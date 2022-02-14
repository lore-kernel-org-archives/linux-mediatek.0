Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E947C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 03:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iih7u5zFWctCz4/ur8TnM5NpIAFjlst8UizrSoOOy0A=; b=spjMpEA2IBBn7c
	NZTyM0lKIjTFPv5dR9gESpoIKoXUn23id6AweU91++QDNxk1Ki+Cl5FbPbO0iZqCv/ApizFj1WmC9
	IvrpHNE/KUXvGWRQyio4k99D0+kIqcpnnO0sctcKI2yBOMx+yrEJMBMrOmLXK7VN/Ti7D2SlcAE40
	nzATbLqTx2+pIAV0/t6LPssjKPZscXU1n5Hf4eQGsFF0Gm4PerpN8ev8Mw8+yPDQYyMVmY4Cj/iIO
	ClK2mHP25swnG/FHWCkro3dGjpn/YVqEC2hrk/+COJtBYBVsE3K2oVT/O3yrNdXTrkSuD9vzebI6o
	iVF1s0cWOviszpWk8lbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJRob-00D72D-Nb; Mon, 14 Feb 2022 03:14:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJRoZ-00D71J-6g; Mon, 14 Feb 2022 03:14:12 +0000
X-UUID: f0dbfe622fa146e08a93e65d07668ffd-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cACakIfi2Z/O+Q1EPaNUZ+pLTQABefn5NlTepM0mesY=; 
 b=IslRPgLbIwDSJaYW7lSe7j12bQLS3Ub0SC/DQ1M31c++1yZBInyL+cZZZ/rlOioOm7DRbp01Y/DpK8ptF5a3kyp0Xk/V/nQkZRx6v081c1rkCLfpN+kt1QUBy1VFE4SJsxo38M3RJM2FY8QKN7/XX9jWJY40mtKzInP9L7Pv3tE=;
X-UUID: f0dbfe622fa146e08a93e65d07668ffd-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1738162941; Sun, 13 Feb 2022 20:14:09 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 19:04:07 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Feb 2022 11:03:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 11:03:58 +0800
Message-ID: <ab823da2bff2dddcbf563083c787631c9ef842b7.camel@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8186: add pinctrl file
 and binding document
From: Guodong Liu <guodong.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, <linux-mediatek@lists.infradead.org>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-gpio@vger.kernel.org>, Sean Wang
 <sean.wang@kernel.org>, <devicetree@vger.kernel.org>
Date: Mon, 14 Feb 2022 11:03:58 +0800
In-Reply-To: <1644504472.320340.2624780.nullmailer@robh.at.kernel.org>
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
 <20220210062122.23974-2-guodong.liu@mediatek.com>
 <1644504472.320340.2624780.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_191411_279540_2536D9B9 
X-CRM114-Status: GOOD (  15.06  )
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

-----Original Message-----
From: Rob Herring <robh@kernel.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sean Wang <
sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Rob
Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com, Matthias Brugger <
matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, Sean Wang <
sean.wang@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8186: add pinctrl
file and binding document
Date: Thu, 10 Feb 2022 08:47:52 -0600

On Thu, 10 Feb 2022 14:21:20 +0800, Guodong Liu wrote:
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8186.yaml      |  313 +++++
>  include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174
> +++++++++++++++++
>  2 files changed, 1487 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-
review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml:
properties:reg-names: {'description': 'Gpio base register names.\n',
'items': [{'const': 'iocfg0'}, {'const': 'iocfg_bm'}, {'const':
'iocfg_bl'}, {'const': 'iocfg_br'}, {'const': 'iocfg_lm'}, {'const':
'iocfg_rb'}, {'const': 'iocfg_tl'}, {'const': 'eint'}], 'maxItems': 8}
should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-
review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml:
ignoring, error in schema: properties: reg-names
Documentation/devicetree/bindings/pinctrl/pinctrl-
mt8186.example.dt.yaml:0:0: /example-0/pinctrl@10005000: failed to
match any schema with compatible: ['mediatek,mt8186-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1590838

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

Hi Rob

Thank you fou your useful information, and we will update it for next
version.

Thanks
Guodong



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
