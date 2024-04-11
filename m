Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA6DCD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CEUv8/vX9Yj8LYxJzEvWBhJg+Z+9IJKRp+0lTzE59Rs=; b=f3Lsx2a0OZpT1IL799Om0rbSCs
	Jk/zfl2kOiFJvNzCjBj050bRsDA4BLN2BSt7QGv1L0/Y1VFIoCa54HKgt2iJ0aS92ahIIPhd5ux5E
	bg0ngkkFKPsRxuhcjr43h+VtB8cVPMKN7rsJ+WPXIohOeBChEyJtsKjbryhwAMrfPPZpV7pdnw4Pp
	RSqA4jC2S2JOtX8isW8rmuSLpyMEsr3NYMU+ca6UUPlHbdu76wd4+cmfqahqY+CZBqn8nx/DWa7Yx
	g8GQ0XKiNOyBz84EK+U17EViqgnJ/1F2IUjWBPFIj3Wx1r0iQ8gFWk6WvQ2qM1trCYV8QQ2fYNykZ
	Mgev7U5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulGo-0000000ABvT-3oRi;
	Thu, 11 Apr 2024 03:38:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulGk-0000000ABr7-2yV3;
	Thu, 11 Apr 2024 03:38:35 +0000
X-UUID: f6dc47d4f7b411eeac1957ae9f99f617-20240410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CEUv8/vX9Yj8LYxJzEvWBhJg+Z+9IJKRp+0lTzE59Rs=;
	b=JLshGaH2HuWZgCz+wT3BghPpjZJfR427NB06oU8Zc1GVhjMt0M9imHxbSYoep4+dmyByONjMi2UPqeLtW5KsAPphzkuZTd1nedNH/CMOo3hUlxQSxxiG55OeDl2pS+jkoPLMDSzCmP1YJJkgnMVeF9/sVhfNIPJle1r9EkeLU5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:44259f72-d3f4-4a1c-bdfa-6a93dd5d16ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:bf770a86-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f6dc47d4f7b411eeac1957ae9f99f617-20240410
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1619522116; Wed, 10 Apr 2024 20:38:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Apr 2024 11:37:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Apr 2024 11:37:53 +0800
From: olivia.wen <olivia.wen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Tinghan Shen" <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>
Subject: [PATCH 0/2] Support MT8188 SCP core 1
Date: Thu, 11 Apr 2024 11:37:48 +0800
Message-ID: <20240411033750.6476-1-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.728900-8.000000
X-TMASE-MatchedRID: 5QkmdD6LvPKtGUuyWCB/KosKNaNh88CQTJDl9FKHbrlGL0g1nVmkYV2k
	xKIqW9ov4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8jfhP1xgyx3DNbluTaZDCfQexs
	PsLsZUCpUMEaxhqvmXiMu2Y9Ez16wi+7vFLFx0XSzJ7sL1nbh6SwXJUWXOqeHm110BD6OWbQ2zu
	p2rewEAI6H7DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09qIdY9jOi4lTI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.728900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 744BD5FC53961DB76626F4B855044EB74205B7C16E9164E059E8D277DFA8359C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_203834_760146_0117B9AE 
X-CRM114-Status: UNSURE (   7.47  )
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

Add below patches to support MT8188 SCP core 1
[PATCH 1/2] dt-bindings: remoteproc: mediatek: 
               Support MT8188 dual-core SCP
[PATCH 2/2] remoteproc: mediatek: Support MT8188 SCP core 1

olivia.wen (2):
  dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP
  remoteproc: mediatek: Support MT8188 SCP core 1

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    |  3 +-
 drivers/remoteproc/mtk_common.h                    |  5 +-
 drivers/remoteproc/mtk_scp.c                       | 62 ++++++++++++++++++----
 drivers/remoteproc/mtk_scp_ipi.c                   |  9 +++-
 include/linux/remoteproc/mtk_scp.h                 |  1 +
 5 files changed, 64 insertions(+), 16 deletions(-)

-- 
2.6.4


