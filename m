Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A515D78333
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaH2quEaKj8yOu++9MIx8fQjkXZLihRJEM2GwaPWvJ8=; b=3ngPoooUXPVP9DlmYMrko9Vpy0
	/pAdyU+xrQyQTK566BBWs1XJHGrV6lQz0YQCC1CETT37wTds2pNggqwvMihAjzMv1tnHmLsV4WxA7
	qin1ZOf1OV5AkKErXK2pIDe/Yy8CJaTX0zfxhYuA7mvD9JXpGl0x9B6llk2DjaIli7moW/0N57mJ1
	TXOwHsqRhoOo0KgvMscgFiwRFdVT2Vyfkw/VBN4aNm06yzUJ70gVz+azMDPBTVp8LCrokXvdVHh2h
	479FJYq5dIsrrsq7w4NITxQxn9jWEytnyLyOExPdLTlBnJTpllHblBDecA5fJcVfxWRfobyCzrbr8
	FXK3en0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9EG-00000006q0d-0k8z;
	Mon, 02 Dec 2024 16:24:56 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8y5-00000006mdP-1PXj
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 16:08:14 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e39779a268bso3182630276.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733155692; x=1733760492; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PaH2quEaKj8yOu++9MIx8fQjkXZLihRJEM2GwaPWvJ8=;
        b=g0VDTw1mv7b+4lVVuuYmaj3eXhZVwcDtAs4FEzECP/2Hxn8dopypq9hAtV4EIC4JYw
         G4/P4Deol763v+/zCoNw8Xx1ktbh0A5OaRRFfJyLmUNHpOCrLBr7xQ60qDo/sTuXtxVq
         /eyle6UQQ5nY/l33hRM6+EEuQBeEDFvIriVsaV3H+GpWcx4Kx5wQzESNEgfQfRTsERce
         wC38fuAra9bwIPSaN7iEZcdvWmQV930rYbWEMYxMDvOLT/VMFdkZGZTzVo94FRJwn4zI
         MOQEyo5dn3V1rRjZ0S948n9JXbYC11a95S2E/5Rwbv6BC7ZcUHU6iCc7GoJUn67X/JLg
         KW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155692; x=1733760492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaH2quEaKj8yOu++9MIx8fQjkXZLihRJEM2GwaPWvJ8=;
        b=JtZfHvIZFmajJS/BEHZHR98z0RzKONJ5CSRSCMtGllRbQOMgJuMVeq+8vchUNQjJ5o
         Poxo/Mt7sUgHPrh63lUpi14RP4AlJwGFbe9IuWXHeW8Jj5c1Chr4mxeoz4efpvW0qBGd
         TQudMItpJJXM1xszpGEYATcTGsvCqm/kM0kVs1NAF1NLkS4zdPUw484rQnKT9FfiSl9y
         gmLcqnRz1gXhE1zjLlw/XDh46mCC35YF/U+qj1Z+n9dMnZziPgDTb19iUACd9vRPeyrv
         nyJM4E+LqTH1V/l7K1XoKhnpgONPMoBX4sg2m5tUOe08z0Q7SD2Eu+2ojYD0NkASBCP8
         pVzA==
X-Forwarded-Encrypted: i=1; AJvYcCVJLy4USEVnnc5GQ3R46SnySP7/HmGddgSPk6ozUVEBf/+ucvC4+gPvLklS48652/wxzoZnYBx2Ibh3qxsM9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyePpTE9Qu9n1lAIsWaVwStYoFz8LX0bfJjUQp+bwBopwhhLOL9
	skqXQEg+BUtJxlaowtoXZ2NrRk08jhb3GBibXJLvFqntL/S9UbU3pL4FXjyQv83cVlbKrclzW6q
	iOH6vJN5lXF0+tdda7qTuUmo1HD2zmzwmlOiFmw==
X-Gm-Gg: ASbGnct68m7bOxdv2fiKoYPXdjqIxwSppDykYC3zOPY97fpBWrToEy06X4ReQwV1iwI
	cjvyB2qLGBCHqCiaPgwMFvRp+UFT0eGu1
X-Google-Smtp-Source: AGHT+IG7HwzdQGc2Kvrg8khctxbecpx+AXVlBCSBHTZ8x/NzPHJXof0Ee7iQcAC8+6QwlvR9QUpxPUtKrKBUqfZBBpA=
X-Received: by 2002:a25:7bc5:0:b0:e38:864a:1522 with SMTP id
 3f1490d57ef6-e3971958a74mr15808882276.9.1733155689500; Mon, 02 Dec 2024
 08:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20241001113052.3124869-1-fshao@chromium.org> <20241001113052.3124869-2-fshao@chromium.org>
In-Reply-To: <20241001113052.3124869-2-fshao@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 17:07:33 +0100
Message-ID: <CAPDyKFocgdjSdek-sNHy_w1ZQkscgs8Z0TYwXPKC9phUbH-scg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: power: mediatek: Add another nested
 power-domain layer
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabien Parent <fparent@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	MandyJH Liu <mandyjh.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_080813_377270_160EC80A 
X-CRM114-Status: GOOD (  14.64  )
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

On Tue, 1 Oct 2024 at 13:31, Fei Shao <fshao@chromium.org> wrote:
>
> The MT8188 SoC has a more in-depth power-domain tree, and the
> CHECK_DTBS=y check could fail because the current MediaTek power
> dt-binding is insufficient to cover its CAM_SUBA and CAM_SUBB
> sub-domains.
>
> Add one more nested power-domain layer to pass the check.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Fei Shao <fshao@chromium.org>

Applied for fixes (to silence the warning in v6.13-rc[n], thanks!

Kind regards
Uffe


> ---
>
> (no changes since v1)
>
>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 8985e2df8a56..a7df4041b745 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -54,6 +54,10 @@ patternProperties:
>              patternProperties:
>                "^power-domain@[0-9a-f]+$":
>                  $ref: "#/$defs/power-domain-node"
> +                patternProperties:
> +                  "^power-domain@[0-9a-f]+$":
> +                    $ref: "#/$defs/power-domain-node"
> +                    unevaluatedProperties: false
>                  unevaluatedProperties: false
>              unevaluatedProperties: false
>          unevaluatedProperties: false
> --
> 2.46.1.824.gd892dcdcdd-goog
>

