Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CE3C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 21:28:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 996F364F8A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 21:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 996F364F8A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CpaJkPj0CsU28FvDNx5pIwNHpj/dfXQWO9RcJffGURs=; b=B9qdI/iWf/53MH3t4u/Xmm8tw
	LwX9/TtCLMx0+o62CAcfrqykpaBUZhWfhw/OVzWmfNL/MsOwN8ccDRzMMar+RarVqKhFJaV9+K00O
	NeqOBcEKf7mcCqBXfi5N3Ac0TwbBAeHhpDrFpbKfYX8CEXLEjypOFHcFY1wLoV9lhD32ILyti0/HR
	vhL+XIXqVzFE0nab+TRNmkfCBFjdAm1FVwnUoTgiDA1+hpDApGCqnS+VpFej8MrpW2oCrhlrUUMQx
	6WKtJKLho5K1gvlOmB6DWfiWhx/RTQp2rQ6ZxPAIYhA5grNwmMmwEmZjNVP//Xfbhbw3FoKgUBp3I
	JoxMw1mkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMHEl-001toq-G0; Tue, 16 Mar 2021 21:28:23 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMHEU-001tnF-9u; Tue, 16 Mar 2021 21:28:08 +0000
Received: by mail-il1-f175.google.com with SMTP id g9so14127734ilc.3;
 Tue, 16 Mar 2021 14:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tzti3nZ5OVXP9WgoynfjNjMUKwMHz9t/vD1IxL1SSSc=;
 b=skUsEiQ8PTyw+8JAQrE/Qp7V90KXaf6KjdyrCxAs9sqQt2KDgrMAr9WbTOk3CIRhRt
 x4iqeWuqdsfHUoBhNivHX0FvYNDRPXXqagofzE+d0579pqzEhf4r3yrFkcJp/25EBMKo
 /IAx9o8+XSh6z7n+YxYMh1k4sGuU53ut7ZkfSf7+41pCjahXGgnJJ4sCxs0uCQfiDmW7
 k2FhvkT15x0o/FdnbJRXZiKpy/gJgl9JHR37PPf5s9uroTxMeEQafcaldZj/pJEyoFyG
 KW1d/FGl2Kgs1sfA8rTS5ZOq9T1D7Q6jMgmdh71ImHY4K1zu8bjHgqQ6+giJdyOE+uus
 p5wQ==
X-Gm-Message-State: AOAM5333SbwfAVnPGCnOGAwqJJXBX7gdb7xUx7nXdksKgc7w7bhwCPn8
 RItEn+HLq2aZa04cr2m+fg==
X-Google-Smtp-Source: ABdhPJxY8+fVLTfIGuoc9fCv1z8mKXCoP5VTFpupsMgdcpP5gtmUCJnseEQrTQKyhfFn/+d1wMBEgQ==
X-Received: by 2002:a92:d80f:: with SMTP id y15mr5057931ilm.96.1615930084738; 
 Tue, 16 Mar 2021 14:28:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y6sm10031777ily.50.2021.03.16.14.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:28:04 -0700 (PDT)
Received: (nullmailer pid 3697863 invoked by uid 1000);
 Tue, 16 Mar 2021 21:28:02 -0000
Date: Tue, 16 Mar 2021 15:28:02 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Ran Bi <ran.bi@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 4/8] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20210316212802.GA3670080@robh.at.kernel.org>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_212806_435533_F72E7410 
X-CRM114-Status: GOOD (  21.44  )
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

On Tue, Mar 16, 2021 at 01:35:53AM +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v5:
> - no change.
> ---
>  .../bindings/regulator/mt6359-regulator.yaml  | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> new file mode 100644
> index 000000000000..62ff93eefd39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mt6359-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6359 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +
> +description: |
> +  List of regulators provided by this controller. It is named
> +  according to its regulator type, buck_<name> and ldo_<name>.
> +  MT6359 regulators node should be sub node of the MT6397 MFD node.
> +
> +properties:
> +  $nodename:
> +    pattern: "^pmic$"

The errors are because this schema will be applied to every 'pmic' node.

> +
> +  mt6359regulator:

The node name here should be just 'regulators', but that should be in 
the MFD schema and you should remove this level here. So the MFD would 
have:

properties:
  regulators:
    type: object
    $ref: schemas/regulator/mt6359-regulator.yaml#

> +    type: object
> +    description:
> +      list of regulators provided by this controller.
> +
> +    patternProperties:

And this should be at the top level of this doc.

> +      "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_v(fe|bif|io)28$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(fe|bif|io)28$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_v(aud|io|aux|rf|m)18$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^v(aud|io|aux|rf|m)18$"
> +
> +        unevaluatedProperties: false
> +
> +      "^ldo_vsim[12]$":
> +        type: object
> +        $ref: "regulator.yaml#"
> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vsim[12]$"
> +
> +        required:
> +          - regulator-name
> +
> +        unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      mt6359regulator {

I prefer to see a single complete example in the MFD schema rather than 
piecemeal schemas in each sub schema.

> +        mt6359_vgpu11_buck_reg: buck_vgpu11 {
> +          regulator-name = "vgpu11";
> +          regulator-min-microvolt = <400000>;
> +          regulator-max-microvolt = <1193750>;
> +          regulator-enable-ramp-delay = <200>;
> +          regulator-always-on;
> +          regulator-allowed-modes = <0 1 2>;
> +        };
> +
> +        mt6359_vcamio_ldo_reg: ldo_vcamio {
> +          regulator-name = "vcamio";
> +          regulator-min-microvolt = <1700000>;
> +          regulator-max-microvolt = <1900000>;
> +        };
> +
> +        mt6359_vcn18_ldo_reg: ldo_vcn18 {
> +          regulator-name = "vcn18";
> +          regulator-min-microvolt = <1800000>;
> +          regulator-max-microvolt = <1800000>;
> +          regulator-enable-ramp-delay = <240>;
> +        };
> +
> +        mt6359_vsram_proc2_ldo_reg: ldo_vsram_proc2 {
> +          regulator-name = "vsram_proc2";
> +          regulator-min-microvolt = <500000>;
> +          regulator-max-microvolt = <1293750>;
> +          regulator-ramp-delay = <7500>;
> +          regulator-enable-ramp-delay = <240>;
> +          regulator-always-on;
> +        };
> +
> +        mt6359_vfe28_ldo_reg: ldo_vfe28 {
> +          regulator-name = "vfe28";
> +          regulator-min-microvolt = <2800000>;
> +          regulator-max-microvolt = <2800000>;
> +          regulator-enable-ramp-delay = <120>;
> +        };
> +
> +        mt6359_vaud18_ldo_reg: ldo_vaud18 {
> +          regulator-name = "vaud18";
> +          regulator-min-microvolt = <1800000>;
> +          regulator-max-microvolt = <1800000>;
> +          regulator-enable-ramp-delay = <240>;
> +        };
> +
> +        mt6359_vsim1_ldo_reg: ldo_vsim1 {
> +          regulator-name = "vsim1";
> +          regulator-min-microvolt = <1700000>;
> +          regulator-max-microvolt = <3100000>;
> +          regulator-enable-ramp-delay = <480>;
> +        };
> +      };
> +    };
> +...
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
