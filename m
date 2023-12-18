Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFA4C35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 08:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RN8uPOB4PQETpivCJ+p4IT7QHrFP25bbFcqUaZN5iAg=; b=OHmooIPcxkdhcTmkBKHIK/kpMZ
	qxOMkNOXm1W9MInA+GtFU5OZcIDimcP0KShFiN267Aq4vHpqybstHh/L8oePIgjL64tVqV5g+P8Kx
	rFbI9kRSC47PUjyOPHeJQMteoKHCJDFtBr++qzxMlxFHaGeOXi1YpBu7UJ2QAliHhGPbTmxWhEXI6
	oKiPQu/FxMA0ArcafAvH35wcx7a7c1eZW7DolazIKyf3bP7KwZgeAj2UJMftIyVPvYi1KM7HbiFLR
	3skiqYzmWbJYqde7q02LaEo3P9W0GShc2TKxl6iDhv4dncqI6tCtS0a8Fezs1Miro+yScrdxyK+GM
	eDmC1zHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF98G-009Ug4-36;
	Mon, 18 Dec 2023 08:37:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF98D-009Udm-0e;
	Mon, 18 Dec 2023 08:37:46 +0000
X-UUID: b1bc137a9d8011ee9b09ad09c76753c8-20231218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RN8uPOB4PQETpivCJ+p4IT7QHrFP25bbFcqUaZN5iAg=;
	b=K1I45V9rCMNp+O6PLon9PJ5LcgdACAlOcJU9HqyAthptJuENF2roJIAz2+ASLywDDQfau3nAS8Jxgtz1Qby3sdY7bE5tVmmoiSn5Fk5hbA7+E5TEmz6aInlIhXhegC7/TcOj3dYZDHQHNgXvM+RyQdRltJWSkENwmhGgIb8yXXs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:512e0248-9f7c-4b45-9bea-13e87ff56b5b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:2013ea73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b1bc137a9d8011ee9b09ad09c76753c8-20231218
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2021853373; Mon, 18 Dec 2023 01:37:35 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Dec 2023 16:36:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Dec 2023 16:36:05 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH 0/3] Add mediatek,gce-events definition to mediatek,gce-mailbox bindings
Date: Mon, 18 Dec 2023 16:36:01 +0800
Message-ID: <20231218083604.7327-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.736100-8.000000
X-TMASE-MatchedRID: REQh4LCxv5DHof55kx23ffyAR9DgC/hHecvjbu/xDjoY0A95tjAn+7h0
	OUlkSqv9tYR/uNxnStGIJs0Up7vkWEkjllSXrjtQFEUknJ/kEl7dB/CxWTRRuwihQpoXbuXFU0N
	mgjpLwWgpK7FYyXJ7dzWXzuuIBy9l39CfFEXKCCLIp7X/GY6TRDQ+x7OL/d9Ga95GWOWghV7vUj
	22LskS7tuMe3AJpm3nF0aD5ljt43pMcHZD6gqu7wxMjfifIXfowkvVoA11TwqeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.736100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4835C8790B1F7367BF5849827331B2C30F006B62E79F41485C34A86A534115FA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_003745_261675_2451C29A 
X-CRM114-Status: UNSURE (   7.27  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Since mediatek,gce-events property is a HW event signal from GCE,
it should be defined in mediatek,gce-mailbox.yaml.

Change the description of mediatek,gce-events property existed in
other bindings to reference mediatek,gce-mailbox.yaml.

Jason-JH.Lin (3):
  dt-bindings: mailbox: mediatek,gce-mailbox: Add mediatek,gce-events
    definition
  dt-bindings: media: mediatek-mdp: Change the description of gce-events
  dt-bindings: soc: mediatek: Change the description of gce-events

 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml  | 7 +++++++
 .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml      | 5 +----
 .../devicetree/bindings/media/mediatek,mdp3-rsz.yaml       | 5 +----
 .../devicetree/bindings/media/mediatek,mdp3-wrot.yaml      | 5 +----
 .../devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml   | 5 +----
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml   | 5 +----
 .../devicetree/bindings/soc/mediatek/mediatek,wdma.yaml    | 5 +----
 7 files changed, 13 insertions(+), 24 deletions(-)

-- 
2.18.0


