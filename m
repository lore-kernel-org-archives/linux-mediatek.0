Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9558DC87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=; b=aWMEWh2zbTr86z4wTA83hxxcjF
	ZpG9z0cn2QVnxLHHcdzd+fEzhrIYlEFjM+XZsDD8KnDxTERak5zniVSPX+lpIfU16YP+XHDcfkc5e
	TAmAIxiKoVjVO/LlTVL4qY1aRh/DM8HVNvlZX3cxRUh9HtxhL6HjHeaR7vcwmlaWakv0CD4wmGpny
	kYC4NbMYZhBAtnfMW3Mz3ZPtEbsmVY7GzuIojT5ON4qPL2SkdkPWHUfaTC//N3sQgQwetASXMnBoT
	HuKQdid6fpHtDrrisQUd3R6cBAr5g5LezxB8TPqjzqBzMfOYT4eYgRvJHd/ucMqWYAfQ6X1p5OTD/
	dQGf5e5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGYE-00000009hlB-0OCn;
	Fri, 25 Jul 2025 11:25:22 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufG0e-00000009dWk-2f2k
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 10:50:41 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-73e88bc3891so1125509a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753440639; x=1754045439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=WV/3bWKmqMmpf23slxG+WVpYy1JMlsPbfUMCYnk2M9FWNy2ez2j7FRIHUbMHbSpffb
         hBYeqZ6tYdG9q8o6ImQew2I+ILR8j4bWsy6hPPZlbvWW2yZkTVibYOe1tLRuy2Wkr+Uu
         nwdYqPK+EHKJZ3bobPcdTSFhiHwvGHQKD2b5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753440639; x=1754045439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfE909p8Iq119G3J/2SxiBSXlMMdz4SFa3hpgANK2k8=;
        b=D9cfFRjOptJmSDzyv9KYhyAHzdmnrUPyHenpTVxIMu+sOXMPchucrktItBysRghkMF
         e9SVFWr2zYUFY2tPU08v3ccOoA6834aMkOVETt0SlkqM2o/h4x3tHss8dI2U0pyGAZ9t
         q5J2dOmTjQyj0GJPjrx0JgZyNpXxm/l2Nibvu3z/H3l4d+kpboziTk2QIwjjZYkejj67
         BYo0uyvjw+8b8S6QIGc/NDTXLvmrIkxgHOKAZ4O/nYJJyho0my0f7cLoWvKlYLtK9xo8
         9k4nvdbCBxr3PvmHU4JovLaLVFCjIbtrDyafOhAmKluZuSvTt7d4VkzjNRCq5gYsIAK+
         z3Qg==
X-Gm-Message-State: AOJu0YypKTR3FOVck75e1ybc111e8q6uOCzKDOby2O3+2kwtWsPQIssf
	TF8eZ0lCAkeUE48MfxlIqqwiPt2jurSDCYBK1SFtq5OTRwK0XjkCAyY+o3br5vyfCz6Be5i8MCC
	jMRgsEA==
X-Gm-Gg: ASbGncu+tLIAENdoveHq3Vtpj+1IXDvxa1ycC0hNVJ1uqpSpJZfhcnjKYaB0b3FGNou
	yD0diRkZF5zdlC2ZnIRtXWvvrGp6k9di8hbswsj1004NcpIxo2nuVAge09Ky620wFlm+55UeSUP
	tSFB+HKTfNJgHIba5n82/enIBPP0blg/sbEeEys+46WZNh/8IAVzHbhAyZAbQ/NSuC2DYXvrDlv
	7PrdOX4URuxWobPSle7cdxrF76qVjREkoWUk+OM1T0fHS5FgOG+7jCrgv61GTZFTQqKzp28CjyL
	NvsMgXeX3hTpKPFVYxw8Wu4p9NqsMQ52Njxx2AIEXcM/Pf1ety0stzDJ1ipgAEAKMYHN8XJlMEf
	Lp15j93d5y4V7K9C85oO6re/W7yDs/3U/QSKrXYuLXe6vBZRIDnNO7b7gBQ==
X-Google-Smtp-Source: AGHT+IFytdfssfl9vokE8XBsBODEz+QCefbKGt8Mwku2Q580mvBjhWcwADi0lNCnJ5XerzKEabSlnw==
X-Received: by 2002:a05:6830:43a8:b0:72b:94d8:9466 with SMTP id 46e09a7af769-7413ddb987amr714541a34.28.1753440639447;
        Fri, 25 Jul 2025 03:50:39 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7412d2ad45esm627612a34.36.2025.07.25.03.50.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 03:50:39 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so1030210fac.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 03:50:38 -0700 (PDT)
X-Received: by 2002:a05:6102:3713:b0:4e9:b7e3:bdcd with SMTP id
 ada2fe7eead31-4fa3fad468amr285963137.12.1753440273293; Fri, 25 Jul 2025
 03:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:43:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
X-Gm-Features: Ac12FXyc7RkTIKa4HnSlf_SM-GYdwIREUn6AcAkOBKhNuekdCdvFzy29o7Ufs68
Message-ID: <CAC=S1njhu11nHpyMULbK6PE-BLrBMq+d397pDU6gBzgo7xivXg@mail.gmail.com>
Subject: Re: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express
 T-PHY node address
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
X-CRM114-CacheID: sfid-20250725_035040_688497_FD792391 
X-CRM114-Status: GOOD (  15.71  )
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
> The PCIe TPHY is under the soc bus, which provides MMIO, and all
> nodes under that must use the bus, otherwise those would clearly
> be out of place.
>
> Add ranges to the PCIe tphy and assign the address to the main
> node to silence a dtbs_check warning, and fix the children to
> use the MMIO range of t-phy.
>
> Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
> Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/=
dts/mediatek/mt7986a.dtsi
> index 559990dcd1d1..3211905b6f86 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
>                         };
>                 };
>
> -               pcie_phy: t-phy {
> +               pcie_phy: t-phy@11c00000 {
>                         compatible =3D "mediatek,mt7986-tphy",
>                                      "mediatek,generic-tphy-v2";
> -                       ranges;
> -                       #address-cells =3D <2>;
> -                       #size-cells =3D <2>;
> +                       ranges =3D <0 0 0x11c00000 0x20000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
>                         status =3D "disabled";
>
> -                       pcie_port: pcie-phy@11c00000 {
> -                               reg =3D <0 0x11c00000 0 0x20000>;
> +                       pcie_port: pcie-phy@0 {
> +                               reg =3D <0 0x20000>;
>                                 clocks =3D <&clk40m>;
>                                 clock-names =3D "ref";
>                                 #phy-cells =3D <1>;
> --
> 2.50.1
>
>

