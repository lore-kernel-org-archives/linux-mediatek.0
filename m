Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D61C83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WW2uf9Dse9OAFXSGg4nVLrSNNR6IaqC06E35FrZCQw=; b=IGYSKMpQnNPMQ+jW4DWAHjk6y7
	+XfXs5FSuQafU6UOyLckiOfmnjhUCxtrjYQtz1GHpdTtcraHpcuAvODcZQQLhXjQTG0IW2b3HOHes
	Qgi9gmhTPa+6Ol9+bpuSs5xTOBn+j9ATWB7Fx51ZS/Qy4+bVWKZPnP7/n2qaZNPmzxWmslE8hJmcP
	uEZjOlgvOtwrFe8L51a28Uq7yKVowROJNJJuWjaZlJ6LNyKIRUlwkLVxUcXx9XD+LP+jqe7wbSYtV
	N8Ma+6jtkw8GwX3F+aomqX+i6zgkCkf5gghPSY02jhGyjv+Q+f9pLvz3MMD5ahd8XGQP3ycvVjzAg
	w7SOn6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpxt-0000000HI0i-0PRG;
	Mon, 21 Jul 2025 12:49:57 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoP9-0000000H2iY-0vdJ
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 11:10:00 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32f1df5b089so38445221fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 04:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753096197; x=1753700997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WW2uf9Dse9OAFXSGg4nVLrSNNR6IaqC06E35FrZCQw=;
        b=QH2QLxN2sugGp8EsNjyFVYAN0ATp57cBO3PFs4vL6fWfJH7eaqmhp+jjnH/J6aXVzG
         MTDE80ZNEFGBsvjtDE4B0q2B0i7CC9cqiGxcQe4l9WYAE3ObZC1om5buDRiwtaTat5an
         rx+6D+7o9rHBb6Tp+kDgSRCx8MPSaxVpCLWTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753096197; x=1753700997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WW2uf9Dse9OAFXSGg4nVLrSNNR6IaqC06E35FrZCQw=;
        b=AYLIu8vk83mMDhzUIMOzWQFHYlxwoM468DSwsqU58XjS2bvcDoGmEmBNJaPcUdx+9l
         K4byIjEfyMWn84N3rbxQnVmxpPmqLxGUA5tlvQDzxnzIf1JIxu6BmUFKPNaovIuecEqQ
         QA/CywrY7mqAKY8GTR93XQhBqvd4pFqYOSsC8mZxhZ8ATLU3tu2O9OjRIwH6vHVXmnCm
         jZcXXuMeTTOcGdAaXddN4bziJviJ2AdFXvKWYRYaIW8FVIbKGgLT6iXlYD224EbUzhOP
         +8HR/re2fHqxyhQjMT0Jc2E6nE4CFoPepWphhVoFyg70TNchiCfUrGR+B/EeCN16JsLK
         xLDg==
X-Forwarded-Encrypted: i=1; AJvYcCVYFlNOvMN+vdySbYwd8E0UlLUxyDsXJhL6uaRLOJIBUZNegShC4BLtbLICB9kf5DDe6CXIoiccaqa5WWL7JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbRhsooC/HuZDIsr5RRjV7MEC1qDuoABX5KzC1iYSozoLMJbIl
	gJHke57NyzUY6Zxqnn3lt2LuF2vKiWqXyAMDhs9GOQh00QATVU19dPIhWTP8cDUsmS2/e4yNJXG
	bwQoWplsnGYX4Li3zQB4qdKebxI7YEW1vxL6WiZTn
X-Gm-Gg: ASbGncsbjRCysi0z7o7iPBtb9/x+KzabqKvZpvQzUb+uedbCQXp+/CzV3sjiH3AbJ6s
	0+wYAIyJ+OEu/4Vt7+TAeADS2fUcVuWPLJRUp5sEIR8PhWeXcteLIaQEDOJSdAzhSw71656Kmpu
	tQ3bo/rZZoFb2ro4VfAPjR5PK2TZ7e1rZbT5QdvxgU84+KRqwgUXiEIN83YtVc/6D53O1GIeKsZ
	ahIPEeB+XLYxqUxMY4PHtrlCqXpr3qofi8HuDIglhtcBQ==
X-Google-Smtp-Source: AGHT+IF4nBN7l8BVpT48NL044EtxxNCfvAewP1ZUdA31VvrzYipiWFMocffu+xLGFjFA/wIBhY4ZsuRqkeecG+8Cpu0=
X-Received: by 2002:a05:651c:3241:b0:32f:522e:f040 with SMTP id
 38308e7fff4ca-330a7b352d4mr27431031fa.12.1753096197351; Mon, 21 Jul 2025
 04:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250721081459.16278-1-laura.nao@collabora.com> <20250721081459.16278-7-laura.nao@collabora.com>
In-Reply-To: <20250721081459.16278-7-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Jul 2025 19:09:45 +0800
X-Gm-Features: Ac12FXzx8td7SOjqLltSsFYEC21ZPF3VEQHs0mR_h7cbh7ksB6i9GixQOdHUn5w
Message-ID: <CAGXv+5Fgha-3xAa8gOEsub0u=Qr5RjQVzkyPoZ=iDkJL_KCXEg@mail.gmail.com>
Subject: Re: [PATCH 6/9] thermal/drivers/mediatek/lvts: Add support for ATP mode
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nfraprado@collabora.com, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_040959_384944_A7F59EFE 
X-CRM114-Status: GOOD (  20.44  )
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

On Mon, Jul 21, 2025 at 4:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196/MT6991 uses ATP (Abnormal Temperature Prevention) mode to detect
> abnormal temperature conditions, which involves reading temperature data
> from a dedicated set of registers separate from the ones used for
> immediate and filtered modes.
>
> Add support for ATP mode and its relative registers to ensure accurate
> temperature readings and proper thermal management on MT8196/MT6991
> devices.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 34 ++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 3c34956e37c1..8f9da0d5b886 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -44,6 +44,10 @@
>  #define LVTS_EDATA01(__base)   (__base + 0x0058)
>  #define LVTS_EDATA02(__base)   (__base + 0x005C)
>  #define LVTS_EDATA03(__base)   (__base + 0x0060)
> +#define LVTS_ATP0(__base)              (__base + 0x0070)
> +#define LVTS_ATP1(__base)              (__base + 0x0074)
> +#define LVTS_ATP2(__base)              (__base + 0x0078)
> +#define LVTS_ATP3(__base)              (__base + 0x007C)
>  #define LVTS_MSR0(__base)              (__base + 0x0090)
>  #define LVTS_MSR1(__base)              (__base + 0x0094)
>  #define LVTS_MSR2(__base)              (__base + 0x0098)
> @@ -90,6 +94,7 @@
>
>  #define LVTS_MSR_IMMEDIATE_MODE                0
>  #define LVTS_MSR_FILTERED_MODE         1
> +#define LVTS_MSR_ATP_MODE              2

Nit: I suggest changing this to an enum since they are related, and
also because these are artificial (unrelated to hardware values).

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>  #define LVTS_MSR_READ_TIMEOUT_US       400
>  #define LVTS_MSR_READ_WAIT_US          (LVTS_MSR_READ_TIMEOUT_US / 2)
> @@ -207,6 +212,10 @@ static const struct debugfs_reg32 lvts_regs[] =3D {
>         LVTS_DEBUG_FS_REGS(LVTS_EDATA01),
>         LVTS_DEBUG_FS_REGS(LVTS_EDATA02),
>         LVTS_DEBUG_FS_REGS(LVTS_EDATA03),
> +       LVTS_DEBUG_FS_REGS(LVTS_ATP0),
> +       LVTS_DEBUG_FS_REGS(LVTS_ATP1),
> +       LVTS_DEBUG_FS_REGS(LVTS_ATP2),
> +       LVTS_DEBUG_FS_REGS(LVTS_ATP3),
>         LVTS_DEBUG_FS_REGS(LVTS_MSR0),
>         LVTS_DEBUG_FS_REGS(LVTS_MSR1),
>         LVTS_DEBUG_FS_REGS(LVTS_MSR2),
> @@ -621,6 +630,13 @@ static int lvts_sensor_init(struct device *dev, stru=
ct lvts_ctrl *lvts_ctrl,
>                 LVTS_IMMD3(lvts_ctrl->base)
>         };
>
> +       void __iomem *atp_regs[] =3D {
> +               LVTS_ATP0(lvts_ctrl->base),
> +               LVTS_ATP1(lvts_ctrl->base),
> +               LVTS_ATP2(lvts_ctrl->base),
> +               LVTS_ATP3(lvts_ctrl->base)
> +       };
> +
>         int i;
>
>         lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
> @@ -656,8 +672,20 @@ static int lvts_sensor_init(struct device *dev, stru=
ct lvts_ctrl *lvts_ctrl,
>                 /*
>                  * Each sensor has its own register address to read from.
>                  */
> -               lvts_sensor[i].msr =3D lvts_ctrl_data->mode =3D=3D LVTS_M=
SR_IMMEDIATE_MODE ?
> -                       imm_regs[i] : msr_regs[i];
> +               switch (lvts_ctrl_data->mode) {
> +               case LVTS_MSR_IMMEDIATE_MODE:
> +                       lvts_sensor[i].msr =3D imm_regs[i];
> +                       break;
> +               case LVTS_MSR_FILTERED_MODE:
> +                       lvts_sensor[i].msr =3D msr_regs[i];
> +                       break;
> +               case LVTS_MSR_ATP_MODE:
> +                       lvts_sensor[i].msr =3D atp_regs[i];
> +                       break;
> +               default:
> +                       lvts_sensor[i].msr =3D imm_regs[i];
> +                       break;
> +               }
>
>                 lvts_sensor[i].low_thresh =3D INT_MIN;
>                 lvts_sensor[i].high_thresh =3D INT_MIN;
> @@ -907,7 +935,7 @@ static void lvts_ctrl_monitor_enable(struct device *d=
ev, struct lvts_ctrl *lvts_
>         u32 sensor_map =3D 0;
>         int i;
>
> -       if (lvts_ctrl->mode !=3D LVTS_MSR_FILTERED_MODE)
> +       if (lvts_ctrl->mode =3D=3D LVTS_MSR_IMMEDIATE_MODE)
>                 return;
>
>         if (enable) {
> --
> 2.39.5
>
>

