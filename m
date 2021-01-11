Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E37C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 02:53:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D7C022482
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 02:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D7C022482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b7e4cE56o+GPOsLA9RK+RzwVJHYjZ+M+cbTPY8lVn3U=; b=tyTrgf1FVfgTrQqNHiO0aUXDR
	AlCsPnjmjvECYSmYcfN81rY8BxJcfUAvMLGFsQuEJQZzuJsPfoYk0w3YUIXwrE4Igfgm+L0nrZjVk
	3RX2byO2vzUfVJQ0MYqeNcRZBY1Lz7cdAw+iAUMYML87JBMGXpiRcEn+RpkhEYYBpQV0RBXFX/57W
	IB2d9HJDoz5APb+qvHbFCeDzdRz3qtKP9qRgmjOv+rv1mE39dcDSfiNw3N6mGZ09z3czxyUCgpUKN
	MILYn/DJ5fMx9/8ij3abRGLzcAuAmRFqV+z02eyXytM8C9JutC4+ZsI7a69ASxqWAq9cJeSTof53V
	xQr6Y+1aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kynKA-0008FI-O5; Mon, 11 Jan 2021 02:52:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kynK7-0008D0-33; Mon, 11 Jan 2021 02:52:52 +0000
X-UUID: e41aa6523e5e426b93e49350bab69f19-20210110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RU7+xCTgbwjA5/NtcwBJENhgnq5+fPnUIsbPT3lI/JM=; 
 b=u3b95U32sPUFB6giWzfm6HoTt305o5A02NSaF3ruxcMHyzCYwsL8IsMURf7hJ+KNQe2sDv1Rs2ZaexXJcBySZoo8IGk9UWWP3Hr6KW7CsjHhC306ITGgTJEnCXFgrHAUKZb50hrCrED2l7nyYsR9OMkEPa9dUzRculju3cGRln4=;
X-UUID: e41aa6523e5e426b93e49350bab69f19-20210110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2055537676; Sun, 10 Jan 2021 18:52:43 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Jan 2021 18:52:42 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 10:52:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 10:52:33 +0800
Message-ID: <1610333553.2992.7.camel@mtksdaap41>
Subject: Re: [PATCH V7 01/13] dt-bindings: soc: Add dvfsrc driver bindings
From: Henry Chen <henryc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 11 Jan 2021 10:52:33 +0800
In-Reply-To: <1610163019.789930.3762037.nullmailer@robh.at.kernel.org>
References: <1610092095-5113-1-git-send-email-henryc.chen@mediatek.com>
 <1610092095-5113-2-git-send-email-henryc.chen@mediatek.com>
 <1610163019.789930.3762037.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95F7C6906A6D4DC8F92E1987659365ED2D84E2337FE6B238817FF73313E3F32C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_215251_334105_914EC0BB 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, James Liao <jamesjj.liao@mediatek.com>,
 Nicolas Boichat <drinkcat@google.com>, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Arvin
 Wang <arvin.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryan Case <ryandcase@chromium.org>, Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Fri, 2021-01-08 at 20:30 -0700, Rob Herring wrote:
> On Fri, 08 Jan 2021 15:48:03 +0800, Henry Chen wrote:
> > Document the binding for enabling dvfsrc on MediaTek SoC.
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 67 ++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dts:19:18: fatal error: dt-bindings/interconnect/mtk,mt8183-emi.h: No such file or directory
>    19 |         #include <dt-bindings/interconnect/mtk,mt8183-emi.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Sorry, because this header file is added on "[V7,07/13] dt-bindings:
interconnect: add MT8183 interconnect dt-bindings".
Should I change the order of the patchset (let the yaml pathc behind the
header) to fixed that ?

Thanks,
Henry
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dt.yaml] Error 1
> make: *** [Makefile:1370: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1423679
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
