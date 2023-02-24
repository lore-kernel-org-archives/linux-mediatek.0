Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF51C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hup0iftcL4w1rRk5wtFimO6PxuW6uWdJ0jF6+XpUdR4=; b=WpLwxWFnKcEFWjm17xgSeTayoB
	/SR6/8ISpQu+iOSShFndqK2AjboEStMfgZZ7b3WWHAc+dd3NCckSZct0IPjwroXF1hQTX7cufYsXv
	0MC+BpBALFqUbLkmexdtMGBU9BsCvI749eT1R7j69BHczdlqIetGSh2ZYVDe9pJbOWlFZkRkTB3aL
	6GoNmHKVl78jW+yPuP0/vtUmapwpBYOtHwnTPswvVbMusUfUrZYnEhNjfGrxaOxujAIkE9o3dsRx+
	ewYYGuA6WO19XvHrKLmfymNXkSh4d57ITMU2Hj2YmuNNH7qciiP/cblvgycTe2/54QehkSqMQbNnD
	95HBdTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUam-001j1h-PN; Fri, 24 Feb 2023 09:42:16 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUae-001iyP-Po
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:42:10 +0000
Received: by mail-vs1-xe31.google.com with SMTP id f31so20625760vsv.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hup0iftcL4w1rRk5wtFimO6PxuW6uWdJ0jF6+XpUdR4=;
        b=ILlbVCTYVbpnbi+jGGAGx3PaoBWbhKoVb6P+oj/K1qHYViVWJaIetHfDytZ27sv5ta
         vbT1LgpOKrk1fogvyMOL2rd/aQi/sc4z2bOcGAXaAbNnwvVddJ97/I3KDSt8O0VZJeyV
         AWxdSUQjjBnxOZ60ohawiP8oRX2MBClGagJiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hup0iftcL4w1rRk5wtFimO6PxuW6uWdJ0jF6+XpUdR4=;
        b=dwS6HjfQ1mpoGHfuavbozUm1NhO92T9kwa7+RfDi5CrbB3oso3k6KVTePZScglTlKl
         kncNWdqDK/GpMmFN6iDIeyu3XbxXHVYez/RhItLPQod8VBIEhBR3X3od7xHzSJJ/WTI8
         uBnnNYxoNWbraVtLSV5EsZiZLxfLFJVAAEbdOgh47AMFejZCtXyPTUqcA+laCZEATlMI
         9VUxC4agbV+kIzpnPVIPflEv0juBM29g5Zh3DTrVn3Z4syOiM2M9grRpIreZQo/qwpLu
         PxmJHo0aHTFYe0Sop4WzZKEwEeDxSocnCVmf8p4ZvbelT3fmUX4VesvkeQU6i4/f4c7d
         DYAg==
X-Gm-Message-State: AO0yUKV4tCQzaaP2krOWwe+Ng0yzZdSULsX8AEjSnMaRlvZ0JlXwFOD8
	1TyH4jgSqdTyz45sExSjxFT4XRYA263S7l8XPtQbdg==
X-Google-Smtp-Source: AK7set9DUpz0pEONX2reqzfDYEcSwsr+i/Um3XAlW3+tABX0lBa5XkMywVbJR0HhqBPXZ89dHJNKXj2sT8/vLVhiVck=
X-Received: by 2002:a67:d21c:0:b0:402:999f:51dd with SMTP id
 y28-20020a67d21c000000b00402999f51ddmr2176299vsi.3.1677231723939; Fri, 24 Feb
 2023 01:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:41:52 +0800
Message-ID: <CAGXv+5HvQugnQjJbdqOuQKeqpFgJOvtzzwhVD9FL2CKgxxJYQQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] Enable GPU with DVFS support on MediaTek SoCs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_014208_844495_7F409538 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, Feb 23, 2023 at 9:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v2:
>  - Changed MT8186 to use only two power domains for the GPU.
>
> We finally have working GPU DVFS on MediaTek SoCs.
> On Panfrost.
> For real.
> ...and the best part is that it's going upstream.
>
> In order to get GPU DVFS working, it was necessary to satisfy a
> specific constraint (which is different, depending on the SoC)
> between two regulators: GPU VCORE and GPU SRAM.
> This was done through adding the mtk-regulator-coupler driver,
> which transparently manages the voltage relation between these
> two vregs, hence completely eliminating the need to manage these
> regulators in the Panfrost driver; this solves the long standing
> issue with devfreq+opp tables not supporting managing voltages
> for two regulators per opp entry out of the box, due to which
> we never got GPU DVFS on those SoCs, often locking them out to
> a low GPU frequency.
>
> This changes. Right now!
>
> Tested on MT8192, MT8195 Chromebooks.
>
> This series depends on [1].
>
> [1]: https://lore.kernel.org/lkml/20230223133440.80941-1-angelogioacchino=
.delregno@collabora.com/
>
> Alyssa Rosenzweig (2):
>   arm64: dts: mediatek: mt8192: Add GPU nodes
>   arm64: dts: mediatek: mt8192-asurada: Enable GPU
>
> AngeloGioacchino Del Regno (13):
>   arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU
>     regulators
>   arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu
>     constraints
>   arm64: dts: mediatek: mt8183: Remove second opp-microvolt entries from
>     gpu table
>   arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
>   arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
>   arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU
>     compatible
>   arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
>   arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
>   arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER
>     regulators
>   arm64: dts: mediatek: mt8195: Add mfg_core_tmp clock to MFG1 domain
>   arm64: dts: mt8195: Add panfrost node for Mali-G57 Valhall Natt GPU
>   arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
>   arm64: dts: mediatek: mt8186: Add GPU node
>
> N=C3=ADcolas F. R. A. Prado (1):
>   arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183 Juniper, MT8192 Hayato, MT8195 Tomato, MT8186 not-yet-upstreamed
device.

