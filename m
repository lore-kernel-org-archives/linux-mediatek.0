Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CFCC61DA3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 05:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+YN0F1HdMnuHar7bYxgXcUl3w2yvmhyQJ80J9Xov3w=; b=fhhXRvjLUKtBg7hVdfEb3nMPt8
	gqIXOUx5sonxShCy4PX4mJLRrCZw0YQMfWKOZjLhCfcAKvfCdGTqpDqTJ2z0lNf6CaVCt2/wh+/Vg
	BmxX9Y/zAJsZg5TgwkfuYfuoM7+0IMhhFYYa7Foz943JY6nH25GdkU52lRXIcHgNvW8BHTiGyiRgg
	JHq/IHXPGZlm9dCQhaOZyuVyY70gcQVl6xqLAhpLxftShRUNbpDM0s0cGyZFfxdfEYvEY1qyi/Mya
	1pvDZziX+q4kVQMQbh6s3X2aC6RQbYfjc1/SnJ17IlfPciKTEUbdUzG/SAU33vF52aBIcHw6cy1d6
	hebEv41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ2zW-00BL79-FL; Mon, 06 Mar 2023 05:02:30 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ2zJ-00BL4B-E8
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 05:02:20 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-176b48a9a05so2709057fac.0
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Mar 2023 21:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+YN0F1HdMnuHar7bYxgXcUl3w2yvmhyQJ80J9Xov3w=;
        b=ItWJGW7lsr7wbvnu6ME9BwD1nZQZvcD9vVlnblE6VBHFjy8ReTooeadcSJqmr30ff6
         0AOY1Cy4AJwN0EBENh4JBC2yMq3NoPCByA7sPNrmJznVewgLrsDnWCsIHWmoacYGN7yV
         3mMYseYZ9J/Zyepqu4YMQvo4JUm6bRzWHkDPTd0/KkVJSOvTztbaKEs/12Z31xeo7gge
         Xe2nhDVhe9vtY8QSuxANt19DcUkfwVkcBRavmrRXwBqaPG9hmNatOUYRZ7IBUBhzErTT
         dNuC9O6vpABj4ZbYv7W2ubYRbmHmk8m+ZU3IA7lreTzBCULLqqsfQcXpP0YKThYZWiRf
         v1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+YN0F1HdMnuHar7bYxgXcUl3w2yvmhyQJ80J9Xov3w=;
        b=vJff3mgGCgBmOWLpT8SzJqm0dBQWHrUk5RcbuYGcI1MnA3CpK4/CNOtc7uMO8rXAWZ
         6j3X7eUbOPOFl3jBzimFBfltDEeIZa/5f0bFEwSNdOt+i8jQX9bpCvlZ0fQenfvchRSK
         NiqT35i89iM7xN2UiVDrIpshrTgSmnJFE41/94irieuYweKkHyNzrs7+mnYw3S80CK9R
         soCG8/Y9rI9U0sQ2BvpsWjesNj+RxyZ/i3e8rIwaRUuADrOyMX0qID4AQWLhShGfsgZ9
         VBhK7MqWL6oqO1PYOG5av1cNiBr2uWrGgOEs3+mZ5uNPd86c05LDc1yRc+48sT3zU1ob
         vgBw==
X-Gm-Message-State: AO0yUKU6pONE+DYBU3GEHii2/95Gp+gR2atF9MO8B4WgKmIQJZ1nK4Vr
	3G2cBKPVDVC7djnug9Y+ZlzimpRaR8YKTXChJncAbg==
X-Google-Smtp-Source: AK7set/9iaPE1Eoe9S7cRkBeIC+gf9mbqi0d7/xhCAKDgJI1/mpRmwm0jwRInDR61SswWXR9KP7wakxA0qSFMhi470E=
X-Received: by 2002:a05:6870:1a97:b0:16e:ddc:2d41 with SMTP id
 ef23-20020a0568701a9700b0016e0ddc2d41mr3175791oab.6.1678078933888; Sun, 05
 Mar 2023 21:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20230125143503.1015424-1-bero@baylibre.com> <20230125143503.1015424-10-bero@baylibre.com>
 <8c348b39-67f3-9210-1929-8b2f093be24c@baylibre.com> <Y/XenZUmT7Nh2qGP@kroah.com>
In-Reply-To: <Y/XenZUmT7Nh2qGP@kroah.com>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Mon, 6 Mar 2023 06:02:03 +0100
Message-ID: <CAP2ifjPvsvPyF56=YXrc9Ti6ZSLOxEXbMCOP-Qa4ZSempfod=g@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] arm64: dts: mediatek: Initial mt8365-evk support
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org, 
	lee@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
	daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com, 
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, 
	allen-kh.cheng@mediatek.com, sean.wang@mediatek.com, zhiyong.tao@mediatek.com, 
	khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_210217_706578_0892128F 
X-CRM114-Status: GOOD (  11.22  )
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

Hi,

On Wed, Feb 22, 2023 at 10:21=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Wed, Feb 22, 2023 at 09:17:39AM +0100, Alexandre Mergnat wrote:
> > Hi Matthias,
> >
> > This is a gentle ping to know if you can take this patch please.
> > Sorry for the double mail, I screwed up the first send.
>
> It's the middle of the merge window, we can't take _ANYTHING_ now.
> Please wait until after 6.3-rc1 is out.

Now that 6.3-rc1 is out, can we try to get this patch merged? All the
i350 driver patches are waiting for this to land.

ttyl
bero

