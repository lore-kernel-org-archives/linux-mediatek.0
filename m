Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E40BCD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFuELjL9wHU3/r3v6NC6dkdDKAH/Ysa2Z6sZ78BU0lw=; b=n8HbD+KHws5Q7L010HoKFsJaPI
	uxbWjdeI9BQg+/mtw1wB3UrC//1eK8uC/dBjhgB0v80LKIYNtZ3z+i7LRDE/oLDFNhqK7/1HInSqp
	3rwU6wzIzBw6SIT1J8BOSPxOfydq+OqDlePcabvTwbysRnbH3eIFURdqe1+vWSLgk1Ds30LMTtssm
	lw2VHPb8oXojFQaHwq7evUKuQZrOxgLa3oJeGctgiotvUsQ1rGORs9PxjtlX8crwbTxY7iZuPPXUd
	h/Ps21zhst4WqP4WQ5Gc+DQZY1tA6CdwOO8GZ6k8ZkRMTxPavi0y4C6Y5ZS/Isx3y7El1G22Xc1gG
	N9686GGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9cl-00EqOJ-0b;
	Mon, 18 Sep 2023 08:28:55 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9ci-00EqNU-14;
	Mon, 18 Sep 2023 08:28:53 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6b9a2416b1cso2822743a34.2;
        Mon, 18 Sep 2023 01:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695025729; x=1695630529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFuELjL9wHU3/r3v6NC6dkdDKAH/Ysa2Z6sZ78BU0lw=;
        b=RBLeZPb1hsiZYsQcKrdZ7c+uLt06srA38eDPE+g5fdUCuzlzwiouLFuwlx8GhYYOeX
         GJIyRi9ZeouQ4+qtDWnlbyMKhtDQVgheNgvzRU43rQ0o7Q5Ny3TSQMBC7vZm/5KURXbw
         T6n84XscgjXMHdUlPDTuRe/aykOlXLEccgxTKQyc5+yWX1L5iGIUpUkizV5hHh0+Byov
         yMmOAZ+L0lbyvIs81nBQNCmXgzolEbZFw6Zb+eXqYLtHo+2jYRQBHL77r52IW4T0Rlsb
         vjkyVzPRhhWNPkVoBzg4a/hbNIdV4ycwXs395dDRtpz/mjnWzsJSYnAkm0zjxhipA9IX
         knfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695025729; x=1695630529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFuELjL9wHU3/r3v6NC6dkdDKAH/Ysa2Z6sZ78BU0lw=;
        b=gCQ5TxJPJOEuOS52Ak8oLXfVMP0wfx1Z/BdtS/tnXeGY8Vc1QcuHvRJcEOOkTVrYCw
         +tB2YQyks2enP2jiBxODl+gEKmfEipXAvjdrg1LuOg/YirgI1tnH64WVMUL+90aURExw
         x9rtGKZttlrKnCM+mtsyXI1CiuI9z6DPrGjooalhN6J3nP8i6E1LnflVzbbveITawIg5
         IAKpcFhNdDoo6s+2/nTBD0HMm8p6FsAx0QxXuokVGzlU+j1V4AFCJi6ZYXv8Rd2PNlTq
         aD3YZSfIq9sD8OUzklJAnQZMldtAHB9x2pU5E72P6dupqgX2zoTKuzfVCGv/IQpZOcrU
         FXDw==
X-Gm-Message-State: AOJu0YxeJB+VN5ISo8toQf96x4+gRGrNmeoPsjT2uRfKZc39wumi6L3S
	Xe8GrPHqm4/SnhwKuxwBYatVPK4P5MyUNQlmTn4=
X-Google-Smtp-Source: AGHT+IG4kn+qWd1PhAyH+rl4WMfKjGa4HXKlnZITVifNV3eU5cCeivDBadKLeEFA6nPd9OZgAYGvv8f66qRINkj3Zxc=
X-Received: by 2002:a05:6870:c08a:b0:1bf:2ad9:8dae with SMTP id
 c10-20020a056870c08a00b001bf2ad98daemr11496221oad.45.1695025728955; Mon, 18
 Sep 2023 01:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230918075915.87029-1-arinc.unal@arinc9.com>
In-Reply-To: <20230918075915.87029-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 18 Sep 2023 10:28:37 +0200
Message-ID: <CAMhs-H-mDrPDOVvxsQnUZPLqC5YVOO9O9FhBcbAZ7vb7c-V=Yw@mail.gmail.com>
Subject: Re: [PATCH] mips: dts: ralink: mt7621: rename to GnuBee GB-PC1 and
 GnuBee GB-PC2
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_012852_373431_26FC4D8D 
X-CRM114-Status: GOOD (  11.20  )
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

On Mon, Sep 18, 2023 at 9:59=E2=80=AFAM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.un=
al@arinc9.com> wrote:
>
> Rename GB-PC1 to GnuBee GB-PC1, and GB-PC2 to GnuBee GB-PC2 to include
> brand and model name.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts | 2 +-
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

