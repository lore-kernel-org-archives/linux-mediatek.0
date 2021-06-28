Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E51C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 08:14:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CE576120D
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 08:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CE576120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Xxaij2U4Fkmo5L5gh2WOFgyJ37/V1Xujps4MMLB+lo=; b=A40c5m1dflTRBF
	TRD92Y/SMLJMmdT9SN8PxDisFqOdfLRLXCu2khjE84rYaoktGAs0k1+5y8s0uoivZ9NAR4tJqLNoQ
	/KchqlJRJzwMpioz0QFzcVH8ryDi0iCGkxt+to6BiZvl3wQMxyDKCSpk9eJGvTX5LmdIrhit+GGf/
	gN67qJmdGAbOM8tM6MMP4/BAAr9v43f9hb6EHnalxNQzBq8CVkb/a0pMEDEWi2dpSiquB+Uw7TVEp
	/JE1gBpWi58D2i4wy0WoyCzwWHJCMOiuolkKQW3nc9ByjVAzWmZ8O5IPXC9+1y3iyodciApz8crbv
	J5Ge2DqdArP+WCeYgOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxmP8-007LwN-V0; Mon, 28 Jun 2021 08:14:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxmOv-007Lu2-Rd; Mon, 28 Jun 2021 08:13:55 +0000
X-UUID: f7ba9193062b4f21af23f69c69af8fbc-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UyCUoWq5C8H8X3Ls/9jw1l30aSnsYNS8MIqI3Jdte34=; 
 b=NQShitKfmMb479YptqZkariH15y33S2g8+NDnwgUZ+eDrNkMRyFunmkMb7By0jVUIZSbsLMJqa2tFzr9mtZZChfk+abZn0TBa5ACznHKLh+5bkm38UEgRgGO8Ekd5hBsQJPM211xrhtYh9OPpy8oPpP01bUSxJ+/bQaXIaZWDag=;
X-UUID: f7ba9193062b4f21af23f69c69af8fbc-20210628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 543766919; Mon, 28 Jun 2021 01:13:48 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 01:03:45 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 28 Jun 2021 16:03:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Jun 2021 16:03:35 +0800
Message-ID: <1624867415.19871.7.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: Add property to
 disable dvfsrc voltage request
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <youlin.pei@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <qizhong.cheng@mediatek.com>, <sin_jieyang@mediatek.com>,
 <drinkcat@chromium.org>, <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski
 <kw@linux.com>, <Ryan-JH.Yu@mediatek.com>
Date: Mon, 28 Jun 2021 16:03:35 +0800
In-Reply-To: <20210611114824.14537-2-jianjun.wang@mediatek.com>
References: <20210611114824.14537-1-jianjun.wang@mediatek.com>
 <20210611114824.14537-2-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3C847F0C72EE72988F88A8EF8A8CFC570617985F93A7278597666503F0F909702000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_011353_941677_9DD8AD04 
X-CRM114-Status: GOOD (  16.82  )
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

Hi Rob, Bjorn, Matthias,

Could you please help to take a look at this patch series?

We have done the internal tests and need to implement this function in
the final product, We really need your suggestions.

Thanks.

On Fri, 2021-06-11 at 19:48 +0800, Jianjun Wang wrote:
> Add property to disable dvfsrc voltage request, if this property
> is presented, we assume that the requested voltage is always
> higher enough to keep the PCIe controller active.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
> Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index e7b1f9892da4..3e26c032cea9 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -96,6 +96,12 @@ properties:
>    phys:
>      maxItems: 1
>  
> +  disable-dvfsrc-vlt-req:
> +    description: Disable dvfsrc voltage request, if this property is presented,
> +      we assume that the requested voltage is always higher enough to keep
> +      the PCIe controller active.
> +    type: boolean
> +
>    '#interrupt-cells':
>      const: 1
>  
> @@ -166,6 +172,8 @@ examples:
>                       <&infracfg_rst 3>;
>              reset-names = "phy", "mac";
>  
> +            disable-dvfsrc-vlt-req;
> +
>              #interrupt-cells = <1>;
>              interrupt-map-mask = <0 0 0 0x7>;
>              interrupt-map = <0 0 0 1 &pcie_intc 0>,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
