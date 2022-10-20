Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76823C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmdoR/w6BYsfomWVh267+r2sbsTxrmcMIZmpfdw25R8=; b=vXvGKXOnTW5MQqVmFEaXdeCsXM
	4ijNSFG1e+mhQp0zB7Sid7A4A6t32G3T1HDF3r4ONKwgHEo/JSMu1UcGBdXPnclHjPh52qklnQih9
	Nb9qvgUXTq+zJzqLdLzLvCQTu9Xt89H+6abHHnlu6hMTLxA5TcmGsv/9wy4Cymh4xFMmZzjSLwa8w
	n4rbnIl34UpYzjjQ0hwfCVDSxwnbr4rinI3W13waglIHX+8BQYh8Nu7bmDqTP65F2xbvFIFz3536N
	weX6Dc9ttN+xJLh1o/b9p6NVzQD0h35conWowdSdYOh3yDkQFv8Z0s/xeQ2O5Y8qv+o5kVTcmZFNO
	TP8l/qaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUkx-00EqWx-CO; Thu, 20 Oct 2022 12:34:39 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUCN-00EOoO-CY
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 11:58:57 +0000
Received: by mail-ua1-x933.google.com with SMTP id i20so8832712ual.4
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmdoR/w6BYsfomWVh267+r2sbsTxrmcMIZmpfdw25R8=;
        b=chHdDPwrngCggbBKdIbWiDLCXZnP7iqdEib8Kgvwcwr079ZvVEZkyUZObQbu4LPB9v
         ZmZL9dksUjp5QOtQRXo+nXXBnvv0ujExpS8AhU5qghI4lpxjdojJ+Jx1DFH/NDbbjInN
         ruQ+XSYsr7gXr+cizYo+gc/5gO69+XfMLDsAFSr2pTkJNvNGaDa611kzMo9dj1wzqVFD
         4TbBFWpTanYKbeHGfToaLYQ13uydaHAIuvhnLU/Tcm3eyy8MijhlRbUxHpVVNMcOju9n
         vuXpLEQZYve0hDHgWQLaZ75WAaibrb2NzPg58Y9znicE6ZnLCW1mmy942uanNWrXTHPm
         dTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmdoR/w6BYsfomWVh267+r2sbsTxrmcMIZmpfdw25R8=;
        b=ehn0QuKXcVVkUD92oPceBuSbuZT5s09tOELP536iEf+KLAhcTc9QtlW9Vmbp765EBn
         INLXK4XuzBmclA2/CEAFUiWskK34WUcZ2lZG0ast5rEFNdqy5LM57PpL1JrriJuMHtz7
         q7CVx0JGa/+YEmGe0m1D0cF49v9hBkHlsk6fMlDoK6u0Cu0pKDBDNLPekjjhul3wcLnG
         ES35Yrrjtb3g++BdJ3qer9Xc4OrxZCT6K27aE/1XxkB7jBKy3myUfI0NO3ldbE0PUbmG
         3xytnqhN/G/lNyBdg7tpiOWiHVXVBVxhLYE/vErvvRxgk7zw9SWvygc+PJzBz8kBlzJO
         cktQ==
X-Gm-Message-State: ACrzQf3rtEcARKtdhiwTQmEYqfNWqPolON8J6iJnPOKtB1mxIKcXTju5
	Mj9nIgIIfvON39XOwEoQEbel5nSoQLZoiuP5UG+ksg==
X-Google-Smtp-Source: AMsMyM60th5P2fPMIOJLE3lPxXDmFgQe29j7XFR82PlU8rUG/MVn+bF0Ceu1sunzO0mIDlQiOE400CHnNlslzzchU9E=
X-Received: by 2002:a67:ab02:0:b0:3a9:9953:6471 with SMTP id
 u2-20020a67ab02000000b003a999536471mr4410633vse.47.1666267133910; Thu, 20 Oct
 2022 04:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Oct 2022 13:58:42 +0200
Message-ID: <CAMRc=Md+zoaMHkDJm=SYEZMiHSF7_gYiXApuEboPU5qFpnD_1w@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: more quirks to handle legacy names
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_045855_491969_68FAF094 
X-CRM114-Status: GOOD (  15.36  )
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

On Tue, Oct 18, 2022 at 7:41 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> In preparation to converting several drivers to gpiod API, and to keep
> existing DTS working, this series adds additional quirks to locate
> gpio lines with legacy names.
>
> Additionally the quirk handling has been reworked (once again) to pull
> all simple renames (ones that do not involve change of indices or other
> complex manipulations) into a single quirk with a table containing
> transformations. This should make adding new quirks easier.
> When using legacy names gpiolib will emit a message to nudge users to
> update DTSes (when possible).
>
> Note that the last patch requires the following change from the OF tree:
>
>         88269151be67 ("of: base: make of_device_compatible_match() accept const device node")
>
> The change is also available in mainline - it has been merged in 6.1
> merge window.
>
> Thanks.
>
> To: Linus Walleij <linus.walleij@linaro.org>
> To: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
>

I applied the entire series.

Bartosz

