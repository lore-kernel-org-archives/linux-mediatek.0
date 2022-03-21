Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 04:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3Y3gXEtaPQ4oNFag6xOoJyMuIUg1FoB3hEChZU2N5M=; b=t0u/fWvevevdTH
	oJCvY0eiAUDXKG275br2hD/UswTkK3TP78/hf8LLKH64fyE9j0W13sCLGbCbsPlkJ9v3as06sx0iU
	sj7Vd6nxvXIoNXTC7VV9bq6nC5f574yJl8vsjI/lmCK/OyeOWyd40liXwwbjAsAUtbE3GvXbX3VT9
	AWLc10pBCJ+kmIppxqa0Ap570zvCBmeNDxDqYsthWZwg6qf/SOPM9UNM7O3hb9pz0w5JPo8FknUFk
	HSENZQTi2CJQXtNptfe16mdXFC2EleL2AAk8nVcyBE2++PngwQb7KtB5+bf5FkfRe2EMtQ7GZiL+X
	2bnv3tbXroQxV5PyKuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW9bD-006SvR-Je; Mon, 21 Mar 2022 04:24:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW9b9-006SuO-WE; Mon, 21 Mar 2022 04:24:53 +0000
X-UUID: 875a8a54db834eda8eef101a32b233b3-20220320
X-UUID: 875a8a54db834eda8eef101a32b233b3-20220320
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1271639340; Sun, 20 Mar 2022 21:24:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Mar 2022 21:17:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Mar 2022 12:17:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Mar 2022 12:17:15 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <robh@kernel.org>
CC: <adrian.hunter@intel.com>, <andrew@aj.id.au>,
 <andriy.shevchenko@linux.intel.com>,
 <angelogioacchino.delregno@collabora.com>, <axe.yang@mediatek.com>,
 <chaotian.jing@mediatek.com>, <dev@lynxeye.de>, <devicetree@vger.kernel.org>, 
 <ebiggers@google.com>, <huyue2@yulong.com>, <kwmad.kim@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-mmc@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <satyat@google.com>,
 <swboyd@chromium.org>, <tiantao6@hisilicon.com>, <ulf.hansson@linaro.org>,
 <wsa+renesas@sang-engineering.com>, <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RESEND v7 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Date: Mon, 21 Mar 2022 12:17:15 +0800
Message-ID: <20220321041715.8424-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1647742413.962309.2990518.nullmailer@robh.at.kernel.org>
References: <1647742413.962309.2990518.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_212452_057110_1D42FA5E 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Rob,

>My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
>yamllint warnings/errors:
>
>dtschema/dtc warnings/errors:
>/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/mtk-sd.yaml: properties:pinctrl-names: {'description': 'Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin will be switched between GPIO mode and SDIO DAT1 mode, state_eint and state_dat1 are mandatory in this scenarios.', 'minItems': 2, 'maxItems': 4, 'items': [{'const': 'default'}, {'const': 'state_uhs'}, {'const': 'state_eint'}, {'const': 'state_dat1'}]} should not be valid under {'required': ['maxItems']}
>	hint: "maxItems" is not needed with an "items" list
>	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/mtk-sd.yaml: ignoring, error in schema: properties: pinctrl-names
>Documentation/devicetree/bindings/mmc/mtk-sd.example.dt.yaml:0:0: /example-0/mmc@11230000: failed to match any schema with compatible: ['mediatek,mt8173-mmc']
>
>doc reference errors (make refcheckdocs):
>
>See https://patchwork.ozlabs.org/patch/1606491
>
>This check can fail if there are any dependencies. The base for a patch
>series is generally the most recent rc1.
>
>If you already ran 'make dt_binding_check' and didn't see the above
>error(s), then make sure 'yamllint' is installed and dt-schema is up to
>date:
>
>pip3 install dtschema --upgrade
>
>Please check and re-submit.

Thanks for this check.

When I use 'make DT_CHECKER_FLAGS=-m dt_binding_check' on this patch,
the warning message does show up but the 'make DT_CHECKER_FLAGS=-m dt_binding_check'
does not exit, so I am not able to tell if any error occurs by the exit value.

Would you mind sharing the way your bot capture this error? (Do I have to grep 'error'
from the log or is there any warning-as-error flags?)

Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
