Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C242C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 06:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zNawnoaaHjlLZq3/CNT/WHhi0vSTAU+m29M2fAmbgCA=; b=IXOy+XOx5D2fBanfLuetRRWYn7
	Eyew8enxwQBvFz2oxnVmv76QfFNprI8O/YW7YEKybALKByg09snpW+XgRCG/yuUWx1v0q5A9G653j
	DVul847Fk3wTcqILDdfh4+DZmIv4rlQ7/bqYfhx45a59Y5YJWj2DPnGKtUzWYWGbqXxthS98seuSX
	paDHVwaviGnHmJCT+b0eZpFqzyyG0bhkBAx3iCdZQn1nVo8dhhepVaJfqnzODbNq8T9c2L/JmG7F1
	mAJYY5Ee2+9XXlAlV+vurDNQsLPAOvjwJpepSHr2FOF9u5KN/x1OZGiYZ1XZfCEDYAPU0VQZ4QV/R
	vaUsJXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWBD-00DDhf-Dn; Fri, 10 Mar 2023 06:24:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWBB-00DDfV-5D; Fri, 10 Mar 2023 06:24:38 +0000
X-UUID: 37af9bc2bf0c11ed8a441d988bb316ae-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zNawnoaaHjlLZq3/CNT/WHhi0vSTAU+m29M2fAmbgCA=;
	b=tUgHH60PhS9uyBNX4flwLHzKQ2vNiXhBwEcOaKItoBbViPQZe2ufgeTJci+aFx2E2XUu45fW6pQXl/ThTWXRysCJwgrQ4GJXU5hkEvermZj7jXcI+ucrENccCeGpOqv2LQsmefAWzKuRJktAoKEdM4Kl3w3B+5q0RJYAWnODVLU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:1692190a-a049-4cd8-8d72-5b180cca15a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.20,REQID:1692190a-a049-4cd8-8d72-5b180cca15a0,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:25b5999,CLOUDID:c1b45ff5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:2303101035468Q959H96,BulkQuantity:7,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 37af9bc2bf0c11ed8a441d988bb316ae-20230309
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1998941542; Thu, 09 Mar 2023 23:24:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 14:23:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 10 Mar 2023 14:23:57 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
	<maoguang.meng@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>
Subject: [V2,0/7] Fixes jpeg crash issue in cuj test
Date: Fri, 10 Mar 2023 14:23:48 +0800
Message-ID: <20230310062355.9963-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_222437_205202_D7CD953D 
X-CRM114-Status: UNSURE (   9.53  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

This series is used to fix jpeg dec & enc crash in cuj test.
The problem was found frequently that executing CUJ
ui.EverydayMultiTaskingCUJ.*_ytmusic test cases on Tomato/Dojo
devices with the HW jpeg decoder enabled. Firstly the single core
and multi-core judgment methods were modified to make the driver
compatible with both cases. Secondly, the jpeg dec & enc worker
initialization method and the timing issue of remove buffer
were corrected, eliminating crash problems. Finally, some variables
and hw dev initialization methods are refactored to reduce code
redundancy and improve program robustness. 

This series has been tested with MT8195 & MT8188.
Jpeg encoding and decoding worked for these devices.

Patch 1 fixes single core and multi-core judgment methods.

Patch 2 optimized jpeg single core initial methods.

Patch 3 optimized sw flow of jpeg enc&dec worker to remove buffer.

Patch 4 reconstructs the initialization mode of worker.

Patch 5 Remove some unnecessary variables.

Patch 6 refactor some variables.

Patch 7 refactor hw dev initializaiton sw flow.

---
Changes compared with v1
- No change compared with v1

kyrie wu (7):
  media: mtk-jpeg: Fixes jpeghw multi-core judgement
  media: mtk-jpeg: add jpeg single core initial function
  media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow
  media: mtk-jpeg: reconstructs the initialization mode of worker
  media: mtk-jpeg: Remove some unnecessary variables
  media: mtk-jpeg: refactor some variables
  media: mtk-jpeg: refactor hw dev initializaiton

 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 130 +++++++++++-------
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  28 ++--
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  43 ++----
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  38 ++---
 4 files changed, 113 insertions(+), 126 deletions(-)

-- 
2.18.0


