Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FF2C54798
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgDyYN4gqhMpyCBDK9N6WOirh+vNkj7cCYbnXyp9xlY=; b=Kwi6tN7zKjs6ejCIPpb0f9Y/QZ
	DoOVeujCK7nciThJ60RXS9maHh3a6u96OLa7w8hfjVQfVZmyIHYsuW3P1FGZDYEB9dVZiPKe+CLdq
	Abe3N6lSXig+pPfuMKd+8s2fw/preyN5BJu1wO0Hx6ruRYrZ0ApSPTiCiLOrx/v8pQFUFo5XIz6hk
	FlzOHI8yu9IYYL0NSwNyKws4TzVjvy8ZmJrumyQ5FpgDP+k/QYsf6YDTs63yLL7Na7mVOnYoqdJov
	dQ3ueO2sTMJC+PinOsU1ZBZ0w4G3au0MGiXnmhB5AqfgSGFevLD1a4qMSkigM3+Qka3jQZjeApkEX
	IBf9g9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riIHp-00000005qC2-2dkF;
	Thu, 07 Mar 2024 18:16:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riIHm-00000005qAc-0tbe;
	Thu, 07 Mar 2024 18:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E28BFCE222F;
	Thu,  7 Mar 2024 18:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBBEC433A6;
	Thu,  7 Mar 2024 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709835363;
	bh=dPTPHjpCRLgFm/lxnmSiKFph90OqA6fCyXoBFtp7HgI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cbZ6kMNFOkqi+7zE5sc/Pm/lwZqYTLfDaqQhaj5pW8MtTwucVP5YmR1AI7k6Ne9K9
	 JF1MEO8ho44ojQvrGTotYT+v8JVtyxY5cIdkxj+PafS1ucT4/mopGa/TP+bOkkCos5
	 WUK263hl8RH7XSBatFCN9LEX7M0QkziThw8SWmjM7t4ZnjXUAM6KYOE3a3dERknIz5
	 5cS43qeFOkK+pFb23/H5NKciBwgsqwjM2PBQV7yPnRW6WmafhGkkTe+eaw0Td0ZJFm
	 f9N2a2PxwIuS+SSQKqIg5/pFdUCeaFNgxP/2mpA23OYbdFUc9f8it6c+IbudqBIT3G
	 /d1f0QizmEvOQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d382a78c38so13683431fa.1;
        Thu, 07 Mar 2024 10:16:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsajwO/cJZxz2VtbZktdkoBDDFUR74puC9sw2Y02e61HgV0ECRwOZloGYHJS9drjmPQGvTP6rJUNNZpU8X7MLqJFvu+qrNbQUmTZblQuBURJSHFukpbhmkMDaqwt/k9yLLhKgGVd9AL3SfYv5nA+5g0A1fhCwLU5k=
X-Gm-Message-State: AOJu0YwxbHwkncuSCG6p8UkVaimTEc7MKLAfu2e9D+BPja+NKoP6K9G1
	l1M4u78BZnbh+uTU8GFTYK090mlgZJL5FaANEOMh9lzS1L92EuB+qzZeuw6PCgAPSbdbHoAfed1
	UIm9Qeuks+D6QWIUze9eRALUzlw==
X-Google-Smtp-Source: AGHT+IHSczJ87wbSLjyRnbI+ltnna+Ea2X/Todom8MfI6gfwI0NKJYZDpNsic5AtpHJXDE7KYe9zt3aMQkOjFiGtHhs=
X-Received: by 2002:a2e:3317:0:b0:2d2:4637:63f with SMTP id
 d23-20020a2e3317000000b002d24637063fmr1814686ljc.45.1709835361141; Thu, 07
 Mar 2024 10:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20220929122901.614315-1-angelogioacchino.delregno@collabora.com> <20220929122901.614315-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929122901.614315-3-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 7 Mar 2024 12:15:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKrad8JndQhxHAYjFXPkj7eaJ0GXqkSJy=xrfa=EHvOwA@mail.gmail.com>
Message-ID: <CAL_JsqKrad8JndQhxHAYjFXPkj7eaJ0GXqkSJy=xrfa=EHvOwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: timer: mediatek: Convert to json-schema
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_101606_477930_DFB02EE5 
X-CRM114-Status: GOOD (  10.97  )
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

On Thu, Sep 29, 2022 at 7:29=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert the MediaTek SoC timer txt binding to json-schema.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../bindings/timer/mediatek,mtk-timer.txt     | 47 ----------
>  .../bindings/timer/mediatek,timer.yaml        | 86 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-=
timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/mediatek,time=
r.yaml

Looks like this never got applied. I've applied it now and added 8365
which got added to the .txt binding in the mean time. I'm not sure
it's right though. The txt binding says it was CPUX timer, but the dts
says otherwise. The 6795 dts looks wrong. It says the timer is CPUX
and GPT timer. That warning remains.

Rob

