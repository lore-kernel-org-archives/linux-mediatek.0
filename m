Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA470D2F7E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 03:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68USvSZu77qzMKozbSicW9caulcy9M9tEmfAfhNd7F0=; b=Gl/UyiiGGa1pVmPgK+cczYII7P
	Vr4UuhYKsE5R6mdwek2EmN570GNZt4J6kNfHVtcO9d94fC7/IlzmgBkGS1NNLgCIfUg9IuiVFzZj+
	UTFN2DJsI3JYNLmGlyMSoYieeFGkwU0DjTaIvMgG5JHfSGUYylg/MhCpEGdkT0W7X5LfPqtl/7cYo
	ORNdYSP5O/5OznKKQCw/KmCy5Ny3SHv/oV1e756A9GkFlM8buS2FVgglovSSSeCDG+s4jU5DR/dN6
	s/k+H6XGLLNZqPSgdsV/a6e3pJnE25cn0a2Q7K2bhWxqH4j9RpDbUcmZapxGBXLH8AQsw8lpGiV37
	5zX4uCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1HAE-0000000DelB-3vNg;
	Thu, 17 Oct 2024 03:27:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H7q-0000000DeWl-3SXY;
	Thu, 17 Oct 2024 03:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=68USvSZu77qzMKozbSicW9caulcy9M9tEmfAfhNd7F0=; b=ISGHcgF8Hh8LR17CeFUt9z7X0G
	jS9HzKdtWNHbIOJTD5845VH+Bv8xVzf+Ire++tNxehRX13zJrdPu31LxaFvjmb7XPJ/QM+OCPMLMQ
	q3d0SA+uewVIhwbjQItM+GaeDaM+vCJnC/cGhO+g4DHUhiH73sGUT5y6cBbE3OuyyIkqqbONjDQ0K
	qEN775xI6FtK+QBgqmJECRQBMaBjJtJWUwgqiB/VWInhBYtnzTmzttP7KNOO3RntYmB7opCcGm3/R
	iETA11wGlX2pqZkmP1XM+Wtu+F75PxaO1x3Iib+paSS8D1L+wNTYwKFK6R2vx2P0IP9yOsS5y4Y7u
	kpqUdAuQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H7a-000000072md-2v1T;
	Thu, 17 Oct 2024 03:24:26 +0000
X-UUID: 48e882108c3711ef82ff63e91e7eb18c-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=68USvSZu77qzMKozbSicW9caulcy9M9tEmfAfhNd7F0=;
	b=VSlA6GYNP4pKdY90l4iyiN2UwX9xyWu0tYCt2BCvCw3yd8HmNyCsorbuF3P68jH1tG21sjfEpaRHg1Bu8LaLW6v1zTw+aG2+bRPlMW9jzw0A4wb5Mhqc/1J4XHicz0XuUjNuz8ZRbqwUOAFqDIEBnBJ3hc44OQjTczzYtcJjWFQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7fd23d96-af30-41f8-ac3b-974b4d58f890,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8681ea06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 48e882108c3711ef82ff63e91e7eb18c-20241016
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 747819524; Wed, 16 Oct 2024 20:24:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 11:24:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Oct 2024 11:24:10 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Simon
 Horman" <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v2 3/3] net: phy: mediatek-ge-soc: Propagate error code correctly in cal_cycle()
Date: Thu, 17 Oct 2024 11:22:13 +0800
Message-ID: <20241017032213.22256-4-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
References: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.666600-8.000000
X-TMASE-MatchedRID: E1MpS5hJl2mf9SROPcS9xgPZZctd3P4B8JzVOUQUG5wKogmGusPLb4KO
	HgdS51oIrXsnC0Bkz2K9TnZXLseR1h8TzIzimOwPC24oEZ6SpSk6XEE7Yhw4FnRn8zaQo/+MPMM
	1RXgEGV0FW/CNJroz7afHryy2FmoegvZxKPAABDf8y7GIVr9A+A4GheOti5yjN6mpdfdFp0iWSi
	jrUwB5vMGQYFMiVRG5ehcPPz6UzEWlb5ogMngNpHOTEn5IiRSOUASbXCnDmH6UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.666600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 980CD781AF41FA93E07A9F7F9A7BDAED161D100E5D645F141870E13AEF892F792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_042419_743182_850015B7 
X-CRM114-Status: GOOD (  11.16  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

This patch propagates error code correctly in cal_cycle()
and improve with FIELD_GET().

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek-ge-soc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index 1d7719b..a931832 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -110,7 +110,7 @@
 #define   MTK_PHY_CR_TX_AMP_OFFSET_D_MASK	GENMASK(6, 0)
 
 #define MTK_PHY_RG_AD_CAL_COMP			0x17a
-#define   MTK_PHY_AD_CAL_COMP_OUT_SHIFT		(8)
+#define   MTK_PHY_AD_CAL_COMP_OUT_MASK		GENMASK(8, 8)
 
 #define MTK_PHY_RG_AD_CAL_CLK			0x17b
 #define   MTK_PHY_DA_CAL_CLK			BIT(0)
@@ -351,8 +351,10 @@ static int cal_cycle(struct phy_device *phydev, int devad,
 
 	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
 			   MTK_PHY_DA_CALIN_FLAG);
-	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP) >>
-			   MTK_PHY_AD_CAL_COMP_OUT_SHIFT;
+	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP);
+	if (ret < 0)
+		return ret;
+	ret = FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
 	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
 
 	return ret;
-- 
2.45.2


