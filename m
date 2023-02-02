Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BD7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 13:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=58VVwq5R0SeVWSTuqEd+Zn7+PpfZGMiJHhHOV+5UOXU=; b=ldSb4inTgxnJXmFRUWJK3SqB6D
	PQl954b9rzZN4MYVJB+7OoNiTwxDkHz14X4rwjBVy/Pjq+5k5oPe7FlHJJRmMfj13iZhkGZISbH1N
	Os1TS1Ll20XS7H6OKD4LUarwaEjIh2qFXYt0OIt+voVVIS8x5otZNc55sWWxgc9e+Pio43oQCunQo
	IXEE5hfFPJ2pjPQfZqjnPT6yXiUgle6fgQ51NCsb05JZysmkhseekViLIrvDp8VdvXc1IusKbMwCT
	uhEXcZv8eZdAE8gnrs2uNMPH5mZne6jBLveVKVfW7+tY9hx3CLv+KqG2x1HP8wIHGLtTEV6wZYyT2
	pTWDOqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZDL-00Fvg2-ML; Thu, 02 Feb 2023 13:01:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZDI-00Fvet-5T; Thu, 02 Feb 2023 13:01:17 +0000
X-UUID: aa3e7c14a2f911eda08d4d6090ec5a5c-20230202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=58VVwq5R0SeVWSTuqEd+Zn7+PpfZGMiJHhHOV+5UOXU=;
	b=GsA7nA++86YWeUqE+Gyy4LLCuolRv0C53a3gQitonVW04ldOQBoaKEyRsc7gG51TslDtCk8zIUkctABETenRRBaC4cfQUC9/fz3prl6X3wOB7KGELo9CH68NxyLpFWXmjOuIL53L8qe5NdQ8fIOTZV9qVEcf9Ud97DmEm2gtqNc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:afdbb8b3-91dd-454e-a757-1362f7edc776,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:75381c56-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: aa3e7c14a2f911eda08d4d6090ec5a5c-20230202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 726641852; Thu, 02 Feb 2023 06:01:10 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 2 Feb 2023 20:41:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 2 Feb 2023 20:41:05 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 0/3] Enhance SVS's robustness
Date: Thu, 2 Feb 2023 20:41:01 +0800
Message-ID: <20230202124104.16504-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_050116_247675_88B47C6A 
X-CRM114-Status: UNSURE (   7.61  )
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

SVS driver got accepted upstream but still has room to be improved.
Therefore, we add these patches to fix issues and coding style.

Change since v4:
- Rebase unmerged patches and resend to patchwork

Tested on:
MT8183 Platform (kernel v5.10)
MT8192 Platform (kernel v5.4)

Roger Lu (3):
  soc: mediatek: mtk-svs: use svs get efuse common function
  soc: mediatek: mtk-svs: use common function to disable restore
    voltages
  soc: mediatek: mtk-svs: add thermal voltage compensation if needed

 drivers/soc/mediatek/mtk-svs.c | 142 +++++++++++++--------------------
 1 file changed, 56 insertions(+), 86 deletions(-)



