Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D5CC982DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 17:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+f9X0ca+9K+KN+ouHkTy41XPStpAzUEe61gXgOIJlE=; b=I1PSVN4neW6B3V87fXpcA/ase0
	p260F+RgeVabrFQtiBvoBpugFi+Fj8L2AmNARJ1Y2uE9B2trUl5r08VhkrOP7IMfBezcQDB40T4zA
	9+Z0Vo8USgLUpFkS8cco9fSUs3iKBCnwha3FmBunKE5ZxTRsa9hncrO4DHioe3OCwZQ4clW37r1g8
	KLm/3NLMHshl/L3pmY+ALvlPZDIIMN5oQIIHzMgHqrVKQHt2J60QLePcgJo7U+x9w747+uo1seqEQ
	IAhLhDI8NRQmkV+sd8Q8Ugasz4V1eXk5sW5K1+Q66QjHTcNhc+f7ZfMURnKVMCyrJGZPluSGYLiCX
	WDzRil1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnyp-0000000EbXU-0NrO;
	Fri, 16 Jan 2026 17:51:27 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnyl-0000000EbWj-3ltQ
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 17:51:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so3634028a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Jan 2026 09:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768585881; x=1769190681; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t+f9X0ca+9K+KN+ouHkTy41XPStpAzUEe61gXgOIJlE=;
        b=JtIq4wtqvS+w5YJ7zRXnBrKbITEG/BJnmRXKNVP8OnSSJOUaqbaCMUxQjKyokinqgr
         H5Yb1+T26MsG3owuagnDLyzzglTBMRjgX64KkAC8RYOgM2K3qYwa76dOLD7Cb/XEn1z8
         uS3kemRH+fIpRtuaUJjAnSmuR75TM348c5j3yX7LN/UKinBdQzO96J3wcY8U6nj25NCP
         kGydNtOD/mEDJnqNC28XFtVK1R7LxSOxgJoPfohBI60H9ArxLrT6keudflAkp0U5YSkG
         jKRzosqZwpgi6t5ds17t3IOYVv8jLHubwHy+Ng9Pe2N7L4YJPlu7h8QnUozPk1nZVEDn
         IDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768585881; x=1769190681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+f9X0ca+9K+KN+ouHkTy41XPStpAzUEe61gXgOIJlE=;
        b=EaqdY7nhtktTGtNvw/e2dXYWux/CytZiovNszGmnCAg5R3gZdAYVPewRNY/IbzgrH9
         x6XA7B5JzAB4Ir5T7ME87fGYQtqbnK5LxLFd22xPsOHdGak51qurjq8NsYYkuUIeaOy5
         YdHvzvRuYymyEIvMtW2f1lOiQvCEEBHOJFGi7OfWt7O9+pHC75Z/l55TH21J1erKd+cb
         cHHWgD5hT+ZeaIwjug2haVxokZx7fL6RUviwimzWVITr/Pg57ET5nTrigDOdyGF54eyk
         xFqoegg5FlnDWApgCtqIxBnDdx6XblfvRhjjwiuvfFXJFQsS7z1j1gKDgIa/gpB/3iPZ
         +qlA==
X-Forwarded-Encrypted: i=1; AJvYcCXVsf4U6pRCNwnGeswXDVd3dnhEYcrEPVGp2IUtBkojL/571LXB2XSjHnAcRnC6HTYSitVRBo4DTXqNk+LOdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLE5gj4GQZWP72xKNOVvZIRJUOu4q6A4xqF/l8d5gvC0rK19MY
	ChAVqg8rX9bdP20P7IQTOtqADzOBCCGrM6NuZ4xekS6wW5PUjFokfSLgZ1PDROMPkOTIQeArTgI
	bOi2Y1DxBVOotR65btaXMwgfFVD/+Ku8I9Qr0F0TIJg==
X-Gm-Gg: AY/fxX4IAbVJI7soAcrY9VgEzXs0OXlULeQCH8Tg2J0IpP9Vt6vlNkGy8czM04d+p/Y
	sdMr9AyENsvnzpgDAIElFRVHPBZ8kBOMjD7wg/ignJIpJAzNXpVvHrNlIeHRMFJG8QIQHXXRSB2
	+fSx2hGpAf466X7IqOqrXOkNBt2C1lv0jKxRogvCr7LHXlrYWhlZRp3X190lDCox34leFlg8uxv
	oXzk39PO4hkcy6jQxn1gwE5Q99XfB6EbSsuSr/3TlT/93c8pebxTUiQlC3mztIA4TpJemYNi1Ja
	A3TBqEBTcpeZvFdkS1vRQvqkEZWUIoKSFXIdDJf8
X-Received: by 2002:a05:6402:524d:b0:649:cec1:6cf1 with SMTP id
 4fb4d7f45d1cf-654ac00290emr2575856a12.0.1768585881040; Fri, 16 Jan 2026
 09:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 16 Jan 2026 10:51:10 -0700
X-Gm-Features: AZwV_QhtJIlvC8lax7reCIuuwunpA2-9R9Z6379FfXEQO74d5fi8ERBctyrcGDE
Message-ID: <CANLsYkzU8YDv_PzSMjj3+zAg-js8Yo8uFWotzzz2r_nYDK3M_Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_095123_946048_B1FDD9B9 
X-CRM114-Status: GOOD (  13.96  )
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

On Fri, 16 Jan 2026 at 10:29, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
> tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
> so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
> maintainer.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 2 +-
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> index 88575da1e6d5..508b8c2f13a2 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: MediaTek mt8186 DSP core
>
>  maintainers:
> -  - Tinghan Shen <tinghan.shen@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>  description: |
>    MediaTek mt8186 SoC contains a DSP core used for
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 179c98b33b4d..bdbb12118da4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Mediatek SCP
>
>  maintainers:
> -  - Tinghan Shen <tinghan.shen@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>  description:
>    This binding provides support for ARM Cortex M4 Co-processor found on some

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> --
> 2.51.0
>

