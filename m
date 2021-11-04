Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A2CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 09:53:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA616113B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 09:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FA616113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqeYXBrmXi8gQ+OofYR+NPKzhQIO5Bg1qHEUzTwVMBI=; b=RidF1E8dnGAulM
	pygnzeqrKhFA4n7+TkqhPc+9U65yHN7vFlV2j3J2CBwhoxmohbsN4jN/PXHjuj6hshWqgzQYhwqlc
	LaF+q9aE0w3DEpQg2q8yz8JSgRHxJNFatjiKXVhn52mUr91IeubijylFfoY4rSdAQm8MViLmZvttq
	wHuM5prkIclv0nBI5qD2W5mflyMN+Jt8ur6Ggu/SiNO9dO25Z92+8/Edly37nHh9Ve19Ek4HoXymV
	/uUA6EvI9B/g6LxmHKpB6nAJ+h2pxzS02CDQU5bULvDezJxh1nJSYT66vowQ6kIfep81RYf1RuSi7
	8eQMerqf2AMUEWc0A7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miZQW-008XPE-PE; Thu, 04 Nov 2021 09:52:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miZQK-008XL7-3x; Thu, 04 Nov 2021 09:52:45 +0000
X-UUID: cd6d5575711348568f899b2d585b0181-20211104
X-UUID: cd6d5575711348568f899b2d585b0181-20211104
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 363598177; Thu, 04 Nov 2021 02:52:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 02:52:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 4 Nov 2021 17:52:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Nov 2021 17:52:36 +0800
Message-ID: <4c3036d8181c788fbf047883e2f49172edbe3f0f.camel@mediatek.com>
Subject: Re: [RESEND, v13 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From: James Lo <james.lo@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Hsin-Hsiung Wang
 <hsin-hsiung.wang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>
Date: Thu, 4 Nov 2021 17:52:36 +0800
In-Reply-To: <1635944770.215632.1040288.nullmailer@robh.at.kernel.org>
References: <20211103081021.9917-1-james.lo@mediatek.com>
 <20211103081021.9917-3-james.lo@mediatek.com>
 <1635944770.215632.1040288.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_025244_200571_1CFB8785 
X-CRM114-Status: GOOD (  20.85  )
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

On Wed, 2021-11-03 at 08:06 -0500, Rob Herring wrote:
> On Wed, 03 Nov 2021 16:10:19 +0800, James Lo wrote:
> > This adds documentation for the SPMI controller found on Mediatek
> > SoCs.
> > 
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
> review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-
> pmif.example.dt.yaml: spmi@10027000: reg: [[268595200, 3584],
> [268603392, 256]] is too long
> 	From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/spmi/spmi.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/1550144__;!!CTRNKA9wMg0ARbw!yBdAIu8sF9FdGe9H9yO19pC0PvopKz_1DwYCmY0g5pqXvOC6acHZh_NfySMb2x_n$
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

Due to [RESEND,v13,2/4] depends on [RESEND,v13,1/4],
so we local can pass yaml when apply all 4 patches,
and fail only apply [RESEND,v13,2/4] as your bot's result.

Should we merge [RESEND,v13,2/4] and [RESEND,v13,2/4] to one patch ?
Or Could your bot help to run yaml check for all 4 patches applied (one
series) ?


Many thanks


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
