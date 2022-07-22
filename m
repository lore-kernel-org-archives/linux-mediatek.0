Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3150FC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 08:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DPcjI0LIlsaFKiVSnERWISObm446Cib/HLNTXS6Dw6c=; b=y+F01Ig6iJ3F/gJWA3mJKEovb1
	baifVygJtHg0V+SUtM7MbUsR4RZ9GxHHtPRTNnCdYaHUyWoO/Xd5kpFfyKDOdMHlmGXFOWzC3cWQS
	XYNwNNFoE5Yx06berb8weq4hesk670hyoRRM8IDRHX60MuDTRFGPw5ITCaaK0BeRq8pFK5mFVTZof
	yYBb1UWtHq28Mt8Ev/WdsUxY/wFnVFfRLZTdT0xycIbGz6YiO2IDj7qlQbYpQ+L9ks+xyz+9cmcv4
	XefsNPr5Rh0CQvjpwnaIMJKZTTMGz6/MwH2e+D1l0EytsXogqqBZ4kapRNK0qJzUvpmhOtfvl5H2+
	krew0MBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEoCv-00177K-JO; Fri, 22 Jul 2022 08:40:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEoCr-00171Q-6Z
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 08:40:23 +0000
X-UUID: 4ea5e1f2d8cd4dbb94f066fb51440be2-20220722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3763ec17-e5bc-40cd-8e64-b3350762e611,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:7fb98e29-fd69-41f1-91fc-8b8a329d3a88,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4ea5e1f2d8cd4dbb94f066fb51440be2-20220722
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 764572135; Fri, 22 Jul 2022 01:40:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 22 Jul 2022 16:29:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 22 Jul 2022 16:29:34 +0800
Message-ID: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
Subject: pull request: linux-firmware: Update Mediatek MT8183/MT8192/MT8195
 SCP firmware
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>,
	<shawnku@google.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Justin.Yeh@mediatek.com>, <Allen-KH.Cheng@mediatek.com>
Date: Fri, 22 Jul 2022 16:29:34 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_014021_269038_B84F1333 
X-CRM114-Status: UNSURE (   6.91  )
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

Hi maintainers,

Update SCP firmware for MediaTek MT8183/MT8192/MT8195.
Thank you!


Regards,
TingHan

---

The following changes since commit 4421586e8e95ce789cb6b3f1af98962bfef74c7b:

  amdgpu: update renoir to release 22.20 (2022-07-19 06:44:08 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-scp-20220722

for you to fetch changes up to 56cf6461a82b08facd41154f7c44a19f0a085f66:

  mediatek: Update mt8183/mt8192/mt8195 SCP firmware (2022-07-22 16:16:27 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Update mt8183/mt8192/mt8195 SCP firmware

 WHENCE                  |   6 +++---
 mediatek/mt8183/scp.img | Bin 1032064 -> 1030776 bytes
 mediatek/mt8192/scp.img | Bin 327968 -> 328096 bytes
 mediatek/mt8195/scp.img | Bin 429668 -> 429820 bytes
 4 files changed, 3 insertions(+), 3 deletions(-)


