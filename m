Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC27ECD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZryZl/fS6pc78wdeFePflYUHBIKbUg/O9hvHU797WQA=; b=zPurGaiHJ9eyGbIwuCc6sWjwoO
	Kb65u2nfqv1Zsvu2sbS7HfJ95tdbxnQcJoXSNgasrBOnk/vNGUPSaNFxZb52FBftutYNOaFMj9E7k
	bWNWYpCH3utSxWcdL+TYiNeV2Ou29Cy0Bep+RR0s4mN+zhr1yAVSrhW6fIdptJ94eQONlNNvdatpV
	hyJgfv073IOiO3CtzqKr7mR0uWJIFvTOkkuZdVBtW4a012tS3XMnEZA7iprfDB+AVk+9YX2k0DvrC
	YZuWP4wv2vtjIZ0MckKY35wBfYebq4j6+VtV4zWBfF8Qhz4Y/EtE9bJwRphJdExh/Y+k4jg3jtoKv
	XEkxq+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrujJ-0000000EOd6-09cl;
	Wed, 03 Apr 2024 07:08:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrujE-0000000EOa4-3tAH;
	Wed, 03 Apr 2024 07:08:15 +0000
X-UUID: ec71a492f18811ee96d5dfc950b7243d-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZryZl/fS6pc78wdeFePflYUHBIKbUg/O9hvHU797WQA=;
	b=JqK+SNTCe+gLRpH4kWbJGmA45yMN5tNhzCWMW+gwY8z76GbFiQszeKlFclynxiuxL7mpPP+1zp3T1iv1stYbi8GrMxySn3GNHc4pToWdyR9GZgku9cb2jqzrEZqBGqoiCdIatI9kgsa1tJJBSLk3pLQOZOfa67aXBWAuXHcuxMk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:99a5818c-4c9f-4d79-87eb-be4800cc6b58,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:e9a0c385-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ec71a492f18811ee96d5dfc950b7243d-20240403
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 928486861; Wed, 03 Apr 2024 00:08:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 15:07:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 15:07:33 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
	<sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v4 1/9] drm/mediatek/uapi: Add DRM_MTK_GEM_CREATE_ENCRYPTED flag
Date: Wed, 3 Apr 2024 15:07:24 +0800
Message-ID: <20240403070732.22085-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403070732.22085-1-shawn.sung@mediatek.com>
References: <20240403070732.22085-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.654100-8.000000
X-TMASE-MatchedRID: k8Cd32tj8sGXFGyE5q3nYI6MisxJraxHkKAa/khZ3iT3bBqxmjinTUbj
	B8LDWKj2XQfL6gqs5ORuLPg+qB+4FrzGV3ndBhcIG5mg0pzqmX59LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4I66NVEWSRWybH0KLWoaLjsDRxtpMgfkOquxoY1VGElyx7qk6/CriHFCXDB
	DaofGNbVFVCdf1vKsB2h1guZKcWd06Bd5qdQ0mGA6codyJ3/ShjofsMjQaxVwyYjbiqIQ3Csykh
	tyXcigD6rVdgBjDT2r1nXJavJVNag==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.654100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DFB5D2C452CDE2450E4298B873C27F88EAE4766363A37B3850650FDF66FEB9B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_000813_028500_D5D7AF19 
X-CRM114-Status: GOOD (  10.37  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add DRM_MTK_GEM_CREATE_ENCRYPTED flag to allow user to allocate
a secure buffer to support secure video path feature.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 include/uapi/drm/mediatek_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_drm.h
index b0dea00bacbc4..e9125de3a24ad 100644
--- a/include/uapi/drm/mediatek_drm.h
+++ b/include/uapi/drm/mediatek_drm.h
@@ -54,6 +54,7 @@ struct drm_mtk_gem_map_off {
 
 #define DRM_MTK_GEM_CREATE		0x00
 #define DRM_MTK_GEM_MAP_OFFSET		0x01
+#define DRM_MTK_GEM_CREATE_ENCRYPTED	0x02
 
 #define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)
-- 
2.18.0


