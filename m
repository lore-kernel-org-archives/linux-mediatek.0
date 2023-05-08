Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18672C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y1HnJqsO/WkMHXAXN/S1iWJu5d9vaTn7O2ZE737u36k=; b=G/WSISyEfnw2CR9tA5FBHMAc0P
	r/PU8m32DknWklzcg18Qs2gmgnXLMkMOfv9YRCasHubBL52ORVLZlvp2P3JPnAFBzATQCv0pshwXv
	jNrd36iDrPG87TfDfuetH4V1MM95cOW+IAiTtFRKKXEBaaSme17cCcFFahaUwYTHs3Urw3UUUNzL8
	9x+uH+E8CFmFpaywvPcmeJHpV+MQydJ//QO/hLNYoSAltdrajoP3Kc/zfWCWT5GhFWxINh53HpFct
	2KQ6b2hCA3eX/vNbYLg/IAHycdoDB04SJV0dLR2bXu/xrT9oYtG3yVpEGATsHtmjL5UWCAQb2e556
	kP5Kn3BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvv65-00HTA6-25;
	Mon, 08 May 2023 07:15:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvv60-00HT65-0H;
	Mon, 08 May 2023 07:15:45 +0000
X-UUID: 20f84036ed7011ed83ed1395ce914268-20230508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Y1HnJqsO/WkMHXAXN/S1iWJu5d9vaTn7O2ZE737u36k=;
	b=pJpJ0iXEDWMNBOaMO8oeMXuZZKSVHwQ9FYA9CU6H3UzrhwXGkQGhC0zEytMfNzYY+TZptj4mU3/83yz/yYTqip5/JsLfi7ks11ExwWlzmOFrs13yAacPDNB+aL40zK7IMEBLpArwuEhQk547gdziKI4kQ4+Ty9NBwV6KKkktIB8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:dc5360e4-620a-4a57-a7af-c381d8277193,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:697ab71,CLOUDID:6d55176b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 20f84036ed7011ed83ed1395ce914268-20230508
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 634226109; Mon, 08 May 2023 00:15:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 May 2023 15:15:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 May 2023 15:15:33 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] ASoC: mt6359: kselftest fix and driver extension
Date: Mon, 8 May 2023 15:15:28 +0800
Message-ID: <20230508071532.21665-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_001544_123829_FEDBD4FD 
X-CRM114-Status: UNSURE (   7.36  )
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

The patch series includes a kselftest fix and changes for extending
driver capability to support more use cases.

Trevor Wu (4):
  ASoC: mediatek: mt6359: add supply for MTKAIF
  ASoC: mediatek: mt6359: fix kselftest error of playback gain
  ASoC: mediatek: mt6359: add mtkaif gpio setting
  ASoC: mediatek: mt6359: update route for lineout mux

 sound/soc/codecs/mt6359.c | 152 ++++++++++++++++++++++++++++++++++----
 1 file changed, 137 insertions(+), 15 deletions(-)

-- 
2.18.0


