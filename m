Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D68C87FCA
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 02:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ednytb03Q5q416JP0JY/M7sGlnOexHCJGJ7CeMJwt38=; b=05PgwJ8JdIl/dngKbW+/Pt8O9y
	2E5pksrWLdW8iLGyfnk247CSnH9pItYrCYaUGtKMIf5l+kBvEPqVQ56dE5jiWuMzOrH/WtfQ4IQft
	Tpe/0GhGtIwMmcJsMW/+vgGzIVmaEAaQjkBzKV+V0gxINeD28WtaUtc3WFGwrKniitDAljU6so0B1
	Jc2fLYrJ16HgE6uXcWOebyPNvTnsqszx8Vbx703BHs7rxekgvmkvd8icXwOoOMFTXS+QN9vo/Gv/x
	Ywps67m1sGQrABtIqgACPd4+a/VoE+qGr5y1/SCo2W9y0oNOC5d5Rwgi+BUNmGlv1zjddwaZNZ15Y
	Xl4OMB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7K-0000000FxyJ-3GTe;
	Mon, 21 Jul 2025 02:19:02 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7C-0000000Fxgl-43kS;
	Mon, 21 Jul 2025 02:18:56 +0000
X-AuditID: a67dfc5b-669ff7000002311f-b3-687da3864ae7
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
Subject: [PATCH net-next v12 08/12] iavf: access ->pp through netmem_desc instead of page
Date: Mon, 21 Jul 2025 11:18:31 +0900
Message-Id: <20250721021835.63939-9-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721021835.63939-1-byungchul@sk.com>
References: <20250721021835.63939-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxTGfb/3u7XS+K0a9+lmTOrUSSKbt+VkGmOWJb5/bHGJyxY1URv5
	tJ3lklY6UImIFUMzigomgGUBC9hSQqFF6FxhWJgQdcq1q3K13rXMTYRQEVmr8b9f8pzzPOfk
	HB4rbzOLeW3yIUmfrNapWDktH4srX33Klqn5/EI9B1ZXDQvd4+UMOKfS4eKol4Eehwi/d01R
	YK1uRPAyMsCBO3cQw3h7Bwu28kkMkbo8Gqy3TDRMuF5heHA1xEGnf4YGp/tbGKl6SIPvVBOG
	tonlEMrvZCHPNI2hePgkC7N3phlojvzDQbbXTkHzs0scdDVaGCh8VYmhKWs0mnUvwEDvZSsL
	vSe6EQzXzDLw0B8NDNsHObA4SxD4/3CwkG1aB+FLLzn491w7hhHLFnhTZISrZQth8noYwUBl
	PwWzPi8HN4drGWh3NVHQdzeCYfKXUhbMY/kI+osvU3CjtI6Biut9VHSO7RCYfU1BQU8ZC/dM
	Iwh62kI0nD9uQeBqCTLwny+68vSUld3yFWkLP8fEO1SBSIPjNkUen35DkWDLNYr8VjLEkTJ3
	GvHY44nN94Qi5mAPJu7qXJa4X5zlyGDAx5LOommaeCqOkceeYvTdkp3yTYmSTmuU9J9t3ivX
	3KnPwakXuPSGggkqC+WzZiTjRWG9eLHtV+Y9n6m98pZZYaUYDEZwjBcIa8TxUAdtRnIeC3/F
	ic2eIiomzBd2iI+e9dIxpoXlYtbADGdGPK8QNog5TuM7z6Wis671rY9M+EIMRa8fY2W0JPzU
	y8Q8RcEmE8/+acHvGhaJV+xB+jRSlKE51UipTTYmqbW69QmajGRtesK+lCQ3ij5cVebrXV70
	omu7Hwk8UsUpUulMjZJRGw0ZSX4k8li1QEE6DmuUikR1xmFJn7JHn6aTDH70EU+rPlSsnfw5
	USkcUB+SDkpSqqR/r1K8bHEWOvITbVr3galZ93X6mQ7HjGmo30Bte3Au/mBL4bx59z1pd2fs
	Sy0fd7qY/pJSR94G1cLv1a23QscCn5p31++vWaUJLavPzv3x6GjjoJxqKGha7dib/8nG+UdS
	KmWN4fuhrYHCqtpWsK+w7egjnm8aTnTXpOh+SPty7pjJ+PeihI3tOSraoFGvicd6g/p/zy4E
	2GwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRTG+793R4O3ZfZ2oWBQgVQWZZwuRNCH/hRGEBgFVqNe2mhe2Gqo
	YZkto1HTskBLad6aumi2lS5btynTMks3tZWmtrBSV1leaKnZVvTtd3gOz3PgORwpq6Hnc6qk
	Y6ImSaGWMxJKsnPjmRXZpRnKVZNPl0Oh9RYDbSPFNFh+poK5z0GDp1KAB60/CSisqkEwGuxi
	wXa+m4SRhkYGSovHSQhWX6Sg8JWegjHrLxL63X4WmlxTFFhscdB78yMFznO1JNSPLQF/ThMD
	F/UTJBT0nGVg+u0EDQ+DX1nIclQQUF/0LDQO3WOhtcZIw5Vf5STUZvaFAj900uCtK2TAe6YN
	Qc+taRo+ukKpgYpuFoyWawhcjysZyNKvgcC9URaGrzaQ0GvcAr/zdeA2RcF4cwBBV3kHAdNO
	Bwsve27T0GCtJaD9fZCE8QtFDBi+5CDoKKgj4EVRNQ1lze1E6I7d0Dk9SUCex8TAB30vAk+9
	n4Lrp40IrI98NHx36qktW3F94BuJHe/KEL5b+YbAn3N/E9j36DmB7197x2KT7Ti2V0TjUucA
	gQ0+D4ltVecZbPtxmcXdnU4GN+VPUNhedgp/thegXYv2STYdFtUqnaiJ2XxQonx7J5tMKWFT
	7+aNEZkohzGgCE7g1wqXbj+lw8zwywSfL0iGOZJfLYz4GykDknAk3zJTeGjPJ8LCbH6v8GnI
	S4WZ4pcImV1TrAFxnJSPFbItun+eiwVL9ZO/PhH8OsEfajzMstBKYNBB5yKJCc2oQpGqJF2i
	QqWOXak9qkxLUqWuPJScaEOhb7qZMXnJgUa921yI55B8pjSFylDKaIVOm5boQgJHyiOluDFd
	KZMeVqSli5rkA5rjalHrQgs4Sj5Xun2PeFDGH1EcE4+KYoqo+a8SXMT8TNRRt7+43W9vM2eX
	FJycKlm2SmqMj5mTu3RD/HBlcl7O+tGh+/NczPKOEY3E3ALxYpT7BhE3tMndF9lijerfsfDB
	Oa/N/dr8rdm87oQxpvXs+gS+alAsz1pb7Eif5Ymasbc/Ifb0wPMeU5xCnTgopL53DKxI0NZd
	3/V98EX/nuhhOaVVKlZHkxqt4g+CbkU9SQMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_191855_144989_0012F71C 
X-CRM114-Status: GOOD (  10.69  )
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


