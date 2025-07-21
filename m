Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E9CC87FC9
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 02:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUG3tdgHQh8DFSP/CByqeRaXiaXksHpfsYIwZf7x+hE=; b=OyrmT8fSDG/ERJ7FVxfEYTkKBk
	eCxEiRkzdjeGooNDnqWj1UDMIEGgqej/Ta0/Gmx8NgigP5U+30WS6Ihx9L0Q2HLnppeJZLqFQm6Te
	NRcRd00GXTvfZXr7A/s2Aq9H4tfjkToyyfaok4eRs6z+X96A/3tCe6peAujTMtlgRZM25XxfQXSCF
	XcowkkE5uRkBQItwQsjdVyvyk9LLm70JFAiwifgzywV5ggHe+vNUCPM2W/Iq2fcikdZ7YNoGU3tqV
	jqx7+C8lzPdKjGeGhbuFL63oo6q6bFiXITQhChGtA7UDLF7gbuRYbqMLn2I76uB6s6PnFuRRSkH6I
	VPpDqwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7J-0000000Fxx1-3kVn;
	Mon, 21 Jul 2025 02:19:01 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7B-0000000Fxgm-442j;
	Mon, 21 Jul 2025 02:18:55 +0000
X-AuditID: a67dfc5b-669ff7000002311f-8f-687da386aba9
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
Subject: [PATCH net-next v12 06/12] net: fec: access ->pp through netmem_desc instead of page
Date: Mon, 21 Jul 2025 11:18:29 +0900
Message-Id: <20250721021835.63939-7-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721021835.63939-1-byungchul@sk.com>
References: <20250721021835.63939-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxTG937vd2krX/KlGvfNxalN2BYTQTbcTozZjMmSN3OaLfyxi1u0
	kS+2GSBrBcGMjEmnsVMkUzJwlUvAjlK2YitQpXhpmSDIBgW7KgVqnQRG641rhclaL//9kuec
	5zkn58iw8hazQqbN2ifpstQZKlZBKyIJ1esO1RRo1lfYNoHJ1sBC32Q1A9a5PPg16GTAaxGh
	tXeOAlN9M4Kp6CAH9iMBDJPtHSzUVM9giDYeo8H0l4GGadtjDHevhjjodP9Hg9W+DUbMozS4
	Drdg8EwnQuh4JwvHDPMYyod/YGHx1jwDbdF7HBx01lHQNtHEQW9zMQMnH5/B0FIYjGXd8THQ
	f8HEQn9RH4LhhkUGRt2xwHBdgINi6ykE7ksWFg4a3oZw0xQHD0rbMYwUb4YnZblwtWo5zHSH
	EQyeuUHBosvJwZ/DvzPQbmuhYOB2FMPM0dMsGCPHEdwov0DB9dONDNR2D1CxOdLAt7hAwQlv
	FQt3DCMIvJ4QDb98X4zAdtHPwENXbOX5ORO7eQvxhO9j4hyqReSc5SZFxkqeUMR/sYsi508N
	caTKnkMcdWtJjWucIka/FxN7/RGW2B/9xJGAz8WSzrJ5mjhqvyNjjnL08covFJvSpQxtrqRL
	fm+XQnNvzMtmV/J5E0MVqBB1KYxILhOFVNH+81HmBbdGep4yK7wh+v1RHOdlQoo4GeqgjUgh
	w0JPgtjmKKPiwlLhK3E0YKLjTAuJYsB3DcWZFzaI58zm56arRGvj5adGcuEdMRQ7f5yVsZrw
	v04mbioKVrl4u3Sce9bwinilzk+XIL4KvVSPlNqs3Ey1NiM1SZOfpc1L2r03045iH2cuWNjh
	RI9609xIkCFVAp9NF2iUjDpXn5/pRqIMq5bxpOOARsmnq/MPSLq9O3U5GZLejV6V0aqX+bdm
	9qcrhT3qfdLXkpQt6V6olEy+ohB9Pls0rU/ZuYZ/sGdrEi7cHvjbMDv0LpW38eyaQzl/NF/2
	pH/bWzrxiaM9kqboCpg1U/tfr+H/KflosBKnDnzQt5AwcngLVTmnCBb1V/hWmz70RJZ8Y/GW
	bHj42c3h5h+//HS0orM0HwctqgZ56g7j+H1rMHF26s3fomne5Pe3B5teU9F6jTplLdbp1f8D
	qgOKR20DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSeUxTaRTF+d73ltJQ86xk5oVJxDRxicYt6syNe6LRLxrNJGM0UVAbeKGV
	gkyrCGaIiHUjWnFLihatoZY1lhSxFeuSgkBxUCxLOmPZSiQ4VMcZFq0g2Gr873dzbs65ybkS
	LHcwcRJ1+iFRm67UKFgpLd2+6sTCU8U5qiVvSmaByVbJwsvhWwxUfMyCkl4nA94yAR60fqTA
	VH4PwUjoFQf2s34Mw/WNLBTfGsMQqjpPg+mFnoZR2ycMrxsCHDS5P9NQYd8GPdYBGlynHRjq
	RmdD4EITC+f14xgKu0+yMPX3OAMPQ+84yHOWUlBX5AmPQzUctN4zMHDl020MjtzecGB/JwNt
	tSYW2k68RNBdOcXAgDucGiz1c2CouIbA/biMhTz9MgjWjHDw/mo9hh7Depg0ZkKD+QcYexZE
	8Op2BwVTLicHz7vvMFBvc1DQ3hfCMHauiIX8txcQdBTWUvBnURUDlmftVPiO36BzaoKCy14z
	C/36HgTeugAN148bENge+Rj4z6Wn128gdcF/MXF2WRC5W/YXRQYLJinie9RMkfvXujhith8m
	1aXzSbHrDUXyfV5M7OVnWWL//xJH/J0uljQZx2lSbTlGBqsL0a8zd0tXJ4sadaaoXbx2v1T1
	btDLZtyUZQ113UC5qFmaj6IlAr9cePC2hYkwy88VfL4QjnAsv1QYDjTS+UgqwXxLjPCw2khF
	hBl8ojDgN9ERpvnZgr/TgyIs41cId61W5ptpvFBR9eSrUTT/sxAIVx5heXgn+I+TKUBSM4oq
	R7Hq9Mw0pVqzYpEuVZWdrs5alHQwzY7C72TNmbjoRCNtm92IlyBFjCyDzlHJGWWmLjvNjQQJ
	VsTKSONRlVyWrMw+KmoP7tMe1og6N/pJQit+lG3ZJe6X8ynKQ2KqKGaI2u8qJYmOy0Wpe2rj
	Czd5OpL5JWkTi0MnPS26pDUJprVbN5qjzpn9ce0FM3x3PqScKalZ543RpYwaxAV/mO19SY7p
	lSOfZbstv8TsmEdFNeROs1k0iXOPsQfinsZv32s88n7Ii60bfs+41Hvg9RrP6daEdYJ75cZJ
	206jLG/OqZS+/itm3Lwru1hB61TKpfOxVqf8Ai8NpxdKAwAA
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_191854_240117_BC7A544B 
X-CRM114-Status: GOOD (  10.53  )
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

Make fec access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index b481ee8ee478..1383918f8a3f 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -1045,7 +1045,9 @@ static void fec_enet_bd_init(struct net_device *dev)
 				struct page *page = txq->tx_buf[i].buf_p;
 
 				if (page)
-					page_pool_put_page(page->pp, page, 0, false);
+					page_pool_put_page(pp_page_to_nmdesc(page)->pp,
+							   page, 0,
+							   false);
 			}
 
 			txq->tx_buf[i].buf_p = NULL;
@@ -1586,7 +1588,8 @@ fec_enet_tx_queue(struct net_device *ndev, u16 queue_id, int budget)
 			xdp_return_frame_rx_napi(xdpf);
 		} else { /* recycle pages of XDP_TX frames */
 			/* The dma_sync_size = 0 as XDP_TX has already synced DMA for_device */
-			page_pool_put_page(page->pp, page, 0, true);
+			page_pool_put_page(pp_page_to_nmdesc(page)->pp, page,
+					   0, true);
 		}
 
 		txq->tx_buf[index].buf_p = NULL;
@@ -3348,7 +3351,8 @@ static void fec_enet_free_buffers(struct net_device *ndev)
 			} else {
 				struct page *page = txq->tx_buf[i].buf_p;
 
-				page_pool_put_page(page->pp, page, 0, false);
+				page_pool_put_page(pp_page_to_nmdesc(page)->pp,
+						   page, 0, false);
 			}
 
 			txq->tx_buf[i].buf_p = NULL;
-- 
2.17.1


