Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6659C021AA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2025 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwohrPAvCZ/qg3MA5g5m35rC3ir1Vy9aIxHkgumCgKo=; b=ztIHTpFKwTlK89EEEfsnjF4Jlm
	DJha/LHHgdu2XOTG+q9nAj4OcT+eRFSdtMYRMdhkMHwccQxfFWB9BkgRcpeZpSjlipOSHpx+mi8oB
	z5kWPL7WHc/LAJAu47hQMLs8iVLPP8t7HQOK7oYSTHvwN8dwWkvHq+mYAS5mlk3jPg46EeiA5P1iT
	2wzp5QFbLDK7wWNVB/sJlbtXMVhMEf7QgvwZAvM8lX7Q4JzumDvlZCmVSUNdx6jKJY/kp9uRrSTl6
	2T4zu1vkcOGBwXT3cSSP4RKEQmgzQeuElx9mnJXUVq2cFR5H9eQ/E0osWI1yxQ2/qX0z27rRCXEWP
	fXg3W+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRJd-00000005LLF-2hiX;
	Fri, 21 Feb 2025 11:35:33 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRJa-00000005LKQ-2Ah0
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Feb 2025 11:35:31 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4b9486a15a0so1859544137.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Feb 2025 03:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740137729; x=1740742529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwohrPAvCZ/qg3MA5g5m35rC3ir1Vy9aIxHkgumCgKo=;
        b=ZyATv2ZwNanx3xmQ9CdLdVhJEffqW2Lr8tE+5zbhTt82drzKdmWAP1Nmv7zksWdwsV
         SfuTEUQAHE3DtwE+Fnw0FREJDksVIEpbnzJoz1n+qfhbFFUKxDHS28vpt4npHEp4pBkU
         pvnL5hgxkSpbC2qrXQSjC9Nhgvra6ZQh1GGIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740137729; x=1740742529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwohrPAvCZ/qg3MA5g5m35rC3ir1Vy9aIxHkgumCgKo=;
        b=Rr0zmL/Yyvh65iNFZOeQXs9kx6GOXcW5Una5FeOE+L4DaKFV1xOM5u/Xke3LjNnMXq
         hfTrGwlLISe26Hdvo1XqJPEazWHA7iNS6acWMcb/SKIjBvI6YgGJBUP4Ss6dg/dog3Zh
         ArpXshs3dFtiG8HNaoejDLLrAaJ2AzqTVSJzA7HTUv3fk6JQvw2nJENyVPCcSAryjuEx
         5LUKrPKwpWng5+m0EZkWkFEYHWHIbMTakK9HVP5pSTGK/DvOcsXwizthofy9DmCB3kl8
         LCELKKWzGPKthHcACKv5XOFL6fNNkDgqEkhVzs5I0jvlAyK2QSwd64El5Z/cf0UO+KUZ
         3Kdw==
X-Forwarded-Encrypted: i=1; AJvYcCW6UWe5wceNVsAg259WdQc3pX9ldb4xjFHndobWAmQKCFfKDaB+DbxXqwXrkc/Sb1ne+ahth65KffVYH23JNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyiDR+Y1DUZz1OyVaJOgkGOjm5TY+qL1t0wcg+f89BNusFNKRg
	eMMAHg9VwDF2pjbmupCqBTxdfjtWMyLohcZd1oRKqZSehbqZagcbWrR2wTnaWh6Vg0M95+zJqUs
	=
X-Gm-Gg: ASbGncuIP571EkUAs2/MAydsR3HaEG5d79SmfO6Avp8ta4Sbi6CERB84LQEhTFFwJcN
	jpsyFFD+306SdAjFbl6E0b1XGfII5JQci4CZHPqzGGKtgGj09jFPPxJwz/sRYLkoKbD3liwE/bo
	Zv4ctHY26Gd+/+uAPThQhuQazGH784VKRn6AT6xASKzENQmyJEPB3SlQxSJR38m7E4gUJcZLicb
	9zK66xJw6zoKeRldAKFUJXC+4fMKfZdSSzOM8yAwGZRit2ZDFrS7Cyh4k+KSDAPFQgVA3S4wuP8
	0EI6lX9KW3F3VYVAs60cZfQv5T9ml5p2a0eTrCgbkm/WwWH2odRMkGrh8IU/0A==
X-Google-Smtp-Source: AGHT+IEkKHwpI+OJ0tZ7eQ2VgIxWASZ1jCNPqiWeZzwL/UfaNLybTNpNK3Qa/7wYZp65MBLVnk6nVQ==
X-Received: by 2002:a05:6102:5090:b0:4bc:d2d7:3e9c with SMTP id ada2fe7eead31-4be9930df0cmr3927446137.12.1740137728879;
        Fri, 21 Feb 2025 03:35:28 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be26117ab8sm2693077137.15.2025.02.21.03.35.28
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 03:35:28 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-860f0e91121so2106500241.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Feb 2025 03:35:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYFGCi+3IUEkKGgMhyPSLpy49o6ajPQemJDf1em87NtlMUKjpna4PoZmOkOUeXoT1DDHBOiYviTld9NHcaQw==@lists.infradead.org
X-Received: by 2002:a05:6102:2921:b0:4bd:22d9:b117 with SMTP id
 ada2fe7eead31-4bfc0fdf40bmr1459685137.10.1740137727505; Fri, 21 Feb 2025
 03:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20250221-mtk-socinfo-fix-print-v1-1-20500f30ef66@collabora.com>
In-Reply-To: <20250221-mtk-socinfo-fix-print-v1-1-20500f30ef66@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 21 Feb 2025 19:34:51 +0800
X-Gmail-Original-Message-ID: <CAC=S1njHBs27TtTZXgED4wdLw=FrSDCazbb6ZssZywvSWV2h3A@mail.gmail.com>
X-Gm-Features: AWEUYZmV51gkv5en-4xAlrGPHtRp_UB_-TGQXQmxc_me0FZsV0tfUBhu-ic9sd8
Message-ID: <CAC=S1njHBs27TtTZXgED4wdLw=FrSDCazbb6ZssZywvSWV2h3A@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Avoid using machine attribute
 in SoC detection log
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_033530_675206_9E3E034C 
X-CRM114-Status: GOOD (  18.98  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> The recently introduced SoC attribute info rework avoided modifying the
> machine attribut but still used it in the log message on successful SoC
> matching. It leads to print a confusing log about a board-related info
> (read from devicetree) and not about the matched SoC:
> ```
> mtk-socinfo mtk-socinfo.0.auto: MediaTek MediaTek Genio-510 EVK SoC
>   detected
> ```
>
> So, fix the dev_info format to display SoC family and name attribute
> instead.
> ```
> mtk-socinfo mtk-socinfo.0.auto: MediaTek Genio 510 (MT8370) SoC detected.
> ```
>
> Fixes: da77c2d3d06c ("soc: mediatek: mtk-socinfo: Restructure SoC attribu=
te information")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Ah... my bad, I forgot to update the log. Thanks for the follow-up fix.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/soc/mediatek/mtk-socinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mt=
k-socinfo.c
> index a15d8f854cefa90883377b47bbc16a7072ee21cd..ac7bb0cbff2df5e1c4033646c=
d3b644e67ee7f69 100644
> --- a/drivers/soc/mediatek/mtk-socinfo.c
> +++ b/drivers/soc/mediatek/mtk-socinfo.c
> @@ -87,7 +87,7 @@ static int mtk_socinfo_create_socinfo_node(struct mtk_s=
ocinfo *mtk_socinfop)
>         if (IS_ERR(mtk_socinfop->soc_dev))
>                 return PTR_ERR(mtk_socinfop->soc_dev);
>
> -       dev_info(mtk_socinfop->dev, "%s %s SoC detected.\n", soc_manufact=
urer, attrs->machine);
> +       dev_info(mtk_socinfop->dev, "%s (%s) SoC detected.\n", attrs->fam=
ily, attrs->soc_id);
>         return 0;
>  }
>
>
> ---
> base-commit: 964b0ceed00032fa0fa841fd61e5f315880a2d36
> change-id: 20250220-mtk-socinfo-fix-print-e83f3b3e50bb
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

