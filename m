Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EC4C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 15:59:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D574F610E6
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 15:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D574F610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zJNDaj8OuLFRtoFqhDZJx/EVwcTou8smQhPkrv5DPCc=; b=kU8SWpJqvSdN4PuUgPHgDDDa8
	2BvEjKl9jvK8yBAhaaO3MRzAyBZM5lNpPd0Q+eHHjcD1HJBm1/a2xnufkCNqT2C1pRqvNmObNVg7K
	jqA23+kFuJCEAV9gSXdmogn9toyXDQUzzqsm+ZU1thsywpNa2gF2Q3Z9HpZYXGOut+/eujOMQ32wr
	CuF/WwwVNhSfmhF/z2wFoYTbp8zavkd5EaI8+nf5JLhKhZqHu+YFljTIJZXy4SJnA21hjtivYFwhG
	4k+D5pIHxLo/TyizGbc2gda+Y3+53vzpI5HsxErhULCxzmpi1ElJwzQJnt0vPRLNP6yo8H6sabmcK
	zVG1xderw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUtXG-0013R7-UN; Fri, 09 Apr 2021 15:59:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUtX4-0013QK-6z; Fri, 09 Apr 2021 15:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jgoc7YBBGngzqtr9YUw4x+DXgK0qHQoZ5/OqbIMHaXE=; b=ELwNON7VRKIQEIlCE0RnRU5Rpl
 CjifhdqlHorciLdwgfIXNUuS6eoTMoHSlBBtZVwLn2UItwuOTQ9firkHNczN1U7ySuNsCbOVdW5d0
 ZOZZGkN8qMWKWc3nKxHMzV/kr4IKJ/KM0FwhaGYkxGfsQsqwdq+uknDzq2ZSAxcPLQ9GLWot9TLHn
 mLL/kGsZ45AgWMdAimCnUDgh0YWalBSGIplZfhNGh23hfJNFHdDipgbYUgJsqXjfJyiOeVau3QrR8
 44lRH0fjfNqlFYmvb6OlKg7bgYkV07uSjCzjfhdVmmc0+ddKHsTKiWegEp2RIZT+YSXY9+5z05MG9
 viDWo2OQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUtX0-004dN3-6T; Fri, 09 Apr 2021 15:58:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1D3761186;
 Fri,  9 Apr 2021 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617983929;
 bh=boUQFp8BrP5adormbeyGrdToQnS2iV9bBtrffhE9cWg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fab8lZuNy5F4YIYlursMfD3dxY6ylVb5oG+qgxXvPtN9RDB0aQV5yMn/tgUw4sd7v
 uNHGJc2iMMKpfaO2VbdCOl6w9uFTGbYuU5IHBAol6CZIq1sBOqfFot+bMla9XvULIR
 CgbWWB8q2EnY84fsXUEmoX2aPb38/a+uyP8PWpzoNGgusVBEhwZAyeYzYA7k24ULti
 nR2ugmQ8Xk6fb5jWDnKkBy8Z9kx3pz4is/Yc4ncAWhNVO/IWuplXfRXxPZSRjGaSAV
 7tq2kJyw5yyuDCXyjUBcKtVhybDnjOHX595lwyXSsGW8VBnUv68LXhzScdN1QhXEXH
 j8sxQYtSAlwAg==
Received: by mail-ed1-f53.google.com with SMTP id w23so7132677edx.7;
 Fri, 09 Apr 2021 08:58:48 -0700 (PDT)
X-Gm-Message-State: AOAM5315Uss9rZkDvW26qOonr/jqZ0rIs2MBUGbyf4RAqflYc1+0Bwem
 Ykc7DUql/7/ZoYfD9JbzDijYjte6Ovx4oDq7Rw==
X-Google-Smtp-Source: ABdhPJwP4FlWMM6Zfr313cW9Cfl6tJV14f9XLmY0h1Ka1cstG1KX4xZL1MgcU6M6qW/LVKG2nPiUqa3BIDhkYVlSR2s=
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr18615073edd.258.1617983927008; 
 Fri, 09 Apr 2021 08:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
 <1615383186-18500-2-git-send-email-argus.lin@mediatek.com>
 <CAL_JsqL-TvUZOZ8Eev5zrq2aA59SLLEMVV3Ypq-07bNccp=NRw@mail.gmail.com>
In-Reply-To: <CAL_JsqL-TvUZOZ8Eev5zrq2aA59SLLEMVV3Ypq-07bNccp=NRw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 9 Apr 2021 10:58:35 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+awH=L=qu4HqoL-arA8fsCuEkqf9oYsYnw6=3nq8XENw@mail.gmail.com>
Message-ID: <CAL_Jsq+awH=L=qu4HqoL-arA8fsCuEkqf9oYsYnw6=3nq8XENw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: mediatek: mt6359: add ASoC mt6359
 ASoC accdet jack document
To: Argus Lin <argus.lin@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jack Yu <jack.yu@realtek.com>, Shuming Fan <shumingf@realtek.com>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>, 
 "Shane.Chien" <shane.chien@mediatek.com>,
 Chipeng Chang <chipeng.chang@mediatek.com>, 
 Linux-ALSA <alsa-devel@alsa-project.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_085850_329970_9CF65C49 
X-CRM114-Status: GOOD (  22.26  )
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

On Wed, Mar 31, 2021 at 9:16 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Mar 10, 2021 at 7:33 AM Argus Lin <argus.lin@mediatek.com> wrote:
> >
> > This patch adds MediaTek MT6359 ASoC accdet jack document.
>
> Seems this never made it to the DT list so no checks ran. It's got all
> sorts of errors:

Still broken in linux-next. Please revert if can't be bothered to fix it.

>
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,four-key-thr: 'oneOf' conditional failed, one must
> be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,four-key-thr: 'oneOf' conditional failed, one must
> be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,four-key-thr: 'oneOf' conditional failed, one must
> be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,accdet-name: 'oneOf' conditional failed, one must
> be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,accdet-name: 'oneOf' conditional failed, one must
> be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,accdet-name: 'oneOf' conditional failed, one must
> be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-use-ext-res: 'oneOf' conditional failed, one
> must be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-use-ext-res: 'oneOf' conditional failed, one
> must be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-use-ext-res: 'oneOf' conditional failed, one
> must be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,tri-key-cdd-thr: 'oneOf' conditional failed, one
> must be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,tri-key-cdd-thr: 'oneOf' conditional failed, one
> must be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,tri-key-cdd-thr: 'oneOf' conditional failed, one
> must be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,pwm-deb-setting: 'oneOf' conditional failed, one
> must be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,pwm-deb-setting: 'oneOf' conditional failed, one
> must be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,pwm-deb-setting: 'oneOf' conditional failed, one
> must be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-num: 'oneOf' conditional failed, one must be
> fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-num: 'oneOf' conditional failed, one must be
> fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-num: 'oneOf' conditional failed, one must be
> fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,mic-vol: 'oneOf' conditional failed, one must be
> fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,mic-vol: 'oneOf' conditional failed, one must be
> fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,mic-vol: 'oneOf' conditional failed, one must be
> fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-trig-mode: 'oneOf' conditional failed, one
> must be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-trig-mode: 'oneOf' conditional failed, one
> must be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-trig-mode: 'oneOf' conditional failed, one
> must be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,three-key-thr: 'oneOf' conditional failed, one
> must be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,three-key-thr: 'oneOf' conditional failed, one
> must be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,three-key-thr: 'oneOf' conditional failed, one
> must be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,key-mode: 'oneOf' conditional failed, one must be
> fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,key-mode: 'oneOf' conditional failed, one must be
> fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,key-mode: 'oneOf' conditional failed, one must be
> fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-comp-vth: 'oneOf' conditional failed, one
> must be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-comp-vth: 'oneOf' conditional failed, one
> must be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-comp-vth: 'oneOf' conditional failed, one
> must be fixed:
>  '$ref' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-use-ap: 'oneOf' conditional failed, one must
> be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-use-ap: 'oneOf' conditional failed, one must
> be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-use-ap: 'oneOf' conditional failed, one must
> be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,mic-mode: 'oneOf' conditional failed, one must be
> fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,mic-mode: 'oneOf' conditional failed, one must be
> fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,mic-mode: 'oneOf' conditional failed, one must be
> fixed:
>  '$ref' is a required property
>  'allOf' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-detect-mode: 'oneOf' conditional failed, one
> must be fixed:
>  'type' is a required property
>  Additional properties are not allowed ('maxItems' was unexpected)
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-detect-mode: 'oneOf' conditional failed, one
> must be fixed:
>  'enum' is a required property
>  'const' is a required property
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml:
> properties:mediatek,eint-detect-mode: 'oneOf' conditional failed, one
> must be fixed:
>  '$ref' is a required property
>  'allOf' is a required property
>
>
> > Signed-off-by: Argus Lin <argus.lin@mediatek.com>
> > ---
> >  .../bindings/sound/mt6359-accdet.yaml         | 164 ++++++++++++++++++
> >  1 file changed, 164 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
> > new file mode 100644
> > index 000000000000..7fb3e8dfb4c5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
> > @@ -0,0 +1,164 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mt6359-accdet.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Technologies Inc. MT6359 ASoC accdet jack driver bindings
> > +
> > +maintainers:
> > +  - Chipeng Chang <chipeng.chang@mediatek.com>
> > +
> > +description: |
> > +  This binding describes the Mediatek Technologies MT6359 ASoC
> > +  accdet jack driver.
> > +
> > +properties:
> > +  mediatek,accdet-name:
> > +    maxItems: 1
> > +    description: named as "mt6359-accdet" jack.
>
> Sounds like a constraint. Why do you need this in DT if only 1 value?
> And why expose an SoC specific name to userspace (I guess)?
>
> > +
> > +  mediatek,mic-vol:
> > +    maxItems: 1
>
> This is an array because 'maxItems' is for arrays? It needs a type
> reference. Same problem throughout.
>
> > +    description: |
> > +      accdet micbias1 voltage.
> > +
> > +      enum:
>
> The indentation is wrong here, so this is just part of 'description'.
>
> > +        - 0x00 # 1.7v - micbias1 volage is 1.7v.
> > +        - 0x01 # 1.8v - micbias1 volage is 1.8v.
> > +        - 0x02 # 1.9v - micbias1 volage is 1.9v.
> > +        - 0x03 # 2.0v - micbias1 volage is 2.0v.
> > +        - 0x04 # 2.1v - micbias1 volage is 2.1v.
> > +        - 0x05 # 2.5v - micbias1 volage is 2.5v.
> > +        - 0x06 # 2.6v - micbias1 volage is 2.6v.
> > +        - 0x07 # 2.7v - micbias1 volage is 2.7v.
> > +        - 0x08 # 2.8v - micbias1 volage is 2.8v.
> > +        - 0x09 # 2.85v - micbias1 volage is 2.85v.
> > +
> > +  mediatek,mic-mode:
> > +    maxItems: 1
> > +    description: |
> > +      value as 1, 2, 6 to indicate ACC/DCC mode. default is DCC mode 2.
> > +
> > +      enum:
> > +        - 0x01 # ACC - ACC mode.
> > +        - 0x02 # DCC - low cost without in bias.
> > +        - 0x06 # DCC - low cost with in bias.
> > +
> > +  mediatek,pwm-deb-setting:
> > +    maxItems: 15
> > +    description: |
> > +       headset-mode-setting : Indicates customized pwm, debounce setting
> > +       accdet pwm_width, pwm_thresh, fall_delay, rise_delay
> > +       debounce0, debounce1, debounce3, debounce4
> > +       eint pwm_width, eint pwm_thresh
> > +       eint deb(debounce0, debounce1, debounce2, debounce3), inv_debounce.
>
> This is a string?
>
> > +
> > +  mediatek,eint-use-ap:
> > +    maxItems: 1
> > +    description: |
> > +      indicates to use ap gpio.
> > +
> > +      enum:
> > +        - 0x00 # MT6359 eint detection mode.
> > +        - 0x01 # SoC GPIO detection mode.
>
> Would boolean work here?
>
> > +
> > +  mediatek,eint-detect-mode:
> > +    maxItems: 1
> > +    description: |
> > +      indicates to use ap gpio.
> > +
> > +      enum:
> > +        - 0x00 # detection mode with higher detection power.
> > +        - 0x01 # detection mode with lower detection power.
> > +        - 0x02 # detection mode with sw moisture detection mode.
> > +        - 0x03 # detection mode with hw moisture detection mode1.
> > +        - 0x04 # detection mode with hw moisture detection mode2.
> > +
> > +  mediatek,eint-num:
> > +    maxItems: 1
> > +    description: |
> > +      incicates pmic eint usage.
> > +
> > +      enum:
> > +        - 0x0 # PMIC_EINT0 - use pmic eint0 to trigger plug interrupt.
> > +        - 0x1 # PMIC_EINT1 - use pmic eint1 to trigger plug interrupt.
> > +        - 0x2 # PMIC_BI_EINT - use pmic eint0/1 to trigger plug interrupt.
> > +
> > +  mediatek,eint-trig-mode:
> > +    maxItems: 1
> > +    description: |
> > +      incicates pmic eint trigger mode.
> > +
> > +      enum:
> > +        - 0x0 # PMIC_GPIO - use pmic gpio to detect plug status.
> > +        - 0x1 # PMIC_INVERTER - use pmic inverter to detect plug status.
>
> Boolean instead?
>
> > +
> > +  mediatek,eint-use-ext-res:
> > +    maxItems: 1
> > +    description: |
> > +      select HP_EINT pull up resistance, default 0 use internal resistance.
> > +
> > +      enum:
> > +        - 0x0 # use internal resistor.
> > +        - 0x1 # use external resistor.
>
> Boolean?
>
> > +
> > +  mediatek,eint-comp-vth:
> > +    maxItems: 1
> > +    description: |
> > +      indicates comparator detection voltage.
> > +
> > +      enum:
> > +        - 0x00 # 2.8v.
> > +        - 0x01 # 2.4v.
> > +        - 0x02 # 2.0v.
> > +        - 0x03 # 0.7v.
> > +
> > +  mediatek,key-mode:
> > +    maxItems: 1
> > +    description: |
> > +      incicates key mode type.
> > +
> > +      enum:
> > +        - 0x0 # THREE_KEY - support 3-key key mode.
> > +        - 0x1 # FOUR_KEY - support 4-key key mode.
> > +        - 0x2 # TRI_KEY_CDD - support 3-key google CDD key mode.
> > +
> > +  mediatek,three-key-thr:
> > +    maxItems: 4
> > +    description: |
> > +      3 key device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
> > +
> > +  mediatek,tri-key-cdd-thr:
> > +    maxItems: 4
> > +    description: |
> > +      3 key CDD device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
> > +
> > +  mediatek,four-key-thr:
> > +    maxItems: 4
> > +    description: |
> > +      4 key device detection threshold: 0--MD_MAX--VOICE_MAX--UP_MAX--DW_MAX.
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    accdet: accdet {
>
> Where does this node go? You've got no compatible, so it's a child of
> something else?
>
> > +        mediatek,accdet-name = "mt6359-accdet";
> > +        mediatek,mic-vol = <8>;
> > +        mediatek,mic-mode = <2>;
> > +        mediatek,pwm-deb-setting = <0x500 0x500 1 0x1f0
> > +                                    0x800 0x800 0x20 0x44
> > +                                    0x4 0x1
> > +                                    0x5 0x3 0x3 0x5 0xe>;
> > +        mediatek,eint-use-ap = <0>;
> > +        mediatek,eint-detect-mode = <4>;
> > +        mediatek,eint-num = <0>;
> > +        mediatek,eint-trig-mode = <1>;
> > +        mediatek,eint-use-ext-res = <0>;
> > +        mediatek,eint-comp-vth = <2>;
> > +        mediatek,key-mode = <0>;
> > +        mediatek,three-key-thr = <0 80 220 400>;
> > +        status = "okay";
>
> Don't show status in examples.
>
> > +    };
> > +...
>
> > --
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
