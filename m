Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B34C83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sz+kaZ1se4PT9k5UN9FHxR5Z2+oLab62g6tMxeEWE6w=; b=g7tt3pdUrCcQizcmHFQUPL/BuK
	fZ6QNVoBOGJHzmgnS1pJf47uXPUdaSImbQlphef6aS5wjfCrtS2ZKEt0lOgm5yv65yNiI3DrGdGLe
	5R/BkNzqDudtpn3IcnR8WDVcXsAzVPop1XgcMpEAKfr/Mxbv+inuMorHapasHz5Kp23p5KLbMYZhR
	+f+lJB1cgyCzJ+4xESJO2p79gbJoT1kv1B2ifxmpXcegM8WAXXNH+JeKLjBeTyhkzK+qkXfcmY/ZN
	lPAjo8qeQfNU0owR2/4lIzXCIkdEAaQZ/wRddL6wvgGx18zzk+KxtQl48i1vc9HMmqtgN2zWfwML8
	+xECPZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIHg-00000002AFt-1Vx1;
	Mon, 14 Jul 2025 12:27:52 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHru-000000025oJ-46X5;
	Mon, 14 Jul 2025 12:01:16 +0000
X-AuditID: a67dfc5b-681ff7000002311f-90-6874f17ac5f4
From: Byungchul Park <byungchul@sk.com>
To: willy@infradead.org,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel_team@skhynix.com,
	almasrymina@google.com,
	ilias.apalodimas@linaro.org,
	harry.yoo@oracle.com,
	akpm@linux-foundation.org,
	andrew+netdev@lunn.ch,
	asml.silence@gmail.com,
	toke@redhat.com,
	david@redhat.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org,
	vishal.moola@gmail.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	jackmanb@google.com,
	wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	sgoutham@marvell.com,
	gakula@marvell.com,
	sbhatta@marvell.com,
	hkelam@marvell.com,
	bbhushan2@marvell.com,
	tariqt@nvidia.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	saeedm@nvidia.com,
	leon@kernel.org,
	mbloch@nvidia.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	m-malladi@ti.com,
	krzysztof.kozlowski@linaro.org,
	matthias.schiffer@ew.tq-group.com,
	robh@kernel.org,
	imx@lists.linux.dev,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v10 09/12] idpf: access ->pp through netmem_desc instead of page
Date: Mon, 14 Jul 2025 21:00:44 +0900
Message-Id: <20250714120047.35901-10-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250714120047.35901-1-byungchul@sk.com>
References: <20250714120047.35901-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe2xLcRTH/e57zRo3JVxvaSxkiXlzEoKIcCMRjyHxCMrutNF10lVtQgxd
	xGzdMkS3dVZ0dBs2rVnRFd3MvKdYiq2zeWToGGPadVOtx3+fnHO+3+85yWFwyQtyOKNQaQS1
	SqaUUiJC1Bl9euLurxr55KvWCWCsOE/Bk+5TJJT7U+HcazsJ7lIOrjf6MTCWXUHwPfCKBuvh
	Zhy66+5QcOZUDw6BymwCjI91BPyo6MXhXX07DQ2ufgLKrUuh9ex7AhyHqnGo/RED7TkNFGTr
	gjjkezMoCL0MklAT+EzDAbsFg5pPVTQ0XtGTcKy3BIfq9NfhrDdNJDy9ZqTg6cEnCLznQyS8
	d4UDfZZmGvTlBQhcN0opOKCbBr6q7zR0Ha/DoVU/H34ZtFBvGgI9930IXpU8xyDksNPwyHuR
	hLqKagyetQVw6MkqoiCzMwfB8/xrGDwoqiTBfP8ZFt4jHppCfRgcdZsoeKNrReCubSegcL8e
	QYXTQ8JXR/jkoN9IzV/A1/q+4Ly9xYz4y6UvML4j9xfGe5z3MP5qQQvNm6w7eZsllj/j+IDx
	mR43zlvLDlO89VsezTc3OSi+wRAkeJt5H99hy0fLR60TzUkQlAqtoJ40d7NIHrj7ltiREZ3a
	/2V2OioRZaIohmOncz/r+oj/3N1xhI4wxY7nPJ4AHuHB7BSuu/1OeEbE4OzDaK7GZsAijUHs
	Wq6roO2PmGBjOF1TFxlhMTuTO2aux/6ajuHKK2/+MYoK14uL2lCEJewMzplpxiOmHFscxXlN
	vn+CYdwti4fIRWITGlCGJAqVNkmmUE6Pk6epFKlxW5OTrCj8cGf39q23o2+N8S7EMkgaLYaP
	GrmElGlT0pJciGNw6WDxxxa1XCJOkKXtFtTJm9Q7lUKKC41gCOlQ8dSeXQkSdptMI2wXhB2C
	+n8XY6KGpyO0MCZucl6yLTHevcqwLXFWYsu7Q1syWrFV1Ssf+B1TPxnjO0feZhaOJwurskLZ
	cf36PRsXz+M+xA5c1D9qyd5hElHuZSdbmLVmbM4mseuW/1zQnNc1Js1JnVSuKF42dOm4E3e3
	eHNGei4N0WpmzLXsH63aYDhptNeuljti2y5Yx/VKiRS5bEosrk6R/Qb7QWBBbAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5//uczh6rTEDgUVAwmMLnbjDaOEgk5REURF9aFOeWijuWSz
	4aLLylm48tIN1FwabeaNtJm6allNs5V28dKYebcLVlbW1FxqthV9+73PA8/zfHglWF5JzZCo
	NAmiViOoFbSUlG6OTpp/5HuCcpFxgIWc0hIaGn3XKCgeSYQb3Q4Kmgo5uPdqhICcokoEg/42
	Buwp7Rh8tU9ouH5tGIO/LJWEnJcmEoZKf2F4X9fLgNs1TkKxfRN05X8gwXmmCkPNUAT0prtp
	SDWNYsjqTKZh4s0oBff9Xxk45SggoMbyNHB+rmDgVWUaBZd+2TBUGbsDhW89FDTfzaGhOakR
	QWfJBAUfXIHW/oJ2BtKKsxG4HhTScMq0BPorBhkYuFyLoSstBn5n6qEuLxyG6/sRtNleEzDh
	dDDwovMmBbWlVQS09PgxDJ+z0GD+ko7gddZdAhosZRRY61uIwI6t4JkYI+BiUx4Nb01dCJpq
	ekm4cjINQWm1l4LvThMZs4av6f+GeUeHFfG3C1sJvi/jN8F7q58R/J3sDobPsx/mywsi+evO
	jwRv9jZh3l6UQvP2HxcYvt3jpHl35ijJl1tP8H3lWWjLrF3SlbGiWqUXtQtX7ZUq/U/fkfHJ
	oYnj36KNyCY1oxAJxy7lfH1nmSDT7FzO6/XjIIexUZyv9wlpRlIJZp+HcvfLM4mgMY3dyQ1k
	95BBJtkIzuQZoIIsY5dzl6x1xL/Q2Vxx2cO/QSEBPdfSg4IsZ5dx1WYrzkDSPDSpCIWpNPo4
	QaVetkB3UGnQqBIX7D8UZ0eBb8o/NnbegQab17kQK0GKUBl8SlDKKUGvM8S5ECfBijDZpw6t
	Ui6LFQxHRO2hPdrDalHnQjMlpGK6bMMOca+cPSAkiAdFMV7U/ncJScgMI7pquzPcAETj9vV4
	xdTju/UpvtWpYWXThPhk75ShqLUjutH3j0cyJ7fUzxHW3fA9P75v3oNkH5xuMSy2G5dUe6Ux
	7kfusYqCpJ8R4yG3Hnmc8lpbriU8XfvCjRrWbM84YBhPMeV/PGqPjdRs84dfIOsyIFSt3K9X
	R7bmTi8p3KggdUohKhJrdcIfZ+A0mkkDAAA=
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_050115_137014_415F6843 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To eliminate the use of struct page in page pool, the page pool users
should use netmem descriptor and APIs instead.

Make idpf access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index cef9dfb877e8..6b5f440aede3 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -3276,8 +3276,10 @@ static u32 idpf_rx_hsplit_wa(const struct libeth_fqe *hdr,
 
 	hdr_page = __netmem_to_page(hdr->netmem);
 	buf_page = __netmem_to_page(buf->netmem);
-	dst = page_address(hdr_page) + hdr->offset + hdr_page->pp->p.offset;
-	src = page_address(buf_page) + buf->offset + buf_page->pp->p.offset;
+	dst = page_address(hdr_page) + hdr->offset +
+		pp_page_to_nmdesc(hdr_page)->pp->p.offset;
+	src = page_address(buf_page) + buf->offset +
+		pp_page_to_nmdesc(buf_page)->pp->p.offset;
 
 	memcpy(dst, src, LARGEST_ALIGN(copy));
 	buf->offset += copy;
@@ -3296,7 +3298,7 @@ static u32 idpf_rx_hsplit_wa(const struct libeth_fqe *hdr,
 struct sk_buff *idpf_rx_build_skb(const struct libeth_fqe *buf, u32 size)
 {
 	struct page *buf_page = __netmem_to_page(buf->netmem);
-	u32 hr = buf_page->pp->p.offset;
+	u32 hr = pp_page_to_nmdesc(buf_page)->pp->p.offset;
 	struct sk_buff *skb;
 	void *va;
 
-- 
2.17.1


