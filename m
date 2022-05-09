Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02883C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 12:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agz1M4K2ivtYAhdT93k1OwQ8gxHKltceiY4kKd8C48Q=; b=rV1C+68MGGjQpp
	Ew6oetMQ03EGjDjstgCr8UBeAGyri/u9f2BU7za28kg2QN32D3wLEJR6g5qJ7HETQm4SBu2+L74+s
	+aqXGtxt09UEOKFMEfvQf0cSC020QNGNT4TKdEebc3Wi31w/0MavKKmv0SRhSDSufQTyI7sZEML4e
	xp2wNZcn850ORdkLs/wFhImUF8K2IfStwsifLJ7iveIMLqa71AWjPIx0z9uLWNu2y9Du1lxyrdt0b
	KDV93peall6zchUPgJaa375AoWh5KbuqS/dGO/uUgJ3GWCmob8JhXFB3teRTW4O1MZVDScVDOZU9b
	ZjwPAFv1PhMN2uZlGohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no2Cm-00EGXz-Mb; Mon, 09 May 2022 12:09:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no2CX-00EGSv-Dr; Mon, 09 May 2022 12:09:23 +0000
Received: by mail-pf1-x431.google.com with SMTP id c14so12078738pfn.2;
 Mon, 09 May 2022 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZCKR2KVToumZXg10SfRvbk1URc/xJPQvsDbss1BO/1o=;
 b=ePKFMJwL5M1xzt0w76+6VlSDEby4h4o0iY4YRShL+32c2fNBngdZDBkJ8+lYgsifg1
 JZ2yaxHPvbFrydTuxN9q91HvF5fv9hZvt35W+3wSMEZNIPaN3Tw5lO0uaNCR2JR2tlt8
 o/FNAtivqYH3yIf+HOVGe8VtMMZHmkyLbhMRSqrkrXRqjedOxVFYV72tpvxfz9iqDLdS
 xjO9YXahuk/4G5wCYGnJFObReCScziM3Rl7J9SUv0aDDIx2DGvpYbaLQpPSYgJIDrxLl
 qjqFUgWKmPx9OGYuJisuhkoMB+226LCqRj+PH30FmG8NSFPalGLRRj2ry/mBRk3Yo+Jx
 YMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZCKR2KVToumZXg10SfRvbk1URc/xJPQvsDbss1BO/1o=;
 b=S2FieU4Hum0L1LL/Jboq/aq4bCkpAqFnTjAkI8DVI3TIdOyBzq3pHGfa5zo7Jh/pgm
 /6ECgAVHbkycuHXfOtejRzlvr2ZJ0jvSHa9RJQxyUy6Hifal1OVHwCUR/d+jIR4cIYXE
 DXWhCtTFAZiD6MWrIqywnkYiry7CcHTFppZyZ36WK1H9MzFnehgDDGOxs1BPhmL2U7aS
 n0NYt/9pFXxG/qWlg/G3Qe1sqAj3K9Io4/1Rwva/oOx9fEcPhUQf3cTC7zo15oPzV+qB
 hwsCODNdbbM09nz34brQwd0+hL1umz6NyKd+8uXYIMx3AONrkYvW7A5AoVQaMIOZTOuj
 csJA==
X-Gm-Message-State: AOAM532d2fcxg6ori3rJm/fwufdm68qdbfySh8tuI5YGY4USXRfW3QaW
 zT8t0wUKFIQAVWEZOEss+Wk=
X-Google-Smtp-Source: ABdhPJwCNlzwTWdyYUV9nLIUQ8FyUrTnDjVEBuHktiZQfP4Wryqs2YCdeWG4ZYYFdtjeADhw7PCaWg==
X-Received: by 2002:a05:6a00:1307:b0:4b0:b1c:6fd9 with SMTP id
 j7-20020a056a00130700b004b00b1c6fd9mr15621633pfu.27.1652098158457; 
 Mon, 09 May 2022 05:09:18 -0700 (PDT)
Received: from [172.30.1.40] ([14.32.163.5]) by smtp.gmail.com with ESMTPSA id
 y10-20020a170902d64a00b0015e8d4eb2d8sm6916016plh.290.2022.05.09.05.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:09:18 -0700 (PDT)
Message-ID: <94efefab-918d-2367-4b74-076dd6f23936@gmail.com>
Date: Mon, 9 May 2022 21:09:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-2-johnson.wang@mediatek.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220425125546.4129-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_050921_545570_99C469A9 
X-CRM114-Status: GOOD (  23.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 22. 4. 25. 21:55, Johnson Wang wrote:
> Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>   .../bindings/interconnect/mediatek,cci.yaml   | 139 ++++++++++++++++++
>   1 file changed, 139 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> new file mode 100644
> index 000000000000..e5221e17d11b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Cache Coherent Interconnect (CCI) frequency and voltage scaling
> +
> +maintainers:
> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>

Why did you add your author information?
Please add your author information.

And add this dt-binding information to MAINTAINERS
as following: because I cannot catch the later patch
of modification.

cwchoi00@chanwoo:~/kernel/linux.chanwoo$ d
diff --git a/MAINTAINERS b/MAINTAINERS
index edc96cdb85e8..a11e9c1947b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5698,6 +5698,7 @@ L:        linux-pm@vger.kernel.org
  S:     Maintained
  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
  F:     Documentation/devicetree/bindings/devfreq/
+F:     Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
  F:     drivers/devfreq/
  F:     include/linux/devfreq.h
  F:     include/trace/events/devfreq.h


> +
> +description: |
> +  MediaTek Cache Coherent Interconnect (CCI) is a hardware engine used by
> +  MT8183 and MT8186 SoCs to scale the frequency and adjust the voltage in
> +  hardware. It can also optimize the voltage to reduce the power consumption.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-cci
> +      - mediatek,mt8186-cci
> +
> +  clocks:
> +    items:
> +      - description:
> +          The multiplexer for clock input of CPU cluster.
> +      - description:
> +          A parent of "cpu" clock which is used as an intermediate clock source
> +          when the original CPU is under transition and not stable yet.
> +
> +  clock-names:
> +    items:
> +      - const: cci
> +      - const: intermediate
> +
> +  operating-points-v2: true
> +  opp-table: true
> +
> +  proc-supply:
> +    description:
> +      Phandle of the regulator for CCI that provides the supply voltage.
> +
> +  sram-supply:
> +    description:
> +      Phandle of the regulator for sram of CCI that provides the supply
> +      voltage. When it presents, the cci devfreq driver needs to do
> +      "voltage tracking" to step by step scale up/down Vproc and Vsram to fit
> +      SoC specific needs. When absent, the voltage scaling flow is handled by
> +      hardware, hence no software "voltage tracking" is needed.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - operating-points-v2
> +  - proc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    cci: cci {
> +        compatible = "mediatek,mt8183-cci";
> +        clocks = <&mcucfg CLK_MCU_BUS_SEL>,
> +                 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
> +        clock-names = "cci", "intermediate";
> +        operating-points-v2 = <&cci_opp>;
> +        proc-supply = <&mt6358_vproc12_reg>;
> +    };
> +
> +    cci_opp: opp-table-cci {
> +        compatible = "operating-points-v2";
> +        opp-shared;
> +        opp2_00: opp-273000000 {
> +            opp-hz = /bits/ 64 <273000000>;
> +            opp-microvolt = <650000>;
> +        };
> +        opp2_01: opp-338000000 {
> +            opp-hz = /bits/ 64 <338000000>;
> +            opp-microvolt = <687500>;
> +        };
> +        opp2_02: opp-403000000 {
> +            opp-hz = /bits/ 64 <403000000>;
> +            opp-microvolt = <718750>;
> +        };
> +        opp2_03: opp-463000000 {
> +            opp-hz = /bits/ 64 <463000000>;
> +            opp-microvolt = <756250>;
> +        };
> +        opp2_04: opp-546000000 {
> +            opp-hz = /bits/ 64 <546000000>;
> +            opp-microvolt = <800000>;
> +        };
> +        opp2_05: opp-624000000 {
> +            opp-hz = /bits/ 64 <624000000>;
> +            opp-microvolt = <818750>;
> +        };
> +        opp2_06: opp-689000000 {
> +            opp-hz = /bits/ 64 <689000000>;
> +            opp-microvolt = <850000>;
> +        };
> +        opp2_07: opp-767000000 {
> +            opp-hz = /bits/ 64 <767000000>;
> +            opp-microvolt = <868750>;
> +        };
> +        opp2_08: opp-845000000 {
> +            opp-hz = /bits/ 64 <845000000>;
> +            opp-microvolt = <893750>;
> +        };
> +        opp2_09: opp-871000000 {
> +            opp-hz = /bits/ 64 <871000000>;
> +            opp-microvolt = <906250>;
> +        };
> +        opp2_10: opp-923000000 {
> +            opp-hz = /bits/ 64 <923000000>;
> +            opp-microvolt = <931250>;
> +        };
> +        opp2_11: opp-962000000 {
> +            opp-hz = /bits/ 64 <962000000>;
> +            opp-microvolt = <943750>;
> +        };
> +        opp2_12: opp-1027000000 {
> +            opp-hz = /bits/ 64 <1027000000>;
> +            opp-microvolt = <975000>;
> +        };
> +        opp2_13: opp-1092000000 {
> +            opp-hz = /bits/ 64 <1092000000>;
> +            opp-microvolt = <1000000>;
> +        };
> +        opp2_14: opp-1144000000 {
> +            opp-hz = /bits/ 64 <1144000000>;
> +            opp-microvolt = <1025000>;
> +        };
> +        opp2_15: opp-1196000000 {
> +            opp-hz = /bits/ 64 <1196000000>;
> +            opp-microvolt = <1050000>;
> +        };
> +    };


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
