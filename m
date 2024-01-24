Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A5DC47DDC
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 01:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Y2eeQTZZY/NZ2a6vQYTyhiRsKBL6xd0zO5wl1rg1YyU=; b=hht
	AV0bA11bBPYm+sjOEkRmfsxJ3SElYa26rThqOc3R09CWQ6TOvzOG/X8TzZttQdl9OS67pQi1TbTlL
	McDERJkhmYuRPWfGKPGro2KCzK+Skry0AQPi2KjYEAY65W9hMV8geDSHd7+WYCr8rE8Us1cPne5N6
	RSAH735MXeP1rSXdMP4nfsBOADqRJLRHkLsv3EePlaFYT4eM98Ha4jyB4Oqj7LSZV6PxJw7k7yK6m
	/HPOBhobzBC0DYcx+YXEFiPjNcKWbDvsd2+MW+EaPfQH1haIcYHfPwQMTMZHxf/6/0zE0McYG/DIY
	Iq/36d+dpjQJy8fHtEPlPlTnKJ2xEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSRrI-000zL7-0g;
	Wed, 24 Jan 2024 01:15:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSRrE-000zJn-0Q;
	Wed, 24 Jan 2024 01:15:13 +0000
X-UUID: 0088c9b6ba5611eea0bf134e88e6c2dc-20240123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Y2eeQTZZY/NZ2a6vQYTyhiRsKBL6xd0zO5wl1rg1YyU=;
	b=rxB9HOM78j+NMjcuBvzvtfG4QJomjAwtce5C9/yQdRIUASFyRVoZW0PjX1GsH3xaSBVBfybo926wPXk+HGnoKfyvigwC098F+eW29qQR+MI/qARm9IPFshKpkAkwWFujyHf8Dr7fWLFPznIbs1xztyCL8LTwAHONNTObaOu1d90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:dd5e9148-3adf-4f02-9fea-44cce7c500e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6e16cf4,CLOUDID:2758958e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0088c9b6ba5611eea0bf134e88e6c2dc-20240123
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 758539580; Tue, 23 Jan 2024 18:15:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 Jan 2024 09:15:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 Jan 2024 09:15:00 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
Subject: [PATCH v4 0/3] Add mediatek,gce-props.yaml for other bindings reference
Date: Wed, 24 Jan 2024 09:14:56 +0800
Message-ID: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_171512_223024_C8FED3A4 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

The property "mediatek,gce-events" is used for GCE event ID corresponding
to a hardware event signal sent by the hardware or a software driver.
If the mailbox providers or consumers want to manipulate the value of
the event ID, they need to know the specific event ID.

Since mediatek,gce-events property is used for both mailbox producers
and consumers, we add a mediatek,gce-props.yaml to place the common GCE
properties like mediatek,gce-events.

Change in v4:
1. Fix some typo.
2. Change maxItems of gce-events from 1024 to 32.

Change in v3:
1. Add more description and fix typo and grammar.
2. Fix $ref as full path.

Change in v2:
1. Add mediatek,gce-props.yaml for other binding reference.

Jason-JH.Lin (3):
  dt-bindings: mailbox: Add mediatek,gce-props.yaml
  dt-bindings: media: mediatek: mdp: Change mediatek,gce-events to
    reference
  dt-bindings: soc: mediatek: Change mediatek,gce-events to refernece

 .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 11 ++--
 .../bindings/media/mediatek,mdp3-rsz.yaml     | 12 ++---
 .../bindings/media/mediatek,mdp3-wrot.yaml    | 12 ++---
 .../bindings/soc/mediatek/mediatek,ccorr.yaml | 12 ++---
 .../bindings/soc/mediatek/mediatek,mutex.yaml | 11 ++--
 .../bindings/soc/mediatek/mediatek,wdma.yaml  | 12 ++---
 7 files changed, 74 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml

-- 
2.18.0


