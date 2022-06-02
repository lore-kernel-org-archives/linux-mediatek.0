Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0337BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 05:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFEO35Spgq7nqK18iE1tt15OwTLSoBW2NiClzoElY3A=; b=PafnJUOoVG7FXW
	M031ZTqcCS9yiXkJTTY7HuiuIgp+Yz/aC7f295eDYbZsly6rWOrLvM90BbihBpf7h/adUnOoNKvsP
	WjrQ1ur5ecoVHH/198p7uSI+59jpaKP4jcqnokNLh5npvSaqIMmSlXPT+aH2JSxvqxBPWVhPB0Rqb
	fFPy321ohtQ0ztG91XcLCfwda5VQdO4ruUxZy7dAbM0WKHGXrCWJhX3QaOYNXTmG9diDzTP/re+P6
	tswDSM1Ml52u86Ez3cwC+obopGI9fs5H3i6QpiFEbHNFQAImvtY9zCEA730oCx5Bs25CMhFxbwVy3
	M/H6dE44CAistNTS6Utw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdPM-001SaH-Nk; Thu, 02 Jun 2022 05:30:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdPJ-001SXU-Bn; Thu, 02 Jun 2022 05:30:06 +0000
X-UUID: c0ea01106a474f08a38fcbf42768e00f-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:79344132-63eb-482d-97b1-48dbcebcf1dc,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:5040900d-3a0d-4bbe-9d72-0e5d26d57423,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: c0ea01106a474f08a38fcbf42768e00f-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1127045885; Wed, 01 Jun 2022 22:29:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 22:21:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 13:21:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jun 2022 13:21:12 +0800
Message-ID: <3c837acfbefa5b7e23e1121678b5b878f08e4ef2.camel@mediatek.com>
Subject: Re: [PATCH v1 01/15] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Prashant Malani
	<pmalani@chromium.org>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>, Brian Norris <briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Date: Thu, 2 Jun 2022 13:21:12 +0800
In-Reply-To: <dd3ea397-fa21-abe5-85ad-b8a4818dc011@linaro.org>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
	 <20220601112201.15510-2-tinghan.shen@mediatek.com>
	 <dd3ea397-fa21-abe5-85ad-b8a4818dc011@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_223005_480554_ABD73DC2 
X-CRM114-Status: GOOD (  27.99  )
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

Hi Krzysztof,

On Wed, 2022-06-01 at 13:50 +0200, Krzysztof Kozlowski wrote:
> On 01/06/2022 13:21, Tinghan Shen wrote:
> > The SCP co-processor is a dual-core RISC-V MCU on MT8195.
> > 
> > Add a new property to identify each core and helps to find drivers
> > through device tree API to cooperate with each other, e.g. boot flow and
> > watchdog timeout flow.
> > 
> > Add a new compatile for the driver of SCP 2nd core.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > index eec3b9c4c713..b181786d9575 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > @@ -20,6 +20,7 @@ properties:
> >        - mediatek,mt8186-scp
> >        - mediatek,mt8192-scp
> >        - mediatek,mt8195-scp
> > +      - mediatek,mt8195-scp-dual
> >  
> >    reg:
> >      description:
> > @@ -57,6 +58,16 @@ properties:
> >    memory-region:
> >      maxItems: 1
> >  
> > +  mediatek,scp-core:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      The property value is a list with 2 items, a core id and a phandle
> 
> uint32, not phandle.
> 
> > +      to the sibling SCP node. 
> 
> Skip this. First part is obvious from the schema, second part should be
> described via items.
> 
> The core id represents the id of the dts node contains
> > +      this property. The valid values of core id are 0 and 1 for dual-core SCP.
> > +      The phandle of sibling SCP node is used to find the register settings,
> > +      trigger core dependent callback, and invoke rproc API.
> 
> Entire description did not help me to understand what's this. So far it
> looks like it is not a hardware property but some programming help, so
> it does not look like properly described in bindings.
> 
> > +    maxItems: 1
> 
> In description you said - two items.
> 
> You need allOf:if:then disallowing this property for other variants.
> 
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -115,6 +126,7 @@ examples:
> >          reg-names = "sram", "cfg", "l1tcm";
> >          clocks = <&infracfg CLK_INFRA_SCPSYS>;
> >          clock-names = "main";
> > +        mediatek,scp-core = <0 &scp_dual>;
> 
> This looks like phandle, so wrong type.
> >  
> >          cros_ec {
> >              mediatek,rpmsg-name = "cros-ec-rpmsg";
> 

Thanks for your feedback.
After looking for a comparable uses case, I find out a different approach.

  mediatek,scp-core:
    $ref: "/schemas/types.yaml#/definitions/phandle-array"
    description:
      Enable the dual-core support in scp driver.
    items:
      - items:
          - description: Assign a core id for current scp node.
            enum: [0, 1]
          - description:
              Phandle of another SCP node. This helps to find
              the scp driver of another core to trigger core
              dependent callback, invoke rproc subdevice API, etc.

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
