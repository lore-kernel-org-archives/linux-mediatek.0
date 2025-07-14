Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D614C83F2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ednytb03Q5q416JP0JY/M7sGlnOexHCJGJ7CeMJwt38=; b=GS2x9+n894JlXDHRnMzdyCa0eQ
	IAfG4xOooaDY8oGK+6ImAkRfrfDe+oM8jk7i2VEK4Juy8qa4KY4BAlRn3CQAVf1uFOHnZeZdZA30f
	JHJnZz8zU6cFQWIlVVMtEhjRl1sAleXOrsUi1SS821zW8j3p7BBCgyfpLlsgnzDnTMUlD/6t4V9hn
	r8xo8xEOofgBGRJsz60OXfMXD81VTyKJdbnA5iJZFL2bKh4DDimEcwdpgfO2OySJQVUJzzPfZXfBq
	VVGy89Vg/z6+7d9SfKiKrTNrhlk2b7aeF6f6P1B3er+FI2a8fCYOdyNE/9v67tie4pjW8x6oOgEUX
	ziQNLAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIHh-00000002AJC-44VP;
	Mon, 14 Jul 2025 12:27:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHs9-0000000264N-2bbf;
	Mon, 14 Jul 2025 12:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ednytb03Q5q416JP0JY/M7sGlnOexHCJGJ7CeMJwt38=; b=cVuCifgIctM9dUAgFhcfQQfEGP
	ugiShnJSsaMfu0Gat8qz3/JF/ODvaWjmXWzMVeysZT5TNH6N7ouyLAeK1mVj7F/GnYaqIgeen41Ke
	4tNSWdlRps7QwTxuvsXUG/ZUHZ/JTkvz1w54iflcbwfzc2/FUrf1oLhXl21vK/eMOOYdaH2j7qqNU
	nABvpeCuQbm+m30BdgkTHeqA7V1GvFD64X4iCW7D+weChwmj3oHYzrf31328ZfHBtPaH0h82m9UJ8
	bNP9TK2kXFlPmxHHxVr+wgxGQHewfe1UZBwDzKzOJ7S/k+N0PstExVNr91nMIAbE/XMAU3WlLm+CQ
	aQVsYSmQ==;
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHs2-00000009lEn-0Qsp;
	Mon, 14 Jul 2025 12:01:28 +0000
X-AuditID: a67dfc5b-681ff7000002311f-7d-6874f17adf47
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
Subject: [PATCH net-next v10 08/12] iavf: access ->pp through netmem_desc instead of page
Date: Mon, 14 Jul 2025 21:00:43 +0900
Message-Id: <20250714120047.35901-9-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250714120047.35901-1-byungchul@sk.com>
References: <20250714120047.35901-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxTZxTGee97v9rQ5Kaa7Q6zGWuMCYs6HFtOiFvIovGayNQQTWRBbeTG
	NgKSggyIi0wqSsVidMsAi2JFbamxWBSqFtSWKBMdWIUU5MMWRYcgaG1DAa0txv+e5HnO7zkn
	OSyWe6g4Vp2dJ2qylZkKWkpKx2ONy4re5Km+Kzm5CAzWizQ89J+hwDJVABee2ilwm3m40TVF
	gKG+CcG70BMGbGX9GPxtd2k4eyaIIdRwlARDp5aEgHUaw/M7Pgbane9JsNhSYOj8CAmOQ80Y
	XIEl4Ktop+GodgZD1eBBGsJ9MxS0hF4zcMBuIqDl1VUGupr0FPw1fQ5Dc/HTSNdwDwWPrhto
	eFTyEMHgxTAFI85I4ZipnwG9pRqB86aZhgPa72Hs6jsGJv9uwzCkT4YPlflwp/YLCHaMIXhy
	rpuAsMPOwH+DlyhoszYT8NgbwhAsr6FBN16BoLvqOgH3axooqOt4TET2SIWe8CwBJ9y1NAxr
	hxC4XT4STv6pR2Bt9VDwxhE5eWbKQCf/IrjGJrBgH6hDwhVzLyG8PPaBEDyt9wjhWvUAI9Ta
	9gqNpnjhrON/QtB53Fiw1ZfRgu3tcUbo73HQQnvlDCk01u0XXjZWoY1fp0lXZYiZ6nxRs+Ln
	HVJV3+VSnGNkCq6cCBDFqILWIZbluUR+4qZchyRz8pKpholqmlvKezwhHNXzuQTe77tL6pCU
	xdyDWL6lsZKIGvO4rfzrYReKapJbwuuNWhRlyrgf+LLg6k/Mhbyl4dYcR8L9yJ+u8c7F5ZFI
	q64OR5k8Z5Hw5henqE8DX/G3TR7yGJLVoph6JFdn52cp1ZmJy1WF2eqC5Tv3ZNlQ5N/O/zH7
	mx297Up1Io5FilgZjOap5JQyP7cwy4l4Fivmy0YHNCq5LENZWCRq9mzX7M0Uc51oAUsqvpSt
	DP6eIed2KfPE3aKYI2o+uwQriStGh2eP8KnEWn1RknH8nwXpKw/e0ltDiVv2LwqsW1Of8syf
	8N47YnKXLeYk/25NP1Wyzfsq9V6S77661BvQnZ5Oqk6LMzbFlGwGeq30WbVtdJPFEk+uT15d
	2mn+NqbvcspkeOIn2e1eV1GOa+RB+Tcp+8oL03/t7pBM3ugt9acVbOhUkLkqZUI81uQqPwK9
	dXv1awMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxTZxjFfe97v2hoclOR3bBEkmZKYjLROMyzbDNOZ3xjhCyRxLhk0UZv
	bEMppIUGSJYBdi40s6CgA2knH5WVDwULQsWCpiWIQ5wWJB1QPiNxDplIQSpoLS777/fknJzz
	/HF4rGhn4niNLkvS61RaJSujZSlfnPk0byFLvaNsSgbW5iYWHi9WM9C4kgO/T7oY8NWLcPvR
	CgXWhnYEwdAoB86iMQyLPfdYqK1exhBqOUeD9U8TDUvNbzA87Z3moM/zloZGZzJM1M3S4P65
	A4N3aQtMF/excM60iqFi/CcWwiOrDHSF5jkodDko8NruR85/bnLwqN3CQNmbqxg68icjhTPD
	DAx2WlkYPPMYwXhTmIFZT6R1zjHGgaXxMgLPnXoWCk27YO5mkIOXF3swTFj2wrtyI/RWxcJy
	/xyC0atPKAi7XRw8HL/OQE9zBwVDUyEMy7/YWDC/KEbwpKKTgge2Fgbs/UNU5I8jMBxeo6DU
	V8XCjGkCgc87TUNlgQVBc7efgQW3id67n3jn/sXEFbAj0lb/F0WelbyjiL/7D4rcuhzgSJUz
	m7Q6tpFa998UMft9mDgbiljifHWBI2PDbpb0la/SpNX+I3nWWoG+3fyd7MtTklZjlPSJe07I
	1CM3zuLMGi6nrXSJykfFrBlF8aLwmXjdYePWmRUSRL8/hNc5RtgpLk7fo81IxmNhIFrsai2n
	1oWNwjFxfsaL1pkWtoiWGlOEeV4uJIlFy9/8lxkvNrbc/ZATJewWr9imPtgVEUu32Y5LkKwK
	bWhAMRqdMV2l0SZtN6Spc3WanO0nM9KdKLKmuh/WzrtQcPCgBwk8UkbL4XmWWsGojIbcdA8S
	eayMkT8P6NUK+SlVbp6kzziuz9ZKBg/6mKeVH8kPHZVOKITTqiwpTZIyJf3/KsVHxeWjQ4P+
	2MOv01IOxH+1VlrdMuJ9mMlqfcPOIV63azGc++Jl6kJJfLvWXXB/a9nT7/cnMpVB/a8d0lR6
	hiOQP2aPms2uC1g/SV05Qu7OJgX3GTehBCivlM131e5JvqW8NhBMWaqJd1w6mHw+NTpY1vB5
	U5/6a5Kgdhw++9uGOuNMp5I2qFU7t2G9QfUewTvwW0kDAAA=
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_130122_584373_E0EDCE68 
X-CRM114-Status: GOOD (  10.23  )
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

Make iavf access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/ethernet/intel/iavf/iavf_txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_txrx.c b/drivers/net/ethernet/intel/iavf/iavf_txrx.c
index aaf70c625655..363c42bf3dcf 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_txrx.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_txrx.c
@@ -1216,7 +1216,7 @@ static struct sk_buff *iavf_build_skb(const struct libeth_fqe *rx_buffer,
 				      unsigned int size)
 {
 	struct page *buf_page = __netmem_to_page(rx_buffer->netmem);
-	u32 hr = buf_page->pp->p.offset;
+	u32 hr = pp_page_to_nmdesc(buf_page)->pp->p.offset;
 	struct sk_buff *skb;
 	void *va;
 
-- 
2.17.1


