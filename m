Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5B6D5B841
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3EiCf37zmh6OYCxevsK3wYl1l2l0yO8i3lRu2zzoOo=; b=ejQKyzeL2CXtCT8CkkB/q3vVKx
	HSNT9QLchg1gYLk6QYoBYhYBoJHz52iT07tA3tr1ZizRNgDlOo1qAvFU1+XlMWU0xRk37k50Gov1t
	lmH5vTBxnwX+R+11AhdAx/TmSpoO6JXgWbETq0dEn7D+qOvGg9s09UmMa6xSrXmwA6MHANOXTolWq
	hKe2Ywic37BN5wtDqQTbCPrr80a2k1FBEKUE4zfyNbla6gcuWELjfAf/gFyfkpNn6JbN/7PXBSnut
	F4P99vzO6ip5eKlpHK9oYfF9vdusDeRmP/GNTLZ4OpIasS47RuoKLsifbuNcS/qrf/PC6A0QU9mbT
	e7XuzSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAkN-00000003ufY-097j;
	Mon, 15 Dec 2025 15:44:27 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAkK-00000003ueV-0A6E
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Dec 2025 15:44:25 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6447743ce90so3502506d50.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Dec 2025 07:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765813462; x=1766418262; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K3EiCf37zmh6OYCxevsK3wYl1l2l0yO8i3lRu2zzoOo=;
        b=k/+/MQG2NEOmvBGiCKTyLC12xcKNe0xE0MMqsiwMi86/LyOfRZtHwpykQUEBCS8Nvl
         msg4Sb46UjwnVBx+csHQWjBTitx66mVcPLkcTeyLr1rPIKMAxBOq+SK4nuSV2/P83WBl
         IO1v2YE7MH0kTPrwz71ixnZO6wJXEpN2Aloul1HOndNszHMz4V5uVlZ78fFFqW4Wafkv
         9fPN72xiLKTdUgpGRbxlhtOovnJPh6Z0Z16I7g4e2wTFCzIKtppuaSrEn8EunVHyDmSU
         LkFudDWeYTOA70rNFVXnxdCWxap7hX7F5qiqg05cstKiOd6UQCUvO3kbauCuHI9bjOlh
         jYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813462; x=1766418262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3EiCf37zmh6OYCxevsK3wYl1l2l0yO8i3lRu2zzoOo=;
        b=bDNC5wFJWzq53LvXzin5b0vBwOZcckJYsjG3GOfB5TejgEbWSiQvvX/XLssuZB4lPD
         vTZeT21nFmwmwMXfoosWM2arivXV1Crxqh/7gwoGzNtEHGZiap/Pw1NQqFz5x3aPwxSu
         T0jdHWOpWITnmaohw/rFV5yhCWDhdpfbecSFWDZmMNYbscV+uA2Yfoh8k0ua+MC/J/pX
         NzXAr2HkAx4b7dbmb47tjZALygCMmeAA5n2/RyCieVlIIOGokqAtEI6JL55za13iQbpW
         x3KssjrNU8GCWEN+EOlk+9Bp4we2e1LhDYsyhRvrX9o4q0Aq5K5FqJJuu5ot4iLWDXeE
         f1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVOf8ssTyO20kcOZZ31BIOiLKThLG+J2X8iCSt1RxtM6Ti5/pgwChSJC1sW037Cb3oKkTyoqp2oPsGqn5VFZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0MODhpkQhbbTYlZ1kCulWvd9DYS/ovZOkcnpjM6yr9Ch61ChB
	qCfS6gGJRnks9CevlYk93p0xqBLb46f6rAr1LriObyZfZk/UKq8C3CWGJfO8DuV9+hJo5F+tnF+
	JswG+3J0U2owM4bwugB6VuoQSFr6mcsqCvoSzdJb7wg==
X-Gm-Gg: AY/fxX5ldEjiYNNYDXL3urq7wFn9ih/hFWxxwTlitduoVhV5ZtJAFDAbHOSlQ17splb
	FY7euo3Q8M5NK0K9XZ/4OBlJHk5R+oThlB4s/UfPycZMenVlrdSloRs6fFeo8r41MfdlZ+TXJzr
	eSS417ouFak0utOKNgogVWJkroOJR/m4ir9iUmLckBVP9ABAQNUD3yC4bMqTR6NjDNBZUvQWh4X
	U2+00dnDggxQ3YQTSoch2BSp1INLnVJtnQKpPOoVBj4mHHD8Gv3p+vNHlPbTb8Wsbgp/ws7
X-Google-Smtp-Source: AGHT+IGoFL7q8HvVv9KIvA1/iDdDg15+gVc1fqtWPGh45LUtRp806bxzNvgl8df7HOVfQLqABF6bjGbmgvq2nhhi7vM=
X-Received: by 2002:a05:690e:dc9:b0:645:541a:4f11 with SMTP id
 956f58d0204a3-6455564f24fmr8169644d50.49.1765813462393; Mon, 15 Dec 2025
 07:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
In-Reply-To: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:43:42 +0100
X-Gm-Features: AQt7F2qLO5M-hmnWGiTMCwqz4Oz4UGYnEMVnkbdBTh1zCvxxkv8BxBAberyOD40
Message-ID: <CAPDyKFoXoO-rpEK4Y-FZyWhpOumiwir96-XfLOOR2U1h73ADhg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add SD/MMC Card driver support for Mediatek MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, kernel@collabora.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074424_069168_0AFE8939 
X-CRM114-Status: GOOD (  16.77  )
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

On Wed, 3 Dec 2025 at 12:45, Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> This patch series adds in the Mediatek SD/MMC Card host driver (mtk-sd)
> the support of Mediatek MT8189 SoC and its variants (MT8371 and
> MT8391).
>
> It has been tested with a kernel based on next-20251203 tag on the
> Mediatek Genio 720-EVK board, based on MT8391 SoC, using both onboard
> eMMC storage and a micro-SD card.
>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Louis-Alexis Eyraud (3):
>       dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC
>       mmc: mtk-sd: add support for SPM resource release control
>       mmc: mtk-sd: add support for MT8189 SoC
>
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  3 +++
>  drivers/mmc/host/mtk-sd.c                         | 32 ++++++++++++++++++++---
>  2 files changed, 32 insertions(+), 3 deletions(-)
> ---
> base-commit: e47d97576181b31291cf58e77d737d21def0e160
> change-id: 20251128-mt8189-add-mmc-support-ff6df8f89e41
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

The series applied for next, thanks!

Kind regards
Uffe

