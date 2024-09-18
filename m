Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB079FA3758
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 07:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOqc83yMPmUNy7v5ZCgAL4TGfjubvgZuTWuJi6zr/fg=; b=ZSLCCeZaV9n8IVsjDBWucN/jcS
	lvND+DVZqjC16w3avgbowkY09Gm57GGtIX/OTp/MxxfRfFozlKXvMZCh9OP8UMLSwOeJ4OlCSW1bw
	ZaN+5G54/Y86/bexxIp8ZUKb8CKTUM7F3ruq786fW/z6LiAy+Rqq2dsa4HDxge6ru2Qr51DuJaiCn
	qi0tE75IVOfEb5VLaqzd/WzZKQ+0QqQQP2VemLImCWT1kAqpsrHDyl0aYa/xsRz44ugdeCATpm8zh
	gke4TXsvFc6eiajKSez5JV0LCV6AYHhwcvqMu9btFuJixEfZ/lk0JcTJjeOJH2kyr5sDHk1wLdtWN
	MNLUT/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqogh-00000007c8Y-270w;
	Wed, 18 Sep 2024 07:01:19 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqofa-00000007c0b-0Pav
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Sep 2024 07:00:13 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-710da656c0bso1493219a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Sep 2024 00:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726642808; x=1727247608; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOqc83yMPmUNy7v5ZCgAL4TGfjubvgZuTWuJi6zr/fg=;
        b=kXNerXsAml1XeMFBWhYrhCMiihMtXrKhIiLHapzYBg/bQSf9QxKyOE3vyG98RkkQBF
         rPMGJH/uyXb3diZPO0j47VikYV5+KDEgQ0ZI8b2s/YknKIRThjwng+a8lKTChPAGuq8/
         1BoAzops0Anat3ZCphKVk4d7CYNgvd5ADqvVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726642808; x=1727247608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOqc83yMPmUNy7v5ZCgAL4TGfjubvgZuTWuJi6zr/fg=;
        b=RapP/W2wEIg6SA5itaxdflTyd8D9zOZ3Be5i+x+bOBacATV1m1CJNDFsNBg38ghYWM
         Hzs0/QoYU7S0B5nIQ2NiURrcP4AFKPcIXokVtxky4hdI4g7vAn0x27Fu8XCoVi0i4nA/
         uu2UblTsMZIxbNvCd4sEqARcDzBAhbqHYum0pDi6mndqu5AEReg/xiMA4VhDt8Q5p2ma
         JtIyiw04RLkxCyiotD1g7GX0Fs8f9QmK4atpqXsRbNyOLvhjRl+mCeKJPKGyWmfmHGLM
         vsuEkYgKDQDhDU4TBpV4ylrHo1e7jpca6Yc582V7CNIojiXBqPiI/aGC5WLAJeNuHAqj
         nkKA==
X-Gm-Message-State: AOJu0YzjmUGk8fbCtiH5/ulsio/erJbfcVyQzySLpQ1TlAjaAZ1ZmnZ0
	YeMvLt6CYLSnDDu0NZZU61gYwXrAQtbknplOiNRTRFGNZmzYB1/3a+lEmdcdZD/CwJi8Ai609Rp
	c666+wgvFFmMWDgzKOgJaKZNfmdP6B+8r3saA
X-Google-Smtp-Source: AGHT+IEBksw6fFdlYZ7q/FBpGRgy55uXZtW9PS9HPUQ2weMty0HZGZxThjuKX6anaB5NViscVV3L7qxmQJ9lVWMx6WM=
X-Received: by 2002:a05:6830:3703:b0:703:6434:aba8 with SMTP id
 46e09a7af769-711168e8f6fmr11760759a34.0.1726642808164; Wed, 18 Sep 2024
 00:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240916162956.267340-1-alpernebiyasak@gmail.com>
In-Reply-To: <20240916162956.267340-1-alpernebiyasak@gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 18 Sep 2024 14:59:57 +0800
Message-ID: <CAEXTbpc=ZgF_V9AwxgTTJ8Ki1pb5M7bJ=se2fPE7Qg7s9H7XdA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui: Disable DPI display interface
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	Pi-Hsun Shih <pihsun@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Fabien Parent <fparent@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_000010_159093_B2636A44 
X-CRM114-Status: GOOD (  19.53  )
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

On Tue, Sep 17, 2024 at 12:30=E2=80=AFAM Alper Nebi Yasak
<alpernebiyasak@gmail.com> wrote:
>
> Commit 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183") adds
> a device-tree node for the DPI display interface that feeds the external
> display pipeline, to enable HDMI support on the Pumpkin board.
>
> However, the external display is not fully described on Chrome devices,
> blocked by further work on DP / USB-C muxing graph bindings. This
> incomplete description currently breaks internal display at least on the
> Cozmo board. The same issue was found and fixed on MT8186 devices with
> commit 3079fb09ddac ("arm64: dts: mediatek: mt8186-corsola: Disable DPI
> display interface"), but the MT8183 change wasn't merged until then.
>
> Disable the external display interface for the Kukui device family until
> the necessary work is done, like in the MT8186 Corsola case.
>
> Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
> Link: https://lore.kernel.org/linux-mediatek/20240821042836.2631815-1-wen=
st@chromium.org/
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 22924f61ec9e..07ae3c8e897b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -290,6 +290,11 @@ dsi_out: endpoint {
>         };
>  };
>
> +&dpi0 {
> +       /* TODO Re-enable after DP to Type-C port muxing can be described=
 */
> +       status =3D "disabled";
> +};
> +
>  &gic {
>         mediatek,broken-save-restore-fw;
>  };
>
> base-commit: 7083504315d64199a329de322fce989e1e10f4f7
> --
> 2.45.2
>
Reviewed-by: Pin-yen Lin <treapking@chromium.org>

Thanks for fixing this!

