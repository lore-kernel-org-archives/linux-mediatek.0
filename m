Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B43CD3427
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2026 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=; b=ZVZkasepBZE3XhNX6AFNMgUYRw
	WrwwYDW/rhVPZ+whte0d9HmddQ29iKRhWI8FETHss6kq2VnK4FJH4yLJl2LnpbtM+AKVchu3VFiOD
	lu4v62BfwfiKLflUBzIZIc/3YiinHjKBD6HyjGw7CU5bANiiEc0pStwv7fvbybHBHXtZraCbICNQz
	vpbbvufW42Sp4PloPlsfkZTLl9yWtGHFsKjQvWO9opnmSVuByaOnTgiCdgCkfHlAfXYHujN6MTDqr
	IwCEhUKjublKvkU48tk0U8487XWB1YjqAuwqYtyP99XrhqKJuQ9E9C8O5/ArLlRto1LTH2xHsnhHg
	y2cypKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnpO-0000000CcPP-0N4p;
	Mon, 04 May 2026 07:34:54 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnpL-0000000CcNw-10d5
	for linux-mediatek@lists.infradead.org;
	Mon, 04 May 2026 07:34:52 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso34594541fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2026 00:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880087; cv=none;
        d=google.com; s=arc-20240605;
        b=TSe8OCrnxzA+KK8utQpjWey5F/9V2NvPp4QTkjZIyZxDARpp1g324QkpRshqvlPZJC
         PCvSlN0LmcvuTOW1saauZgggg1kpjcxoE4OKf6zkTz5VFkUnWsr0h05nOxw+5wNWbOKQ
         9USnBsrBv9ID8ptSm90mDwz+21z2Z/kEfxoaRYMsJAiMiK3xOin61NKU2S33gHQOmSPD
         QwC3kwwFR3A6qDjUwabGNEbbHB7u8DymcbgDrDARsXZsYJykrfXzjwjInQVNwzz5XlIV
         q5x06UMOuL2Ur2mhdLaBuf0ptj6GFTycyf66QCRW0v6zmspq2GbiNJ4jPtmnIqd1aa5V
         xm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        fh=/22lpxjzdmw3n5IDshKJLobCW2OW5OdHCK2CFg3Ez9U=;
        b=U+fzjANMJ8StjCcINxi/JG3ji7noc9j9IQ47cEDEwXEQFcDHBjBr4mpYTF8RFkDhJz
         ESKI5J2YRZ56raPHc1MbNQcOaUI8PhK6FSM16jPA5MdbaXmd1sIlq3Igwks05WW53g2B
         R0Yb/gY5/w6KkpaJ05iRqjEBT1721+YHCPuvxFJOlH9tQCFGy4Efyv4hNUVNpWmWUlfA
         GlYlkJH9vF4fkOfnfY/iiMZFMfuRbO67b0MHcFrJLHpvF2aA1jaTmEGSodOZPv4j/l3d
         cJgCtuOrmuf/W6lq9jMayxcXKYXnfVZfUS3wKFxGZuaFRu+bkuEprXwsmha/r2lZ6l6B
         SPuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777880087; x=1778484887; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        b=Ifi/TiOSGzDW3KbDNlOM6ujNPb9ch44wQZErMA8PEvDaqgUxSzyvG1OXLJDSmhpZo2
         XBrAtWHs3Mt8goXxzyLxsz5JKH0il4UcNPsZMyq1pnYDnsGcBD78vBw+E9E/P/PYBx5f
         Vshcop5NS9hlVyzz4P2JE6FBd/idqM+yIqhwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880087; x=1778484887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        b=Hvb7X4HGnQ2wCrLFHMJQsEBtAQDraV2RAO2OEPOtPkgC9+AeD0lH/WEWpDoxOHOXZa
         HGxpASBypq2qBvrzGbU1T8CQ4qG6q74FUhYzffiFoYgWNlxVgJBf7EP82QG9DHNO0i89
         j3+7r7VIvOXtyIgiZ+FTCNxu0EdzCfE6SEdtEf9slfXSzDEA+4NgOFhqDv5VDlABT5x7
         dPtgHJFYTikHo1Hy3fTNRzQBW8PsWsXbDCW7S/93JMRkrkwQiT0YPWUg6o4hFESSXkvx
         TTNltx3FLbL8PN1+L5BLu5aiRriB4JvxJrhUZpDmPO0uwMljXS+rQN6AKJBM7IJ8knNl
         qfnA==
X-Forwarded-Encrypted: i=1; AFNElJ9WgO1PKpQz4C3MI+RPMMKeQ6z4EzMUlxdwpPTv+H9UJAQYu3om0p+JfgwuXj57LSETUfTjaq2b0sgUZ4EMuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVGsCofxPHFzZDGJQeVIeG4CJtkvOCxbOJegdqiXizjdjnhQLt
	JENeiEBZ3KtPGO+N/OaUosh4X8I4z74n1YJMiQyTB2uE+WcgoVIqyB1CBckg6WNuR02B7t5quiN
	RENyA3b94kMHepfw5D181lSpnXt3VacV1NMl9iyB+
X-Gm-Gg: AeBDiev4QDYzvlSzW7/GEx9TPTrZXiBDR2sikwGmzslamgCj1ClQR7cbarmVOXhDTux
	V7NcVTpr+XulB+tDrXdR7AsHMJk20XI1jsbZ/IWxNkCgSLNDhAsIRKvtZlMOWTTCK5QConm/OV8
	Jbn8waluS3O3891CwB8Y5C1dqY+Q+AUsCnXgrl6OYNoJ4qBmEcX3QrmytDzMA+1UoydQg6tgASt
	U4yNRY8+h9pDwwQWuS67T3iP2LRQdLeJngdY9peiJS432wCwKylYipcSOVYRwvF/VWQMDW8G8Bx
	PRcAtVZ4NfvSdUR4KJakj7D1MXbU0eDQaJUjxPP83W8/b4zU
X-Received: by 2002:a05:6512:3b84:b0:5a2:a3dc:51e3 with SMTP id
 2adb3069b0e04-5a862ec11b8mr2434888e87.12.1777880087115; Mon, 04 May 2026
 00:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn> <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 May 2026 15:34:35 +0800
X-Gm-Features: AVHnY4IuKDBbAkS85uOVR5vEB6IDbpI4Sjzup8SfiFFfaDlz9Xmq5t63cjYsvnU
Message-ID: <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi card
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_003451_297586_A7D20980 
X-CRM114-Status: GOOD (  20.66  )
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

Hi,

On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> The mainline pcie-mediatek-gen3 driver does not have code managing
> downstream device power / reset.
>
> As the Wi-Fi card on ciri is a fixed device, set the related regulator
> to always-on and use GPIO hog to set the status of its reset pin.

The plan now is to model it as an M.2 E-key slot (even though the chip
is actually soldered on the main board).

I have some of the patches ready, but I'm still working out the USB
side of it.


ChenYu

> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index 8e423504ec052..c25780098103b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -544,6 +544,11 @@ &mt6359codec {
>         mediatek,mic-type-2 =3D <2>; /* DMIC */
>  };
>
> +&mt6359_vcn18_ldo_reg {
> +       /* Used by WLAN */
> +       regulator-always-on;
> +};
> +
>  &mt6359_vcore_buck_reg {
>         regulator-always-on;
>  };
> @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
>                         output-low;
>                 };
>         };
> +
> +       wlan-reset-hog {
> +               gpio-hog;
> +               gpios =3D <145 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
>  };
>
>  &pmic {
> --
> 2.52.0
>
>

