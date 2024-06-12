Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96B0C27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 01:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoDbejxUQ5CH3/w/X+WKXRuM50NCUjo+XMdENx3Q9sc=; b=IU3wWyUJHkhqn7F/xmmTPlomrO
	IBzea3UL4LABy0DUd6fHoaicU3yp3X1Y0mmgJJDZ1jRVRMSKqYCjDtlpSry9Yb+C7Udof2oFeb8t7
	A0iQw4FyPcGZtqOjBzx2AeUpzYCayLOYvLOdW0tv+bW7AS1LaUdakjmvdwK4pUdhKBS3OlIwbMzk8
	8U5NdvViGXLwytYNbt1Vv1BKmiK6z63sXwdzXCNQ3mQkJ2PfDoVkAlP0TzRfliGjZYMYGolnGSGrI
	0+wlLbEka7RH6VVy8D5I4PKgMPavINWVZQBd6zkdTrP24sn10OHda9hQ9CKXehoVM8F2IrUNSxp4S
	EJgTfcOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHCgG-0000000AfZj-0tsq;
	Wed, 12 Jun 2024 01:21:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHCgB-0000000AfWC-1ysp;
	Wed, 12 Jun 2024 01:21:36 +0000
X-UUID: 1788653c285a11efba8bfb22b0451c12-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GoDbejxUQ5CH3/w/X+WKXRuM50NCUjo+XMdENx3Q9sc=;
	b=iSb0nmpbzwz+qwAH2d9XJwIcH3JbYsdkwv77GMJft1Br5dpug4R4lKiZMAOSI8FB9LcrUnSAKvCNgZmA/lpyMBeXQJ6dCkff59JvsDX/hOg/+q/8pV9gogXMxMVCWOtWgmCjjsf8dYsf9KNtqtGUhtP8i2O1i7OS5tBHe1jU+Vw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:fe867885-cd21-449f-9722-d667c9fff535,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:0632f984-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1788653c285a11efba8bfb22b0451c12-20240611
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2096754562; Tue, 11 Jun 2024 18:21:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jun 2024 09:21:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 09:21:22 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner
	<heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, "Mehdi
 Djait" <mehdi.djait@bootlin.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for GT97xx VCM driver
Date: Wed, 12 Jun 2024 09:20:19 +0800
Message-ID: <20240612012019.19078-4-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612012019.19078-1-zhi.mao@mediatek.com>
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.740300-8.000000
X-TMASE-MatchedRID: GIpmbigRs3Y9S3IiQd+eNQPZZctd3P4BFuNF4lJG6xtGL0g1nVmkYTcG
	i0cOVVasRcK0DrBkisuAMuqetGVetksDkkP3zIjqavP8b9lJtWr6C0ePs7A07fH8XRQwShO7Ayk
	Qe1sIa0XYNwoFzR6TfCnyQECDq3YS+cAQf7nhiHEBxwmF6nT2v0FNSQkI9yjefYyfbAjKfD6cXr
	SpsbyZea6edyNz+tV1oydMlEjRcid9fBQSbWi4PMsNjEULX/uufoZ02Tg1aYA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.740300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BBF44A3C6038B97E8327B33B45543D43F4733C587BBDE6740BD7819DB45B6D542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_182135_672748_391D1C8B 
X-CRM114-Status: GOOD (  11.51  )
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

Add maintainer entry for GT97xx VCM driver

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 670b8201973b..d12694c743ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9328,6 +9328,13 @@ F:	Documentation/filesystems/gfs2*
 F:	fs/gfs2/
 F:	include/uapi/linux/gfs2_ondisk.h
 
+GIANTEC GT9769 LENS VOICE COIL DRIVER
+M:	Zhi Mao <zhi.mao@mediatek.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
+F:	drivers/media/i2c/gt97xx.c
+
 GIGABYTE WATERFORCE SENSOR DRIVER
 M:	Aleksa Savic <savicaleksa83@gmail.com>
 L:	linux-hwmon@vger.kernel.org
@@ -23590,6 +23597,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/ak*
 F:	drivers/media/i2c/dw*
+F:	drivers/media/i2c/gt*
 F:	drivers/media/i2c/lm*
 
 V4L2 CAMERA SENSOR DRIVERS
-- 
2.25.1


