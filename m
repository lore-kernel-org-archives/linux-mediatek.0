Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E4BC5321C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=; b=G4nyp5661BgN8p0glm3jIwqMGy
	Nu8qwqUNxYHXbORv2ZEsgMQVMwU7rvAB3fYcXwmmUkEG0pKMu/whiZ3AcGk4nk02Q2JlrSfza87kg
	vAvIMQk4jdXdS38Hn4clsXYReRfUjxWN39eQU6/Qnec3HNc/zl/D3RktEAbBtRdLvE2o1CXQNJN5k
	B8jLu81MUZyx87gfmTethIiOa7Tm6jN0pgqox8RTVjp1vEftQXiLt+S3XEjiUCUYpoEZR4l2+cB3Y
	OymCuwc9t0jv9ojBo8ndZHBvSJMavVSWRsQPSlp/q7K7igHlKwuc0hsqEfYPq6dSRtJrkQbll8GCs
	dcIodZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHxe-00000002NQr-113R;
	Mon, 27 Jul 2026 09:49:26 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHxb-00000002NPs-2ah1
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:49:24 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-81f3b227a4aso29671687b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 02:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145762; cv=none;
        d=google.com; s=arc-20260327;
        b=HktohGX8punuwq5VaDw61814AJLzAjIEhSNj7BwUyXGtjOC6NDgHS5IJdxEYmFZeh5
         TpZnI64U2BMibgupN8H6hlyDZjFT3CHF51r/xdb2iIKSGEbF09prwcUi0kxT92XSTAVk
         vwDNwbZGi6AsdT+uLEyFYv/10ic1LyyM5wW62aUsM69OSXbN+GbFJwSrn1n/BsFIZ4E+
         ePAXXZL800AAO301R2QAfdupQMZiaB1YvaAF9v4bbGmdQFOvS4ARKWuHChL/EiyrcCLm
         4QBIUUkZBEb/dGSAT10HOkBHISYlFNwk/rmV/5qm0Hen6kZWir/gyoikaumVjIARuv5o
         6ViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        fh=WSJqTY+2ihp+eEt+39xzdnhN6/mgv45aVweY4lAc/bQ=;
        b=ot3WFkE+uQ8YK4qBQ5rFd8goE25lYus+RlLEA+crr4w7XwsWjtxuKtXlE9NA0E6rcX
         NX6uqbMcZu+iWFz1YWMBF/BJUUHKFUySoSamCeEdd3Ub4YeT6/jVxEgE2EneJAzM/O6f
         OLWzQ4r/xjGuN65pwqgX3m3kixvJIbSxyyXNcUTGvdAgQ504sUWtcStJNudVNqfcUrds
         6Xd8Bc3nFNN+tgexUgtqmoHGCcuL/eetC18aKIONPVLz0BKLXY0t/AIseYCIUbJm0td0
         Gmy8h+inpqQj9rUtQqKMB3wsT0no+iO4hE4SrGANf9usn8yB1vZqvY9WwJwFsoOTguJ5
         d0gQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785145762; x=1785750562; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        b=TSI4/I2iRMdcuwUTBFMSoRqeRL2BjUL7H/1pWdLzcGg+wruqjJzCKhHVGBmSf6DSfr
         JycaZiY8XtQ/TvArHQxglbz8zP105v182rgmHOvU+QheyFzC2YrbSProXEXmiwy2tP1T
         EdtptHMo0BnXfONrZSrBrOHLKCSa4NYcwF+Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145762; x=1785750562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        b=MEAQAsNksEbAAM5gC2JQTMhk3l5qeVygyOzUgVmmhauqsO7hhaU9LOZ4Z4D86JnKVO
         cn7uuJuxAcaBcuEFot1Du64eizVrqVBxoiz+AKPZ94+wza/PmlbnfJ9WLDA6ECOjJVwl
         GNebwAmSNSgPMqWjxGRgVJIRbeSkVv2ZdAOzEoRcPFR2MnKjO3d3AuaiISy1dRC3IZl7
         c56DCzNEArDSAFC7eCCQ22h7t8x+HtYRtC9bHlExmEwCKhDtolgtNQCFPE38y3ry52RU
         sOElbhgB8TbqO3fdT4dOWvNlIELEmgDhLlz2pT1oYxEpUX57gUUXXVkmTcIZN9H/LDiR
         at2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqNdDQuIb2qpriIKrM3frsZuOyYS0onGUl5+/S97ObQWX4KydrUsWw5fGk3KtHBCa+owqsg5TPCuRupAkACOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG2RVPuZ+FI900YUk8lxN0VFULiooW+FOw6xeodmpCraKhv6FP
	ZrGBS+Gn5/MtWQt/662LWIte4FJyuBGqNFKgy49E9XIybumPi5tOu0LVwzCLvwms+KFqNQ3oDq1
	a90stzTY2oq5XfE3ELfEVzW+37xPb+q0YIDDO4HFK
X-Gm-Gg: AR+sD13U608qMynlaMl3xpsW9dYou88Cv4w0/cg1uhscrRccogqmOiDnt/otGA0YJB2
	NJvoalNXDJYxb/iqcnJKtAOxBpsfaCjpp2LlhHaFHq8LAFd1idrH486e7wW7StOTNeYw5zWxsEn
	s/hOufLaSdd4G8f2Fm/VOyEm6PdPrEIf9aFvf5tEv775y+i+S8DNhZNUFGqkmqjNEUoVH6crHoj
	dgpJWEXkrTJpidqUYkdWb2wbSrrQ5osWSuW2oyr9Iu710uJS8Y0I0HoyySmB8XaaUhJvmkC1UkX
	WlRyH5Yvs+Zzhyo=
X-Received: by 2002:a05:690c:3744:b0:80c:85c6:8982 with SMTP id
 00721157ae682-81f69e5c41fmr26771557b3.65.1785145762611; Mon, 27 Jul 2026
 02:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
 <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Jul 2026 17:49:10 +0800
X-Gm-Features: AUfX_mymWG_ASKh7iZ4RJYyJ6_dUoLJGXydzUsgaPikOadmqrflcGR-sfKa6ifw
Message-ID: <CAGXv+5EM5P-cY2VW9MXc_iSjwq=QY1-OaV-s6W8wD8YTUvFN0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial ports
To: Carlo Caione <ccaione@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_024923_691275_79B1885F 
X-CRM114-Status: GOOD (  12.39  )
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

On Mon, Jul 27, 2026 at 3:40=E2=80=AFPM Carlo Caione <ccaione@baylibre.com>=
 wrote:
>
> On most MediaTek boards only serial0 is aliased, so the remaining
> enabled uarts get first-free ttyS line numbers from the 8250 core in
> probe order. When the console uart defers on its clocks another uart can
> win line 0: console=3DttyS0 then ends up on the wrong port and the boot
> looks like a hang on the serial console, depending on probe order.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++

>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
>  arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++

These are the only two MediaTek-based Chromebook designs that use
Bluetooth over UART and have a second UART enabled.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # kukui & asurada-hayato

