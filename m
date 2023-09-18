Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5D4CD13DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ohe7PTNvXOZGi+BDTtfZfa0VwrX9Qjt0oNzoT7NFb2A=; b=fBKLw2ThW91EWIhdXt+m2Nq74Y
	6rVnHqAHXIzUqQXMfJOPn63ulHmbX8uqJUsmNoN1K5rkG1epH38/h0L9iUN7IfixD4gjZ04/FoXs7
	vigJIP/Vg0FPscANfqBhatSAAhhEJAUuBoVMLejs5w/kVOsCG/+r1LOI2my/ODC1HVXdi+N+GybVe
	f5WANc3chqs7mDl137eG9nyLOsX7LHnQQVkRM0rULn71axgpL8tW59uiHlSIrglTPBREXLQ5/6+0T
	IIy0w/7FY1HAjG3PkiBT3dBlw6J8en2QF9L4vnysY+9/81TQgG8CYuLrgo63UZ7jiM491VjsbxH8f
	tDmGJfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJpA-00GANx-2G;
	Mon, 18 Sep 2023 19:22:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJp4-00GAGi-0I;
	Mon, 18 Sep 2023 19:22:19 +0000
X-UUID: ac339884565811ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ohe7PTNvXOZGi+BDTtfZfa0VwrX9Qjt0oNzoT7NFb2A=;
	b=gAW9Rknb2Xg8Kch2aIDa9ryDvfBedd0K1prfFWJCVq/5ZxcL+9L6A3MO2RHOFpa8vZ5/9+LQXRYG3yYxsaDKg4JkdnBC/K6tDO5ioY1h7fxnNpoUma/srfrKAcQ4PxkFjV7EWjH5eIEeWuHY/8clDwzta97QZNwZO6jkBtEYdVc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:3d18e324-7840-4987-9494-c09c83071a55,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:ff9a2bc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR
	:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ac339884565811ee9b7791016c24628a-20230918
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 960021295; Mon, 18 Sep 2023 12:22:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:08 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Elvis Wang" <Elvis.Wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 13/15] mailbox: mediatek: Add mt8188 support for CMDQ secure driver
Date: Tue, 19 Sep 2023 03:22:02 +0800
Message-ID: <20230918192204.32263-14-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.418400-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+sXSulpnju2H23NvezwBrVmTJDl9FKHbrkKogmGusPLbxnd
	tvNnwKaH4vM1YF6AJbadn/a8z5b7FtAtbEEX0MxBxEHRux+uk8hxKpvEGAbTDs52aMwdfUbNAMi
	+x5DcAtKFmah50m+y3Z30wU8NihPLdiAY2whwRjAUPzmnqX7L6lD+ECo116Dupd01CO1VgD51OB
	66CA39FnmVKZusLp922v9OjYWA2uMMswg45VMfPXY3pGDmoik6
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.418400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DC8342B6EF4BD92F8D927C9C4DCB5A0A4AF643F97636FB377AEDB0B0A1C2598E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_122218_176214_A3781A77 
X-CRM114-Status: GOOD (  10.13  )
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

Add mt8188 support for CMDQ secure driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 3940b9f8e774..4e047dc916b9 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -750,6 +750,7 @@ static const struct gce_plat gce_plat_v8 = {
 	.thread_nr = 32,
 	.shift = 3,
 	.control_by_sw = true,
+	.has_sec = true,
 	.gce_num = 2
 };
 
-- 
2.18.0


