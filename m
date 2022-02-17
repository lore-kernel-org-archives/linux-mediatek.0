Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C27C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhAX6GWa7f1YSKx1sPmVyK4wSaA7OU7oqIfSsNTzV+4=; b=y7tK98s512WM06
	7BjERD9R3+z5Mi9IOSl7/1v3MqwmI76wAwpETiovuG4c5zQEo1vh9QmEg8Vv64eGIE/3aylPXOfoQ
	/s6+nYfeiaRepb8ylyRmzA/hnSPDbHYcVmxqYMRBF5Gz2XvEe7oWuWq0IRvOj4K5mMKqDq3zpat02
	pFRyVXjvA9YQrZCYs7K1l7nBqTvt3zpNkLYeeP3oHJAgezV8LzbS45i+uYXBjBCz8Dit5C/B104TQ
	7dvx2Y5sS5ENxB0DbX8JdLKWn32LATsCeq9kuYZwwZjdmggbJSjgVSPRUCaie/KrYIrkDxTn21suh
	ywkA8qoR/yxIwVxL7QaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKg4j-00ATFk-4s; Thu, 17 Feb 2022 12:39:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKg4W-00ATEA-CG; Thu, 17 Feb 2022 12:39:46 +0000
X-UUID: 2682d024741341a3bc6b2ff2381020b7-20220217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7ZAOKUhx7U5z2ewwKcmE8tF6q4WFxw0j/nmwj85bsmQ=; 
 b=DV4MnGR38PpfRq4RcaO76sqxbV3OVGWCXXTeSKZj06FuzSbbu6yflfYHA+0nfx15yRl7mIRDEp44IZlkSEWT7rlxtj46cnGgz2wbxINMP2tP+0eYhgYXUT8LOF0Mwl1ogbhm0KNwdLIqxUAkrHsCztSAM84/l88A1T3YOXN/BZg=;
X-UUID: 2682d024741341a3bc6b2ff2381020b7-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1475413098; Thu, 17 Feb 2022 05:39:39 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 04:35:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 20:35:48 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 20:35:48 +0800
Message-ID: <0f8c014c077d0fc75c8552e457482d9daf68d73b.camel@mediatek.com>
Subject: Re: [v2,1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek,pwm-disp.yaml format
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <thierry.reding@gmail.com>,
 <lee.jones@linaro.org>, <linux-pwm@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <jitao.shi@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <u.kleine-koenig@pengutronix.de>, <devicetree@vger.kernel.org>, Xinlei Lee
 <xinlei.lee@mediatek.corp-partner.google.com>
Date: Thu, 17 Feb 2022 20:35:58 +0800
In-Reply-To: <1645051913.078742.1825836.nullmailer@robh.at.kernel.org>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-2-git-send-email-xinlei.lee@mediatek.com>
 <1645051913.078742.1825836.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_043944_452491_DAA35C47 
X-CRM114-Status: GOOD (  19.60  )
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

On Wed, 2022-02-16 at 16:51 -0600, Rob Herring wrote:
> On Wed, 16 Feb 2022 17:32:48 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> > 
> > Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as
> > suggested by maintainer
> > 
> > Signed-off-by: Xinlei Lee <
> > xinlei.lee@mediatek.corp-partner.google.com>
> > ---
> >  .../bindings/pwm/mediatek,pwm-disp.yaml       | 71
> > +++++++++++++++++++
> >  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ------------
> >  2 files changed, 71 insertions(+), 44 deletions(-)
> >  create mode 100755
> > Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-
> > disp.txt
> > 
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for
> dtbs_check.
> This will change in the future.
> 
> Full log is available here: 
> https://patchwork.ozlabs.org/patch/1593550
> 
> 
> pwm@1400a000: compatible:0: 'mediatek,mt7623-disp-pwm' is not one of
> ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm',
> 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
> 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
> 	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml
> 
> pwm@1400a000: compatible: ['mediatek,mt7623-disp-pwm',
> 'mediatek,mt2701-disp-pwm'] is too long
> 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
> 	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml
> 
> pwm@1400a000: 'oneOf' conditional failed, one must be fixed:
> 	arch/arm/boot/dts/mt2701-evb.dt.yaml
> 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
> 	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml
> 
> pwm@1400a000: 'power-domains' is a required property
> 	arch/arm/boot/dts/mt2701-evb.dt.yaml
> 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt.yaml
> 	arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml
> 
> pwm@1401e000: compatible: ['mediatek,mt8173-disp-pwm',
> 'mediatek,mt6595-disp-pwm'] is too long
> 	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml
> 
> pwm@1401e000: 'oneOf' conditional failed, one must be fixed:
> 	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml
> 
> pwm@1401e000: 'power-domains' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml
> 
> pwm@1401f000: compatible: ['mediatek,mt8173-disp-pwm',
> 'mediatek,mt6595-disp-pwm'] is too long
> 	arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8173-evb.dt.yaml
> 
Hi Rob:

Thanks for your review. I'm trying to modify the dtbs_check warning you
mentioned. I would like to ask what cmd I can use to test the modified
dtbs_check locally.
Also for WARNING: DT binding docs and includes should be a separate
patch. I've also made some attempts including splitting the delete .txt
and create .yaml files into two patches, but the warning doesn't
resolve. Do you have any suggestions for the results of checkpatch
?This will help a lot with the next edition I send out.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
