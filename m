Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9099C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvl3FNltG6A0XDGlTAZj5GTOgCaoTaAxqpcRFcSNbj8=; b=JEN3lQwlic8/gT
	Lb7Q6ax0ID8+tawAm8prUcLCUN7/+AhMJ9QDBn2dz+3Z/GJL6abfx/RuqPliEWY71zGKVNfQFi78o
	yjbiURPGCnHzrXaovMJJxJuo7dmjRv2jAxF1X4ssSLWF+0QkFKYxxxPaUlZrKaAHOhLL7xLs7KF1h
	R8+HaHoEekaPeHOIgRxrdSu5Zhc+eAOGmHmdHLzubzsorW0tu+JuIzuea0wwHcB8LwubWCV2Unn9s
	z5mxEVIMIbS5KVGmZL2d+hlPCdrvt8SnjkhIKHDcCUZiqfd+qe3lMiKoUN6xMrS1UME3MD5RAfkg8
	vREtCILyFnmjnuKuk7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUdC-00956J-Nb; Mon, 31 Jan 2022 11:13:58 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUcm-0094y4-Jz
 for linux-mediatek@lists.infradead.org; Mon, 31 Jan 2022 11:13:34 +0000
Received: by mail-yb1-xb36.google.com with SMTP id c19so10479929ybf.2
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Jan 2022 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0Pw1BfqGZvVWUtyLjOHuhJwlMA1Use2yqcwgUkQnwE=;
 b=F/ECo8ebBP3ogDbxQiY4hhui7DC5U/UMWgo9Zxz2mCrE3YKYlRwsn8i6WMbi1ujwL+
 F6RWtT6HBlFzfySG6LZv1PSv0vwGis3HZwYSpSS9Hc29Ez3WcAtHPDp0M0EniYkeFuQP
 vMA+VOZ1Ign8qZkpcj+5tqUlZrYNyhl+lbsyQ3EgkkMF+kIkkfA4B52aHxnb2frXX0a7
 Hf5Jj2Ip5PmM4TVjHH23jDBAmknumfzIEPYA2ny7XV1pVboUBrBGG0Zl6M1/y8c1kbyM
 NyLWqgGFxGTvLnD6/N2khaA9Rqn+cJcUH8dVK5IIzrye3eEHB5fbTpdShnNmFP/AZ8Ef
 Xb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0Pw1BfqGZvVWUtyLjOHuhJwlMA1Use2yqcwgUkQnwE=;
 b=M67UQpH42iUFKDcKYn2bjxCbtyIQqtGyvKOc3GslWgOSO5R+jcfA+ftfYavjT5LdB0
 /OSu85n7uxKAw1o4x+Tljy0oxFUbGVNxU3gIFovOnfuQXu4BFX5+V6pvka1sJeYyJPiJ
 ww89+u+4Vrw0dt5yO8lGc3tu8kQmnPT/Ym/pjsLgAMdYtwLM3Prikb7BcqsNoJCUN3n6
 FTGjcCFwIPNTk5x/tOeYm4+e4+Nr7gORxa5jzd5OpTa2rvrNZXZwMdlZT1DAxOCgwzwm
 ae90dJrqKcy+ykyHQUevIFKkqQjWcvRLsRavzJZuVMI0vnUkCW4n8vny/IBNy/pNcm05
 /xgA==
X-Gm-Message-State: AOAM532vNVuOc7Umv7gzFmmv0Xtw42PHxRWbxhpY2rYySPiC0wv+nP68
 SvmnjaWwFe99L8Ifc7nl4ROmMCi7jsEnFOyV6BKDhg==
X-Google-Smtp-Source: ABdhPJwnjcbKcmXqxkDyE6M/D5slJFtoF8e/5OEa0RJfRa4THHqn7fj5ZGK9wLiBaPNsXouP0qEB6ly0WbzNmpDFVXY=
X-Received: by 2002:a25:5143:: with SMTP id f64mr30614251ybb.520.1643627609604; 
 Mon, 31 Jan 2022 03:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name>
 <20220130145116.88406-13-nbd@nbd.name>
In-Reply-To: <20220130145116.88406-13-nbd@nbd.name>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 31 Jan 2022 12:13:18 +0100
Message-ID: <CACRpkdY38VWT_95jz25NTNtsqzkkVsSONNLswQ35JApT0HUXXQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/13] gpio: Add support for Airoha EN7523 GPIO
 controller
To: Felix Fietkau <nbd@nbd.name>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, john@phrozen.org, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_031332_728381_54CFF4A9 
X-CRM114-Status: GOOD (  10.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 30, 2022 at 3:54 PM Felix Fietkau <nbd@nbd.name> wrote:

> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs. Each instance in DT is for a single bank.
>
> Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

This one and patch 11 with the bindings does not seem to have any
build dependencies on the rest of the patches at all.

What about Bartosz just apply these two to the GPIO tree so we
have less stuff to iterate?

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
