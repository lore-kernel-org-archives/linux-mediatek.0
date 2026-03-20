Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D37D109879B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLXcqIVzc+TE7/RYP3TxhjZkuh5oaQY94C3LjN7BMto=; b=BctKUC6mjVQS2lS5x/2zWUPcmM
	DM4FzXmktjw78lu2yKpRtwyLouXtbjZk+xRyvxloNQxoIHv9RkMqqM2XMRM3MNpFa41systlwFqS9
	h+2J193mXrb8d6tygO2E3DUrud9ETldexsdBzkpO75aJZRnjvnGuBbsOKL6XcfieFTR1szdAw8pmE
	8WVQhO+/q3XmNyAAqIatMREB2GRR6VakyjJdVKaYZqYG9mYpg55HDRVxWRF2wHA996P0btvKRquny
	qmpIzRoYPVq1vR+7aU695a63t27qkY+Vd99gBocl/LUiGRpak0cb8fcdVVxRf8YakNL9DL/qs+j5A
	ONOsmIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bic-0000000D2KP-2N4L;
	Fri, 20 Mar 2026 15:24:59 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3biZ-0000000D2Jh-3DtG
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 15:24:56 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-56ce07a54e8so483567e0c.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774020294; x=1774625094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLXcqIVzc+TE7/RYP3TxhjZkuh5oaQY94C3LjN7BMto=;
        b=BrXRh4sDIDlSwr/MCeySWjtzoeDITHVjg6C2UPf/h2O+0w2W5n/DOETwGi/yUqxlzX
         6YFzlzB17NVYbRqeV/Lhk84+1XHtraDuJKvSqR2Q24cT7wf00t54XnzsWp2oi9YJh2Xs
         uo12+hFnRBqnRLaze7dX6hB5d6NpbvaP0Yx3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774020294; x=1774625094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XLXcqIVzc+TE7/RYP3TxhjZkuh5oaQY94C3LjN7BMto=;
        b=YxUXkIK/mqxnhHHuHpdR2XDftAQorkOACmLvpEqMjL5AnnxZ8Hc1JGWTA9Pesopwsb
         45oklYWJGHpibIkMzgn1TePEgWLIKqeW7foRKfgUh6OYQENQkOAHd59dM0DNoSeodmhB
         5K3vbl8Ecy++GD6lOrV7grcpoWYKx6gPJV7sADqbj9bNqrkaeler/nxIilDXjRUmrfYG
         eVkq2122rgcj5d+Rq9jTcix/c/u1qzOe5Yldy1mELVyn178AWWJdpvzRBJeEa4sAx5cz
         gK4SpnI1SHuk8WmFEb/NtHqlZN/+6WHM8VRlMDye0lkzs0uM974wQhrSqarGKOQyTM6j
         q3kA==
X-Forwarded-Encrypted: i=1; AJvYcCUE8MeJwGmKGHYjEfby6sOuzdmyTBmeqLh3xN/bNKtpWhxall39uOmtFvcvOHY1+ndyHauaep1ptKnYoy8Q0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVI+DhGg2hFdyjuXAlULQaF95qKcVyjG+G0YqGmRAOBtT+K77O
	2acq5wN0AJXqWEE0y2XHkT7mCS1kyQHQDITcr3HsUZhsOE+I8i5juc/POXfJkKB6nQ2Uw2qtQ1G
	/+Wk=
X-Gm-Gg: ATEYQzy6POQzCDW9I/fARoGbWKX/1qZoOcTfAZVZkMUTX8LWduFC/nxmNKLQUTBEKV2
	wgTkRxLKNTBd61Us40gu5LZr3JCa94aGt8T3gcKxidUxZ8CHkpB5i2kKi/+E/6Rg+w6jxzAxM8a
	DNu9K0sTI1UPwdtXkkBZ/eGo8MIA9i+avg+GqlvKF2ziaaXAlVA0hUpPvU8hO5/clT1S/vyaWVJ
	zOeJQmdSx7kM+5tDOT4zl5uvk/q0IMCDcnOSIlwa1MB8hPhHm98a0Fn2WXfjIU1CZl1bJZE48qC
	8xSmR78t/XUzNxbmLSapnEARsAjmPgV3TXZuSwLIxGcEHOu6M0A0zivJT9XSgdfa2dRVYjKv0o2
	SreYF/HwhDxUn6KyjxC3BrHAMN2UktcJGJvw2JJGINfZClMppLmQwU+LuTTv4svqCTBhBlcn1cY
	tTyo+6jZl0V6fT1oWXc2EeOpaNzdxUWKiqXx0db7Z9RWGQNPVlhfDb/4otpttaiA==
X-Received: by 2002:a05:6122:d28:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-56cde3aa17cmr1981192e0c.4.1774020293893;
        Fri, 20 Mar 2026 08:24:53 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcb1179sm1677919e0c.14.2026.03.20.08.24.53
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 08:24:53 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56ce07a54e8so483547e0c.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 08:24:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfrxTanSsytblvSFTpH/2+5MWhAvpAEL8QyceRErb/vTXsM/jaFRGW5PoWIUb7vjLRbS0EfLSw07IiH0h3/g==@lists.infradead.org
X-Received: by 2002:a05:6102:2927:b0:5ef:a8da:8b26 with SMTP id
 ada2fe7eead31-602aed346fbmr1801022137.27.1774020292428; Fri, 20 Mar 2026
 08:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260320084351.2461060-1-wenst@chromium.org> <20260320084351.2461060-5-wenst@chromium.org>
In-Reply-To: <20260320084351.2461060-5-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 20 Mar 2026 23:24:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhBnhE2XJRaGfSOSutZGJXfHQujOd1rMbhOfAwGQa0ZrA@mail.gmail.com>
X-Gm-Features: AaiRm52mZwCR4AEeTV_75B0alA5w3n6BBFefcUDCvgduPyrlTgwEFUngOeWKn9E
Message-ID: <CAC=S1nhBnhE2XJRaGfSOSutZGJXfHQujOd1rMbhOfAwGQa0ZrA@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm64: dts: mediatek: mt8192-asurada: Add MT6315
 PMIC supplies
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_082455_905068_193E1FB9 
X-CRM114-Status: GOOD (  14.78  )
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

On Fri, Mar 20, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> There are two MT6315 PMICs in the MT8192 Asurada design. One has two
> outputs ganged together and two outputs unused. The other has three
> outputs ganged together, and one left independent.
>
> Add supplies for all the used regulators. In the case of ganged outputs,
> add the supply for just the first output.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8192-asurada.dtsi
> index d16634e9f342..318903b112a3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -175,6 +175,17 @@ pp3300_wlan: regulator-3v3-wlan {
>                 gpio =3D <&pio 143 GPIO_ACTIVE_HIGH>;
>         };
>
> +       /* system wide switching 4.2V power rail */
> +       pp4200_g: regulator-4v2-g {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp5000_a";

This should be pp4200_g.

Regards,
Fei

> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <4200000>;
> +               regulator-max-microvolt =3D <4200000>;
> +               vin-supply =3D <&ppvar_sys>;
> +       };
> +
>         /* system wide switching 5.0V power rail */
>         pp5000_a: regulator-5v0-a {
>                 compatible =3D "regulator-fixed";

