Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4370C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vseSRLmlE6TrnuWqyVbQuscqNdv4VUb/dWbhVa5oOnQ=; b=yKqNihmmEFmK4FVeo9hn8sEXfa
	FABETGHjw311IRk7HTT8SgRblreQCyQZUNMgNRJqGvyD5wfRuxK1Z1/NXOmksOoGISxZ5T8auCIpZ
	QWkb5CRfqPaE6b3MQiZh9C8u9AWhzqQJ+Oe215cbX/UrWdS/N+acb72sRZ2DUpEEdFWuQD2C8IdIm
	llHAA2fxcn49pmJiFUP9fNuxfq0Nl/3tx5OS4SsnT4T63+LO/+A9jcAl+TemA9mXh4rE1g8JqpOTz
	leLVHdLlQTM8lXxY1nmSMUuF+GuVKBeTbIdHkKjaCF3oOeLAsqQ25CoxHf0OKa/ah911ZDevLEsPN
	cPCbLxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8dZ-008D5S-0l;
	Thu, 10 Aug 2023 16:35:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8dV-008D4U-2T;
	Thu, 10 Aug 2023 16:35:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C29D76639E;
	Thu, 10 Aug 2023 16:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFA0C433CD;
	Thu, 10 Aug 2023 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691685343;
	bh=tAd8cGqWXnMp+MhyA+QN6jDgfWonWi3hyrZySG4ENN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JXB07tmP1/SRRe6/WnKUKx+EHTRS4Y+3pwfbddMMxRPcFQgijA8lk9u7PsqrzAkcb
	 kP3L1o8hmC2780WNQmMuCB98OLnqSNHNpst0XbcQN4U+D0MqFxhb1++CSDuDDSlYsx
	 zEvn5o1aiaKfFVqGZ2mlqpuw/FZRIzikDM+Lerc99HGS/COF6NHA4bWhPk2XiZ/tll
	 vaAH7atcMxYLNbmf9yylYAkTRcpYaSZWddJelDqvyW6JheiuC95U0ElFUlouJ1DYda
	 r747Yp2U8Ikh2VPT4HapI39XQUSd9GoQ5JOmBvFGHPyH9P/X2RQ/VqUhFY8A+PPNVN
	 tL5YcKIQnCRgg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b9338e4695so17131271fa.2;
        Thu, 10 Aug 2023 09:35:43 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy0uEywaLpi7HZFHHLTIQQZNu5vzPMoAeZCOQfYE6DPUIBBkAAw
	OW72BIFJqniOAVsExeQ+KC5ZdzFgIbhzPnokQA==
X-Google-Smtp-Source: AGHT+IGMhThSGcH6iK3+zXMwVeXv9qRB2ftg4Knvd20JgbzEnsxMFjNJQ8haNG3+I9TXP94jb4Whom2WJEFxRHLe5Aw=
X-Received: by 2002:a2e:3c11:0:b0:2b6:a804:4cc with SMTP id
 j17-20020a2e3c11000000b002b6a80404ccmr2488397lja.53.1691685341671; Thu, 10
 Aug 2023 09:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
 <20230810063300.20151-2-krzysztof.kozlowski@linaro.org> <169165201641.3911557.18445521260746432395.robh@kernel.org>
 <137a734e-0e5a-5fcb-f0d3-1fdbb5e8da34@linaro.org>
In-Reply-To: <137a734e-0e5a-5fcb-f0d3-1fdbb5e8da34@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Aug 2023 10:35:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL-x5V2mJOCgDC8xoHuvu6A1enQh-idmxGJjy80A9fdow@mail.gmail.com>
Message-ID: <CAL_JsqL-x5V2mJOCgDC8xoHuvu6A1enQh-idmxGJjy80A9fdow@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Judy Hsiao <judyhsiao@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Jonathan Bakker <xc-racer2@live.ca>, Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela <perex@perex.cz>, 
	Rao Mandadapu <srivasam@codeaurora.org>, Takashi Iwai <tiwai@suse.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_093545_908168_8E54547C 
X-CRM114-Status: GOOD (  18.82  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 10, 2023 at 1:47=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/08/2023 09:20, Rob Herring wrote:
> >
> > On Thu, 10 Aug 2023 08:32:50 +0200, Krzysztof Kozlowski wrote:
> >> The mediatek,mt8188-mt6359 Linux sound machine driver requires the
> >> "model" property, so binding was incomplete.  Reference the common sou=
nd
> >> card properties to fix that which also allows to remove duplicated
> >> property definitions.  Leave the relevant parts of "audio-routing"
> >> description.
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  .../bindings/sound/mediatek,mt8188-mt6359.yaml  | 17 +++++++---------=
-
> >>  1 file changed, 7 insertions(+), 10 deletions(-)
> >>
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_chec=
k'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> >
>
> I think the bot responds like this if the patch could not be applied.
> Probably we can ignore it.

It's because I converted dtschema to use pyproject.toml (the newest
and 3rd way to do python packaging). I started getting deprecation
warnings on debian testing due to using setup.py. Converting breaks on
ubuntu 22.04. Seems to be this bug[1]. The CI job should now be fixed
by installing the latest pip version.

Rob

[1] https://bugs.launchpad.net/ubuntu/+source/python-pip/+bug/2018288

