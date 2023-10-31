Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8999DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXhk8j7RgMYbDOudOHh/s7hOM+xUoPUnDadljYQRfhA=; b=0KOKmYohke0oQQay+SVV1oKFXN
	Z56d04DIibxmZ4raeA1rov60+LUmy3ciGRcgpAvddpAjLPLXO2KGSOPhA2eBrrXy8XZrsg5q7y5aP
	EZ54O7r/wlKeD/PGai6b3GpEKk/c2J9iKITGw8sAZcq/uIUlT6Ze3QJcv4k+UxwGvDfIADWkfPCSj
	bZKy510x5g58yFRkYKwYOV/fyCOMtTnNncvTu55kTWypDBcXuhlHUx1NcKMu99Kwp6v2iP7o5jX8M
	3fA3ExaU+30w60yikdMJ4KrKZMa2qYrirVzj0KtS/9VP2dKNVpD9A9dY8yNtOCwfuOQYMa/g1xUwX
	tuC6qQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkuj-004rdk-2E;
	Tue, 31 Oct 2023 09:19:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkug-004rcN-2v
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Oct 2023 09:19:56 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5079f6efd64so7555103e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Oct 2023 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698743988; x=1699348788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXhk8j7RgMYbDOudOHh/s7hOM+xUoPUnDadljYQRfhA=;
        b=DLaRC+9XXgswiVsSvgSkqSEHl1RHj1rodwhvmPmUHUfMyR68jkH/ZNvcQNrEwWrVD3
         M20sewNWQnFm38xnn+stCXSpIOC3b5BcZsRLap+QLUlmXm4uiuc43ERTPL7iAgqfPlAO
         1/35p/0eJfe26y8dAXlyccQicilgZoHaEZXvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698743988; x=1699348788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXhk8j7RgMYbDOudOHh/s7hOM+xUoPUnDadljYQRfhA=;
        b=PwrmUYlta9BVWutd92FNoK72GJPkWUm3vQ7uEiuxa4ouzBajAjYBLePGDalCDzNhZG
         P/nI6hMzR8THuIVZ5lX0/qFnyWExycLtovltsDqfZ3Z13O/MvgRT5QbgnKotzWNoXueM
         iVyb2ICu/bG2imzENTuUX52yRod6uvb363lRLRISyoA6tpNo80dfFZLudls+DIZfIx4k
         SflK8VdC7vUXUdisxqc8Bx+ia/Q1QXFuFGtU0rbNRlsY2C3kIdk8Uh4Yxdt8UHUqO+eu
         Zbs5M/4KF9nbt/z6x9aVwvmk6otHNdJOrOvv9JaViDDL6pj++wCuBGAgbMWRcbYtjC1G
         jaSA==
X-Gm-Message-State: AOJu0Yz/NqTAnO/Nmom2OCSCIfPmB87c0KEhc4cwjndsLHXM1jzgTlZV
	gkjFcht7EWbjpTbov3LIpDE4Y9ITBYNTD0WJRX1Ydw==
X-Google-Smtp-Source: AGHT+IFn5yWC2uhLfXCKgv1dEdMIAEZF0taqktQ/pQKq4j66LgSHNMQAoiTD3AocqF86NDROFv5aLWYwvNc/v9aYlPM=
X-Received: by 2002:ac2:498e:0:b0:507:b935:9f60 with SMTP id
 f14-20020ac2498e000000b00507b9359f60mr9079538lfl.57.1698743988383; Tue, 31
 Oct 2023 02:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231030132523.86123-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030132523.86123-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Oct 2023 17:19:37 +0800
Message-ID: <CAGXv+5FWPZYjsXse58k5HyMijkrKBDYw0k4wpdfGv99ur8=5yg@mail.gmail.com>
Subject: Re: [PATCH 0/2] MT8195 Cherry: Assign MFG vregs for power saving
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_021954_950794_976BD3BA 
X-CRM114-Status: GOOD (  12.12  )
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

On Mon, Oct 30, 2023 at 9:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series assigns the right regulators to MFG0 and MFG1, respectively
> VGPU (GPU Core) and VSRAM_OTHERS (GPU SRAM), and removes the property
> regulator-always-on from both.
>
> This allows to save power both during runtime suspend and during system
> sleep; specifically because:
>  1. The GPU SRAM regulator is switched off during runtime suspend
>  2. The GPU Core regulator is switched off during system sleep
>
> Of course, in order for those power saving actions to actually take
> place, it is required to also have the code in [1].
> Anyway, even without series [1], this will not introduce any unstability
> as the Vgpu regulator will simply not ever get turned off.
>
> [1]: https://lore.kernel.org/r/20231030132257.85379-1-angelogioacchino.de=
lregno@collabora.com
>
> AngeloGioacchino Del Regno (2):
>   arm64: dts: mediatek: mt8195-cherry: Add MFG0 domain supply
>   arm64: dts: mediatek: mt8195-cherry: Assign sram supply to MFG1 pd

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on Tomato without the power saving patches. Regulators are correctly
requested and I can see the SRAM regulator get turned on and off with
GPU usage.

