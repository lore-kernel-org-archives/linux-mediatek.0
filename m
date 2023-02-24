Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B5C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbnXOoIvCwre/+4QX5AN/9RjsRsacNnY7HA3dADS82M=; b=nDj4hp2tAtxYtUOzqTKS6xS4Nd
	p4vjKKizui1NtUEmxjytV89WAR8Bf8HzfJJCr0v3bo643dwqZrRjtWQ/ZT1J9A3q77jeu3SutKQvU
	joVRvv/hSHrLUz6k7m/5T6amYnlcxG3x5U6NgNDnO3+ITYq/Wtdp+UIJfZCDAAH+1Z/tAZkN2E8qq
	0APa3N4++VXe+T40haVgI53bCglXFQNGaxHmzSyfGGwAws7zz5/vg438WI0qYAWvC+j9fnX/CWkgB
	MUZ1R19AEUYXvk+pCH3bSSaQVAHepBCkzVL3CQt7ORnyOYamKOYBJuyZj/SHbqf79N8/pl9Slr0jF
	Av70IdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUbo-001jJY-3m; Fri, 24 Feb 2023 09:43:20 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUbk-001jI7-Mn
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:43:18 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id d20so13087860vsf.11
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kbnXOoIvCwre/+4QX5AN/9RjsRsacNnY7HA3dADS82M=;
        b=SSI0N/ZzzZtFN3NC9K9DXhTBJeR3c8kHwLA5fTMTff0SyrOe86wwffe3Djlo0gYd0f
         6g64G/BHBOijusArADG/hxf6rlwCGwFkRKhecjiHfm1e9LFUFnB/sJTf5NUQq15Ht5UV
         Gc1zD7tqJ1k8N8zfsQK6IWmeY1a5VmYBokIxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbnXOoIvCwre/+4QX5AN/9RjsRsacNnY7HA3dADS82M=;
        b=EO1YBbU3DnUxCUKS8T3PGD2HsEhaITg/fkr+EpsTCi5ZQ76O0D9EUzDNyh1oE+gxor
         GsEHe6SuEh3hSPyNI1XUxL+mO4ZYcEu7ibK58k9iXAojcX1tbByEocR8qjrXJt/b35na
         mXIoYD6i02MiE67VSIQQ+4o7948MYAmLnlZuGJLSlONU4KHXa9qmt55eXkPq43Ej8R7w
         yBcZ/mqvxmnVfgS5zI0iZE0xiIoZy05B+yEAhLpKW5aXINMXfKAg9hVqWo8RIidjslya
         fGz+HE6HiSv5NCVuYnl4UFUDqtUW5RHC52vwUQUQQ0qKGJlrDFYvBezfKia34IOv1B7q
         kQ4A==
X-Gm-Message-State: AO0yUKX5X9DrkLKd1lnckWX3agvQ3IUisRM3Pu4oCvOvG8zpxEawG+YJ
	YE7Pp1tpJZiq9g+wIwUGB4PJ7QaNEcJs6g5u+oS+WQ==
X-Google-Smtp-Source: AK7set/KpmOufYOT89amku4MuWdzdnK+6D2wu9CS/8jhVNSAh5wdSQfoQxCA2kg+qARRnk13Skua4AsQwc/ET0fx5nE=
X-Received: by 2002:a67:fbd2:0:b0:411:fff6:3cc4 with SMTP id
 o18-20020a67fbd2000000b00411fff63cc4mr2067609vsr.3.1677231795727; Fri, 24 Feb
 2023 01:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:43:04 +0800
Message-ID: <CAGXv+5Gcnx4cw891hDTsSzMQsw+NAR7Le7FkUejEJCL-MMsktg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] Panfrost: Improve and add MediaTek SoCs support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_014316_762710_5611D96A 
X-CRM114-Status: GOOD (  17.88  )
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

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v3:
>  - Changed MT8186 bindings to declare only two power domains
>  - Added a commit introducing MT8186 specific platform data to
>    panfrost_drv
>
> Changes in v2:
>  - Add power-domain-names commit from Chen-Yu to the series
>  - Kept sram-supply in base schema, overridden for non-MediaTek
>  - Added Reviewed-by tags from Steven Price to the driver commits
>    (as released in reply to v1's cover letter - thanks!)
>
> This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> and improves MT8183 support: since the mtk-regulator-coupler driver
> was picked, it is now useless for Panfrost to look for, and manage,
> two regulators (GPU Vcore and GPU SRAM) on MediaTek;
>
> The aforementioned driver will take care of keeping the voltage
> relation (/constraints) of the two regulators on its own when a
> voltage change request is sent to the Vcore, solving the old time
> issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> supporting only single regulator).
>
> In the specific case of MT8183, in order to not break the ABI, it
> was necessary to add a new compatible for enabling DVFS.
>
> Alyssa Rosenzweig (3):
>   drm/panfrost: Increase MAX_PM_DOMAINS to 5
>   drm/panfrost: Add the MT8192 GPU ID
>   drm/panfrost: Add mediatek,mt8192-mali compatible
>
> AngeloGioacchino Del Regno (7):
>   dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
>     variation
>   dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
>   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
>   dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
>   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
>   drm/panfrost: Add support for Mali on the MT8186 SoC
>
> Chen-Yu Tsai (1):
>   dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183 Juniper, MT8192 Hayato, MT8195 Tomato, MT8186 not-yet-upstreamed
device.

