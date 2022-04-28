Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 23:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTOfVWlaj1C1yNOCYkNlov2OMJ4AolDysXAbrW7WhcA=; b=vSXc3zPKFz5w6t
	Pi9ow6sBX/ddWAn9NoOTPDWS4PM2qawg2QyVf/62OCLncdPUxz6ZwTVWzJmIogxRScVNLRwuxOh1p
	rztLwpT54rFUWksCLWrOh9UTo1h1FZ6faSOVIJ8g2cKsSrlvcUP8aUv+MuYhzbZjGGbbVVS2RRzTZ
	UT/P+UsPElQRyKpAIdttSLg13gDjFFAQw1sLDb11uVUn6dYCuo4/ynkxQqztY1OlgYF2hFGBSsqzp
	FQF5kyQr3aYkiRQYYTwDlqc5M4nayvwrHYuAtYvEir9Rrty+zXST0PUBS8QZ4hY5I1jl7OjHcMb9P
	FrVYloZpqqkmJ+Njw3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkDIU-008x5o-Fe; Thu, 28 Apr 2022 23:11:42 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkDHy-008wnM-2q
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 23:11:11 +0000
Received: by mail-yb1-xb29.google.com with SMTP id i38so11613191ybj.13
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 16:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NyPCKxTWsziHM5455WCFcGsf6KHq5nbSg+7kc8T1Enk=;
 b=w3EXn5LQ3WggPXlrWTgOz3wh1BiyZZf2RtecVtCXewGw/7/fPCXTcwk5GAbAnabAoP
 j72e6VFAKB0taT8M7pYKXotdMgJotbUtzYM24v91+6Dk0cOvaeSNiCgpHrrh9FrMwBq8
 OQDkQbV1l76unzPts+xKdb+S7UFIYt6q+TcXYpdwgCMGuHxJ+xe3kvg3OEJSIQUcG26m
 ul1rO4zsxklDWbFEI8R7ssN/m+vBtNFiT73ko85PRb1hT8cVlCwapW3m0u3eqdGnvW1w
 snMwu+ApV5B3qrD6YIHEqjMB/TdOaTgUyxDBWxnQqkN2HGSByL9KLTEYdqhHhjvHctV+
 EQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NyPCKxTWsziHM5455WCFcGsf6KHq5nbSg+7kc8T1Enk=;
 b=BB30YOaJiJdPwjG5z72QSZaIDhYyA9RxQoHwVK4WU5h1uhgooFiGrvA1HBfNHuQ9fL
 CwuTvpT3diLpEyXlcSaa/cdcSnJoHVOvhPgDdibvJul9A9JPfKaa+6aUQoGj7Pdj22ZU
 kZj7lTXXiBbmX0HWMBlpVlIjGpZsOA5v9mxwMPNg0m91kw0A2lylBKZ8tL7ygkgWnq6U
 eSPOoXvbzQ7bEGFXCvaVkFjwU4eIDT3P9U0FNHwFPZk6aSB/KxSuNJQDsb1sFwGbjU/L
 QI/vJn6lzW8wRTcrY7BCGfeF2bj09fzRYDEqR/ur5TX8ZTCzQWrIfdElA6OQFRbpLbhJ
 mJdA==
X-Gm-Message-State: AOAM531XbHL/bZ5e7OfXtobO321yh1F1ZQCuTm0evq8U/ZEfbJJArpvp
 sw8/W5SUtWaj7FRKAIj1c6zDItqWRTVS4eH/5uyHTg==
X-Google-Smtp-Source: ABdhPJzRbPWM7IZwhg9ocYRv7Fwg9Etal1Ags93CZRpWHRUtlYK4KKVbBNbF/xd3ph+QJP0hCeUd3Soe2zzp9ElLGAE=
X-Received: by 2002:a25:bcc3:0:b0:648:7360:8e75 with SMTP id
 l3-20020a25bcc3000000b0064873608e75mr20393659ybm.533.1651187467360; Thu, 28
 Apr 2022 16:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220426125714.298907-1-mkorpershoek@baylibre.com>
In-Reply-To: <20220426125714.298907-1-mkorpershoek@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Apr 2022 01:10:56 +0200
Message-ID: <CACRpkdacrj5x-vQZwBOF=oQPvr8Fra-bjTAiuS+NhX67ORcFLg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8365: fix IES control pins
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, linux-gpio@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Youngmin Han <Youngmin.Han@geappliances.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_161110_152984_AEE36971 
X-CRM114-Status: UNSURE (   9.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 26, 2022 at 2:57 PM Mattijs Korpershoek
<mkorpershoek@baylibre.com> wrote:

> IES26 (BIT 16 of IES1_CFG_ADDR) controls the following pads:
>
> - PAD_I2S_DATA_IN (GPIO114)
> - PAD_I2S_LRCK (GPIO115)
> - PAD_I2S_BCK (GPIO116)
>
> The pinctrl table is wrong since it lists pins 114 to 112.
>
> Update the table with the correct values.
>
> Fixes: e94d8b6fb83a ("pinctrl: mediatek: add support for mt8365 SoC")
> Reported-by: Youngmin Han <Youngmin.Han@geappliances.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
