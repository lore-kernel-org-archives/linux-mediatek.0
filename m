Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA096C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYlNpP2yjuaN1s/0GSGSvR/4nmMU/j9YNQNQQpMCen0=; b=Ta8Ebb09n1JdC3zhyd+FXrSB43
	4q1jP6GtzsSbF1+8mW0HVfiszXxwIAgV+D3dCjEOukB1vdVnO0rQ3bSneVH5Rub/Kn29DJvJp4jQz
	Zyy0Q/OcrLLgqc4A05NdvHIJ5lS2PEHTS+qDottl+qQKh3cvlNITeV9Wy/XtB4LsLeU7kL7GqyUoe
	QVPAwDFTS0kavARLlonHHUwZ59StCfMEiVfOEZBWWgYf5NdyIgxw4iXYTWzjxl7/l9tj7R8q65Ooq
	Qsw3kVVmlrpSUZ8XJXcVJVzJP4ovEZjwYEtFZElUyi9dm4IeUjjPgP40o6c26ZhWn50VqWIe5b3ic
	Qj9Y2SpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okN3o-00ADt4-5V; Mon, 17 Oct 2022 10:09:28 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okN3c-00ADoQ-Fc
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 10:09:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id w18so23697605ejq.11
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XYlNpP2yjuaN1s/0GSGSvR/4nmMU/j9YNQNQQpMCen0=;
        b=oZoKJjjfO5FspRdoxdL2uANtPdoBw5drTem2Nu0XKEMpfDUzx0TroI3BQseDtZqp8p
         SON8Fkilm37wNDTCjWqMfHGh31X6cAi74/akiK9gyONpvbNfDr/EcBDYcimuxdigJJw8
         T6DxD49qhUqF05JfiXcRjbebsZ1+hZXCksJ6f6csULxBwXrTQvFqwsSgWogk++IBYi7b
         zmd4WEGga8QGXTyyv51XlQOVxBZHK/5SXSYu+3VLOMulfq6yLYMgnxi4ezzaJprIDeL5
         /a+xgzykxz2/CX0AVAZqsAqPno9T4Fykg8UC4qqyYQ6czZ7iOPirVaGmIUlA4i2Vcna2
         BbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYlNpP2yjuaN1s/0GSGSvR/4nmMU/j9YNQNQQpMCen0=;
        b=k12krowOkSMtsl1fMRmCyMqLTdcL+9VwBMu4AfoEpZNJ9mWydmk7fNS5gE3G9w093I
         Uvom5t4y4gTJXLhzW3LxEqe7XmaWuJhmfc9wnFjgKXu5iGi8c6rTp3xEoELIr5urSxMs
         1AIs3D87HMu11EWTlxn7o30NyV/ELLiAse2ieKrOSam3Sol5io0TVKSGSuKsUdOQctDb
         lLErgWD4pObup8S+9MitIhj+xt3ThlA4pe+qVALolL2+O/hha5QgLvpjJu7wd8JogbQj
         EKM17CucpSG+LioGU6qu434aievQEfj5D2ZhmD4YMU8zwP2p01l2nrRznPxwx6o5b/sL
         QF6g==
X-Gm-Message-State: ACrzQf2MF0cskebXIB0XX1uH6p3cvTkGNmfkLDpZISIlz/Yd65Vpi3AS
	+xwORwf3z+87ZJ7KKOAt1k/ZqHJZAO0hfGNxtLXZsw==
X-Google-Smtp-Source: AMsMyM7CfYGIBACp5LKxkb/LipLw+lzRqIwClD7Vd43soIZs3l5TGz2NezqJSA7FslOlqykmU4zg4CP4AQesbbM8xTo=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr8058069ejc.203.1666001352390; Mon, 17
 Oct 2022 03:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 12:09:01 +0200
Message-ID: <CACRpkdbEm6ZOTkXFkfxHzo6ke2SLowkxrNvUFyz7ba_BBywAGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] gpiolib: more quirks to handle legacy names
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-kernel@vger.kernel.org, 
	Daniel Thompson <daniel.thompson@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_030916_570951_B735D744 
X-CRM114-Status: GOOD (  12.52  )
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

On Fri, Oct 14, 2022 at 7:54 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

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

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours.
Linus Walleij

