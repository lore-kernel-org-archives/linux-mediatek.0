Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20741C43464
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 07:53:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB096208DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 07:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y78n1oP4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZJCNtkf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB096208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fj3eCpJ9t+Jin5EKXt2kK3g+FwbFvPFPygDYJxou0qA=; b=y78n1oP4+Jmcd0pOejjrjIQN8
	pY0q/go0VDU7XWmOKRwzXO9+25ezChct0VqyPtoo2w3RWxYVvDIG5gqElkw23jcXDOYdjtPOMDKuY
	DR86JbsS0ekX1qzKXu0LPF+zZpDXwlaFZTTisuOm87a3Qd0WvAEqvPqUp3CCgdjB3Cz7Z02A2Zdjn
	tOZEBU6AMBxLup2lJLEIg879M/evIHrwV5oGlGgVVl0D0UoeQKaB9qq/pt6gBpyQA5c5RCdGl7XWj
	dsoXaj+5plLqwq2KdNnLBQMAdkbbXGs3xNpolsut54BI1f607UJegUZCoVHz/Fawc+wX9uDf+6Pkn
	KZ9WKz/xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBCn-0007Ck-UU; Fri, 18 Sep 2020 07:53:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBCk-0007Bu-M0; Fri, 18 Sep 2020 07:53:15 +0000
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A092D235F9;
 Fri, 18 Sep 2020 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600415594;
 bh=zR4pC32CsRwkRMcQjTnnCp339wA8YZYmTzvhc8Ku3wQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cZJCNtkfkHA0r0FeMIAWY7D+QPapfLaH15sFE1WNYM4PKyUdb33JlOgilSdSSTwM4
 xGabXi2sfwLjYfFwquhkvjT02UVDctUBVqx+oQlovxOMWqP6oSQxOmeXlwiNQh93Do
 /Vu58+Vdi5m6dZbWmFufI2IgJXtwo+Id3LfJFLZc=
Received: by mail-lj1-f175.google.com with SMTP id u21so4287129ljl.6;
 Fri, 18 Sep 2020 00:53:13 -0700 (PDT)
X-Gm-Message-State: AOAM531UXoBCGZBiVlOAt5+3BTZvZHEU9oF0G1hsmvRKFdNKUF68W+w8
 n0sJYiry8sO7sZ9CRVCfxhcfbQ/OCGmsYn9Nm/I=
X-Google-Smtp-Source: ABdhPJz4h58zSa29o5A1o7MhoFoews9vi+zWZmYhOt2gWbPt5yeBvYS4l1uut8tLvrHP24ftCZlb9SA8h3ZMk81xBpI=
X-Received: by 2002:a17:906:5008:: with SMTP id
 s8mr36525529ejj.408.1600415590292; 
 Fri, 18 Sep 2020 00:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <20200917200936.GF3969@pendragon.ideasonboard.com>
In-Reply-To: <20200917200936.GF3969@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 18 Sep 2020 09:52:57 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc=o0vtU0VKE5b5Ro3nF=ra-p7UnbFfjj_++onw8MeSKQ@mail.gmail.com>
Message-ID: <CAJKOXPc=o0vtU0VKE5b5Ro3nF=ra-p7UnbFfjj_++onw8MeSKQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_035314_845164_B34220FD 
X-CRM114-Status: GOOD (  22.41  )
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
Cc: Amelie Delaunay <amelie.delaunay@st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Anson Huang <Anson.Huang@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Andy Teng <andy.teng@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Jaroslav Kysela <perex@perex.cz>,
 Sungbo Eo <mans0n@gorani.run>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sricharan R <sricharan@codeaurora.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hoan Tran <hoan@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 - <patches@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 17 Sep 2020 at 22:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Krzysztof,
>
> Thank you for the patch.
>
> On Thu, Sep 17, 2020 at 06:52:49PM +0200, Krzysztof Kozlowski wrote:
> > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > controllers.
>
> How about deleting the part that has been converted from gpio.txt ?

I did not move everything from the gpio.txt and it is really nicely
explained there. I think to leave it as it works as a overview/guide
better than YAML.

>
> > The schema enforces proper naming of GPIO controller nodes and GPIO
> > hogs.
> >
> > The schema should be included by specific GPIO controllers bindings.
>
> Instead of including it manually, could we use a conditional select: to
> apply the schema automatically when a gpio-controller property is
> present ?

You mean the same way as generic schema for GPIO controllers work?
This could be done but the point is to enforce the GPIO controller
bindings in GPIO controllers, so also in cases when someone forgets to
add "gpio-controller" property. Although, if given GPIO controller
schema requires "gpio-controller" then indeed select would work...

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
