Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13334C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 06:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C/x5ZEPwF9HzG+0ysOsNMQvXNqur3Ncn/FhZ9KulUQ4=; b=zXifm3+97z+xTDpub/PGVQReTC
	LvKV8D2tvNage2jB3epFMvsiPF2D9jk1pLrSOsVCc3/Iza0UNPzwhZMBreGdPdHAGOUt/U4tjMa83
	NgG7tByuPVQESyyRVdS3I3teh4aGWcUumdkORQOeFnELU4seo8gyCcfhS3oc4A1eYGSfjgmiDNVZi
	/EMkwUdEn6ESrU3iJY9UaSuXJYWEgVpdRTVlzdX1aT/UfYGwKEr/95/3YFBwkcybp6NswOu4RkyPs
	w2/HcZcDHugAkjB1OCAl2dEOQq9ebpoMPI1IoN2srooH7Zq8xP5nlktph7t+7E3DcbLur63/N5LPy
	zuBMheQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpNI-0000000Ffef-35FY;
	Wed, 20 Mar 2024 06:24:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpN6-0000000FfVe-2uq4;
	Wed, 20 Mar 2024 06:24:27 +0000
X-UUID: 7abab39ae68211eeacdb61a41848c7d2-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C/x5ZEPwF9HzG+0ysOsNMQvXNqur3Ncn/FhZ9KulUQ4=;
	b=lVHSsUZ3/78y68PeK7mTFcWc+jjoCJklWpt1mLlcAkiRoZgOhH9+ToY6Q86mnsEx+eIvMPLxBPYgn66/q+lR14bA5IzpDQ10NggjzojuwIOF7DBNWHt6vwcErTEY0KiBkgGAjDT1Jh/u2hGkOyUAFJ7lUL2LTcZnEQAQvQIz1Iw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4c41b6fe-cca9-41d0-b039-61e20145b033,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:00153685-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7abab39ae68211eeacdb61a41848c7d2-20240319
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 266640513; Tue, 19 Mar 2024 23:24:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 14:13:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 14:13:38 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <sebastian.fricke@collabora.com>
CC: Longfei Wang <longfei.wang@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] media: mediatek: vcodec: Handle invalid decoder vsi
Date: Wed, 20 Mar 2024 14:13:36 +0800
Message-ID: <20240320061336.2615-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.832200-8.000000
X-TMASE-MatchedRID: nNgqr+SeSsSrSedjouq7Z7MjW/sniEQK+Vb3woyMZbuU8ftiyKjZrRKD
	eJ94PUa2cspcFewXO92AMuqetGVetv1UB9A6pTKC3QfwsVk0UbsIoUKaF27lxVOb0brJ+/6rvkS
	GjzkB1uo1yZqscazcVC2u/uqEQ+30NPT6X9pzQIunTH3K2EqYY3j6YUn1Dqif7TmFv0QF0kyTES
	cYd8gA2mmnnl9kOWyvfhxj8HsmpdphnVHs1efQx0GaYJdwrIUUnqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.832200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 26B1BC9D6BAFBFA7FE3DF0EA3DC0BBCEE827FEFEE317F6209CECF52A10B9F6542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_232420_872067_DB6AADA6 
X-CRM114-Status: UNSURE (   9.47  )
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

Handle invalid decoder vsi in vpu_dec_init to ensure the decoder vsi is
valid for future use.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 82e57ae983d5..17770993fe5a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -231,6 +231,12 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	mtk_vdec_debug(vpu->ctx, "vdec_inst=%p", vpu);
 
 	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
+
+	if (IS_ERR_OR_NULL(vpu->vsi)) {
+		mtk_vdec_err(vpu->ctx, "invalid vdec vsi, status=%d", err);
+		return -EINVAL;
+	}
+
 	mtk_vdec_debug(vpu->ctx, "- ret=%d", err);
 	return err;
 }
-- 
2.18.0


