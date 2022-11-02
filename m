Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39708C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 12:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZG/ByG3yJYBkXj69Uab2Z/6HK+E8SMP0+2AXC/lf1A=; b=WSXQ4SkR/0rPByQ2JLa/GNsR3Y
	He//nUSBQzU2nlljyfQmFMx1wxvQm00/7aVJ7UuCylgMQKRO2Kcgs/ssIGLlNiIAiRRXdBT+X4TZp
	QfbAseJ7Y9mmcd6ejPitjoU8XIZ0gX0Fn/pzHTNvxIa6ZM5Y0jgAPziYDEE1IaGw0LxCDicaIvoGT
	3DXxfE92VfsnxgJ+UjNo1EJlSNZIJGqYDszhjd13IS/tSTh4aN/o/5hMp94d9IPueWAigih04gBid
	kTJeLIWvh4AbKIzIJjdq/I9d+ueuYiQS8X0BpmAtX9sdx3lV4ez3Uz+Dbfh9kQ5Xa7Ml3LUzXz2IG
	TCnO0lCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqCdL-00AvuV-HK; Wed, 02 Nov 2022 12:14:15 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqCdI-00Avsj-Rg
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 12:14:14 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3321c2a8d4cso164210267b3.5
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 05:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EZG/ByG3yJYBkXj69Uab2Z/6HK+E8SMP0+2AXC/lf1A=;
        b=AkNUUmqO/Y45WxuoBR0rRaklH4OHqR+yZ5YeF6JnVQmYmTjluAaV46qVgaOKJ2mmgM
         PBqqDqdSWLLqNZ45Xbhc9B3t+OD2sBNtUXc4stMQoQBI48nwjPKRzZqbUNLP46fnP13T
         lQmPaz8cpBM0wcs0z2tUJuejy8JXAcpI/+Hs5tpVWFSQAdsg7I4Jl4sDzhvROmrGNqdQ
         MWBorzdi2SMHTwJ7sALIh4+WOqexvrkM688bwEJwNkjYffRbHc4ARbU+DnpEWbp7wI+u
         1X56Ly/vyk7iOdRZ842EBbJE8Gr+ggILqwOTMmQvHR0dIVSvVeQbheizloGpALSZYzdr
         XbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZG/ByG3yJYBkXj69Uab2Z/6HK+E8SMP0+2AXC/lf1A=;
        b=wPVvqxCr/FQBCRaxSOoRRzGt4N7JY2Kxr0l076nZXr8h1umluKnHbeO6w0gy3yq3FH
         ZA8KELvIv66uisBrF32soevFvLn/BcU1xRfATuUTbk9cAUkJmz38LW3ejXdXpgOUNu8c
         6EWT0XpGgU1hYPVMlHEGcUMDUZN137BL8gD1AcN4pSarvGOzwkCfGAhMEZeE0Bgf72nj
         m3jOP7I9Fo3waTYQElZlSVpzFWJepJ3ZTX9YoOLFSA7sjvR8Mi9GfLoXIKMOYTE2kxnu
         s/PD1BtlSqafX1XQjf2OKuZ8azUgYMvGZLiBlv/neX4k1WNYVT4/vkJ95IrFP1osucrs
         K17w==
X-Gm-Message-State: ACrzQf1od+rtKBCQeJX9gKaasdAhLuKvtis69KbO2gq7DCsgh6XrGoNu
	8PeHDA1ecPcbFPr8ylhUpyGEVsbVpYH9Y4WuChXKqresPoo+rg==
X-Google-Smtp-Source: AMsMyM78NfzDgrg2IPxctI0tS2AzDrlpnwtNUe18UdnC0fjfl1bmHHKpixedQ85u2WDA5JObnaAM2Jkhsl48huvRB6I=
X-Received: by 2002:a81:9e47:0:b0:361:468a:7221 with SMTP id
 n7-20020a819e47000000b00361468a7221mr23413942ywj.155.1667391250013; Wed, 02
 Nov 2022 05:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
 <20221031122224.1846221-3-ajye_huang@compal.corp-partner.google.com> <549e1ff6-821a-1c26-0a4f-021bed27b093@collabora.com>
In-Reply-To: <549e1ff6-821a-1c26-0a4f-021bed27b093@collabora.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Wed, 2 Nov 2022 20:13:58 +0800
Message-ID: <CALprXBbL6HDaZhGU5eG6cnDP_rqymvamjTNGy7acaOk1rTMNmA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] ASoC: mediatek: mt8186-rt5682: Modify machine
 driver for two DMICs case
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek@lists.infradead.org, "chunxu . li" <chunxu.li@mediatek.com>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_051412_935047_8140B8D0 
X-CRM114-Status: GOOD (  16.48  )
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

Hi AngeloGioacchino,

On Wed, Nov 2, 2022 at 6:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> > A "dmic-gpios" property is used for a mixer control to switch
> > the dmic signal source between the Front and Rear Dmic.
> >
> > Refer to this one as an example,
> > commit 3cfbf07c6d27
> > ("ASoC: qcom: sc7180: Modify machine driver for 2mic")
> >

> > +static const char * const dmic_mux_text[] = {
> > +     "FrontMic",
> > +     "RearMic",
>
> Why are the two words joined?
> s/FrontMic/Front Mic/g
> s/RearMic/Rear Mic/g
>
> Like that, we keep it consistent with the naming that was given in the commit
> that you mentioned in the commit description.
>
> Regards,
> Angelo

Thank you for your review.
Yes, you are correct, I should keep the string format consistent with
the commit I mentioned in descriptions to avoid confusion.
I will submit the next. Thanks. Regards.

