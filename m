Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F80C83F35
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6DW8EZeO0HDjHfPxrXIJ1gWG+DSlXfNXBsaPr6KmPg=; b=lcFMFTGi49ARKAh0b10xP5OVdP
	oSy2pOEVnml2rX62nLXAYpmGvB2LTmUTI2xZwi/N+zOINBZDbyWbaG1vVrfVU5Wiq+5SlIPchuQ1P
	dKPasrUR/26gCrGYOJK7+qPKwTVmYwrH04QF7jU/nJ6K/2qcHoPBwrs1JTxRHhJyGRKOG1EegtYgb
	vbDmCnYD0s78hIjMimhOnRJeuJud2P2O4JqDHoi1KDV4YdyYLF/atVmA2yqnWJvZkQgTxVrIyMRpB
	9tXAz9etG2NaeKA/DfjBhOBOKgcgKKKBFuN+GNLS6H1Bj/BC4JiE0BizwNzEqUaWGE2/M1A7BJI3J
	7AUXCdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwQ-00000009Q2B-0eEf;
	Thu, 17 Jul 2025 07:22:06 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIcD-00000009MJW-46Te;
	Thu, 17 Jul 2025 07:01:16 +0000
X-AuditID: a67dfc5b-669ff7000002311f-28-68789fb30299
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
Subject: [PATCH net-next v11 06/12] net: fec: access ->pp through netmem_desc instead of page
Date: Thu, 17 Jul 2025 16:00:46 +0900
Message-Id: <20250717070052.6358-7-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250717070052.6358-1-byungchul@sk.com>
References: <20250717070052.6358-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzVSe0yTdxT1971pqH6rZvsUH7FKZsiGY2pyF4w6Y8yPbMtY+EPnskkj39ZG
	QFOggo+IWGNsFBQfAS2jhaqFMktakc61KqUiEXVQEaryEtA4LSpPqVW7UuN/J+fcc869yeVI
	2X16DqfKzBbVmYp0OSOhJEPRxi/t5bnKr05dSwS9tYaBtlEjDZbJXDjf56DBWyXAP62TBOir
	LyEYCzxkwXaoi4RRzw0GKo0TJARqj1Cg/1dLwbj1DQmPm/pZaHa/o8Bi+wF6zz2hwHmwnoTG
	8VjoL2pm4Ig2SEJpzwEGQg+CNLgCL1gocJgJcD2vY6H1UiENJ96cJaE+vy/cNdBBw93Legbu
	7m9D0FMTouGJO1zoN3exUGg5jcB9tYqBAu0y8NeNsfDqpIeE3sI18L5EA02GT2GixY/g4dl7
	BIScDhbu9FygwWOtJ6D9UYCEicNlDOiGihDcK71MwK2yWhpMLe1EeI8U6Ai9JeC418DAgLYX
	gbexn4Iz+woRWK/4aBh2hk8OTuqZNWtxo/8liR3dJoQvVt0n8NOj7wnsu3KTwH+f7maxwZaD
	7eY4XOn8j8A6n5fEtupDDLaNFLO4q8PJ4OaSIIXtpr34qb0UJc/bJFmZJqarNKJ66apUiXK0
	swFtL5fmWnR3yHx0U6JDHCfwy4XQyPc6FBWBLc5Bcgoz/OeCzxeI4Fl8gjDaf4PSIQlH8rej
	BZe9hJgSZvK/CoEDRmYKU3ys0Odqjhik4aCG8gLmQ+gCwVJ7LcJH8SuE4IniCC8Lz7RX5LNT
	oQJvjxIOmy8QHwyzhQazjzqKpAY0rRrJVJmaDIUqfXm8Mi9TlRu/ZVuGDYUf7tyet7840Ehr
	ihvxHJJHS1NrdyhltEKTlZfhRgJHymdJj3s1Spk0TZG3U1Rv26zOSRez3CiGo+SfSb+e2JEm
	4/9QZItbRXG7qP6oElzUnHy0bG7C4i8GvkncXTRo3Pjs0d65w23s5mkrFhUvLHt9cjj+avux
	1IwZ1uumtUO/rb89v4FyrqvobN313V9L9v00Y8jw+88bEpPl08Ufv10yGHfQEduzafpF04vr
	62v+TNqyK+CZvyGxsXP12MKxmDrd0qZxP06yb90zM+kTp1bvyb7lEp4lx8ipLKUiIY5UZyn+
	Bwk0ZW1sAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzVSa0yTZxj1/d7v0jY2+VKrfmHLjJ1mhjjReHuWLcbELLyabTEaNWiMFPtt
	7SiXtNqVJWKF6kYnqKgJaBEYF4GqkHbSCgWlMEHwAgVZN+4XCSrOC5dYYbLCsn/nOed5zjk/
	HglWuJkwiS7+iGiIV+tVrIyWffN56qeuXLN2refcCrCXX2OhbTyfAcdbM1zt9zDgLxWguvUt
	BfaySgQTwS4OnGndGMYbGlkoyJ/CEKxIp8H+yErDZPk7DE/uDnLQ5PuHBofza+grHqHB+5Mb
	Q/3kShg808RCunUaQ3bvSRZm/5pmoCb4NwcpnhIK6nPuhcbnNzlorcxg4MK7IgxuS38ocKiT
	gfYqOwvtqW0Ieq/NMjDiC6WOlXRzkOG4hMB3u5SFFOt6GLs5wcGriw0Y+jK2wvssE9zNWwJT
	LWMIuooeUzDr9XDwsPcGAw3lbgo6BoIYpk7nsGB7cQbB4+wqCu7nVDBQ2NJBhXrshs7ZGQrO
	+/NYGLL2IfDXD9Jw+UQGgvLaAAOvvVZ66zZSP/YSE09PISK/lf5JkdGz7ykSqG2myK1LPRzJ
	cx4lrpJwUuB9ShFbwI+JsyyNJc43mRzp7vSypClrmiauwuNk1JWNdn60X/aFRtTrTKIhYku0
	TDv+Rx1KzJWbHbaH2IKaZTYklQj8BqHFO4znMMt/IgQCwXms5NcJ44ONtA3JJJh/sFCocWVR
	c8Ii/qAQPJnPzmGaXyn01zTNH8hDRnW5Kex/pssER8WdeV7KbxSmL2TO84rQTsevFu4skuWh
	BWVIqYs3xal1+o1rjLHapHidec3hhDgnCr1T8bGZcx400R7pQ7wEqRbKoyt+0CoYtcmYFOdD
	ggSrlPLzfpNWIdeok34UDQmHDEf1otGHPpDQqqXyHfvEaAX/nfqIGCuKiaLhf5WSSMMsKKbN
	cqCh9JBy8vgzzO5JDo97XfRV8S+VA8caR5ePKHcscX84lFyX+uLqlYhdM821muE7VyzUZ7g6
	c3Fq+vWoNO/P+/ynFjT/vqmXPqWJ+VYTOfTcvnl56+5wddflj6t0YYtbYjWriF+6LGv1sDs5
	YW/U96vvu8yVlu0xT76M1O/PkSaqaKNWvS4cG4zqfwG0B/LQSgMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_000114_165840_E0E4F392 
X-CRM114-Status: UNSURE (   9.80  )
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


