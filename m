Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2280C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 13:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4TfzZHvIKC5LQO1bSywL2j93lWnNorQQ8xqECaRR92I=; b=ThEerhi9rI0juf0ALV0QfIMvdJ
	BUWS5BYfCDdvraiV6dxq32wDwcbyEihscMrJIHPfMgzqlzDLjB6Ijl/vtP3RSn73j+Aaif3hhJXFO
	BGj+ChFZsgl+/ssOLEsuCXyhifZ8XYiSvaiXzXH9nGYnKM3w1FqojMGKl5x7wRCLLOQXZ320Ha3fG
	z0o+IP/HyxELB2OZPV1m4ZqmghZ4Jo3ohILd2v/FNRkXhD7ZFV6obYsO7K2rJh3AmkfnRlWbkwDCn
	v0AtFoFwWJqjdNagiXG94Le3HAIa+ETjOXDVPtfSYohOGiaZM95RHSn0J9R6tvUTwXzggu9HuecKq
	nkFsbhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jV3-002Q7I-Cd; Fri, 24 Jun 2022 13:37:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jUr-002Q4T-AD; Fri, 24 Jun 2022 13:37:20 +0000
X-UUID: ed598bb5650e4282a33b6430c76a3d48-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:f0432f42-98ce-4838-8690-e2064c054f40,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:ba72f82d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ed598bb5650e4282a33b6430c76a3d48-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 908669071; Fri, 24 Jun 2022 06:37:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 06:37:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 24 Jun 2022 21:37:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jun 2022 21:37:05 +0800
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
Subject: [PATCH v2 0/5] pinctrl: mediatek: add driver support driving and resistance property  on mt8192
Date: Fri, 24 Jun 2022 21:36:55 +0800
Message-ID: <20220624133700.15487-1-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_063717_397941_D4BEE596 
X-CRM114-Status: GOOD (  11.82  )
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


