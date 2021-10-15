Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE26C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 01:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E23461090
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 01:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E23461090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhOkyjO1/iE841gl6BiREZnrIPgrT2W2061EzAZWmAA=; b=IUNCTsayt5mXNq
	dc+xwYsTHPoD7ZGzR0HOKTLIICKOYOmltedIJLmMMDDDC+q43mU3y0avHznmQ43hNg/smarb7+qUN
	NL/RiQHhtDbiR/xe2/tAJ3uv/tvGa16vLf1amcAwfM8i2DBgg4cjq7e5wZOwl4IYlu2L9v6eIO5i5
	erTgT7vdyLHfEe0tPpYz1qG3CdVartJualY+5DQbJBFuRu9Rvzx3RPIt5cRxw9d4rc/rKm8iQHTjv
	qQs/dgGfS7EC5egXy5aPiraHUqw4/DkRadKr7HCHGTxt1iiVCyuDEBX8b5lUT04cjdvHy4TLFLVrt
	BWOjNbEov/8KyLZalb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbCS4-0050OD-7Q; Fri, 15 Oct 2021 01:56:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbCS0-0050Mz-Js; Fri, 15 Oct 2021 01:56:02 +0000
X-UUID: 4350520b1fe448178d3500a0c99dee39-20211014
X-UUID: 4350520b1fe448178d3500a0c99dee39-20211014
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 602987858; Thu, 14 Oct 2021 18:55:58 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 18:45:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Oct 2021 09:45:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Oct 2021 09:45:54 +0800
Message-ID: <e7cb3220b925209d8f5229c207d5efbc42d58794.camel@mediatek.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pinctrl: update bindings for MT7986
 SoC
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Ryder Lee
 <Ryder.Lee@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>, "John
 Crispin" <john@phrozen.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 15 Oct 2021 09:45:54 +0800
In-Reply-To: <1634221864.165084.3295876.nullmailer@robh.at.kernel.org>
References: <20211014075836.17681-1-sam.shih@mediatek.com>
 <20211014075836.17681-2-sam.shih@mediatek.com>
 <1634221864.165084.3295876.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_185600_696357_023D351C 
X-CRM114-Status: GOOD (  25.12  )
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

Hi

On Thu, 2021-10-14 at 09:31 -0500, Rob Herring wrote:
> On Thu, 14 Oct 2021 15:58:33 +0800, Sam Shih wrote:
> > This updates bindings for MT7986 pinctrl driver. The
> > difference of pinctrl between mt7986a and mt7986b is that pin-41 to
> > pin-65 do not exist on mt7986b
> > 
> > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> > 
> > ---
> > v7 : updated pinctcl node binding description, and separate pinctrl
> >      part into a single patch series
> > 
> > Original thread:
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/8348ed3e-c561-ad7e-fe9e-a31ed346d8d0@gmail.com/__;!!CTRNKA9wMg0ARbw!yJc1hf6XafeskaOgY8TmMDpGDHuIDhx6AGIpuOiJRl7jCVYcnPmr6I4XKz2iy6O4$
> >  
> > 
> > v6 : fixed yamllint warnings/errors v2
> > v5 : fixed yamllint warnings/errors v1
> > v4 : used yaml format instead of txt format document
> > v3 : make mt7986 pinctrl bindings as a separate file
> > v2 : deleted the redundant description of mt7986a/mt7986b
> > ---
> >  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 364
> > ++++++++++++++++++
> >  1 file changed, 364 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-
> > pinctrl.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-
> pinctrl.example.dts:52.36-57.15: ERROR (duplicate_node_names): 
> /example-0/soc/pinctrl@1001f000/uart1-pins: Duplicate node name
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[1]: *** [scripts/Makefile.lib:385:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-
> pinctrl.example.dt.yaml] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2
> 

Sorry, I took the wrong patch in my local environment for submmit

This should be "uart2_pins: uart2-pins { ... "

I will send next patch to fix this.

+        uart2_pins: uart1-pins {
+          mux {
+            function = "uart";
+            groups = "uart2";
+          };
+        };



> doc reference errors (make refcheckdocs):
> 
> See 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/1540821__;!!CTRNKA9wMg0ARbw!yJc1hf6XafeskaOgY8TmMDpGDHuIDhx6AGIpuOiJRl7jCVYcnPmr6I4XK9R-t-CX$
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

Thanks,
Sam
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
