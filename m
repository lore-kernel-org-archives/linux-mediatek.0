Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E11C87FD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=; b=GpLwuVymCUd0eqqSchKcbI2GkJ
	dl7RqNSD50/K8WjRkdMqkysANz0ffsEODFvj2DLchbp4ygDAX2uFU9Di9QnZCgSi2egyfR0IZVD9b
	a1LxFEYOJ+F3zvO0NCa+KSwjCzy3ifhdXZuXKBkXh5wS8yJiXgRTiCrRYZGikt/kSitPxy1sIVs5C
	N73y/WPQbubjKZBnqXHDOOU93BDqAor469tQbssOErJLk1Sx1NJ7o5uPGeXCEXPu9G0S7vMoWPp3Y
	UZU7Cme+qASJUCI9K49cjWrjGvJ9gj5Qs0AKYyIL5r7iXGUn7u41nqgQNmtO9GmCfkJr2XUBHJMUZ
	w9RfZqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHNT-00000009nlK-03yd;
	Fri, 25 Jul 2025 12:18:19 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufH3R-00000009lVW-1qwF
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 11:57:38 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ab93f24dc3so37276561cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753444656; x=1754049456; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=ifWy7R9lYW8w5+BgeTziADZngsq/QW7hKcqW8jD2LbFojNQyZz/bZ2yorS3W7zIsdE
         ukvAWT/v/YW2Hvq4k0EWZXodWXCEfb+1Wei0zQBHq8SL7HavPmQu6zO56yU4jnV4KbkM
         BjnlF5+UuRbpHM+QlYh72Ca11U41VielSdsWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444656; x=1754049456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hJBa13s79OQWhYLxMwSe1UwJVG9FUdchi7fOARwLxY=;
        b=BjGPcmuZBX5e2sAKwSO/F7lhj0CUPn48XUuMCCR3LgfjZwI2wG66D4gZJJg8WGKiq2
         mBBbk2Kw7nNc242nMnIN/lyifZcAzMSAIB/ilXxhYZhr/DZhtUOZmW+8OtSd1mitCmMf
         MK5QBVpL3BA7NMRbjG4wnSlsUo8JACB71uLsiVUDSHlbHjPnyPeqJzv9/4svIAglqwJ3
         4cSiRI261uv/5g5BSbJYKTEoI/mYPk0UOtbC/RU1UXGqVN9+Zs7NEH+8QrZkGRPs3rm0
         ziLXgb13snAvfjhtoUK8v2T8BHS4bmQ+zFsWakSM6q4yXE4N5qH/j4f2c7ffHkScy/4j
         HzxA==
X-Gm-Message-State: AOJu0YzrN9nSjkk4rDvE/RteP8CPmqRTnJWtrb6seDcGsx95rkBrt5/W
	z2cL+JbWfnx9mc97UpzX3M69QxDbW1BrtA19VRSZfLi+5q6oZiVK4pwuEynMNgz3pPu2swydPHD
	3JHQ=
X-Gm-Gg: ASbGncsu1wSY49bu4FPDB3cxWONMTnUeofu2eHBdjc8+FYQA+cM7iodE5sGBtmFZFNp
	P9vyzkfejg45rvm9S0tnbK2cXatw3XEQOomnBynjtPf9J+ZHdhdLZlEPuACBBXCxo3JhKNAatEf
	dxb4S9ujH0Ybnbxrf/DG9EMANIPGjf1eLmjp4S0VclAx/Kh5lX02/h6E5/PSiPSTAiEpmYs2/rW
	0VTK1xF96ULbYMRpmBp2r14D3rPjM1GJYH+OTUr9JJQGSb1w09TGcPZ93hX0080C4shhxm7mZ65
	xLoj43SS3BiEunn1jzFJuIXpXZ0bjGBTwjTYLQ7abE/Xzr8Vjs6y9GFCi0vJqHcKwrej23Y/EYB
	m7K4jYBBUvRvsox2WEeEYkqJRXXJ4bDlNazqAaXT9ruBwKhIoDE9tY/HJSg==
X-Google-Smtp-Source: AGHT+IHZeNBZWKA4a6kTuEerCdJhdrTrtVp490Z8gbsTn6I5zB9X217eo77lh2RSUE2Qb7wUxwlIAA==
X-Received: by 2002:ad4:5d62:0:b0:704:8fa0:969e with SMTP id 6a1803df08f44-707205e6db0mr18268836d6.41.1753444656132;
        Fri, 25 Jul 2025 04:57:36 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-707165d08c3sm18078536d6.37.2025.07.25.04.57.36
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 04:57:36 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7072628404dso2121946d6.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 04:57:36 -0700 (PDT)
X-Received: by 2002:a05:6102:6891:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4fa3ff44195mr316348137.17.1753440787376; Fri, 25 Jul 2025
 03:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:52:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
X-Gm-Features: Ac12FXzhNEGCOc6TL2wVpoG5kEXhC599YdNWu941VvXlO0dL7_W9Jc4if8EyMHA
Message-ID: <CAC=S1nguRWyG3ubmSFE95_zgsCjjq4dxGWr5ErV9-Yu2+mTmpw@mail.gmail.com>
Subject: Re: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek,infracfg
 to iommu node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
	linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
	herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
	andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
	p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
	tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
	broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
	matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
	linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
	sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
	andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
	lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
	tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
	linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_045737_476137_879D4B94 
X-CRM114-Status: GOOD (  12.20  )
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The "M4U" IOMMU requires a handle to the infracfg to switch to
> the 4gb/pae addressing mode: add it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6795.dtsi
> index e5e269a660b1..38f65aad2802 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -427,6 +427,7 @@ iommu: iommu@10205000 {
>                         clocks =3D <&infracfg CLK_INFRA_M4U>;
>                         clock-names =3D "bclk";
>                         interrupts =3D <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
> +                       mediatek,infracfg =3D <&infracfg>;
>                         mediatek,larbs =3D <&larb0 &larb1 &larb2 &larb3>;
>                         power-domains =3D <&spm MT6795_POWER_DOMAIN_MM>;
>                         #iommu-cells =3D <1>;
> --
> 2.50.1
>
>

