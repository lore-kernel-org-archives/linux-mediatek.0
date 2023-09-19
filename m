Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DCCCD3433
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 03:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8YVDxyqFUMPUtEmRu4vRhBkKU6+xIuJD/plS6PwPgI=; b=qx3pCbGX1hEja4aTy4mrumXMD7
	cLkMQJdDf+ESJNZjfYsT+G9XfZmayMo80vgffpytNTfTJgdNjeak9I1avaD40E5oUI/Kdn3QJYMzj
	93JopThZzh2kL+QQVBKqUl3vazhdo2bRffCDB0qw45LrSLO10DEvXk4guIPi4XFp2pvfRVt6nEuRh
	jEKrUxqn0vDsakkXUibnfSHTizvgJwvIk5oW71hyI6+FNGGwL+CralxZu+fwoya0PgUar6V9dNQVL
	bwSPmn5+rNdCw6wVn5NmasyZCzSp9pnR4EeCN3jMLRtZZ4hcVOva5qenhikTDohePhkVIstIhrb5L
	8POdHUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiR2R-00GlwM-2T;
	Tue, 19 Sep 2023 03:04:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiR2J-00GlqF-0P;
	Tue, 19 Sep 2023 03:04:28 +0000
X-UUID: 3b9ef4ec569911ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=P8YVDxyqFUMPUtEmRu4vRhBkKU6+xIuJD/plS6PwPgI=;
	b=cGEy1+pyEJ0Z1e03i1oowAFaMg/7afZ2QOdng9oHmO3wpfhyWcYxa4C/zRQVAUSNNwqmUqw0Rusp64qIRwVrxEkhgX9ecoPnPJXV9Ml+HE+X8DQVrG8wlcdZTQJ2nZ5axquen1bRNibMUnCN6ASG+mEgIhwevuI/O8YRYW+h5VQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:bf038b3b-d584-414a-bbc6-ce29e868362a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:2e202fc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3b9ef4ec569911ee9b7791016c24628a-20230918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 876863917; Mon, 18 Sep 2023 20:04:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 11:03:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 11:03:47 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Jason-ch
 Chen" <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 04/10] drm/mediatek: Add secure identify flag and funcution to mtk_drm_plane
Date: Tue, 19 Sep 2023 11:03:39 +0800
Message-ID: <20230919030345.8629-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.953300-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+sXSulpnju2H0hwlOfYeSqxEbxKVXd70tXfUZT83lbkEAte
	+Pua94rgIAIDm5vZWu4+PHq8e3nI3h8TzIzimOwPC24oEZ6SpSmb4wHqRpnaDv34F7bMpQx9hin
	ct4EsDwcwVAe/hvF/RWd+CkOAbYQn3xRUQILtibZkqeK1RJU6ff/9fS95GkA7CM4wutSD8b/iL/
	CRDFHgmkma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6x5U/HridGByp+zdaDg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.953300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 970F2FF1458D4C470B41AC76593BC4974EFB1D296060D843A976641D04EFADC22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_200427_165483_35D917EB 
X-CRM114-Status: UNSURE (   9.52  )
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

Add is_sec flag to identify current mtk_drm_plane is secure.
Add mtk_plane_is_sec_fb() to check current drm_framebuffer is secure.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 99aff7da0831..fe60e20a6e1c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -33,6 +33,7 @@ struct mtk_plane_pending_state {
 	bool				async_dirty;
 	bool				async_config;
 	enum drm_color_encoding		color_encoding;
+	bool				is_sec;
 };
 
 struct mtk_plane_state {
@@ -46,6 +47,7 @@ to_mtk_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct mtk_plane_state, base);
 }
 
+bool mtk_plane_fb_is_secure(struct drm_framebuffer *fb);
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 *formats,
-- 
2.18.0


