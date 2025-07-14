Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08E9C83F2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6DW8EZeO0HDjHfPxrXIJ1gWG+DSlXfNXBsaPr6KmPg=; b=Y6Wc+hf/RTEuGb1pTVIIaLnSqF
	MSUez3VhWbB1a5AyNOpHoFcUKIVydeQkYvwrfbdX7WUFHZyBK2fTwTpdWqYUBtfh+i87L4KlcVmhk
	EcOME5T30V/d5F+Sw1IDsvlPiOEnFfe2sLgNPP2gTTKSuf5HcePhj4xrtkib2l6oaU/TOl6BPyPOa
	XB7NkPnDgiANf1AD87kl3xZfYrX1LlqFwfDJ+5Jn0DzXlJJ7a8HqCD0frdS6ZBv3q8AL8LqE+R1WD
	XeP868kt/d9tgCoeHExP8nJOpk0S2EhSvHryWRUgffGT9oI1X49p8A2mdTkfEkZx1gvxZEMLi5ZBa
	nsZC/DlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIHi-00000002AJo-1Tei;
	Mon, 14 Jul 2025 12:27:54 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHs9-0000000264e-38vP;
	Mon, 14 Jul 2025 12:01:30 +0000
X-AuditID: a67dfc5b-681ff7000002311f-59-6874f17afa44
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
Subject: [PATCH net-next v10 06/12] net: fec: access ->pp through netmem_desc instead of page
Date: Mon, 14 Jul 2025 21:00:41 +0900
Message-Id: <20250714120047.35901-7-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250714120047.35901-1-byungchul@sk.com>
References: <20250714120047.35901-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSeUxTaRTF/d73Npo+fal2fEKMpm6Jk1EQZnKjxqgx5iVqNPKHUWO0Iy/T
	jmWZgmwZFRWdWGSJW0BLQEFZipYUkQ4UZixEC24IiM+RUqkRUXEDIbQwYqvxv19yzz3nnuSy
	WPWECmX1cUmSMU5r0NAKUvFWeemn9I9JunCTrAaztYqGh8MXKbCMpULZMzsFHRUCNLSPEWCu
	vIHgk+8pA7YTPRiGW27TUHJxFIOvOpsE84NMEkasfgwvbnkZcDn/J8Fi2wSeK/0kOP6qw9A8
	sgC8uS4asjPHMRT0HqNh8r9xChp97xg4Yi8noPFNLQPtN3IoOOO/jKEu41kg63k3BZ31Zho6
	jz5E0Fs1SUG/MxA4WN7DQI7lPALnPxU0HMmMhMHaTwx8ONuCwZOzGj7nJ8Ot4h9g9M4ggqeX
	HxEw6bAzcL/3GgUt1joCuvp8GEZPFtJgepuL4FFBPQF3C6spKL3TRQTuiIbuyQkCTncU0/A8
	04Ogo9lLwoXDOQisTTIFHx2ByuNjZnr1WrF58D0W7e5SJF6veEKIA3mfCVFuaiPEv8+7GbHY
	tl+sKV8sljheEaJJ7sCirfIELdqGTjFiT7eDFl3546RYU3pIHKgpQFtm71CsjJEM+mTJuHTV
	HoVu+PFNlFDEpVpM93EGalOYUAgr8FHCVX89+s7uvFNUkGl+kSDLPhzkGXyEMOy9TZqQgsX8
	PaXQWJNPmBDLTud3CbV5YUENyS8Q5P4GIsgc/7NQJZ/B3zznCJbqf79yCP+LUFTY9zVLFdA0
	mUpx0FPgrSHCg7v51LeFWcLNcpnMQ1wxmlKJVPq45Fit3hC1RJcWp09dsjc+1oYCD3flwMRO
	Oxpqj3YinkUaJQevk3QqSpucmBbrRAKLNTO4126jTsXFaNPSJWP8buN+g5ToRGEsqZnJLRtN
	iVHxv2mTpH2SlCAZv08JNiQ0A019fGza6UjLvNbpNl/UTPUf8eHRhuOhG8LDurM2HFWu9Oz9
	VV3dNr/vXKEV1oSrvYcb3q07uLCzbKNr+azs/ixtQsma1qFL/hVbo+tsU1wftr8ZmYgse7nc
	EhWx+c/1Yy1z1XBtwj/391x3WasyZRvJdQ3oDnStT5c8nI/I+vFFSrqGTNRpIxZjY6L2C6Gn
	Y8hsAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTZxjG953v3GisOemYnmDiki5kCcm8RN3eqFkMS+TERGMk0YzFjE5P
	1kYo7LQSiuiY7WJsFPGWAOMaCkJLBmkFKtaiLRG0XoAiO05KBTbmpFMRJBQQbF387/fkffI8
	7x8Pi1XtVBKr0xtFSa/JUtMKUrFnm/kL05RRu6H63laoaGmmoX+6lgLHXD5ceeqmYKCJh+t9
	cwRU2NsRzESfMOA8PYxhuruHhrraWQzR1rMkVDy0kPCmZR7D37fHGOj1vSXB4dwN4YYJEjyn
	OjD43yTD2LleGs5aFjCUjfxKw/KfCxTciL5g4KS7kQB/5Z2YnGxjoK+9mIJL8/UYOoqexgrH
	hygIdlbQEDT3IxhpXqZgwhdrjTQOM1DsKEfg62qi4aRlE0TaZhh4dbkbQ7h4ByyV5sHtmlUw
	G4ggeFL/iIBlj5uBByO/U9Dd0kHA4GgUw+yZShqs/51D8Kisk4B7la0U2AKDROyPdBhaXiTg
	4kANDeOWMIIB/xgJv/1SjKDFK1Mw5bGQO74R/JGXWHCHbEi42vSYEJ6VLBGC7L1LCNfKQ4xQ
	4zwquBpThDrPv4RglQew4LSfpgXn6wuMMDzkoYXe0gVScNl+Fp65ytDetRmK7YfFLF2eKK3/
	OlOhnf7jFsqtVuY7rA9wEbqrsKIEluc286GSC1Scae5zXpajOM6J3EZ+eqyHtCIFi7n7K/gb
	rlLCilj2Y+4g31ayJu4huWRenrhOxFnJbeGb5Uv4/8xPeUfrzfecwH3JV1eOojirYh6v1YZL
	kKIGfWRHiTp9XrZGl7VlneGI1qTX5a87lJPtRLE1NRxfPO9GM8E0H+JYpF6hhOdGrYrS5BlM
	2T7Es1idqHwekrQq5WGNqUCUcr6XjmaJBh9aw5Lq1cpdB8RMFfejxigeEcVcUfpwJdiEpCK0
	6dtQaDjQOR4pfNhXNSWF560Nk+b5nJ3yyh/6Tr2a/cfmUiwuzf2U4U854SpN9ZYnn3DRgXBa
	l91+/6+kqvSRBqM57ZNg76oq07Ha9GZp/+DjHq959KvU7zL2ve6/li+t5j3i1n6q8LPJrgQp
	lQ8WRTMLe3Llg3W6RH2goL5ATRq0mo0pWDJo3gF9g0E7SQMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_050129_922271_BF33EB96 
X-CRM114-Status: GOOD (  10.19  )
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
index d4eed252ad40..1d0bd6f75368 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -1043,7 +1043,9 @@ static void fec_enet_bd_init(struct net_device *dev)
 				struct page *page = txq->tx_buf[i].buf_p;
 
 				if (page)
-					page_pool_put_page(page->pp, page, 0, false);
+					page_pool_put_page(pp_page_to_nmdesc(page)->pp,
+							   page, 0,
+							   false);
 			}
 
 			txq->tx_buf[i].buf_p = NULL;
@@ -1581,7 +1583,8 @@ fec_enet_tx_queue(struct net_device *ndev, u16 queue_id, int budget)
 			xdp_return_frame_rx_napi(xdpf);
 		} else { /* recycle pages of XDP_TX frames */
 			/* The dma_sync_size = 0 as XDP_TX has already synced DMA for_device */
-			page_pool_put_page(page->pp, page, 0, true);
+			page_pool_put_page(pp_page_to_nmdesc(page)->pp, page,
+					   0, true);
 		}
 
 		txq->tx_buf[index].buf_p = NULL;
@@ -3343,7 +3346,8 @@ static void fec_enet_free_buffers(struct net_device *ndev)
 			} else {
 				struct page *page = txq->tx_buf[i].buf_p;
 
-				page_pool_put_page(page->pp, page, 0, false);
+				page_pool_put_page(pp_page_to_nmdesc(page)->pp,
+						   page, 0, false);
 			}
 
 			txq->tx_buf[i].buf_p = NULL;
-- 
2.17.1


