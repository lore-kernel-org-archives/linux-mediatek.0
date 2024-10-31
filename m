Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086CED6B6B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 00:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxTaQzY11T+U6/4qLM4FfUQ0BEPwevvcufdmsyeDobE=; b=3bInCmYklPkj+wJIU47p8tLYHZ
	3OAb4rwhcK+UqUIO1rOWws2C+aBT81D1dbL64nYeO4yPseA6QMz4VjBL3T4HoMe/NNkiJj7b1+Ahh
	iSJbzvEFlq9mD9iM7d1cNIc9mTYfHq3Ld+ScjEa6Hr23JGxzRegzZ5PLB76tUaw4cifP8Gyl3zx6B
	qoUWSsXOuNBIpPjzQ9mvbTzTHF4lPzibAKuNEWZXT0u3AElfvR2q4yJjwvb7pPt12KTU2OMyGxbcP
	EcMZu3zWdheOHQJ8aB81FoQX98mVZVIKp2TGqv3IPh3TJuBkrUkiBo9FC92Nr7gqcUafHVHVo7lDE
	1j1sSt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6JJ2-00000002B2T-0lN7;
	Thu, 31 Oct 2024 00:44:56 +0000
Received: from mail-oa1-x63.google.com ([2001:4860:4864:20::63])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Iyh-000000029Bq-3zh4
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Oct 2024 00:23:58 +0000
Received: by mail-oa1-x63.google.com with SMTP id 586e51a60fabf-2888bcc0f15so96408fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 17:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1730334235; x=1730939035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxTaQzY11T+U6/4qLM4FfUQ0BEPwevvcufdmsyeDobE=;
        b=P2en1he+CdRYGGNbqSFwkjq0VMTZ8ZQdLi0anvfoNFo63XTSP+AOu7cREpC3tG+zfE
         38Zv/vO/Hvc7OW5SRXkeWmmsQCoBoAqpDX3gHlo6sYfFbrzmMU/EWENjWhBCoFt5M07m
         l5mabKAQVi0LnM92yRxL640rvPvvR1xBmGXb82+XtZFlY9ffnIR+jbGDUST1IRCxcwH5
         FDWNB3pWKE/CP1LnmNq6x0GzwZrnVRTVdV9jjZDiIBSPkdi9Vg0rHuChVZrFvdV9oWKi
         N4apFDdanuaw0s/vTcF79YAcfiNQRNzhoq5BwSYOf/INlO0JapCVXKdw2qT0NIXu0yb0
         vToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730334235; x=1730939035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxTaQzY11T+U6/4qLM4FfUQ0BEPwevvcufdmsyeDobE=;
        b=mTpN25KKG889fY7/MYY14zP8REzMrDb/YiBB4HYKVjlNKULEGwVdOSru4eUNk86d0U
         UPhPgvu1Rv6f9GFfhO88ri5gUiVsOqYH78Omd3wX8to3FpOnOqMKVp276NNDBnCecowD
         KU/Y66YzZIHRv0h6QEvNjb9rXmQZdNmluvfXxyU8mq+PYjv6hf5M8V+z5q6JmtCACnwz
         Yt3NJ3Ng9K/ue1x1MN7gWg/siIWLm8yHuWv5r1/lWoY5fx083d8vMpsTzdLOFSFL41ZV
         fNlDqA0vV0tMJNZ0aBiylt5M3uKtJipzqgatNgDHw6/qCnPFjSG4oeGzGRi5TsZl1V/s
         blWg==
X-Forwarded-Encrypted: i=1; AJvYcCUcjN/jOSR8gJWLHP8ZWWu3njz2VghxSegZDOo0imLfEqzPladpqaxEorVU2UQhb3HmptNS+z85UrNqnepvow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8TnLBYrjWSG2LFVz6UA88QYhSu5vl23nFWQa9VNxIFJH0gP/C
	NxaAxkYSJz0r3gm/3yT6zlC9pDnOxgjtuJqDC+P4aKeg0qxmQXk9vVzBQIHAUPDbaa3cZCteXih
	EDPI+nnx1w8azN+mJOoTzl6PbW2jZnP0afE5I8qByzBPllO+E
X-Google-Smtp-Source: AGHT+IEDHXWKXezVGt2axyaG4+Qei/UZG1ROhWq2Ej1iRUnvlRIQwsdcTAZVg8vNkXXi/D/IjmNAGvcs5MjL
X-Received: by 2002:a05:6870:ec92:b0:27b:9f8b:277c with SMTP id 586e51a60fabf-29051d431a1mr4522874fac.11.1730334234723;
        Wed, 30 Oct 2024 17:23:54 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-2948710f778sm17736fac.0.2024.10.30.17.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 17:23:54 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 75AAA34039C;
	Wed, 30 Oct 2024 18:23:53 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 720ECE40A10; Wed, 30 Oct 2024 18:23:53 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Doug Berger <opendmb@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Louis Peens <louis.peens@corigine.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Noam Dagan <ndagan@amazon.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Roy Pledge <Roy.Pledge@nxp.com>,
	Saeed Bishara <saeedb@amazon.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Shay Agroskin <shayagr@amazon.com>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Tal Gilboa <talgi@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	oss-drivers@corigine.com,
	virtualization@lists.linux.dev
Subject: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Date: Wed, 30 Oct 2024 18:23:26 -0600
Message-ID: <20241031002326.3426181-2-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031002326.3426181-1-csander@purestorage.com>
References: <20241031002326.3426181-1-csander@purestorage.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_172356_078085_09030C7D 
X-CRM114-Status: GOOD (  16.76  )
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

net_dim() is currently passed a struct dim_sample argument by value.
struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64
passes it on the stack. All callers have already initialized dim_sample
on the stack, so passing it by value requires pushing a duplicated copy
to the stack. Either witing to the stack and immediately reading it, or
perhaps dereferencing addresses relative to the stack pointer in a chain
of push instructions, seems to perform quite poorly.

In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
94% of which is attributed to the first push instruction to copy
dim_sample on the stack for the call to net_dim():
// Call ktime_get()
  0.26 |4ead2:   call   4ead7 <mlx5e_handle_rx_dim+0x47>
// Pass the address of struct dim in %rdi
       |4ead7:   lea    0x3d0(%rbx),%rdi
// Set dim_sample.pkt_ctr
       |4eade:   mov    %r13d,0x8(%rsp)
// Set dim_sample.byte_ctr
       |4eae3:   mov    %r12d,0xc(%rsp)
// Set dim_sample.event_ctr
  0.15 |4eae8:   mov    %bp,0x10(%rsp)
// Duplicate dim_sample on the stack
 94.16 |4eaed:   push   0x10(%rsp)
  2.79 |4eaf1:   push   0x10(%rsp)
  0.07 |4eaf5:   push   %rax
// Call net_dim()
  0.21 |4eaf6:   call   4eafb <mlx5e_handle_rx_dim+0x6b>

To allow the caller to reuse the struct dim_sample already on the stack,
pass the struct dim_sample by reference to net_dim().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 Documentation/networking/net_dim.rst                   |  2 +-
 drivers/net/ethernet/amazon/ena/ena_netdev.c           |  2 +-
 drivers/net/ethernet/broadcom/bcmsysport.c             |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c              |  4 ++--
 drivers/net/ethernet/broadcom/genet/bcmgenet.c         |  2 +-
 drivers/net/ethernet/freescale/enetc/enetc.c           |  2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        |  4 ++--
 drivers/net/ethernet/intel/ice/ice_txrx.c              |  4 ++--
 drivers/net/ethernet/intel/idpf/idpf_txrx.c            |  4 ++--
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c |  2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c            |  4 ++--
 drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c      |  4 ++--
 drivers/net/ethernet/netronome/nfp/nfd3/dp.c           |  4 ++--
 drivers/net/ethernet/netronome/nfp/nfdk/dp.c           |  4 ++--
 drivers/net/ethernet/pensando/ionic/ionic_txrx.c       |  2 +-
 drivers/net/virtio_net.c                               |  2 +-
 drivers/soc/fsl/dpio/dpio-service.c                    |  2 +-
 include/linux/dim.h                                    |  2 +-
 lib/dim/net_dim.c                                      | 10 +++++-----
 19 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/Documentation/networking/net_dim.rst b/Documentation/networking/net_dim.rst
index 8908fd7b0a8d..4377998e6826 100644
--- a/Documentation/networking/net_dim.rst
+++ b/Documentation/networking/net_dim.rst
@@ -154,11 +154,11 @@ usage is not complete but it should make the outline of the usage clear.
 	dim_update_sample(my_entity->events,
 		          my_entity->packets,
 		          my_entity->bytes,
 		          &dim_sample);
 	/* Call net DIM */
-	net_dim(&my_entity->dim, dim_sample);
+	net_dim(&my_entity->dim, &dim_sample);
 	...
   }
 
   /* My entity's initialization function (my_entity was already allocated) */
   int my_driver_init_my_entity(struct my_driver_entity *my_entity, ...)
diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index 96df20854eb9..63c8a2328142 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -1381,11 +1381,11 @@ static void ena_adjust_adaptive_rx_intr_moderation(struct ena_napi *ena_napi)
 	dim_update_sample(rx_ring->non_empty_napi_events,
 			  rx_ring->rx_stats.cnt,
 			  rx_ring->rx_stats.bytes,
 			  &dim_sample);
 
-	net_dim(&ena_napi->dim, dim_sample);
+	net_dim(&ena_napi->dim, &dim_sample);
 
 	rx_ring->per_napi_packets = 0;
 }
 
 void ena_unmask_interrupt(struct ena_ring *tx_ring,
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index caff6e87a488..031e9e0cca53 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -1027,11 +1027,11 @@ static int bcm_sysport_poll(struct napi_struct *napi, int budget)
 	}
 
 	if (priv->dim.use_dim) {
 		dim_update_sample(priv->dim.event_ctr, priv->dim.packets,
 				  priv->dim.bytes, &dim_sample);
-		net_dim(&priv->dim.dim, dim_sample);
+		net_dim(&priv->dim.dim, &dim_sample);
 	}
 
 	return work_done;
 }
 
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 6dd6541d8619..ca42b81133d7 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3100,11 +3100,11 @@ static int bnxt_poll(struct napi_struct *napi, int budget)
 
 		dim_update_sample(cpr->event_ctr,
 				  cpr->rx_packets,
 				  cpr->rx_bytes,
 				  &dim_sample);
-		net_dim(&cpr->dim, dim_sample);
+		net_dim(&cpr->dim, &dim_sample);
 	}
 	return work_done;
 }
 
 static int __bnxt_poll_cqs(struct bnxt *bp, struct bnxt_napi *bnapi, int budget)
@@ -3231,11 +3231,11 @@ static int bnxt_poll_p5(struct napi_struct *napi, int budget)
 
 		dim_update_sample(cpr->event_ctr,
 				  cpr_rx->rx_packets,
 				  cpr_rx->rx_bytes,
 				  &dim_sample);
-		net_dim(&cpr->dim, dim_sample);
+		net_dim(&cpr->dim, &dim_sample);
 	}
 	return work_done;
 }
 
 static void bnxt_free_tx_skbs(struct bnxt *bp)
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 10966ab15373..53a949eb9180 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2403,11 +2403,11 @@ static int bcmgenet_rx_poll(struct napi_struct *napi, int budget)
 	}
 
 	if (ring->dim.use_dim) {
 		dim_update_sample(ring->dim.event_ctr, ring->dim.packets,
 				  ring->dim.bytes, &dim_sample);
-		net_dim(&ring->dim.dim, dim_sample);
+		net_dim(&ring->dim.dim, &dim_sample);
 	}
 
 	return work_done;
 }
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index c09370eab319..05dedea6185a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -716,11 +716,11 @@ static void enetc_rx_net_dim(struct enetc_int_vector *v)
 
 	dim_update_sample(v->comp_cnt,
 			  v->rx_ring.stats.packets,
 			  v->rx_ring.stats.bytes,
 			  &dim_sample);
-	net_dim(&v->rx_dim, dim_sample);
+	net_dim(&v->rx_dim, &dim_sample);
 }
 
 static int enetc_bd_ready_count(struct enetc_bdr *tx_ring, int ci)
 {
 	int pi = enetc_rd_reg_hot(tx_ring->tcir) & ENETC_TBCIR_IDX_MASK;
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index 4cbc4d069a1f..43377a7b2426 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -4446,11 +4446,11 @@ static void hns3_update_rx_int_coalesce(struct hns3_enet_tqp_vector *tqp_vector)
 	if (!rx_group->coal.adapt_enable)
 		return;
 
 	dim_update_sample(tqp_vector->event_cnt, rx_group->total_packets,
 			  rx_group->total_bytes, &sample);
-	net_dim(&rx_group->dim, sample);
+	net_dim(&rx_group->dim, &sample);
 }
 
 static void hns3_update_tx_int_coalesce(struct hns3_enet_tqp_vector *tqp_vector)
 {
 	struct hns3_enet_ring_group *tx_group = &tqp_vector->tx_group;
@@ -4459,11 +4459,11 @@ static void hns3_update_tx_int_coalesce(struct hns3_enet_tqp_vector *tqp_vector)
 	if (!tx_group->coal.adapt_enable)
 		return;
 
 	dim_update_sample(tqp_vector->event_cnt, tx_group->total_packets,
 			  tx_group->total_bytes, &sample);
-	net_dim(&tx_group->dim, sample);
+	net_dim(&tx_group->dim, &sample);
 }
 
 static int hns3_nic_common_poll(struct napi_struct *napi, int budget)
 {
 	struct hns3_nic_priv *priv = netdev_priv(napi->dev);
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx.c b/drivers/net/ethernet/intel/ice/ice_txrx.c
index 8208055d6e7f..5d2d7736fd5f 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx.c
+++ b/drivers/net/ethernet/intel/ice/ice_txrx.c
@@ -1350,18 +1350,18 @@ static void ice_net_dim(struct ice_q_vector *q_vector)
 
 	if (ITR_IS_DYNAMIC(tx)) {
 		struct dim_sample dim_sample;
 
 		__ice_update_sample(q_vector, tx, &dim_sample, true);
-		net_dim(&tx->dim, dim_sample);
+		net_dim(&tx->dim, &dim_sample);
 	}
 
 	if (ITR_IS_DYNAMIC(rx)) {
 		struct dim_sample dim_sample;
 
 		__ice_update_sample(q_vector, rx, &dim_sample, false);
-		net_dim(&rx->dim, dim_sample);
+		net_dim(&rx->dim, &dim_sample);
 	}
 }
 
 /**
  * ice_buildreg_itr - build value for writing to the GLINT_DYN_CTL register
diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index d4e6f0e10487..da2a5becf62f 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -3677,11 +3677,11 @@ static void idpf_net_dim(struct idpf_q_vector *q_vector)
 		} while (u64_stats_fetch_retry(&txq->stats_sync, start));
 	}
 
 	idpf_update_dim_sample(q_vector, &dim_sample, &q_vector->tx_dim,
 			       packets, bytes);
-	net_dim(&q_vector->tx_dim, dim_sample);
+	net_dim(&q_vector->tx_dim, &dim_sample);
 
 check_rx_itr:
 	if (!IDPF_ITR_IS_DYNAMIC(q_vector->rx_intr_mode))
 		return;
 
@@ -3696,11 +3696,11 @@ static void idpf_net_dim(struct idpf_q_vector *q_vector)
 		} while (u64_stats_fetch_retry(&rxq->stats_sync, start));
 	}
 
 	idpf_update_dim_sample(q_vector, &dim_sample, &q_vector->rx_dim,
 			       packets, bytes);
-	net_dim(&q_vector->rx_dim, dim_sample);
+	net_dim(&q_vector->rx_dim, &dim_sample);
 }
 
 /**
  * idpf_vport_intr_update_itr_ena_irq - Update itr and re-enable MSIX interrupt
  * @q_vector: q_vector for which itr is being updated and interrupt enabled
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
index 933e18ba2fb2..7aaf32e9aa95 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
@@ -525,11 +525,11 @@ static void otx2_adjust_adaptive_coalese(struct otx2_nic *pfvf, struct otx2_cq_p
 
 	dim_update_sample(pfvf->napi_events,
 			  rx_frames + tx_frames,
 			  rx_bytes + tx_bytes,
 			  &dim_sample);
-	net_dim(&cq_poll->dim, dim_sample);
+	net_dim(&cq_poll->dim, &dim_sample);
 }
 
 int otx2_napi_handler(struct napi_struct *napi, int budget)
 {
 	struct otx2_cq_queue *rx_cq = NULL;
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f01ceee5f02d..53485142938c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2225,11 +2225,11 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 	eth->rx_packets += done;
 	eth->rx_bytes += bytes;
 	dim_update_sample(eth->rx_events, eth->rx_packets, eth->rx_bytes,
 			  &dim_sample);
-	net_dim(&eth->rx_dim, dim_sample);
+	net_dim(&eth->rx_dim, &dim_sample);
 
 	if (xdp_flush)
 		xdp_do_flush();
 
 	return done;
@@ -2375,11 +2375,11 @@ static int mtk_poll_tx(struct mtk_eth *eth, int budget)
 	if (state.txq)
 		netdev_tx_completed_queue(state.txq, state.done, state.bytes);
 
 	dim_update_sample(eth->tx_events, eth->tx_packets, eth->tx_bytes,
 			  &dim_sample);
-	net_dim(&eth->tx_dim, dim_sample);
+	net_dim(&eth->tx_dim, &dim_sample);
 
 	if (mtk_queue_stopped(eth) &&
 	    (atomic_read(&ring->free_count) > ring->thresh))
 		mtk_wake_queue(eth);
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c
index 5873fde65c2e..417098f0b2bb 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c
@@ -53,11 +53,11 @@ static void mlx5e_handle_tx_dim(struct mlx5e_txqsq *sq)
 
 	if (unlikely(!test_bit(MLX5E_SQ_STATE_DIM, &sq->state)))
 		return;
 
 	dim_update_sample(sq->cq.event_ctr, stats->packets, stats->bytes, &dim_sample);
-	net_dim(sq->dim, dim_sample);
+	net_dim(sq->dim, &dim_sample);
 }
 
 static void mlx5e_handle_rx_dim(struct mlx5e_rq *rq)
 {
 	struct mlx5e_rq_stats *stats = rq->stats;
@@ -65,11 +65,11 @@ static void mlx5e_handle_rx_dim(struct mlx5e_rq *rq)
 
 	if (unlikely(!test_bit(MLX5E_RQ_STATE_DIM, &rq->state)))
 		return;
 
 	dim_update_sample(rq->cq.event_ctr, stats->packets, stats->bytes, &dim_sample);
-	net_dim(rq->dim, dim_sample);
+	net_dim(rq->dim, &dim_sample);
 }
 
 void mlx5e_trigger_irq(struct mlx5e_icosq *sq)
 {
 	struct mlx5_wq_cyc *wq = &sq->wq;
diff --git a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
index d215efc6cad0..f1c6c47564b1 100644
--- a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
+++ b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
@@ -1177,11 +1177,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int budget)
 			pkts = r_vec->rx_pkts;
 			bytes = r_vec->rx_bytes;
 		} while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
 
 		dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
-		net_dim(&r_vec->rx_dim, dim_sample);
+		net_dim(&r_vec->rx_dim, &dim_sample);
 	}
 
 	if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
 		struct dim_sample dim_sample = {};
 		unsigned int start;
@@ -1192,11 +1192,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int budget)
 			pkts = r_vec->tx_pkts;
 			bytes = r_vec->tx_bytes;
 		} while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
 
 		dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
-		net_dim(&r_vec->tx_dim, dim_sample);
+		net_dim(&r_vec->tx_dim, &dim_sample);
 	}
 
 	return pkts_polled;
 }
 
diff --git a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
index dae5af7d1845..ebeb6ab4465c 100644
--- a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
+++ b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
@@ -1287,11 +1287,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int budget)
 			pkts = r_vec->rx_pkts;
 			bytes = r_vec->rx_bytes;
 		} while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
 
 		dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
-		net_dim(&r_vec->rx_dim, dim_sample);
+		net_dim(&r_vec->rx_dim, &dim_sample);
 	}
 
 	if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
 		struct dim_sample dim_sample = {};
 		unsigned int start;
@@ -1302,11 +1302,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int budget)
 			pkts = r_vec->tx_pkts;
 			bytes = r_vec->tx_bytes;
 		} while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
 
 		dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
-		net_dim(&r_vec->tx_dim, dim_sample);
+		net_dim(&r_vec->tx_dim, &dim_sample);
 	}
 
 	return pkts_polled;
 }
 
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_txrx.c b/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
index 0eeda7e502db..2ac59564ded1 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
@@ -926,11 +926,11 @@ static void ionic_dim_update(struct ionic_qcq *qcq, int napi_mode)
 	}
 
 	dim_update_sample(qcq->cq.bound_intr->rearm_count,
 			  pkts, bytes, &dim_sample);
 
-	net_dim(&qcq->dim, dim_sample);
+	net_dim(&qcq->dim, &dim_sample);
 }
 
 int ionic_tx_napi(struct napi_struct *napi, int budget)
 {
 	struct ionic_qcq *qcq = napi_to_qcq(napi);
diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 792e9eadbfc3..869586c17ffd 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2802,11 +2802,11 @@ static void virtnet_rx_dim_update(struct virtnet_info *vi, struct receive_queue
 	dim_update_sample(rq->calls,
 			  u64_stats_read(&rq->stats.packets),
 			  u64_stats_read(&rq->stats.bytes),
 			  &cur_sample);
 
-	net_dim(&rq->dim, cur_sample);
+	net_dim(&rq->dim, &cur_sample);
 	rq->packets_in_napi = 0;
 }
 
 static int virtnet_poll(struct napi_struct *napi, int budget)
 {
diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index b811446e0fa5..0b60ed16297c 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -889,10 +889,10 @@ void dpaa2_io_update_net_dim(struct dpaa2_io *d, __u64 frames, __u64 bytes)
 
 	d->bytes += bytes;
 	d->frames += frames;
 
 	dim_update_sample(d->event_ctr, d->frames, d->bytes, &dim_sample);
-	net_dim(&d->rx_dim, dim_sample);
+	net_dim(&d->rx_dim, &dim_sample);
 
 	spin_unlock(&d->dim_lock);
 }
 EXPORT_SYMBOL(dpaa2_io_update_net_dim);
diff --git a/include/linux/dim.h b/include/linux/dim.h
index 84579a50ae7f..06543fd40fcc 100644
--- a/include/linux/dim.h
+++ b/include/linux/dim.h
@@ -423,11 +423,11 @@ struct dim_cq_moder net_dim_get_def_tx_moderation(u8 cq_period_mode);
  *
  * Called by the consumer.
  * This is the main logic of the algorithm, where data is processed in order
  * to decide on next required action.
  */
-void net_dim(struct dim *dim, struct dim_sample end_sample);
+void net_dim(struct dim *dim, const struct dim_sample *end_sample);
 
 /* RDMA DIM */
 
 /*
  * RDMA DIM profile:
diff --git a/lib/dim/net_dim.c b/lib/dim/net_dim.c
index d7e7028e9b19..d6aa09a979b3 100644
--- a/lib/dim/net_dim.c
+++ b/lib/dim/net_dim.c
@@ -345,33 +345,33 @@ static bool net_dim_decision(struct dim_stats *curr_stats, struct dim *dim)
 		dim->prev_stats = *curr_stats;
 
 	return dim->profile_ix != prev_ix;
 }
 
-void net_dim(struct dim *dim, struct dim_sample end_sample)
+void net_dim(struct dim *dim, const struct dim_sample *end_sample)
 {
 	struct dim_stats curr_stats;
 	u16 nevents;
 
 	switch (dim->state) {
 	case DIM_MEASURE_IN_PROGRESS:
 		nevents = BIT_GAP(BITS_PER_TYPE(u16),
-				  end_sample.event_ctr,
+				  end_sample->event_ctr,
 				  dim->start_sample.event_ctr);
 		if (nevents < DIM_NEVENTS)
 			break;
-		if (!dim_calc_stats(&dim->start_sample, &end_sample, &curr_stats))
+		if (!dim_calc_stats(&dim->start_sample, end_sample, &curr_stats))
 			break;
 		if (net_dim_decision(&curr_stats, dim)) {
 			dim->state = DIM_APPLY_NEW_PROFILE;
 			schedule_work(&dim->work);
 			break;
 		}
 		fallthrough;
 	case DIM_START_MEASURE:
-		dim_update_sample(end_sample.event_ctr, end_sample.pkt_ctr,
-				  end_sample.byte_ctr, &dim->start_sample);
+		dim_update_sample(end_sample->event_ctr, end_sample->pkt_ctr,
+				  end_sample->byte_ctr, &dim->start_sample);
 		dim->state = DIM_MEASURE_IN_PROGRESS;
 		break;
 	case DIM_APPLY_NEW_PROFILE:
 		break;
 	}
-- 
2.45.2


