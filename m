Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6CFC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 18:59:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD6761585
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 18:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AD6761585
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LdF7INUO2FwYOHeDW1/ksbubGq/GTAfIkMmPrGt75zg=; b=d08RmV+ADw5B6w8QR6EU/H4K4
	yOu3CF6x05ClD7VfAtL/pYeM2wEJmHyAWOw9kUV/kAVZjpo1o1OlA2VYYH7VHitM/GpWmOI7nQ0tI
	3D3GL81T9x9up9iTuWl/RyRBp3t3xUlao8aQLvzBbi9tze9sT5uo/eXOqa0B8vtFWsNFXurP80Ece
	zmbx8cEklbNa4tH/LJGT9hh6wEsj9/HEH7l0h/43trjAuEwyaNE/5uaCAxujR6+FP19zARFhv1o+N
	c32IE2dmL9e0pxoSwL6TCR0+wqzHrpOcd9msG2EuPbTD5brmH2Y88Fr0UB/AEIlD3jr3x5iDmwT8T
	XiCBM882g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQx5f-0019KQ-OH; Mon, 29 Mar 2021 18:58:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQpqL-000bjX-Hq; Mon, 29 Mar 2021 11:14:04 +0000
X-UUID: 80131bfcc5304d75a03c32441e2856b1-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hFgBU9yLcCHCyobJXrDH3btoHx/jN6JEEmH0JPSgREg=; 
 b=WX22oSxft0GZSjICExjKyLPIqxBoMTb6ZM4T8tJN4gcvQjLgM3Rq4ZHz6f4KYNX7MXOW7RfRxvTbJKnZ8SP2fQZAk2jaaoWYTCTaIR3pFjFwhw/CQFaKOdtmDweMMnu5fUy834uaPeAWiUdN0bnZWBFKrkHWaWdwuUAY6pKXsJw=;
X-UUID: 80131bfcc5304d75a03c32441e2856b1-20210329
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 543468387; Mon, 29 Mar 2021 03:13:52 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 04:13:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 19:13:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:13:49 +0800
Message-ID: <1617016429.8590.3.camel@mtksdaap41>
Subject: Re: [PATCH v6 4/8] dt-bindings: regulator: Add document for MT6359
 regulator
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Lee Jones <lee.jones@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Fei Shao
 <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 29 Mar 2021 19:13:49 +0800
In-Reply-To: <20210316212802.GA3670080@robh.at.kernel.org>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20210316212802.GA3670080@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_121402_162197_08B9A89D 
X-CRM114-Status: GOOD (  26.74  )
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

Hi,

On Tue, 2021-03-16 at 15:28 -0600, Rob Herring wrote:
> On Tue, Mar 16, 2021 at 01:35:53AM +0800, Hsin-Hsiung Wang wrote:
> > add dt-binding document for MediaTek MT6359 PMIC
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> > changes since v5:
> > - no change.
> > ---
> >  .../bindings/regulator/mt6359-regulator.yaml  | 169 ++++++++++++++++++
> >  1 file changed, 169 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> > new file mode 100644
> > index 000000000000..62ff93eefd39
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> > @@ -0,0 +1,169 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/mt6359-regulator.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MT6359 Regulator from MediaTek Integrated
> > +
> > +maintainers:
> > +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > +
> > +description: |
> > +  List of regulators provided by this controller. It is named
> > +  according to its regulator type, buck_<name> and ldo_<name>.
> > +  MT6359 regulators node should be sub node of the MT6397 MFD node.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^pmic$"
> 
> The errors are because this schema will be applied to every 'pmic' node.
> 
> > +
> > +  mt6359regulator:
> 
> The node name here should be just 'regulators', but that should be in 
> the MFD schema and you should remove this level here. So the MFD would 
> have:
> 
> properties:
>   regulators:
>     type: object
>     $ref: schemas/regulator/mt6359-regulator.yaml#
> 
> > +    type: object
> > +    description:
> > +      list of regulators provided by this controller.
> > +
> > +    patternProperties:
> 
> And this should be at the top level of this doc.
> 
> > +      "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
> > +
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
> > +
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
> > +
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
> > +
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
> > +
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo_v(fe|bif|io)28$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^v(fe|bif|io)28$"
> > +
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo_v(aud|io|aux|rf|m)18$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^v(aud|io|aux|rf|m)18$"
> > +
> > +        unevaluatedProperties: false
> > +
> > +      "^ldo_vsim[12]$":
> > +        type: object
> > +        $ref: "regulator.yaml#"
> > +
> > +        properties:
> > +          regulator-name:
> > +            pattern: "^vsim[12]$"
> > +
> > +        required:
> > +          - regulator-name
> > +
> > +        unevaluatedProperties: false
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pmic {
> > +      mt6359regulator {
> 
> I prefer to see a single complete example in the MFD schema rather than 
> piecemeal schemas in each sub schema.
> 

Thanks for your comment.
However, MT6397 mfd driver supports several mediatek pmics which have
different regulator capability, so it is hard to list all regulators of
each pmic in the MFD schema.

Thanks.

> > +        mt6359_vgpu11_buck_reg: buck_vgpu11 {
> > +          regulator-name = "vgpu11";
> > +          regulator-min-microvolt = <400000>;
> > +          regulator-max-microvolt = <1193750>;
> > +          regulator-enable-ramp-delay = <200>;
> > +          regulator-always-on;
> > +          regulator-allowed-modes = <0 1 2>;
> > +        };
> > +
> > +        mt6359_vcamio_ldo_reg: ldo_vcamio {
> > +          regulator-name = "vcamio";
> > +          regulator-min-microvolt = <1700000>;
> > +          regulator-max-microvolt = <1900000>;
> > +        };
> > +
> > +        mt6359_vcn18_ldo_reg: ldo_vcn18 {
> > +          regulator-name = "vcn18";
> > +          regulator-min-microvolt = <1800000>;
> > +          regulator-max-microvolt = <1800000>;
> > +          regulator-enable-ramp-delay = <240>;
> > +        };
> > +
> > +        mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
> > +          regulator-name = "vsram_proc2";
> > +          regulator-min-microvolt = <500000>;
> > +          regulator-max-microvolt = <1293750>;
> > +          regulator-ramp-delay = <7500>;
> > +          regulator-enable-ramp-delay = <240>;
> > +          regulator-always-on;
> > +        };
> > +
> > +        mt6359_vfe28_ldo_reg: ldo_vfe28 {
> > +          regulator-name = "vfe28";
> > +          regulator-min-microvolt = <2800000>;
> > +          regulator-max-microvolt = <2800000>;
> > +          regulator-enable-ramp-delay = <120>;
> > +        };
> > +
> > +        mt6359_vaud18_ldo_reg: ldo_vaud18 {
> > +          regulator-name = "vaud18";
> > +          regulator-min-microvolt = <1800000>;
> > +          regulator-max-microvolt = <1800000>;
> > +          regulator-enable-ramp-delay = <240>;
> > +        };
> > +
> > +        mt6359_vsim1_ldo_reg: ldo_vsim1 {
> > +          regulator-name = "vsim1";
> > +          regulator-min-microvolt = <1700000>;
> > +          regulator-max-microvolt = <3100000>;
> > +          regulator-enable-ramp-delay = <480>;
> > +        };
> > +      };
> > +    };
> > +...
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
