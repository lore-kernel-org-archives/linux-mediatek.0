Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94295606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 01:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XqZ6iuLY;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=B0BsWC8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iQ/pzyfu6F1FUV/I3BMrou23p3S0m7NUJAnaI6wqWf8=; b=XqZ6iuLYPeJJcWe3FNRPM+bWTl
	ll95y7mngYs26ChUeKFe9LIUUn4u5osRvIXOdidk0h0Tm1+RLvIKDpkl5FcNtaxCGL52rTkUGtGck
	jbCxcgZt9jxkMYiXHPw6XykGpg6Jxmx8+Ld2AP0UihF9PuN60Ye0bUO89cCjfVcND2N45hwhTyHL6
	9/0Gm3S7dehReL0kMhjbkRPytazDJGUFXpYxSZsde9k3sa60QZvf+Wg4tLa96yWvW2oiHBcnW3ENj
	GEeL7J60ijGl0zirQRvq1NVmC+E9ojKrqyBECvqMmW1jXcxsHyOIPAgjhj/uj5daSq+6yOqLVPGld
	+/+xx7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsun-000000063u0-0Nia;
	Wed, 28 Oct 2026 01:57:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsuk-000000063ti-2Pvq
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 01:57:19 +0000
X-UUID: e3eb523cd27211f1afed4741b24580c9-20261027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iQ/pzyfu6F1FUV/I3BMrou23p3S0m7NUJAnaI6wqWf8=;
	b=B0BsWC8PfaRmbfe2aXJYcz/glg6szGNyRyyEdTZa8LamIeiPxWnqP2YHosOVdKaGMny8F/DPA+CYZGsaoq66GnkgJylEkcCmAJub9dlOkcRzAOYk0y3D3nMYh0esi/tq8IDGlTL0ARDkvQyHmV3lk+jBL6GSabG5izr3yKJa5DE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:0d70c318-2998-4047-8860-14f903a2899c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:6601d0ed-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e3eb523cd27211f1afed4741b24580c9-20261027
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1520898670; Tue, 27 Oct 2026 18:57:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Oct 2026 09:57:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Oct 2026 09:57:09 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <jeff.hsu@mediatek.com>,
	<eason.lai@mediatek.com>, Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: [PATCH] wifi: mt76: Fix coverity issue for dma init
Date: Wed, 28 Oct 2026 09:57:07 +0800
Message-ID: <20261028015707.2214888-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_185718_622833_D6336281 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jeff Hsu <Jeff.Hsu@mediatek.com>

Check the snprintf return value writing napi_dev->name
free both netdevs and return -EINVAL when < 0

Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index a67880a9281c..2c5d67a5bb81 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -1157,8 +1157,12 @@ mt76_dma_init(struct mt76_dev *dev,
 	priv = netdev_priv(dev->tx_napi_dev);
 	*priv = dev;
 
-	snprintf(dev->napi_dev->name, sizeof(dev->napi_dev->name), "%s",
-		 wiphy_name(dev->hw->wiphy));
+	if (snprintf(dev->napi_dev->name, sizeof(dev->napi_dev->name), "%s",
+		     wiphy_name(dev->hw->wiphy)) < 0) {
+		free_netdev(dev->tx_napi_dev);
+		free_netdev(dev->napi_dev);
+		return -EINVAL;
+	}
 	dev->napi_dev->threaded = 1;
 	init_completion(&dev->mmio.wed_reset);
 	init_completion(&dev->mmio.wed_reset_complete);
-- 
2.45.2


