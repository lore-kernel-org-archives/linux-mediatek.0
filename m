Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0DCC25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7mIr+t/6d/0mox7UxZ9GqbaTZMq4mpqJIVQyRs3Ilc=; b=B0Cmmsiz7P+HK4rA+GXa9QYK+M
	E6EvIFNJDBZwbpNI+raBIUmEKK+Wuzh5l378xnfoCmJllXqeNoCTyhkfjwY6/XnU3KjLOrN2HtT/I
	ih4vxrBNanMg5i6Vr2Fgy2U4CvXglD5ps3zs6S43YJn3z3cjjfI7onM/RcY1iKHi98k3I8XvtuqNM
	LjNqfQUbPuRo3fZPhxzpRq0d5aRhHXSAXq8JOQAyN1bUS2QD2K0r3nhAKLLGTK+3UJY07dlXwE+Ch
	vn6r5K4U+84A5GB222LEqAOLNzJBaVWkM1k4fCuzA5EOtCT3g8bleXlpI/FtRos2x3f8AF8tE3/rO
	jf0ZQniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEoKM-00000005dLQ-45Vn;
	Wed, 05 Jun 2024 10:57:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEoKI-00000005dFw-2tta;
	Wed, 05 Jun 2024 10:57:08 +0000
X-UUID: 553d72c6232a11efbf6c7d4f5c147266-20240605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T7mIr+t/6d/0mox7UxZ9GqbaTZMq4mpqJIVQyRs3Ilc=;
	b=FhQ+a9XRK5dDSxdrY1EOQ6qAQ0p9GCNI7ssQhQg1iM6na+oOzaMTabJQx+p9mNHMElskFfbDEKO/+y+OwSJQ+lmbFgoHF3caXl4v1dSnrB+OvskaTI9XRQEjhyCplvU1AOCsJk35Q679/Kg3J76T+bA3AI0NuNZd/217h/XI1XM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:a197245c-6a19-4680-b834-3e729f9e9672,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:69e13e88-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 553d72c6232a11efbf6c7d4f5c147266-20240605
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2001172523; Wed, 05 Jun 2024 03:56:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 5 Jun 2024 18:56:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 5 Jun 2024 18:56:55 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <sakari.ailus@linux.intel.com>
CC: <laurent.pinchart@ideasonboard.com>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yunkec@chromium.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jacopo.mondi@ideasonboard.com>,
	<zhi.mao@mediatek.com>, <10572168@qq.com>, <hverkuil-cisco@xs4all.nl>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <macromorgan@hotmail.com>,
	<linus.walleij@linaro.org>, <hdegoede@redhat.com>,
	<tomi.valkeinen@ideasonboard.com>, <gerald.loacker@wolfvision.net>,
	<andy.shevchenko@gmail.com>, <bingbu.cao@intel.com>,
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for GC05A2 image sensor
Date: Wed, 5 Jun 2024 18:55:40 +0800
Message-ID: <20240605105540.17937-4-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605105540.17937-1-zhi.mao@mediatek.com>
References: <20240605105540.17937-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_035706_826034_4578BD4D 
X-CRM114-Status: UNSURE (   9.33  )
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

Add maintain entry for GC05A2 image sensor

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bb9f8077b37d..e2ef7a57c0e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9099,6 +9099,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
 F:	drivers/media/i2c/gc0308.c
 
+GALAXYCORE GC05a2 CAMERA SENSOR DRIVER
+M:	Zhi Mao <zhi.mao@mediatek.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
+F:	drivers/media/i2c/gc05a2.c
+
 GALAXYCORE GC2145 SENSOR DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-media@vger.kernel.org
-- 
2.25.1


