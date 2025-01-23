Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857D6C0218B
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jan 2025 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dP4iIFxpGRxJIuWg8fbKde8yqpGCy/LbovICFuWMxcc=; b=iRWWrF8kq71HIt
	mlGg+2Sa6mWXv7gi26fijg8GPvMnkm4kPK/xhNiKCugxvQo/Qf7Nn/Je4najoic5cooY9QhUmATKt
	Vn60O40BjIjjFggR67rwoPf/NUzNv6GpmKnOiJPLFfX9qweGBzAtMZVuMOffIUVpwcwzXsfyNTBoL
	yNHLK+8zJnEv4C2ws/UQWmvqlhmd2hjhlk+Rq7G6ci4NpgqLwnk0oiZuAyH+1CkUib+vvZn85q37I
	gYVtb7Pw8Uo58v03pqOJ5FKSGJfod+jtbkAQ/vWdGXeCCw4JtOC476zl3g+yYpeUjAD/nOQLQ4utJ
	G47M68I4W2FVj0F+U/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazzB-0000000Cohn-15hl;
	Thu, 23 Jan 2025 16:23:17 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazww-0000000CoPT-2uQg
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jan 2025 16:21:00 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so976065e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jan 2025 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737649257; x=1738254057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP4iIFxpGRxJIuWg8fbKde8yqpGCy/LbovICFuWMxcc=;
        b=gqpcT1IlNLodVeVnXKaudmtzca25/xcOmWpiRScw+Q8zSV9hmzbGx3zOkEKE6eJ6vx
         jtPEf9FX/9LzGrgnW5DqBPGfYeDDB5JFiA2drA7hHX3tMbvk6NJ6FcDz0hQuPc+0At9D
         2pW1FOgVJMyFH+N66mK9NfFsnnLYM4UlYpga0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737649257; x=1738254057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dP4iIFxpGRxJIuWg8fbKde8yqpGCy/LbovICFuWMxcc=;
        b=ABRDNQvQ74wso2F91Sr4V8yzCAbelPQWluWfAQso/hyyYwiDOPBx2CDEeO3/6GVwnn
         qWujZEkzVlPZuDLVYej7Fp9iSGvE6EUUVE+3KSqdT6dabwheZxZnNOt2LfkMhp3ArjLP
         4G8Zx/nIjkaFViyD6JiBstjvh6ILf7Dq8bAnNa+SKc6PP1orbwPWa4kDs0iWUc4i69vl
         pGmXuYam4abTX2nu4GIdAmPMwt6EjpVlUUhdW7/IbBjF7HG6IKyJRMoYYgT+KFKFNuZF
         ysNhCN6Bx0lKfmBS72hhFrFAl9Ya+IRiOlUSsnvxZfMWXsVfUBVEn6SXIljTwQuRjPz5
         MqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnPc21i6Z2gj77Av8hAtStLzSjcDBXkFFTjOseTGF/1dicvoa8fGs/gn1J2OlrPftqPLmNlX2vs837BXOEEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv7Ln/O7UfaRKSPah7msKzrrBMK0CH/hcwbRimN74fH/A08zMs
	wpr6qxgiPYwDgnBTdaBWJydJA45T3aHz6mFwiM/tcPJwBqICw2LaMAzFy2p44O+jPZIJHqifGDQ
	xBPMqB0l42A+T+LzjBtfOcOVMiDZGxoogOXXh
X-Gm-Gg: ASbGncvkWrxT43bD2rfKiw7camusHhlZ+goZPF2qL9ON5Jn4jBIJprdmXN5DepkvqzL
	Kr+W7q2uRLarZs28s4Pqm6RDL9IXjkh5Xd3XPqPHGx7JpFASTmokTvg3U+S+K3lkxZ6wiKOUGBn
	ltIRrFRNlMRwMy+99y3Q==
X-Google-Smtp-Source: AGHT+IEKUB561xRTvYxXd4p0qNfpMRKfCZE8QX0G+Jn2kD2LonKgpFupCThYaQ1M0nTLUAE+dgJAYJFA1Lqm+sRFeOA=
X-Received: by 2002:a05:6512:124e:b0:540:2549:b5ad with SMTP id
 2adb3069b0e04-5439c246d35mr9447895e87.22.1737649256790; Thu, 23 Jan 2025
 08:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com> <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org> <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
 <e6fd5225-b437-4f3b-9835-f206ae4b9d2f@kernel.org> <843f2dcee012007572f41df991e52369c1e5ed22.camel@mediatek.com>
In-Reply-To: <843f2dcee012007572f41df991e52369c1e5ed22.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Jan 2025 00:20:45 +0800
X-Gm-Features: AWEUYZkfWBp2Lo-8TZn9tTq4YyIX0WXHpEKOlB7N1Mjjx7XBDKyByJYKaE3h9KI
Message-ID: <CAGXv+5G8C8F5ua595Z3zs-D4vUP6YSUaxaUTGPQY-kfZ6am61g@mail.gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_082058_747297_ADC435CB 
X-CRM114-Status: GOOD (  22.80  )
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
Cc: =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>, "krzk@kernel.org" <krzk@kernel.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "treapking@chromium.org" <treapking@chromium.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 24, 2025 at 12:14=E2=80=AFAM Paul-pl Chen (=E9=99=B3=E6=9F=8F=
=E9=9C=96)
<Paul-pl.Chen@mediatek.com> wrote:
>
> On Thu, 2025-01-23 at 08:21 +0100, Krzysztof Kozlowski wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 23/01/2025 07:11, Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=9C=96) wrote:
> > >
> > > Hi Krzysztof
> > >
> > > I hope this email finds you well. I have a couple of questions
> > > regarding the EXDMA commit patch and decoupling:
> > >
> > > 1. Would removing the example from the EXDMA commit patch be
> > > sufficient
> > > to achieve decoupling for EXDMA YAML and MTK clock/power header?
> >
> > No
> >
> > >
> > > 2. If removing the example from the EXDMA YAML is not allowed, what
> > > alternative changes could we implement to achieve decoupling?
> >
> > Don't use the header constants but just some fake phandle.
> >
> >
> >
> > Best regards,
> > Krzysztof
>
> Hi Krzysztof,
>
> Once again, thanks for the review and reply.
>
> SO If we apply Chenyu's suggestion:
>
> + example:
> +-|
>
> +soc {
> +
> + disp_ovl0_exdma2: dma-controller@32850000 {
> +compatible =3D "mediatek,mt8196-exdma";
> +reg =3D <0 0x32850000 0 0x1000>;
> +clocks =3D <13>;
> +power-domains =3D <12>;
> +mediatek,larb =3D <88>;
> +iommus =3D <&mm_smmu 144>;
> +#dma-cells =3D <1>;
> +        };
> +    };
>
> Does this work for decoupling?
>

AFAIK it will since now it isn't including any headers.

ChenYu

> Best Regards,
>
> Paul
>
>
>
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

