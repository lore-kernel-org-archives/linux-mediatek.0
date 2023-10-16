Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ECFCDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR2mIVGSF7TnFNx625C974mkPtvhKRG+fj3NHxRdBic=; b=vjAZ/C8ykh7aeJt9xeWyA8JMbu
	OfbZJvP/vGP3psGrGmqvGY5cQs+jl3LzAQ4xlpvLhZR/SXaucpfua8dCDCdpXaKacUI4qY2XWHmUx
	6Efnpx2NYlymJYoVa6f9AEnJPz4ss31x2SqS8wGYxCzmaaqb38aTXU7clt4gDVyk+dQYNNnho5l26
	eGzNRP2dnegGcVdPK53wPzt4wHeSpPVKj81bzeLasRkFSSmx8qMvgeu+2U6nu9GTNN/fdh5ih0oO4
	RrAYmH/aKUFLQiounvmshkj2/ZQ1mmdJJJkitgfhM1QcGWW2yZ9CmDraiwhDsVNMcAhqiOfRzho8u
	5cWymx6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsR8t-00ADPd-11;
	Mon, 16 Oct 2023 17:12:35 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsR8q-00ADOK-1V
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 17:12:33 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso28040331fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Oct 2023 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697476349; x=1698081149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR2mIVGSF7TnFNx625C974mkPtvhKRG+fj3NHxRdBic=;
        b=iS9KxyKMBJtXBavur5Q5ydZdEt/vV2Jjl+cVpR+NMeEbisk0+VTw1/ijlaNOx3Ro2m
         lvmrcb3tgjwKv+jSXjRt8VPVnX1Ffc8mO9Rj8lK2upFGGM2UaikHx3uuyUPNTSDbWL5r
         vrWFP1uFHW6G5sf2RFXf+OMylVXEuZhFGNqPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476349; x=1698081149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fR2mIVGSF7TnFNx625C974mkPtvhKRG+fj3NHxRdBic=;
        b=Gq/aRumCfsNshnoc0MByhXYqnoMJFYRDYO8NgQliyGFbKGLcW6hmxy52a7JWAKUl0y
         9i/vcQcJseU/n5Ln1FffZv9Q9EE3Fpy5GgKQ06UFumeAsPKOUqu10hjOtdEEXavI+Nmh
         ziQbnZA3ShIqn3JmCCqOvi2e98tBSpskDEeBBxh1/s32GTHz8vsrjvQKo3CVvSuP3knn
         RsQGd0kDT5kWv7ZtpQOYF2rVb2JR9AAaZkHDgkypvMQ6kp7V4wVphlnTIunigWkJipU4
         mdl/7wzeTvQubu+bFeagzEid8zEX2NOiZE01BHfSpj1t2STGXHnqQquM80b+Hnu3AYq7
         MB2A==
X-Gm-Message-State: AOJu0YyuMPb1gBGCUpjmTIl86w5Y9uNDCP1Is5Oy96yTdgKgwrKIZFL4
	bZVrzJHdPynKkTQUyNkNK8RsLvZWnN/X//YA4o8lBQ==
X-Google-Smtp-Source: AGHT+IFYEwS3GmFPfDnVyPpFl2TGjAr5jpeeRbFDZPrVa7iXPThSJ5Gw1GMmajv1hPud7RpmMQRMCt7PWljX+01yQ3A=
X-Received: by 2002:a2e:a98e:0:b0:2c5:1c4:9005 with SMTP id
 x14-20020a2ea98e000000b002c501c49005mr8458352ljq.32.1697476349608; Mon, 16
 Oct 2023 10:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231012230237.2676469-1-wenst@chromium.org> <20231012230237.2676469-7-wenst@chromium.org>
 <318016c7-8ceb-4c96-8784-597fac8d194b@collabora.com>
In-Reply-To: <318016c7-8ceb-4c96-8784-597fac8d194b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Oct 2023 10:12:18 -0700
Message-ID: <CAGXv+5EY_vfX+cNZ4QH++fH0uRBJ_hEK5mQpRAJbbsisXWBaNQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_101232_522703_8CAD82C3 
X-CRM114-Status: GOOD (  19.53  )
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

On Mon, Oct 16, 2023 at 2:21=E2=80=AFAM Eugen Hristev
<eugen.hristev@collabora.com> wrote:
>
> On 10/13/23 02:02, Chen-Yu Tsai wrote:
> > Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> > Krabby design.
> >
> > Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> > convertible device with touchscreen and stylus.
> >
> > Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> > device. It does not have a touchscreen or stylus.
> >
>
> Hi Chen-Yu,
>
> The Krabby design has the touchscreen ? if the touchscreen is for
> Tentacruel ,then the touchscreen should be described in the tentacruel
> dtsi, not in the Krabby and then deleted for tentacool.

Yes. The Krabby design is the reference design and has all the bells and
whistles. Vendors can choose to drop features for their market segmenting
purposes.

In essence the vendors are taking a Google design and tweaking it to suite
their needs. Sometimes things get deleted. Deleting the node seems like
a proper way to describe it.

ChenYu

> Or is there any reason for describing the touchscreen for Krabby ?
> One additional way to solve this is to have the touchsreen as separate
> dtsi and only include it for the boards that have it, e.g. tentacruel .
> Eugen
> > The two devices both have two variants. The difference is a second
> > source touchpad controller that shares the same address as the original=
,
> > but is incompatible.
> >
> > The extra SKU IDs for the Tentacruel devices map to different sensor
> > components attached to the Embedded Controller. These are not visible
> > to the main processor.
> >
> [...]
>

