Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1D2D42BBF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2024 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1iJJsP4fxx81YgiXQugBdedKb3vFmcw2IIeFVVTfWc=; b=MxR5gq6N4o81Wf4+i6I7LCHKVD
	P6UdBYjxn6ZqSKlWsubndAsiSqrAVokflXkpVU7Sj2cR3epClTmI66tdkWJNmlOR2epwsZjIn5X9d
	1DafTu471w7oPOLIIyXJED9tneuBP8pmaeMO3OIVk40IPOxAOkgQUALs7FKkC9+x2YkB4bi6z11PW
	Kul1W4t/ivoso3/gCS2ZGr221TqVPZeYFiyh6EfjLfamFkaDywAlNBhuVwrzKyBfvuStq2xdgQIBh
	HoYrmCeKptIEurK/EaqE/KcnMA2D8OL8FTYKAvR/1aQqv0s0eWTLKVVL1aO6jpglKzLwL2TmBZB3r
	aOC58fFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDSn-00000006v73-1ctu;
	Wed, 13 Nov 2024 13:31:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDQ7-00000006ucC-1ulf
	for linux-mediatek@bombadil.infradead.org;
	Wed, 13 Nov 2024 13:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k1iJJsP4fxx81YgiXQugBdedKb3vFmcw2IIeFVVTfWc=; b=UNBKxkevy8vWXaq7RsKtitS5f+
	iloqKq0SIU7Uttv4bl16GkrwAwSzTPLFFaN3gYsLkaOW1f8S40cb5gs/n7YOFRC/4+Mew9EuhtGgK
	9vstpooNEwhs0z9vuqMfeLYdoVgPhMiDp8/CsyZQu1kNHh/Cg6xwmLBWXF7GLa1m9cDn1oWfFvLC7
	H5VRebJFSha0PNXK6WiJvWoUN+x8G4cw0B2a92i2BzZnQZjYU+XFsH+yopDYFhzZFUuhm6qFBNmzr
	QMQ225vw2jaM3hg8ugdCgaRlMRVyGKSrSzvKEascSLy8hBqUsbs1QpfjFnEq95ePp1iEFjD11uJ36
	Uz+NXGDg==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDQ4-0000000DHI1-2DWs
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Nov 2024 13:28:30 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so46938251fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Nov 2024 05:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504507; x=1732109307; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1iJJsP4fxx81YgiXQugBdedKb3vFmcw2IIeFVVTfWc=;
        b=WzEGVqm0CzKOkdvw1LrTRiDHPPAm9vJHU4aSYqFyPH/G/Sl1JDxE483USB0IW4Tanx
         kjRvnlkgZiVYnvPQFan0Wscqr6aWXcvjGrc1HZjGfpsA0tcWm6LoY/iy3OrCQZg/qQPj
         xY5nT/LqdIPHMZx2Ej7k/GllECVcTJrbHvfIzdiDesTXYl+F3mlnnuN8e8f8CuvBQGOn
         QZhh128zPIDquvOUOmrV6ySklebRQCpICLoYmBf6OhUPnyWBE32Q43R0XHupKfZU74yl
         j2pHKWTNW/LL6y+KriAtsmp33x5QrUOsYBKOIg4BRxSJ37qhWBqJ5zF72EH7NXUDyiI5
         u46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504507; x=1732109307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1iJJsP4fxx81YgiXQugBdedKb3vFmcw2IIeFVVTfWc=;
        b=cSQexlIh/aM5wg5zDUMN5u0Lux/6e1dr7fYgzDXZotmq2o4EuFtXHiCqRJbv/8bPiY
         GHfDd0ejdYjZFAbrMo4Osr8WaDi5FNNUsJCZXMN6MxtUA91C/sSLn8Q2LzkuljwXWHno
         efZNXsL3BtcYyjEc8/k3lRApDVctqyJYvRVeOkaZOi/DAUxJbnYY5AErsY2QXZz1Ber2
         LvSJ2tFsuyZX+qfUOeqjCfrnaUwcDN38jZD1uJvSrvKhymg9z4y3f4F9PABAM7AX7jYE
         r3CXoQ8ZvgGfBYBYMgUuMj/T/1qxA3/MF6W3RxtFMYcnpRzE9xHAgP5epjpzIBI2eCUs
         MsxA==
X-Forwarded-Encrypted: i=1; AJvYcCVJyvEh2M3K8h0GX5i9rGrOyHKiqsGpvuZ3zk7MSRLPRrtCa1W64RCmA8GhwIGw+MoadtSHggge5fCni9ENeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDmoq9FV4LbVVfhSYYo8XqNSmuvHTrtPTW3CS9DtvSZecjK9ST
	lwqHkTPEuduRaNwJqlIM8w/I9P5feYvS2drISc78sp2ovvwzZMG/eYd8xJFcKBd307HPxTVhspJ
	lkruTAACU0C7UwaMQubXPog1kWzAUZnZqzd5kXg==
X-Google-Smtp-Source: AGHT+IEkgrAvnkTJ5cspkFy9GX1VNIhsj0Q/QVeiK2QhR4qOF90RwckXKqpwSLqoIaSOg2O9mBFnXHSu7X0RYkS3Jm8=
X-Received: by 2002:a2e:a542:0:b0:2fb:4994:b31a with SMTP id
 38308e7fff4ca-2ff20128504mr98330701fa.8.1731504506913; Wed, 13 Nov 2024
 05:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:28:15 +0100
Message-ID: <CACRpkdaUYuNBANWyTcwbE2fS-STyGiV4hzOQ7rS=Q1cc2O5b6A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
To: ot907280 <ot_cathy.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>, 
	Guodong Liu <guodong.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_132828_786046_32851BEA 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 11, 2024 at 9:54=E2=80=AFAM ot907280 <ot_cathy.xu@mediatek.com>=
 wrote:

> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
>
> Add register address for each pin config.
> Add the function for each pin.
>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Cathy Xu <ot_cathy.xu@mediatek.com>

This looks fine, but there are no device tree bindings for mt8196?
What do you expect me to do here, I can't merge a device tree
based driver for a hardware without DT bindings.

Yours,
Linus Walleij

