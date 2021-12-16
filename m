Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1828C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 03:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElPlsyBDA6FylFNYQBV1oLbJvR7czn6Kse2YDVhkFcI=; b=U/QvzKm6RaQM60
	Jop1/kgSH7wozH57SbtNp9voe2ZvLKwI7GMwhbCxUnlajpeydtffpkf6O3NHfNrev4xf03DON1Bi1
	glOrrQ0KP4sVFSrTz7YxZ6r+tEDCjtniJvYcb4MfSjoOyqzJFCY/FrvUzUriZDA6Ki/aIpYDuIWFG
	ETWNKNi8L1Z+WDdN4MkYoaRdYmPrSB8seMy0u720YropxTs3vI6G/eSlgdsy3jad/Pfn2Z9weqldn
	mkQOf+LWcSQC32cmo8jO2chbbv6UV5ARGoxG88ZcnTHRQNQ7wg6puA0msXrAuv3oF4amTntqRqGIB
	iUDWvhduw74hL+g3D7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxhIs-003RaE-Mr; Thu, 16 Dec 2021 03:19:34 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxhIg-003RXJ-2w
 for linux-mediatek@lists.infradead.org; Thu, 16 Dec 2021 03:19:24 +0000
Received: by mail-oi1-x235.google.com with SMTP id t19so34567981oij.1
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Dec 2021 19:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RWM/2Tdo+A39zviPt3A6JldRYsbUDOs2gZmt1TWRfEU=;
 b=zRWPUcug9JLw4lLpjR5FRm7N3TahpWbYFQnGkQdY0nnpN0NcMRzW1rPNPX2iUOk+fz
 wqb2Z9a1/S63sZxUor6sGazjkdHQXZfktqexaXyD3BN2xxB3TLdiriHQSLyOSe0gdWtn
 IP+TVnZklGicQ0oM1CwDLRlXFz5vx0Qw+MJ72Ye/aRXa2mhUUMemZO6K/Bk+sFO9qcGe
 TOwf8L9Izfo45NtjGjU+076dqTi7ndUdP3E9jIOqVUAkMS6nRj9BnMFTny39NDTvu0Xm
 yvkv1F4ZMghOB5QWYM0X7vwbuQT6eofb57B8D4yRhQJl+4SFgLfOS6uC/bAaI4RaNfNd
 L5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RWM/2Tdo+A39zviPt3A6JldRYsbUDOs2gZmt1TWRfEU=;
 b=HNzJEH0w/vTnScYRZG0j+kjcjnA0ZeGKiySsbEvT8ZBU463bDDZ3DWJyMPfAgH/BjI
 +cJ9VT1iW0bbfTGlm4/b2OjUb/s3Pahtk/C5PYXEazZzfYEBE+dUf1NPGcmbOEe1rScz
 QkJ22x/TLM1I/Mgld7ll86+1ooDtJcWuYmquJWqtoSAr1dx/xVUPrsvfqg7vH015n1Zo
 hMyGrZ022mtwywP/tTlQq9Mw/zXCQyvvEkekpc9m/IXqPRSW03D3jTXjhLbBCY/J+HE1
 K/Hou53TrG9CL21Zlk1I+adC+Qa9VW1mEFOL1PLWO1xKP2+yKFxlHRoc/fdOYc1KUvqQ
 bNnw==
X-Gm-Message-State: AOAM533oJetT7aYr1I9ZeS1MGCXOMgDxEJC+NOMhgJlpJcmaBfWBHD39
 4flLvwR5FpMeAljHQtp9Z6XWLfppG5aPujsP23Ss3A==
X-Google-Smtp-Source: ABdhPJxMt8LsH5solEGiTCgX6vrLS/Lejlh/uyv5vtoK/cjjDQdtu3LiiiFa8vkEePPWEVkSf5rT4Xe4hzEx6EQxyiM=
X-Received: by 2002:a54:4791:: with SMTP id o17mr2719065oic.114.1639624760385; 
 Wed, 15 Dec 2021 19:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Dec 2021 04:19:08 +0100
Message-ID: <CACRpkdZxfOZtibKgywx_XL_ayp5NEQiCK-NRrEtbvCUGYSojVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Get rid of duplicate of_node assignment
 in the drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Sam Shih <sam.shih@mediatek.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Claudiu Beznea <Claudiu.Beznea@microchip.com>, 
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, 
 Colin Foster <colin.foster@in-advantage.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Sean Wang <sean.wang@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Support Opensource <support.opensource@diasemi.com>,
 Baruch Siach <baruch@tkos.co.il>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Gross <agross@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_191922_179014_8AAB8D2A 
X-CRM114-Status: GOOD (  10.52  )
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

On Tue, Dec 14, 2021 at 1:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: no changes

Applied this patch 1/2 of the v2 patch set!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
