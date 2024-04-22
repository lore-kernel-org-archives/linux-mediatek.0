Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C86C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 06:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=; b=Tj43Tz/cb19jzNiaMmkJE+nKIL
	kzFrARiXj357WQSQKFmNrJjj8Tvgzq7nCz1dELNbR15WOaCXwvFSj5v6BXdK8r59nH9XrMeCVWkv/
	dzXUTO0+e5q0+zrkz+OXzxv7YFqKf1LzH4AlYUKPsWbvj95mO5BKB45VCgeH5np6r9xEvrSCMQC05
	TLKho93IHyc/X6gdXQhxpyeolUo8rwekM0vJbyMv4dkaOQbl/LSsmWZY7r3mNECboShz/XfKeaxiV
	ftWggvHf+uRnHpgl4UcxNVSqD9g/EY5FpEE8CfDUmm5W0XwxfijkHi6UiRSpea/ZCA+yjeMFi6u/F
	ERt7kAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynYN-0000000CItz-0Xaz;
	Mon, 22 Apr 2024 06:53:27 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynYJ-0000000CItE-37zZ
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Apr 2024 06:53:25 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7da37436e36so156918739f.0
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713768801; x=1714373601; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=LPO6S7A86biZX9Fe8/L9p8BvSSQf/PNVOvZJIPczHfUcd0P6GBEYG0gPYr1vODo1pR
         gbeOI9dmsCRaB5xe25X1FAEG1o8l86m3se3EcPVvMuJK5Vvib1ZpV6wfmDVuLaPTRWfC
         UHsb7uTZAESlpLSRY6J+6VQeZba9J9qBPvMwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768801; x=1714373601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=AslwLyr2OdUI0Om//Xenav9I8DpHLFtYyKTA/ShSo10YJVHEnXz3uEV9HrOuX4g12I
         CIia+J4A64s8KZxP11MAvLJRREcTM7Ezzl6wWGGRcg84itS26o8n+b4hDOe6mZqIELKN
         WfTJJhBwU6MTw1plod/TrB2MPhFmXSzQH5B2v4Zlao0yUmq6lNbGU0nsQ2tUOuC2y6cL
         SQQyifAJ8VrWV2HSe7s9ofFxLgKR34CHGfy66NVlN70KFY3+sIP5/ZdcMHLQM1HUMTBe
         ma/2S1EHcPk0lMw2LKGToDi3X569EZhkPUx//yPXblSl93X26KgbT3DF+oSKyELgxTpd
         n5ew==
X-Forwarded-Encrypted: i=1; AJvYcCWFVwibIi4+xC9bVEgVv3FJH3qvImagYm8tDqzOmHVSc+KYgnVn7GRV8WH6wKpgzFxWMKMLD15oMKWwp/0f0H+w4PlRlP5k6N9up6/xuFZUJrDe
X-Gm-Message-State: AOJu0YwLGDs95lrWoS/PrI/liuZLmHuldQ7mo3oWKbvEQQCx9/mk+e5R
	/jkzSmHjbXK8JbVWy+K+SpxbG8FyrUYFfdVL5mPG+MqR2HXGvH8lXTx8jYRbUhcmGnARXHvlNcb
	rew==
X-Google-Smtp-Source: AGHT+IFVPzQoCMY+57X6ERkH76pmioMg6MzbH9xPe2g2KthouoFJaHmJAXfQp3D1TGXORs42RrQuqQ==
X-Received: by 2002:a5d:8548:0:b0:7d6:9da9:1a69 with SMTP id b8-20020a5d8548000000b007d69da91a69mr9670667ios.0.1713768800859;
        Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id ja14-20020a056638888e00b004829a88a0basm2642564jab.31.2024.04.21.23.53.20
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-36c0ef5f7ebso1405165ab.0
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXf7cmnRK22Uzzxmj4xi3gvPvo2Gxw4vH+NZqgNnhEiv54OsdDFMi2+aHL0Ly7Gr4ziti7NAx4lcecuvvmoJgz84MPY82vJzYD7e4tkTAZZrl/Q
X-Received: by 2002:a0c:ec88:0:b0:69b:1aec:88fb with SMTP id
 u8-20020a0cec88000000b0069b1aec88fbmr9872064qvo.23.1713768779447; Sun, 21 Apr
 2024 23:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org> <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
In-Reply-To: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 14:52:43 +0800
X-Gmail-Original-Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_235323_796118_6906ED8D 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Bryan

Thanks for your review

On Sun, 21 Apr 2024 at 07:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/04/2024 10:47, Ricardo Ribalda wrote:
> > -     if (irq <= 0) {
> <snip>
> > -             return irq ? irq : -ENXIO;
> > -     }
>
> You're dropping the original intent of the driver author there no ? when
> irq == 0 they want to return -ENXIO.

platform_get_irq() can never return 0.
https://lore.kernel.org/linux-media/cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain/

Let me add that to the commit message.

Thanks!

>
> ---
> bod



-- 
Ricardo Ribalda

