Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD5FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 08:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hQUlzBqq9s/YIk1KJRFC00W432skj3REnRLvzeXnTEQ=; b=atueIP8dzp3mIo
	qKzmsfpz/beICBnY66Q4Rkj1RuINf2QelPyIhrBpiJ6A/Hm2vzYss8v/JO65v8ztUIxi7jVTgpv5C
	/wMMDictEGogYavJZml9gGCcJPs+tDd2gh37Oipm9yuxhF6DfXPrQLcrMeeibKJ7Ko1W7g5vJXDTt
	rWkpwWuwuGlYkMuBCqLMUIWSf72bPlDS5mngMSkVoCwagU1pI6fcr0dJ/n/pLzsMEoC3IPb1dJwSI
	AU/GodEv6jVD0UeX/sX7/c2/XxuTwxE7V02FFrTdV/VFElfXMGaGdtzLYiEDGnNnmaNgNkvPho+Yi
	dt/sbZhLrjJ4YWYbQGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrWs-00CACZ-JS; Wed, 08 Jun 2022 08:59:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrKL-00C4bB-8C; Wed, 08 Jun 2022 08:46:10 +0000
X-UUID: 49bd304be1964baf85e0abdc4909bffe-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:3bac735f-6a75-4a44-b6ea-a0366fdb291e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:cb06a07e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 49bd304be1964baf85e0abdc4909bffe-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 518223383; Wed, 08 Jun 2022 01:46:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 01:36:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Jun 2022 16:36:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 8 Jun 2022 16:36:02 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Benson Leung <bleung@chromium.org>, Guenter
 Roeck <groeck@chromium.org>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Daisuke Nojiri <dnojiri@chromium.org>,
	Kees Cook <keescook@chromium.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Prashant Malani
	<pmalani@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v2 0/9] Add support for MT8195 SCP 2nd core
Date: Wed, 8 Jun 2022 16:35:44 +0800
Message-ID: <20220608083553.8697-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_014609_354688_D44C2701 
X-CRM114-Status: GOOD (  10.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mediatek remoteproc driver currently only allows bringing up a 
single core SCP, e.g. MT8183. It also only bringing up the 1st 
core in SoCs with a dual-core SCP, e.g. MT8195. This series support 
to bring-up the 2nd core of the dual-core SCP.

Tinghan Shen (9):
  dt-binding: remoteproc: mediatek: Support dual-core SCP
  remoteproc: mediatek: Support hanlding scp core 1 wdt timeout
  remoteproc: mediatek: Add SCP core 1 register definitions
  remoteproc: mediatek: Support probing for the 2nd core of dual-core
    SCP
  remoteproc: mediatek: Add chip dependent operations for SCP core 1
  remoteproc: mediatek: Add SCP core 1 SRAM offset
  remoteproc: mediatek: Add SCP core 1 as a rproc subdevice
  remoteproc: mediatek: Wait SCP core 1 probe done
  mfd: cros_ec: Add SCP core 1 as a new CrOS EC MCU

 .../bindings/remoteproc/mtk,scp.yaml          |  13 +
 drivers/mfd/cros_ec_dev.c                     |   5 +
 drivers/remoteproc/mtk_common.h               |  35 ++
 drivers/remoteproc/mtk_scp.c                  | 322 +++++++++++++++++-
 .../linux/platform_data/cros_ec_commands.h    |   2 +
 include/linux/platform_data/cros_ec_proto.h   |   1 +
 6 files changed, 375 insertions(+), 3 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
