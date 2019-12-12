Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9C9C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 10:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8249B2067C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 10:33:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ns5RuqH8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bxIPBTZs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8249B2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIL3tVey678KMTKRfSx+S3mueUNNv8Hb6unszrOxM4A=; b=Ns5RuqH8NMyIA/
	53krgK2iiJBpX9nLDBjcvd1MQpmSFvCpar0ywh81wPBg7/XHT98uH7t+RjQUtz+ob3hx8JehH5YgZ
	qlOyFuuu+mJbrVK4QkwbqS4y1T/oaAi1Eh54wQBQHD4dD2S5uQb60KXDMfzKGEA7Cl/FmfPx9bUiN
	sNjnw75DSHaIzkQuE0H7dW+AsjBn1aXPVmOLZ2stCZtalIvhAbIZ+SBodrElbiJfrnG1/qDLq+nT5
	8xfcrz7ZuDB7R4xDMD88Mx8r8GUA48rBZ90e5nfD/GJIWjJqPQsSuMewRWPbmsF2xgwpfQEWfrcVu
	EO01POT3zU5wX00hv3Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifLn6-0008DL-0H; Thu, 12 Dec 2019 10:33:52 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifLmy-00086x-4G
 for linux-mediatek@lists.infradead.org; Thu, 12 Dec 2019 10:33:49 +0000
Received: by mail-lf1-x141.google.com with SMTP id 203so1275095lfa.12
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Dec 2019 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qPF/yalYFBJGDvckzezeF6fnanapi0q/ha5oqUAAdfg=;
 b=bxIPBTZs+yyuk1iz9+TSeqfLyQlsmsZfby1gnoJPTupkUIIcjhzcAZV9uufsKBGZWN
 vR23FlTa/YkI85fPoHmQ4FgXSF9a7mK/nnWkW+c3Zpzt+nLzOEGOesVlVfVJPQgaGr93
 FlPWdlWae9BWBbJ15aG9wHqztZLEl0OZXoJtDEar4hhVSb8uVspdReOtPfaMBf3qojY4
 /HwPMp5fU9dpztsingagfq+N1kqlraRGZ4M2CJ34t8ohPrUd/rzGc0PZLnz01aZfCeeq
 3r4OBKGePnEbVXQ/kbKUExFUz7YRNCsM6bo5mmnQC8DmaVZ3EtsZRxS9P037JZWIDzeD
 x/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qPF/yalYFBJGDvckzezeF6fnanapi0q/ha5oqUAAdfg=;
 b=PYW71olUaxVWX0zQvRqbCGZoC7x+4j8FjyuGg+dn+XiL9JlEDgW3pJV+pbXP70IaBb
 kMUGqi+tRuELKErVpcVWAeAuO8DN9Y8+SXDIXrpzDnAl11tlNXAqIpr8jnzxFdiC2rNM
 mLPYjxXrTrqaaUroBhl6HjmUnhtPSb8XHhJz4whjMtMy3KQKIVfBapg6rlHG/87eNso8
 k8NXJ6eT0FAbfnK1bY5aLfnTjNMl+NY6GqpTT5/PNCkhJs2BfloRgFY6jzVoemGnAOFt
 non8MDH+r7AN7p3FZh08iotf8ye1Hxg+7/bo46xg6p+LplRIolS9Lp5XTwH8iOH2rijQ
 4UYw==
X-Gm-Message-State: APjAAAXKoTGMvFfqxQYB8rVBKuzg4FuO/mYhVpYN+2s5nELrl1vekMUD
 Mi7tL+O2U5rlvt/UqtYAJCU/UK0AxGO/moZmwGLh5A==
X-Google-Smtp-Source: APXvYqx0DF665CL99HUndMdW5PwUL0nbCGCmH0rw2D798Z4vnEevdnPuA75RWOwCG6MTgLnkPM3wqGCGL/aWEO6tMgE=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr5064376lfp.133.1576146821960; 
 Thu, 12 Dec 2019 02:33:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <bcb86aa22d8d8499502bbd8c54a364be24886a86.1574871463.git.nishadkamdar@gmail.com>
In-Reply-To: <bcb86aa22d8d8499502bbd8c54a364be24886a86.1574871463.git.nishadkamdar@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Dec 2019 11:33:30 +0100
Message-ID: <CACRpkdYL+_bQU0PRfOFBY37O0K8W8WW0-tRM49FckA3Uh8S8WA@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: meson-axg: Use the correct style for SPDX
 License Identifier
To: Nishad Kamdar <nishadkamdar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_023344_202135_30E6A817 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Joe Perches <joe@perches.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2019 at 5:44 PM Nishad Kamdar <nishadkamdar@gmail.com> wrote:

> This patch corrects the SPDX License Identifier style in
> header file related Meson axg SoC pinctrl driver.
> It assigns explicit block comment for the SPDX License Identifier.
>
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
