Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF95EC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZyuj75Ez/rddFFT5oB20s7V0CQchh27dVHWZ4w414Q=; b=Nu5WOqeuuP9T//A+8P6Df8wXq5
	xs3PCfXr/D3X/X3o2EW5RuXFYFadCJPrDpCTmFKyEAcrcnxxR/pGcctKWYHK0EZdBb3TEBvVnLXxf
	iZmdKRhFjcd0XOuXUSX8nmW4oUSJyPq3LAZFlBkX5lnL2pvS6ULVkX7CEsPVNnbbbP/9c2nAN04xY
	a565lQN9/wURM7SSrLeMF3r9kwOGcyEn2eOat4fk606v4XSJnJJDnPhodupQ67taH7cjYxOkzNNbj
	KDKGi5ToDic7ceJfmlrI+DDnRS7PXbf7E7PAS0JFuM1d6slNNEL2X+WwZQtjXvELbDABzi+fd2ndo
	cKXfV1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw3s-0000000CfNe-2W33;
	Thu, 11 Apr 2024 15:10:00 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw3q-0000000CfKf-0zwo
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Apr 2024 15:09:59 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ea29cf24c6so1588288a34.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Apr 2024 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712848195; x=1713452995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZyuj75Ez/rddFFT5oB20s7V0CQchh27dVHWZ4w414Q=;
        b=lSV9XXsCylA24r6z1Bd/omXtbtk4MqnjFLijZoKBi6DsZ2l0rCE3SQpOibbNnkoRl0
         KjjBv1DyzGU2frCNv6nENo5C97u9CqY7E5Z7J7RGfEccq0PhD9cofz5VDQuWGmgoHYhg
         Ewh3h0Lwxsw6aY272NrxuxGHLEqBhGMecnbGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712848195; x=1713452995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZyuj75Ez/rddFFT5oB20s7V0CQchh27dVHWZ4w414Q=;
        b=Kz+u4do/moSvrj6hkjOMtHsQ9f2Ylw57A+E2thuDgy5htuiV4e2ZxjRnEng/drPcgg
         u+eHXQj32CLUuQro76WwQDqJuj7887lxEP+r5EAJ0HWzZIelQ97blo0Pt39zZuPK+X/c
         T9ixdF8p1GNeJOWf8B2VHZ8jFB4+wa3ovMIwy7DMdgw3L1w8GYnY0nKnu2srRXxZv/+j
         8kHy6c7uYyVgHoSobRnIJjkGGiBxyjIbZtWe8i7SZXpm7yQzKTkKH/j69Zh522NJQ8dQ
         6s5d1H0LF6FVfGWgsoBx2TW2Ktx6S8KDr7ZXIFDc2I7gR7WWs9av4c+84JwH87dzU/An
         PJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUycptcD1sRnjfJ9g8hEx8G9i4NYlQnW4dxC7fcecc4DEgPt1lfdtoUdl1w40RCS1GN13GFaPqPQ22wpxNFZpce3ihtG7+DrWeaLo7lUQOzRcw
X-Gm-Message-State: AOJu0YzaYbHaNH+tnfP68RTaRrrm3pFUakxYk8O4kG5VCq2DXQOEtyfO
	H7AG2faaYqp5mipM44bWaouOrO2b2LK+AnsUcAUMsk1ryCGD9S5NX+1XcMkYnEmP0Y9aApfrxOE
	=
X-Google-Smtp-Source: AGHT+IGnr1u7r5pzJJadsILA8JPQGy3y1L9KXaggD/5oxFKSVfpUFZtG7eaY2/ymzAO63k+BvHBV/Q==
X-Received: by 2002:a05:6808:18f:b0:3c6:be9:f4f9 with SMTP id w15-20020a056808018f00b003c60be9f4f9mr4945358oic.28.1712848195017;
        Thu, 11 Apr 2024 08:09:55 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 22-20020aca1016000000b003c5f3c1895esm247065oiq.49.2024.04.11.08.09.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 08:09:54 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6ea29cf24c6so1588274a34.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Apr 2024 08:09:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXr3iTAPbNEfZvmBKVowtdRa8oJhpkGJArb0Zp1SbTpMZJhtf5SKud10xbbidAN4sCkiMDW+y9fzsVb5SYNEMMKhka2RDDyR334SezbYnfv9P4
X-Received: by 2002:aca:2b16:0:b0:3c6:58f:8792 with SMTP id
 i22-20020aca2b16000000b003c6058f8792mr5313561oik.20.1712848194156; Thu, 11
 Apr 2024 08:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240409035355.27659-1-jason-ch.chen@mediatek.com>
In-Reply-To: <20240409035355.27659-1-jason-ch.chen@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 11 Apr 2024 23:09:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhc-5QRmd21Mi28pKCbzK8zt0ntsdo8J9xxp+BHJ7ONnw@mail.gmail.com>
Message-ID: <CAC=S1nhc-5QRmd21Mi28pKCbzK8zt0ntsdo8J9xxp+BHJ7ONnw@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Correct the marketing name
 for MT8188GV
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_080958_326558_4ABE0934 
X-CRM114-Status: GOOD (  13.85  )
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

On Tue, Apr 9, 2024 at 11:54=E2=80=AFAM Jason-ch Chen
<jason-ch.chen@mediatek.com> wrote:
>
> From: Jason-ch Chen <Jason-ch.Chen@mediatek.com>
>
> Change 'Kompanio 830' to 'Kompanio 838'.
>
> Signed-off-by: Jason-ch Chen <Jason-ch.Chen@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-socinfo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mt=
k-socinfo.c
> index 6943ab29f095..74672a9d6d13 100644
> --- a/drivers/soc/mediatek/mtk-socinfo.c
> +++ b/drivers/soc/mediatek/mtk-socinfo.c
> @@ -48,8 +48,8 @@ static struct socinfo_data socinfo_data_table[] =3D {
>         MTK_SOCINFO_ENTRY("MT8183", "MT8183V/AZA", "Kompanio 500", 0x0001=
0043, 0x00000940),
>         MTK_SOCINFO_ENTRY("MT8186", "MT8186GV/AZA", "Kompanio 520", 0x818=
61001, CELL_NOT_USED),
>         MTK_SOCINFO_ENTRY("MT8186T", "MT8186TV/AZA", "Kompanio 528", 0x81=
862001, CELL_NOT_USED),
> -       MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 830", 0x818=
80000, 0x00000010),
> -       MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/HZA", "Kompanio 830", 0x818=
80000, 0x00000011),
> +       MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 838", 0x818=
80000, 0x00000010),
> +       MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/HZA", "Kompanio 838", 0x818=
80000, 0x00000011),
>         MTK_SOCINFO_ENTRY("MT8192", "MT8192V/AZA", "Kompanio 820", 0x0000=
1100, 0x00040080),
>         MTK_SOCINFO_ENTRY("MT8192T", "MT8192V/ATZA", "Kompanio 828", 0x00=
000100, 0x000400C0),
>         MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EZA", "Kompanio 1200", 0x81=
950300, CELL_NOT_USED),
> --

I've spoken to the MediaTek folks who are familiar with the MT8188 SoC.
This is an intended marketing name change, so

Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

