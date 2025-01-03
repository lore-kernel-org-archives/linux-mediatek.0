Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5CAE77188
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 10:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3u4oGWBQKjEPREELrdTT/cBTk6tLIvMbyFiElHLVLk=; b=MjozdS8jlmLVKHVdXvm3rcFnfI
	U83quWgc2Dsh34d8hsLR4I4Dab2ko2VtCNDx4dEFSiUwsgREsa23jrErxF4rbQwxprsAgy0aQAmje
	/2ECazQq0LsSBW1w3noqw+tnpQQ9Nmk/CkRQaBTJzvvSTwVeXdgWhvZ+U4zk7yILTlayYDIdMN8em
	1MQYTdLLHtG7oyzwda8Cu/sAEWU2+FIqtV1u5ZF2XSeqmvYp1f7NT2ZxyKWBpPXZbrz6eY+nTeOBt
	GVxBf8TKzh0cbmvFZbmRp7ATTAde3APQeIofB1bilWRhfBQ6q54JpUAUuEUMPdRrcz5X6pq7XMT35
	gnIlbgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfOB-0000000CmUz-1O2y;
	Fri, 03 Jan 2025 10:58:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfO8-0000000CmTY-1Kp9
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jan 2025 10:58:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436202dd730so87005655e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jan 2025 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735901922; x=1736506722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3u4oGWBQKjEPREELrdTT/cBTk6tLIvMbyFiElHLVLk=;
        b=yvv+Yvo7/O98vcGgDyN9gaRrFYfwdUsB7eJhF09Xvr8mKcNTlh3IJvofv7eqdRfQfF
         kLgzvpGn9iDeJPPIOEkOyAPj6HtVN6R/eW06DTcPdaVl9TTkzF34gZpzIorhc3txxLd5
         kHNaWoLrQYhv8ThwlcM+zs9csV+DJvdja/TujzVN1ejrdUCqo4CkQK38TvSi5t/EIzHX
         Uf2F/vPRiLIl48CedImnOT444VH+KomvRXMZzNC1si4SFbZnjCGKZ2FmgPAfDb1KM4Ko
         +KoD6ckkzLZVt3bI0hsujaX3E/pvStfzDIJTFDoxykIZH0EHM3AZ2snbuz8hV3vWy8Wt
         Pkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901922; x=1736506722;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3u4oGWBQKjEPREELrdTT/cBTk6tLIvMbyFiElHLVLk=;
        b=rIyuWh44Nsd46snWZZTiXah9CMu4Wi48eTAW9u7SyEVRYjZLgM1EB4gfwtBdiiOdTb
         FxSheFyg4qmkVK7ESXXDrwc2w5TiOiCsQTgaXeDImMkZGW0njW1EL5i4EyqQfcrzlp4G
         n2X0RtEtrFWyTAyua9PbadhCZDhzw0zhLEle5qY7OhW/DHz9KdI+iznnSrA4/FYC03jo
         scW61WdlqtfCvrgnsZZHPm1pZ1lY+86hZF2Jun/JwaLblKtudaQjOqorQ3T+i1nJsgh2
         gOyKFr8M+PwVjjnGy7cfvZ7Nii7sQ4geOARaLWMIO3TlN664c0+Hw0mOYLo+hmBLA8s7
         a/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUG8dKvHVwr87tx5P6zbd7r/9biCC1NU/0m1viZzICrBSq09f/al2FovGbUwmFvW0VUJENtUr5bKm9yuqPWRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYitu0bAhde1zCFSNUd0kscbaH2hiJuyUXy6f8dLda4qBPW1bW
	XOPBWUjJBcOWZDcsMZeEG8AQeY0Nf2UOYSTyCPxA/d74mANKnclkTCBe1efYrNQ=
X-Gm-Gg: ASbGnctV+DD5xQG6N43ohpnAgFkJgtI1k38GP4UNyIViN4FyVM/AKqvkr+bu8E0Whhx
	ce5GUuxF0wNxImWmg0i1+6RnNdVGNWkxy57VIN9cDXCw13LQRXcvQXGKLJ4vqYssoc3MXfZQAcE
	S5NL1DASYU9dyPCFslEVbFI+vMx0pE6LgZMh4B4MxJ5mDpXZHpTRuQn3Q2wDIXBArDEUoAu+W6Q
	1OIV342SdS/5m8s2kXU4/kSiion2huavgXup0TRJ7fhpnrD3PQ5jkd/6ng5T3w1qA==
X-Google-Smtp-Source: AGHT+IFjtv32f9kYfRVKeyGYT0IEP5Qw+m/gGOhzKk2Cr8BmmZ9Jl41YENFOU1sjQfF0nAEj/HJdsw==
X-Received: by 2002:a05:6000:4703:b0:38a:69a9:af91 with SMTP id ffacd0b85a97d-38a69a9b0a9mr1730131f8f.13.1735901920712;
        Fri, 03 Jan 2025 02:58:40 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a28f17315sm35078406f8f.108.2025.01.03.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:58:40 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Val Packett <val@packett.cool>
Cc: Val Packett <val@packett.cool>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Fabien Parent
 <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>, Amjad
 Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
Date: Fri, 03 Jan 2025 11:58:39 +0100
Message-ID: <87jzbcnoyo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_025844_357225_A7A4BDAD 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Val,

Thank you for the patches.

On mer., d=C3=A9c. 25, 2024 at 16:26, Val Packett <val@packett.cool> wrote:

> The mt8516 patch was previously sent in another series but rejected due
> to not using an mt8516 specific compatible - which the other usages
> of this driver (mt8183 and mt8365) weren't doing either.
>
> It's only fair to add the SoC-specific compatibles to all of them then :)
>
> Val Packett (3):
>   dt-bindings: mediatek,mt6779-keypad: add more compatibles
>   arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
>   arm64: dts: mediatek: mt8516: add keypad node

For the series,

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
>  .../bindings/input/mediatek,mt6779-keypad.yaml        |  3 +++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  3 ++-
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi              |  3 ++-
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi              | 11 +++++++++++
>  4 files changed, 18 insertions(+), 2 deletions(-)
>
> --=20
> 2.47.1

