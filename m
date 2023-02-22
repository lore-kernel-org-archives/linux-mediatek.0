Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1703C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0bM7PsmE0wf0+asUiEYKD7QDlHNZHf9CvubfF1/sRs=; b=hn9D3MdgrUvJItl5gTa23fp+o2
	29E5VyR3lTD0CyE5ujGbH9Offei6OGzIWTR8cc9poyr76DSKYZuOOm+ueOOuZQPnLgI/YbYT32ieb
	IyQtX7gaO5GBfyYHW+gGpBkf0zc1zncgk2ZamuDQTmAhY0Yky8ajfYZrBUHvDRy+QYvkOj+9relHg
	tgwASnyIOOvTsQbQjUWrvNcZfR0qNpkIrFCYCCYH7oQRAyv9INqUO5j0F4jt4vne8MUyIYDJgRyfX
	8tTKvRYH8Xt2GLJPRkZQuuki4XepCNRZJ4NH5AYxTLxc0Q0RmuJ0nXQ8O/hK+RAz+CRXQ9zWNzg8B
	YlTdBjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmPD-00Bwsq-EE; Wed, 22 Feb 2023 10:31:23 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUltX-00BgdW-Bq
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 09:58:42 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id v78so8150871ybe.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Feb 2023 01:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0bM7PsmE0wf0+asUiEYKD7QDlHNZHf9CvubfF1/sRs=;
        b=OQUMilmYM4f9BHwyWGIF9no/TYDPrVshmbeFNhazNpGTND4ALChT/6g8StUN/imNLN
         b2Kq7mcun8v15bEvnSE6Jn0XRSoQoO4IYFYg2gG8TOvt6vBgZLyEOCCWF+UHOIe+AA3m
         mp+MoTbXPjRc5aIvnDyirfaM6UxRC+RNmaRo6rjZb5tljWE8YMAhSoE4QDJ3wyX6YkQQ
         q0COW52QwFd11jIR00fprY0l7NsGxznQvRapc9uTeOSN8uZkduY4BYtXfidOZlr0LoPt
         D3Sj1m25p2AA7LNKYWsnHbmpNly/RZIYd+5JeWe5bsqKZMJOlSWD8lldvPgx19nQugqJ
         O7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0bM7PsmE0wf0+asUiEYKD7QDlHNZHf9CvubfF1/sRs=;
        b=uz7CoMexUIL1anexb0BhCO4hT2E8tFxLBJazsMr61bHzm3POQfepNHLZCK309intAC
         DqQNU74qvqJi4ZU/RG3CnWdxSaUKRToBY21v/dCpQZudLa0HeqOqgB599wU9x/zNjb/x
         wYj6Y1TkQECBSoYV6ISmDbKVkYADXBnDOWdvnLiaB4q5etni3JTVCH//Ew/hlDspBuwa
         GI7Cs5+Mj7FqiIP2RdZJtdWKaYo1F66ClAq01XqnVCPjXWGUbeO7zj8lVfdyrO82euJo
         L9jtFVuphtE3o/Xrx5bNt4VcCrVdZ51nVb+CPguikn3puDF+cB+lM0tXuY70kaqRIg9+
         SLdA==
X-Gm-Message-State: AO0yUKWmtXFLtIaeKw0qQiPS8HAuuJgx6jDHNuj0Umjx5jMYWAPscSnb
	4iQRIgvvs4o2RoWVONnp4CQfurKIr8gtAm+BbX2fKA==
X-Google-Smtp-Source: AK7set8vuBlOWMUYuYN+7GHWG9+nSHIdD2Y0EYhXoFQmb1bQZHobbsI7ZupueVYF73il0ZfrErH/ZZ/NAh8nxua5/Z8=
X-Received: by 2002:a25:8a84:0:b0:92c:2340:4dd9 with SMTP id
 h4-20020a258a84000000b0092c23404dd9mr124057ybl.309.1677059916205; Wed, 22 Feb
 2023 01:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20230125143503.1015424-1-bero@baylibre.com> <20230125143503.1015424-10-bero@baylibre.com>
 <8c348b39-67f3-9210-1929-8b2f093be24c@baylibre.com> <Y/XenZUmT7Nh2qGP@kroah.com>
In-Reply-To: <Y/XenZUmT7Nh2qGP@kroah.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 22 Feb 2023 10:58:25 +0100
Message-ID: <CAFGrd9qp-p5+8_LNo7G_+sMbRUtCXKOtRSPMxspxTS7H7iBw5g@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] arm64: dts: mediatek: Initial mt8365-evk support
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org, 
	lee@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
	daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com, 
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, 
	allen-kh.cheng@mediatek.com, sean.wang@mediatek.com, zhiyong.tao@mediatek.com, 
	khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_015839_627865_488321D4 
X-CRM114-Status: GOOD (  10.95  )
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

Hi Greg,
Thanks for the update, I appreciate it.

Alex

Le mer. 22 f=C3=A9vr. 2023 =C3=A0 10:21, Greg KH <gregkh@linuxfoundation.or=
g> a =C3=A9crit :
>
> On Wed, Feb 22, 2023 at 09:17:39AM +0100, Alexandre Mergnat wrote:
> > Hi Matthias,
> >
> > This is a gentle ping to know if you can take this patch please.
> > Sorry for the double mail, I screwed up the first send.
>
> It's the middle of the merge window, we can't take _ANYTHING_ now.
> Please wait until after 6.3-rc1 is out.
>
> thanks,
>
> greg k-h

