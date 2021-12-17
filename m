Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 02:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yijZwlXIEKeZHi8P8E1sSYLVgpk+WPvlH+fR79XSzY=; b=xKoMrL9Zmzw+V1
	RR+2KjISaPWaSjgTnXCuJtDF9L3zOgX+blSGaY2+FywHWdi9XXJvpEwQXBmAolE8Q5OWb7ZTkkDQ/
	lwlhhl+82CMicRyLkDeKJd5zp4GoD3n58YVzSzPC5IwqVpVsvgwa4O/GpLS12/HmsTUQ6kajT2dx8
	MXW7OR6PtwPVfUI0RXPAlVB3Zssp4BKGVWZRyhVDsimk6yl9Ba+kJjFl98p0+ioEDz68eFgHFXVdU
	YKozwqHyw62VwWLKl85YqP640ygVBYmSVwHSfMitnp8PZP/Ogr8tVwG7NPcRFGXUGazx2ycMhz3fT
	SRkI7BnD9u4AT4dBKdJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my2hQ-008N5U-Qm; Fri, 17 Dec 2021 02:10:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my2dK-008Kx1-42; Fri, 17 Dec 2021 02:06:09 +0000
X-UUID: 90f7e909d41d4fda8bd26bc66570e955-20211216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oKLXoDnvb+4kT3LFl2tU05cJqVSai2RXcpGwEw0iC4E=; 
 b=ELpxMOegMLNzSaITGX1OAu2PibuUls4egKInPifVqYzhfRGPKCOWfdaCc4YLTdeeho8vykxt8KD12j7uaSWzDnXs2MQHRay5lh6MraoZdqazNYZv35/0/hAinInn5Q/f2Mtmm6ACUL4Ik8LdyQ2lKZkV94DrEF+b+5qVbNFS3Go=;
X-UUID: 90f7e909d41d4fda8bd26bc66570e955-20211216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1221145348; Thu, 16 Dec 2021 19:06:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 18:06:02 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 17 Dec 2021 10:06:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Dec 2021 10:05:58 +0800
Message-ID: <be023f9d2fb2a8f947bd0075e8732ba07cfd7b89.camel@mediatek.com>
Subject: Re: [PATCH net-next v10 6/6] net: dt-bindings: dwmac: add support
 for mt8195
From: Biao Huang <biao.huang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <srv_heupstream@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <davem@davemloft.net>, <linux-stm32@st-md-mailman.stormreply.com>,
 <angelogioacchino.delregno@collabora.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 <netdev@vger.kernel.org>, <dkirjanov@suse.de>,
 <linux-kernel@vger.kernel.org>, <macpaul.lin@mediatek.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 17 Dec 2021 10:05:58 +0800
In-Reply-To: <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-7-biao.huang@mediatek.com>
 <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_180606_246794_76A667E0 
X-CRM114-Status: GOOD (  23.76  )
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

Dear Rob,
  Thanks for your comments~

  For mt8195, the eth device node will look like:
  eth: ethernet@11021000 {
    compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
    ...
    clock-names = "axi",
                  "apb",
                  "mac_cg",
                  "mac_main",
                  "ptp_ref",
                  "rmii_internal";
    clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
             <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
             <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>,
             <&topckgen CLK_TOP_SNPS_ETH_250M>,
             <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
             <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
    ...
  }

1. "rmii_internal" is a special clock only required for
   RMII phy interface, dwmac-mediatek.c will enable clocks
   invoking clk_bulk_prepare_enable(xx, 6) for RMII,
   and clk_bulk_prepare_enable(xx, 5) for other phy interfaces.
   so, mt2712/mt8195 all put "rmii_internal" clock to the
   end of clock list to simplify clock handling.

   If I put mac_cg as described above, a if condition is required
for clocks description in dt-binding, just like what I do in v7 send:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - mediatek,mt2712-gmac

    then:
      properties:
        clocks:
          minItems: 5
          items:
            - description: AXI clock
            - description: APB clock
            - description: MAC Main clock
            - description: PTP clock
            - description: RMII reference clock provided by MAC

        clock-names:
          minItems: 5
          items:
            - const: axi
            - const: apb
            - const: mac_main
            - const: ptp_ref
            - const: rmii_internal

  - if:
      properties:
        compatible:
          contains:
            enum:
              - mediatek,mt8195-gmac

    then:
      properties:
        clocks:
          minItems: 6
          items:
            - description: AXI clock
            - description: APB clock
            - description: MAC clock gate
            - description: MAC Main clock
            - description: PTP clock
            - description: RMII reference clock provided by MAC

   This introduces some duplicated description.

2. If I put "mac_cg" to the end of clock list,
   the dt-binding file can be simple just like
   what we do in this v10 patch(need fix warnings reported by "make
DT_CHECKER_FLAGS=-m dt_binding_check").

   But for mt8195:
     the eth node in dts should be modified,
     and eth driver clock handling will be complex;

We prefer 1(duplicated description one).
Can we just descirbe clocks/clocks-names for mt2712/mt8195 seperately?
Please kindly comment about this issue.
Thanks in advance.

On Thu, 2021-12-16 at 07:53 -0600, Rob Herring wrote:
> On Thu, 16 Dec 2021 13:53:28 +0800, Biao Huang wrote:
> > Add binding document for the ethernet on mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >  .../bindings/net/mediatek-dwmac.yaml          | 29
> > ++++++++++++++++---
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> properties:clock-names: {'minItems': 5, 'maxItems': 6, 'items':
> [{'const': 'axi'}, {'const': 'apb'}, {'const': 'mac_main'}, {'const':
> 'ptp_ref'}, {'const': 'rmii_internal'}, {'const': 'mac_cg'}]} should
> not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml:
> ignoring, error in schema: properties: clock-names
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> Documentation/devicetree/bindings/net/mediatek-
> dwmac.example.dt.yaml:0:0: /example-0/ethernet@1101c000: failed to
> match any schema with compatible: ['mediatek,mt2712-gmac',
> 'snps,dwmac-4.20a']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1568902
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
