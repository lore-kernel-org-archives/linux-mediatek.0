Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC2C021AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2025 04:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VEqGe71O4B6jvfykXcb0jRrukuykdD7MfjxVd1svFc=; b=mCm7TY2mUrdwpB/f3Je+S8C1m5
	IsSXobyJ90M0CPqoolOtlgh/4SlXcOY8zNHUpc7Gp5ZHqoUEbDEpnSMa0Xtg1E01YEDoRw1jXkQ9k
	yEjrhQELhz6rnyCGTWBlDWDNs0UE3qvCqehM7ZzS4TmXdzxR+ufD7I2Uh6J6x3o5rRYs4GGgqxWNz
	NkiylCUWs+1atCfgqMZUipP3pQU6a2JoDgZc/yGdPbG1iO1b5QsrtP4E7/+if3Mbb0T/25iXbzo41
	Hkz6vad9JQsTyriZ3dAZXUBkg8L4un1C7pbWfTAY8BCr1PzIB7H7Fu+mncgz7YCzpnxa5KEppXFwW
	F0e5idPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkbiF-0000000AplO-2n8R;
	Wed, 19 Feb 2025 04:29:31 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkbiD-0000000Apk1-1MGI
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Feb 2025 04:29:30 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-546202d633dso2913451e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Feb 2025 20:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739939367; x=1740544167; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VEqGe71O4B6jvfykXcb0jRrukuykdD7MfjxVd1svFc=;
        b=gGmR1gYgCf0Nmt4U+ht5EkFLeZSqa6uk0lU/PLQFIlRkVI/vxp+CqaUvAfEdLVR4cP
         oGvCZLBNWm+0y+GsOBlUtR3x9sLUkIr24YkVBxXBwrfhUkMjoqH3919gHcltJkO9nhqi
         Z4z7467uK6rlRknCAuCMh0aB9Egox0lD9dFNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739939367; x=1740544167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VEqGe71O4B6jvfykXcb0jRrukuykdD7MfjxVd1svFc=;
        b=FJcM5Z1ZfRjmDgT+bJtfv0f+wzvNmUHSjyrEX7kRAPGgGOFu23R8aLXKWC8xq83y9u
         O9kvtb8gjkBQ6/NX4hr7GSpqteUQrnvWkhaFinoMg7VGnuo4zEyoQqXO8s0REdUC4KW9
         T6ZLhOuaP+6CWUBv18BMxwlEuddbyZACnPmysHNGUkwn7maHkCpOXFk5HHDPHOquI/oQ
         ukyFLBQOE7vmxbJ1E0PwOBvANze5wUtPJojcCXgKvg46SF+v1GosO3uuIjJtC7TXqh82
         VCdlCJz3x1y6DMqzAAWNVWesLNYYhgVb/QUOcLGvnpANNVirrBvSuJK8xIZIGhJi3JOf
         hSXA==
X-Forwarded-Encrypted: i=1; AJvYcCXGeI900oWV2YIDGZpc0HtDZEhCP9/Pg9lo2k07l46A7rGz+PWCfU2cdXKgPGMdonH6intJ2H411EFDKTvmxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxybBqJ3bG8pIFXItTPGaLnwnTGcZE2MtbVMxFOSfld1OIf7os
	7zER/T9e3I2iUpKNUkfgNkjVljmZaNtLxeqKDjBa3PwAafjTqQ2BvKuPvLtUnak0+PFvk2pvSu/
	OCbu9UuxegAD1wl2kKxISXK5nG8qA2vCv2q2H
X-Gm-Gg: ASbGncsYr9cRjg+Qjuw0vzNq3FqlIBPMf/c/TnAD6dLKZ9q5uXj4eZ5Vtayw1UKwSuz
	z9qZjlpw96Porq0t4XZJQjlgpuPjKlQpGMSw3qyUq+6hI+6LS/9MUyj3aYbcMnaJQwjNnRwRqb5
	fgIJ0HCMB0hilgI9jgAbGmB3m9
X-Google-Smtp-Source: AGHT+IFDON5BTBrIkCqYoruAW+GgEU4kzLUMfNza88SwUu5KL01SJq4OJVKPavaKWnoXBdabjUxCkcKdf2JVNhz5ek0=
X-Received: by 2002:a05:6512:3d8a:b0:545:85f:4962 with SMTP id
 2adb3069b0e04-5452fe5bd65mr6877441e87.20.1739939366740; Tue, 18 Feb 2025
 20:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com> <20250218-genio700-dmic-v1-6-6bc653da60f7@collabora.com>
In-Reply-To: <20250218-genio700-dmic-v1-6-6bc653da60f7@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Feb 2025 12:29:15 +0800
X-Gm-Features: AWEUYZkGeDpr43jARxyOu4uYPJJwq5tj1ueAuV0HV6f4Jx2FAOS0QlcBYZWYQSE
Message-ID: <CAGXv+5H1pfJMQPBTF_K72D3-JFsZDvZ277erZ449sc6FTkNFSA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: mediatek: mt8390-genio-common: Add routes
 for DMIC
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, parkeryang <Parker.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_202929_486393_6622A964 
X-CRM114-Status: GOOD (  14.43  )
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

On Wed, Feb 19, 2025 at 5:27=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add necessary routes for the onboard dual DMIC present on the Genio
> 700/510 EVK. The dmic is supplied by micbias0 and micbias2, and inputs
> into the MT8188 DMIC DAI.
>
> Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index a37cf102a6e928440cc88e7e8fe0225fc28ec962..efdeca88b8c4e58f0c1782515=
6276babf19af145 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -959,7 +959,11 @@ &sound {
>         pinctrl-0 =3D <&audio_default_pins>;
>         audio-routing =3D
>                 "Headphone", "Headphone L",
> -               "Headphone", "Headphone R";
> +               "Headphone", "Headphone R",
> +               "DMIC_INPUT", "AP DMIC",
> +               "AP DMIC", "AUDGLB",
> +               "AP DMIC", "MIC_BIAS_0",
> +               "AP DMIC", "MIC_BIAS_2";
>         mediatek,adsp =3D <&adsp>;
>         status =3D "okay";

Shouldn't there also be one or two new dmic-codecs, and a dai-link here?

ChenYu

>
> --
> 2.48.1
>
>

