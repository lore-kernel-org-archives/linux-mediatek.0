Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C32C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 07:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9r9AqzJSLA1D1ZaSzMEcs3ZbuUbrvaNUswiizKwmHwU=; b=J2z8bqtHqRV3PSq8wXWjfSrtmZ
	ULScItQGQ4WlcE1pJzElyA/m4IpqYCsxFypQu/QOCFojTEatXWzuV9PJsQpo7cP5tUbr+1KPNeuox
	GPq14WDYjqleNFM5+7jp04TuP0kZgoWCDlxdrBCl5EwybjqpHEVLUjKw8fkLiTcpE1lVMpnO+qhAp
	0rMIBpncrVjRQ39itJ8JaY/zE0Eq5VOyAIb/8LjJA4/W5g2WG+JF8Z2GIvv6paWUivkB5x/aDCQRc
	3Aa6Wiuap8goO1UuMsqYyT+nI8Sogaj3mqlsMYTJ4GwsmgsrgoQ5KK5dPyJJSIowvBzOqYcni+gHH
	vHFLqsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwP-00000009Q1x-3Uv4;
	Thu, 17 Jul 2025 07:22:05 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIcD-00000009MJc-2shg;
	Thu, 17 Jul 2025 07:01:16 +0000
X-AuditID: a67dfc5b-669ff7000002311f-15-68789fb30571
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
Subject: [PATCH net-next v11 05/12] mt76: access ->pp through netmem_desc instead of page
Date: Thu, 17 Jul 2025 16:00:45 +0900
Message-Id: <20250717070052.6358-6-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250717070052.6358-1-byungchul@sk.com>
References: <20250717070052.6358-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfWxLexjH/c57a+XoZM4dIuotJOqd54/lkptczj9DMokgYSd2oo1ulo6u
	I7KhXlZ3xYZsa8Ve7ZUtLVrTznQLixlbzRSzzZYxdLg6y6quabfc/z55vt98v8+TPAwu7ySj
	GXXSQVGbJGgUlJSQDkUULrVd1auWfx1aBZaaagra/YUkVI3qoazXQYKngoO7baMYWCpvIxgO
	vKbBmtmFg7/pIQXFhSM4BGqzCLA8NRDwveYHDgMP+mhodv9HQJU1FnquvSPAedqOQ+P3BdB3
	rpmCLEMQh7zukxSMvQqS4Ap8puG4oxwD16dbNLTdNpFw8UcpDvaM3lBXfycJz+osFDw70Y6g
	u3qMhHfuUKGvvIsGU1U+Ave9CgqOG1aB79YwDV8vNeHQY9oAv3J18KAgCkZafAhelz7HYMzp
	oOFJ9w0SmmrsGHS8DeAw8s8VCoxD5xA8z6vD4PGVWhJKWjqw0B5x0Dn2E4McTwEF/YYeBJ7G
	PgLMx0wIauq9JPzrDJ0cHLVQG/7iG31fcN7xpgTxNyteYvzg+V8Y761/hPF38t/QfIH1EG8r
	X8IXOz9gvNHrwXlrZSbFW79l03xXp5Pim3ODBG8rSecHbXlo6+yd0pgEUaPWidplf8ZLVZZc
	N5GcQ+sHzIsz0FnKiCQMx67mXPYBzIiYcXZenh8eU+wizusN4GGezq7g/H0PCSOSMjjbGsG5
	bLlYWIhkd3At70+SYSbYBVxr2VkynCML5Zwyp0/Ez+GqahvGcyTsGi54MXu8Vh6ydBRl0BOe
	MglXeAGb4D+4++Ve4jySFaBJlUiuTtIlCmrNaqUqLUmtV+49kGhFoW+7dvTnLgf61hbnRiyD
	FBGy+NpUlZwUdClpiW7EMbhiuizHo1PJZQlC2mFRe2CP9pBGTHGjmQyhmCFbOZKaIGf3CQfF
	/aKYLGr/VzFGEp2BEjB2ZreraOr1E5Mure3fT2VG/W1Y11bEuetjjiTPXTj51DbJrLfZ8dPk
	+UUCvqmZ8B8xz1KuiR2mqzc97d04e4svINpc9sHRLYJ+0fpWQemsizRXbJ7i16zMbq/uUu3O
	WqvUpMXLPvbP22yKiT7TGluaHpcqefGpUXtme0NkVIOCSFEJK5bg2hThN4MBEoxpAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUzMcRzHfX/PnW5+O+HnYbQba5qnkH2GNcbmN83D+INspsNv7lZd3OWU
	odKJriSVXHVxPejRXO6iw4ldjSOkKzmc4hoxeSzNOeTO5r/35/P+7PV+//FhcEkTOYVRKJME
	lVIWL6VEhGj9soy5lvPJ8gVuz1QwmC5S0DlUTkLDj2SoeWUlwVnHwY3HPzAw1F9FMOx9QYM5
	y43DUNtdCirLR3DwNp4kwNChJeC76ScOb+54aHDYfxPQYF4HfdVvCbAdb8ah9fss8JxyUHBS
	68OhuPcYBaPPfSTc9H6i4ai1FoPWsnv+8cMVGh5fzSWh8OcFHJrTXvkD+3tI6LpuoKAroxNB
	78VREt7a/amDtW4achtKENhv1VFwVLsIBq8M0/DlTBsOfbkr4I9eA3eME2GkfRDBiwtPMBi1
	WWl41HuJhDZTMwbdr704jOSUUaD7eArBk+LrGDwoayShqr0b8/fYDD2jvzAocBop6Nf2IXC2
	eggoTc9FYGpxkfDVpiVWrOJbBz/jvPVlFeKb6p5h/Lu8PxjvarmP8ddKXtK80byft9SG85W2
	9xivczlx3lyfRfHmb/k07+6xUbxD7yN4S1Uq/85SjDZO3yZavluIV2gE1fyoWJHcoLcTewvo
	5Dels9NQNqVDDMOxizlb0UwdCmIoNoxzubx4QIewEdyQ5y6hQyIGZx8GczcteixgjGdjuPaB
	Y2RAE+ws7mFNNhngiP2czNLUwJpjZ3ANjbf/cYLYSM5XmE8FtMR/0l2RRuchkRGNqUchCqUm
	QaaIj5ynjpOnKBXJ83YlJpiR/5eqD/86bUXDXWvsiGWQNFgc23hALiFlGnVKgh1xDC4NERc4
	NXKJeLcs5aCgStyh2h8vqO1oKkNIJ4nXbhFiJeweWZIQJwh7BdV/F2OCpqQh5faOYLuRLEqa
	rE+1bGs6cTvryEDeIl0mN6FmSY547aaoYEiYkb608mlHtOby2LCvtVG+sIqVuHiJlJykXn3O
	vPNDxMR0h5D5qD9yoSPVtDLUHZM4XPGbu9Sx4PX9rSdGohND8+f42seV30uyZmw4lEHtOxsu
	Fas7p0WvGshZNl0kJdRyWUQ4rlLL/gK76wuPRwMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_000113_893433_C3F5BF63 
X-CRM114-Status: UNSURE (   8.50  )
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

Make mt76 access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 14927a92f9d1..7e9ddf91b822 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1798,7 +1798,8 @@ static inline void mt76_put_page_pool_buf(void *buf, bool allow_direct)
 {
 	struct page *page = virt_to_head_page(buf);
 
-	page_pool_put_full_page(page->pp, page, allow_direct);
+	page_pool_put_full_page(pp_page_to_nmdesc(page)->pp, page,
+				allow_direct);
 }
 
 static inline void *
-- 
2.17.1


