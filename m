Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BE9C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 05:23:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7F2C22AAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 05:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7F2C22AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kph5pJMba8Gu/l0PdENtPQ6KFRBzq3Qt13IDcN3fy9s=; b=ikpv1Me9eqXvPmpDK5naUvDux
	Ngb+BoNQ34o8w3kHx96FiXm0MmNhjBdj8IoVcaX2jarPMrNhyHs+6zU0PWmAjpZVo4oTG/d3gBeIT
	Xq6PZ62A2avdZNQT/6mkdennCFW0lMscWhUmHbF9RfgxUTmya/4kvFJqKwD8jItKWhu+Sp0eQy48U
	7guT13mN3hHAAERCiHyo8h2e0X+zy/PmCvrFmajwdx96+0jvXyI8fngGcuFEYr5P9KH1y5VIwLYtJ
	vj3S6Ue+s5+hGNkEQbU82zBE6huid0/n8bjZkwa1huN7J+XPHXgvYbLpSflA2OaVB+qlv4shKVvhl
	SB7kB4DOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksfZT-0004CW-4D; Fri, 25 Dec 2020 05:23:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksfZO-0004B8-CJ; Fri, 25 Dec 2020 05:23:20 +0000
X-UUID: 1b2469429eba4899a2cdc5f3006d9750-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NymtaQsb4oZZm5gLdklbpuzTSWgSwEAEXv7tkNvz7xM=; 
 b=TqQ+SgiXml4sw71/XWcR4uXdxL3vM6+p8U6UCql75bng6YthtVu1pLcqyeQRb/JluRDET/c1pqu2V8InEft5FcGtRW7dH3RLq7hLyL1TyQbwIxhohIbS/19f1Cp+SHirVRom5EljTjjy1Z5e3sCejryonEAuuWYYRMnk7yt3OLg=;
X-UUID: 1b2469429eba4899a2cdc5f3006d9750-20201224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 860268315; Thu, 24 Dec 2020 21:23:10 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 21:13:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 13:12:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 13:12:58 +0800
Message-ID: <1608873179.24775.1.camel@mtksdaap41>
Subject: Re: [PATCH V6 01/13] dt-bindings: soc: Add dvfsrc driver bindings
From: Henry Chen <henryc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 25 Dec 2020 13:12:59 +0800
In-Reply-To: <1608829305.386312.2966452.nullmailer@robh.at.kernel.org>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-2-git-send-email-henryc.chen@mediatek.com>
 <1608829305.386312.2966452.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2C62C8F5D17C2CB4C8FC8497F9967A51166F542B6D7A0761DDE0458A8C93F1922000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_002318_654404_46F4E3F8 
X-CRM114-Status: GOOD (  19.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 Ryan Case <ryandcase@chromium.org>, Georgi
 Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-24 at 10:01 -0700, Rob Herring wrote:
> On Thu, 24 Dec 2020 14:08:42 +0800, Henry Chen wrote:
> > Document the binding for enabling dvfsrc on MediaTek SoC.
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 68 ++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dts:19:18: fatal error: dt-bindings/soc/mtk,dvfsrc.h: No such file or directory
>    19 |         #include <dt-bindings/soc/mtk,dvfsrc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dt.yaml] Error 1
> make: *** [Makefile:1370: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1420382
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
Hi Rob,

Sorry for the check error, I will re-check and submit again.

Thanks,
Henry
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
