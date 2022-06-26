Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B39BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jun 2022 04:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SDY1N5U3iemI48yGpkeyEpbH66h8Qm7y11OJlgidwoE=; b=kkueYDXV9ZTD8Z7mCHz6ADMliK
	ipApMdTdcHfcuo/abfUEShS5MmJ81eDLSSSd7IkhrbINOp67cYBn9WJxc50MIRV8VAS3WScMaq+tS
	xGcRl4ui/zkEyz/UZSS5lzRiRwlKb+sNyblhdGtk9nVsqzYndKOdipEf5TQrtyPeu0jF5n92WqdNV
	Cj1v9+ETzZGHtz02XTskg64f+4MF0HeMLXkoMwFw8SbVcfFr37FFTUx2Y60OtqDQJ2ps7mmpQ8yNO
	CbuSADctQe3jNT89fUlHfR7+SvtDY6b9DHWWHEYTNRCvM2OYM6HH9eWh9jeaRP1OJFwlpljx9ZWBA
	IcE5ffNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KFc-009ccK-9F; Sun, 26 Jun 2022 04:52:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KDt-009bb3-2X; Sun, 26 Jun 2022 04:50:15 +0000
X-UUID: 272b32bce3a547d9b7dba20d1e8654e1-20220625
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:4a5fe32a-c98f-4411-a59b-30bc218f9a1a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:854c83ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 272b32bce3a547d9b7dba20d1e8654e1-20220625
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 824849603; Sat, 25 Jun 2022 21:50:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Jun 2022 21:40:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 26 Jun 2022 12:39:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Jun 2022 12:39:58 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
	<zhiyong.tao@mediatek.com>,
	=?UTF-8?q?N=EDcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
	<guodong.liu@mediatek.com>
Subject: [PATCH v3 0/5] pinctrl: mediatek: add driver support driving and resistance property  on mt8192
Date: Sun, 26 Jun 2022 12:39:50 +0800
Message-ID: <20220626043955.32756-1-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_215013_134569_5A85A939 
X-CRM114-Status: GOOD (  10.88  )
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

changes since v2:

- Patch 1 Optimize commit message description.

- Patch 3 Fix careless character missing the closing '/'.

- Patch 4 Optimize commit message description.

changes since v1:

- Patch 1 Add commit only, add "mediatek:" on the commit title for this
patch, describe the patch modification in detail.

- Patch 2  Add commit only, add "mediatek:" on the commit title for this
patch, use space instead of tab before the =, Dropping E1, E0, and EN
arrays in this patch, which were used by the original advanced
drive configuration.

- Patch 3 Add commit describe the patch modification in detail,
add the missing pull type array for mt8192 to document the pull type of
each pin and prevent invalid pull type settings. use space instead of
tab after the ,.

- Patch 4 Remove the original advanced drive configuration.

- Patch 5 Remove pin definitions that do not support the R0 & R1
pinconfig property.

v1:

Patch 1 make driver consistent with "drive-strength" properties
  description of  pinctrl-mt8192.yaml

Patch 2 make driver consistent with "mediatek,drive-strength-adv"
  description pinctrl-mt8192.yaml, however, "mediatek,drive-strength-adv"
  description of pinctrl-mt8192.yaml needs to be synchronize a little bit.

Patch 3 Since the bias-pull-{up,down} is generic properties, make
  driver to be used for setting type {PUPD/R1/R0 , PU/PD, PU/PD/RSEL}.

Patch 4 Remove some pins definitions not support PUPD/R1/R0.

Please see the following for detailed  description 

Patch 1 provides generic driving setup, which support 2/4/6/8/10/12/14/16mA
  driving.

Patch 2 provides I2C pins specific driving setup property, can support
  0.125/0.25/0.5/1mA adjustment, and also support driving setup with
  unit microamp.

Patch 3 provides I2C pins pull up/down type which is RSEL. It can support
  RSEL define or si unit value(ohm) to set different resistance

Patch 4 Remove pin definitions that do not support the R0 & R1 pinconfig
  property

Guodong Liu (5):
  pinctrl: mediatek: add generic driving setup property on mt8192
  pinctrl: mediatek: add drive for I2C related pins on mt8192
  pinctrl: mediatek: add rsel setting on mt8192
  pinctrl: mediatek: dropping original advanced drive configuration
    function
  pinctrl: mediatek: fix the pinconf definition of some GPIO pins

 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 296 ++++++++++++----------
 1 file changed, 163 insertions(+), 133 deletions(-)

-- 
2.25.5


