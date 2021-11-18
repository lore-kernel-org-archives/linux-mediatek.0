Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 06:28:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB1F61B62
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 06:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FB1F61B62
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwClKnZsF5NMVXr7yOXzm5C5lZsxb057RoMa8kezxmY=; b=aBS6kwQ0jZspO4
	oiFtzYG5CmU0or9S6rzyqtzBT3G3L+TW7xrfYoLnSxlD5RSfF79F3nLhn9tjTp3vhKlK2Yd/guGEm
	7O+PHFSU3inRdn52i/uvF9t1yHtz/kGZhYS6Kvb43JbVmV+kNeUkE93vq2djRf6bQrw6IioNIYPro
	GJoQYtpUIMNrHigK8kQ8cZBFjsMMF4WufVT8VUoN2TrV/Y78fU+tyYTvqZX6z+GCyA7cQBcDPmlhV
	SPRL/uhoB10FjIPnjvxLm+Yp/brDihGy5/GVAMfUAUwJEvjFJBh2ES+8iu7dhf5l95bWPUuls64GJ
	jHocVo3KzG+mdjwgMOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnatv-006ywQ-HX; Thu, 18 Nov 2021 06:28:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnatg-006yrg-7I; Thu, 18 Nov 2021 06:27:51 +0000
X-UUID: afb5551a02a54f848c918f69e80da18b-20211117
X-UUID: afb5551a02a54f848c918f69e80da18b-20211117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 202133130; Wed, 17 Nov 2021 23:27:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Nov 2021 22:27:42 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 18 Nov 2021 14:27:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Nov 2021 14:27:40 +0800
Message-ID: <f4a008ef426eacc7ec13b8f30e12d6cddc79536e.camel@mediatek.com>
Subject: Re: [PATCH v15 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From: James Lo <james.lo@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Hsiung Wang
 <hsin-hsiung.wang@mediatek.com>, <linux-mediatek@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>
Date: Thu, 18 Nov 2021 14:27:37 +0800
In-Reply-To: <1636983755.172933.595907.nullmailer@robh.at.kernel.org>
References: <20211115042030.30293-1-james.lo@mediatek.com>
 <20211115042030.30293-3-james.lo@mediatek.com>
 <1636983755.172933.595907.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_222748_302072_3FC3CE3B 
X-CRM114-Status: GOOD (  19.89  )
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

On Mon, 2021-11-15 at 07:42 -0600, Rob Herring wrote:
> On Mon, 15 Nov 2021 12:20:28 +0800, James Lo wrote:
> > This adds documentation for the SPMI controller found on Mediatek
> > SoCs.
> > 
> > Signed-off-by: James Lo <james.lo@mediatek.com>
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 76
> > +++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
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
> review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-
> pmif.example.dt.yaml: spmi@10027000: reg: [[268595200, 3584],
> [268603392, 256]] is too long
> 	From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/spmi/spmi.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-
> pmif.example.dt.yaml: spmi@10027000: reg: [[268595200, 3584],
> [268603392, 256]] is too long
> 	From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/1555114__;!!CTRNKA9wMg0ARbw!0y2jw2KWA7dbbFP4B9bbycyT0PxWYrQ0KAUovVW46dRLqIfXI2maZrfVt1KSWIC1$
>  
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

Dear Rob,

Due to [2/4] depends on [1/4], 

Can I only send [1/4] first ?

(After [1/4] is approved, and I will send [2/4][3/4][4/4] as V16.)

Or, could you please give us other suggestion ?

Many thanks


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
