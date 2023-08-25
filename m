Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F5EC6FA8F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gSYhZkHSCCzdMmaFCeh8M3KuCNiXviLZbYMre67Qkt0=; b=xEw7abU4RjPFFoZJuZPZiV1F3X
	g9RHf/G+K6VdQqKmuL3YaEqFrEqRAei7SvkCNYjOBwVFNIcMYuluPIYtRSH//2GbGQB3kY3sNcWOy
	EgzHKpI6HW8BEiRAb8sIO9YQaY2ocjNZt64D1hCCkDtyLpnmHzbjkbWiELmkuCYM68GnrBaY/mudg
	595h2JBSidMwCV2sD1It1j0I/ltlp/jgBaFPkggHL84b0l+IkdxWpULa2Ctl2jWFACisMNahnsEah
	LyhrHw8Bn2bDrqKFzKCcAqSmeu8UQzyFgeUBYSrS/3FdqvyhlZjoQFoxv+dQhv8xbJndPbqL1qDER
	qF5NMPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZNDJ-004BMW-1j;
	Fri, 25 Aug 2023 03:10:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZNDF-004BM1-37;
	Fri, 25 Aug 2023 03:10:19 +0000
X-UUID: e7e8a47242f411ee83ed1395ce914268-20230824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gSYhZkHSCCzdMmaFCeh8M3KuCNiXviLZbYMre67Qkt0=;
	b=X3XBEWf/YbM3MNoyITimnSMftVNjSIVjsDcFSdpCRG7KYS+mFsxRoKLr9Tj54PEFHyUKofHp/q2EF1ltW6tubKEgNUlGo7merjKdEV24NoL669pZ2lYm+ushCGqIyfQjyhbTgwSKe41Mtck1/zx5F6PhEIY9m+6zBsBNOe3kedM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:e5a44d7c-8895-4caf-95a6-2b3756b64d96,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:a958edee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e7e8a47242f411ee83ed1395ce914268-20230824
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 319733; Thu, 24 Aug 2023 20:10:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Aug 2023 10:49:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Aug 2023 10:49:36 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND,v3 0/3] ASoC: mt8188-mt6359: add SOF support
Date: Fri, 25 Aug 2023 10:49:32 +0800
Message-ID: <20230825024935.10878-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_201018_017572_6EF6998B 
X-CRM114-Status: UNSURE (   7.87  )
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

This series introduces dynamic pinctrl and adds support for the SOF on
the mt8188-mt6359 machine driver.

Changes since v2:
  - revise mtk_sof_check_tplg_be_dai_link_fixup().
  
Changes since v1:
  - minor changes to incorporate the suggestions from the reviewer.

Trevor Wu (3):
  ASoC: mediatek: mt8188-mt6359: support dynamic pinctrl
  ASoC: mediatek: common: revise SOF common code
  ASoC: mediatek: mt8188-mt6359: add SOF support

 .../soc/mediatek/common/mtk-dsp-sof-common.c  | 113 +++++++--
 .../soc/mediatek/common/mtk-dsp-sof-common.h  |   8 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 239 +++++++++++++++++-
 3 files changed, 332 insertions(+), 28 deletions(-)

-- 
2.18.0


