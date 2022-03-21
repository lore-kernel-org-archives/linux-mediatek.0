Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6030BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 07:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YZJvxvakyy4ZH7B5rabcR04+Vs6FKI+H5SC0w2142Sw=; b=XvrW7kiGsvGGwp
	Qm4teQG7VqyCB2eamyvsK+cC/6dg0o9zHTpzuogT6/PZVHFJGYY5D7spTmbzqs0JCnwGZWnj9h4Vb
	nCNutkKMw6Sx6mQPCST1++kLd+6U9tev4HCEh63uWb1UeGEVQtI03k0kICPNM+n8rIKiTtbgxoD4T
	ZDLY07y9idfGVuIBNsmvztQ+jyzsdJa/b7LuRlJtpB/2PSgSjTvrKQ9Sr+um3yA5bBgFx8mKVbEev
	LwsWHlwGPUdzC69zdY8CLJY5iE0DyXAmc9KNVkl3sFVQPLO7goD8hmuIjVMF72/U273X/WMlRX7x1
	HPbg+noOytWW6oAYVAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWCPp-006oQh-25; Mon, 21 Mar 2022 07:25:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWCPV-006oJI-8B; Mon, 21 Mar 2022 07:25:02 +0000
X-UUID: b080d6c3fcd44f23a3780f353b12af44-20220321
X-UUID: b080d6c3fcd44f23a3780f353b12af44-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 342015066; Mon, 21 Mar 2022 00:24:54 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 00:23:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 15:23:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Mar 2022 15:23:13 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <angelogioacchino.delregno@collabora.com>,
 <tzungbi@google.com>, <yc.hung@mediatek.com>
Subject: [PATCH v3 0/6] ASoC: mediatek: Add support for MT8195 sound card with
 max98390 and rt5682
Date: Mon, 21 Mar 2022 15:23:06 +0800
Message-ID: <20220321072312.14972-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_002501_317232_AFEB315D 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series of patches adds support for mt8195 board with mt6359, max98390
and rt5682.

To prevent from copy-paste components, mt8195 machine drivers and 
dt-bindings are merged in the patch.

Patches are based on broonie tree "for-next" branch.

Changes since v2:
  - split "merge machine driver" into two parts for better understanding

Changes since v1:
  - remove merged patches about reset controller
  - propose a common machine driver instead of machine driver common code
  - propose a common dt-bindings for mt8195 sound card

Trevor Wu (6):
  ASoC: mediatek: mt8195: revise mt8195-mt6359-rt1019-rt5682.c
  ASoC: mediatek: mt8195: merge machine driver
  ASoC: dt-bindings: mediatek: mt8195: merge mt8195 machine yaml
  ASoC: mediatek: mt8195: rename card controls
  ASoC: mediatek: mt8195: add machine support for max98390 and rt5682
  ASoC: dt-bindings: mediatek: mt8195: support
    mt8195-mt6359-max98390-rt5682

 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    |   51 -
 ...-rt1019-rt5682.yaml => mt8195-mt6359.yaml} |    9 +-
 sound/soc/mediatek/Kconfig                    |   26 +-
 sound/soc/mediatek/mt8195/Makefile            |    3 +-
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 1198 -----------------
 ...mt6359-rt1019-rt5682.c => mt8195-mt6359.c} |  865 +++++++-----
 6 files changed, 569 insertions(+), 1583 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
 rename Documentation/devicetree/bindings/sound/{mt8195-mt6359-rt1019-rt5682.yaml => mt8195-mt6359.yaml} (84%)
 delete mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
 rename sound/soc/mediatek/mt8195/{mt8195-mt6359-rt1019-rt5682.c => mt8195-mt6359.c} (78%)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
