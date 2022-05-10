Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 03:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xi1RMIPAso9FAFxVPGfHC6hhymzA/soW8io7lRR8pLo=; b=KjI84LoVOJKCNx
	icKXKxUBD6/JRgHJSONzFj1DzAGrDej6VZTWNS0o4jAtsN8kuFZXUu8bB5oSlHKO2zGRp4Q1rYOw8
	Kk6GizhFXl2rP2dCMonYTsftxNrKKxjUEboW3cWqHZhRsyxHWuuNeiD9EALoqP+HUTRMTKvaJxXHg
	m/yTwQaCZRviCHmWNF6qGIV+aCFcHUBLrJ1AJwy6HXP+aeR9a2gxafUi33FvmpgQvsoecRfP3VJs5
	uOtyOHuD7KHKJdZYXbxXYiy5lBxTKhLxbVGQ3wR+3O27Ewroko38B72QRyhCH3UdlLKWoOEjbkzbz
	SDFtUKJ4kPnkx3wL9MQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noG6W-00HDQ1-9A; Tue, 10 May 2022 03:00:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noG6E-00HDK7-KE; Tue, 10 May 2022 02:59:50 +0000
X-UUID: f802b4c9c1094bafab3f282c418e2baf-20220509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a5bb670c-d64e-4e31-accf-6c7320236f01, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:73e532b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f802b4c9c1094bafab3f282c418e2baf-20220509
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 918251185; Mon, 09 May 2022 19:59:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 May 2022 19:59:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 10 May 2022 10:59:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 May 2022 10:59:36 +0800
Message-ID: <e8124721a4ecd591ffea2c4d70853c1f89c83975.camel@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
From: Johnson Wang <johnson.wang@mediatek.com>
To: Chanwoo Choi <cwchoi00@gmail.com>, <cw00.choi@samsung.com>,
 <krzk+dt@kernel.org>, <robh+dt@kernel.org>, <kyungmin.park@samsung.com>
CC: <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 10 May 2022 10:59:36 +0800
In-Reply-To: <94efefab-918d-2367-4b74-076dd6f23936@gmail.com>
References: <20220425125546.4129-1-johnson.wang@mediatek.com>
 <20220425125546.4129-2-johnson.wang@mediatek.com>
 <94efefab-918d-2367-4b74-076dd6f23936@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_195946_717859_1712184B 
X-CRM114-Status: GOOD (  31.41  )
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

Hi Chanwoo,

On Mon, 2022-05-09 at 21:09 +0900, Chanwoo Choi wrote:
> Hi,
> 
> On 22. 4. 25. 21:55, Johnson Wang wrote:
> > Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> > 
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > ---
> >   .../bindings/interconnect/mediatek,cci.yaml   | 139
> > ++++++++++++++++++
> >   1 file changed, 139 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > new file mode 100644
> > index 000000000000..e5221e17d11b
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > @@ -0,0 +1,139 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/interconnect/mediatek,cci.yaml*__;Iw!!CTRNKA9wMg0ARbw!z6ogArqzuIzPR3TYO1aW-Z-scpuZJxIriWMofdfnvrKTXAYBBLZeitAPIKyZayMYZGsR$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!z6ogArqzuIzPR3TYO1aW-Z-scpuZJxIriWMofdfnvrKTXAYBBLZeitAPIKyZa9f2pALd$
> >  
> > +
> > +title: MediaTek Cache Coherent Interconnect (CCI) frequency and
> > voltage scaling
> > +
> > +maintainers:
> > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Why did you add your author information?
> Please add your author information.

Sorry, I don't really understand what you mean.
Could you please explain your advice again?

The author of this driver is 'Jia-Wei Chang'.
We have added author information to the driver code and this binding
document as above.

> 
> And add this dt-binding information to MAINTAINERS
> as following: because I cannot catch the later patch
> of modification.
> 
> cwchoi00@chanwoo:~/kernel/linux.chanwoo$ d
> diff --git a/MAINTAINERS b/MAINTAINERS
> index edc96cdb85e8..a11e9c1947b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5698,6 +5698,7 @@ L:        linux-pm@vger.kernel.org
>   S:     Maintained
>   T:     git
> git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
>   F:     Documentation/devicetree/bindings/devfreq/
> +F:     Documentation/devicetree/bindings/interconnect/mediatek,cci.y
> aml
>   F:     drivers/devfreq/
>   F:     include/linux/devfreq.h
>   F:     include/trace/events/devfreq.h
> 

I will add it in the next version.

BRs,
Johnson Wang
> 
> > +
> > +description: |
> > +  MediaTek Cache Coherent Interconnect (CCI) is a hardware engine
> > used by
> > +  MT8183 and MT8186 SoCs to scale the frequency and adjust the
> > voltage in
> > +  hardware. It can also optimize the voltage to reduce the power
> > consumption.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8183-cci
> > +      - mediatek,mt8186-cci
> > +
> > +  clocks:
> > +    items:
> > +      - description:
> > +          The multiplexer for clock input of CPU cluster.
> > +      - description:
> > +          A parent of "cpu" clock which is used as an intermediate
> > clock source
> > +          when the original CPU is under transition and not stable
> > yet.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: cci
> > +      - const: intermediate
> > +
> > +  operating-points-v2: true
> > +  opp-table: true
> > +
> > +  proc-supply:
> > +    description:
> > +      Phandle of the regulator for CCI that provides the supply
> > voltage.
> > +
> > +  sram-supply:
> > +    description:
> > +      Phandle of the regulator for sram of CCI that provides the
> > supply
> > +      voltage. When it presents, the cci devfreq driver needs to
> > do
> > +      "voltage tracking" to step by step scale up/down Vproc and
> > Vsram to fit
> > +      SoC specific needs. When absent, the voltage scaling flow is
> > handled by
> > +      hardware, hence no software "voltage tracking" is needed.
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - clock-names
> > +  - operating-points-v2
> > +  - proc-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    cci: cci {
> > +        compatible = "mediatek,mt8183-cci";
> > +        clocks = <&mcucfg CLK_MCU_BUS_SEL>,
> > +                 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
> > +        clock-names = "cci", "intermediate";
> > +        operating-points-v2 = <&cci_opp>;
> > +        proc-supply = <&mt6358_vproc12_reg>;
> > +    };
> > +
> > +    cci_opp: opp-table-cci {
> > +        compatible = "operating-points-v2";
> > +        opp-shared;
> > +        opp2_00: opp-273000000 {
> > +            opp-hz = /bits/ 64 <273000000>;
> > +            opp-microvolt = <650000>;
> > +        };
> > +        opp2_01: opp-338000000 {
> > +            opp-hz = /bits/ 64 <338000000>;
> > +            opp-microvolt = <687500>;
> > +        };
> > +        opp2_02: opp-403000000 {
> > +            opp-hz = /bits/ 64 <403000000>;
> > +            opp-microvolt = <718750>;
> > +        };
> > +        opp2_03: opp-463000000 {
> > +            opp-hz = /bits/ 64 <463000000>;
> > +            opp-microvolt = <756250>;
> > +        };
> > +        opp2_04: opp-546000000 {
> > +            opp-hz = /bits/ 64 <546000000>;
> > +            opp-microvolt = <800000>;
> > +        };
> > +        opp2_05: opp-624000000 {
> > +            opp-hz = /bits/ 64 <624000000>;
> > +            opp-microvolt = <818750>;
> > +        };
> > +        opp2_06: opp-689000000 {
> > +            opp-hz = /bits/ 64 <689000000>;
> > +            opp-microvolt = <850000>;
> > +        };
> > +        opp2_07: opp-767000000 {
> > +            opp-hz = /bits/ 64 <767000000>;
> > +            opp-microvolt = <868750>;
> > +        };
> > +        opp2_08: opp-845000000 {
> > +            opp-hz = /bits/ 64 <845000000>;
> > +            opp-microvolt = <893750>;
> > +        };
> > +        opp2_09: opp-871000000 {
> > +            opp-hz = /bits/ 64 <871000000>;
> > +            opp-microvolt = <906250>;
> > +        };
> > +        opp2_10: opp-923000000 {
> > +            opp-hz = /bits/ 64 <923000000>;
> > +            opp-microvolt = <931250>;
> > +        };
> > +        opp2_11: opp-962000000 {
> > +            opp-hz = /bits/ 64 <962000000>;
> > +            opp-microvolt = <943750>;
> > +        };
> > +        opp2_12: opp-1027000000 {
> > +            opp-hz = /bits/ 64 <1027000000>;
> > +            opp-microvolt = <975000>;
> > +        };
> > +        opp2_13: opp-1092000000 {
> > +            opp-hz = /bits/ 64 <1092000000>;
> > +            opp-microvolt = <1000000>;
> > +        };
> > +        opp2_14: opp-1144000000 {
> > +            opp-hz = /bits/ 64 <1144000000>;
> > +            opp-microvolt = <1025000>;
> > +        };
> > +        opp2_15: opp-1196000000 {
> > +            opp-hz = /bits/ 64 <1196000000>;
> > +            opp-microvolt = <1050000>;
> > +        };
> > +    };
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
