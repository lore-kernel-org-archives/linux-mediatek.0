Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05765C28B2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 03:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eN3EiMbJZjkPNxTTGOCbQsV4Q3ZOvBjbel13AFC2Bqk=; b=cQW7KiCaKHl6E1Nu3pNXr5HrBK
	2aTIMVBxFT4dKyZQl+d5WK2A/7msRjYmifk27AgZmq/boW4g9FQO4Nc17wuq3zBEZureYAESTA2/x
	1G4vsZ+DAiTt4vsG7qo51VFo6IcdM5WUuTt6Vb1cNsbae9j2O105xdyr8rqswSPnWh1TGPWGQIWDo
	+76kSJuvSAoy8OGjJKF/xqoEj5sYOaxuTwIX22tf61lgqOVsgxt6I+1wtMlytzr27TajSP4CMTF8W
	6tkj9kG4ox/yAMfT+C7BtnibWSm39XJdJ0QB2GuP7IA4nYAzY4NyfwBnHBiZjG6o0jrPsCwzeqlmu
	X/7ZeLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOWZk-00Dd1q-RC; Thu, 18 Aug 2022 03:52:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOWZi-00Dcv3-8i; Thu, 18 Aug 2022 03:52:07 +0000
X-UUID: 81b9f309364f46d09aeabdc5266c9007-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eN3EiMbJZjkPNxTTGOCbQsV4Q3ZOvBjbel13AFC2Bqk=;
	b=KfwRz8PYYHdLGntVEtBo4VVvYp9VgejSlMmNrNDl1fRcw/ZB3tOhrxNrZMqnWG4KYz0UkJCq7SW+aiUrVm2pHUsZs0SVj4e2/UlzTbVZ9trL21tNVP82dblfEsoHHOfTV3e002l33CZY1cVeac94/Su9+0Fx7J8YARpTXDb1Y84=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:52f7dc47-3460-42e4-a401-98a81d9cbc9e,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:3dccff9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 81b9f309364f46d09aeabdc5266c9007-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 88319045; Wed, 17 Aug 2022 20:51:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 10:51:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 18 Aug 2022 10:51:18 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <jiaxin.yu@mediatek.com>, <tzungbi@google.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, chunxu.li
	<chunxu.li@mediatek.com>
Subject: [PATCH RESEND 0/3] ASoC: mediatek: support SOF for mt8186
Date: Thu, 18 Aug 2022 10:51:10 +0800
Message-ID: <20220818025113.17144-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_205206_328546_CFA0987C 
X-CRM114-Status: UNSURE (   6.70  )
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

From: "chunxu.li" <chunxu.li@mediatek.com>

In these patches, we add SOF support for mt8186 which have HiFi5 DSP
inside.

Chunxu Li (3):
  ASoC: mediatek: mt8186: support DSP downlink
  ASoC: mediatek: mt8186: add SOF support on
    mt8186-mt6366-rt1019-rt5682s
  ASoC: mediatek: mt8186: add SOF support on
    mt8186-mt6366-da7219-max98357

 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |   3 +
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    |  12 ++
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 168 ++++++++++++++++--
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 168 ++++++++++++++++--
 4 files changed, 325 insertions(+), 26 deletions(-)

-- 
2.25.1


