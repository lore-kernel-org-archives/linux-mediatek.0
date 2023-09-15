Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1D5EE021A
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 04:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qzmi/iJpKjOZhxEQBLno/kngFnqZ7SNTMdomSBt3AV4=; b=J/p8RgHnpNNjjHZXWILX66IXwe
	S0Yptskj4DJGh4gIF5jaEIaVKONvGpNgZUOtvcjfYby8/v7QQV1BWDN0RBiA+zmmKV7+Z0AEU3+t3
	2IYRvdU0MG+rBtFMZYGT5jPZoB6orkWgJiUVtkdzDlA9yEZ+nc+CX5KUHuhSHCp1AwBAxD7DMkjWX
	0+k6RlcyLSgftwWL/32csbQt4Sj8MW6DR9GfNCYSwvRBjVPTXxX+RDc4AGysNYrPybD6WcbTWdUUa
	iwaDAB7C2rDLAiBH1uYgRNKk468YcHCZcBxy/7VH+YsqydIiYaLwSt29gtVLhJ/n9O8Cxu/GHYP87
	WGPmsFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh06x-009iYr-3B;
	Fri, 15 Sep 2023 04:07:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh06v-009iX7-0X
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 04:07:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50098cc8967so2737729e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Sep 2023 21:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694750832; x=1695355632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzmi/iJpKjOZhxEQBLno/kngFnqZ7SNTMdomSBt3AV4=;
        b=l7SzUfCcBE8HmWaeEFTrca/TYqMbywgkSnYyhiDbcLQw/U+o/xSpIn6dV9/uukq0UB
         nUGl06hVTjtpMcMQUNNWm42QFWZyE1NufzNhOc+dkRSJY8vyxXkIiN0c/BvbVAvZt8Ds
         1oyc6B0AZ+AtbEO8FkysKKjYDd7oCGWD2mISs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694750832; x=1695355632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qzmi/iJpKjOZhxEQBLno/kngFnqZ7SNTMdomSBt3AV4=;
        b=GnPIFBgqf7na2RwZUInbznBRpT4XYsMrRpEmt9+u6qCtcFgZL3o+zwWD7DfA7sR+nw
         99KYeOMhlRW5IhSNNRbHwuqyPRGuB8QFJG1LDkvLjr4QuSXne0Y+jXeNeItbjU9HCwzM
         bQhwBq0mZb1mpseLGPhi2qMm6Gs0B8qB3D0H+X5SdQpMdmmFHTdhD/xbiOtK/lPZxTop
         TL5AF2OM49VZAJBUfuo0GIfhmZUXXTiEV+K1sNr8CxsexTCWYpLcqQJazouLiTeG3D2Y
         bv3xXVU0JN/MEekmIZnDbDUURBJ9V7Kxt0p4DYmbnMHxuuHDHcChcRbIAuIHlAYPBVRh
         XSpQ==
X-Gm-Message-State: AOJu0YwwnMYFDP4Rl/EU87l7+NMARqHedH+sUMi4kYwJrwQw2zSf5LL+
	MEzAJTxkcBt/zWzEWQBoEQg2A3mRIMVbl2uIzHr1Sw==
X-Google-Smtp-Source: AGHT+IHPS3hgvoT9h4h71M5dq9RHUqZPZ6160DtqEMhD9LLdIbTTMUMfxv9+Y4dc7C1UVI025fGTudkIedQkt3zqhIw=
X-Received: by 2002:a05:6512:3d05:b0:4fe:8c4:44fb with SMTP id
 d5-20020a0565123d0500b004fe08c444fbmr532868lfv.38.1694750832139; Thu, 14 Sep
 2023 21:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230914183831.587273-1-john.ogness@linutronix.de> <20230914183831.587273-12-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-12-john.ogness@linutronix.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Sep 2023 12:07:00 +0800
Message-ID: <CAGXv+5FNSBm170z-XffkfcfQaAw4XXH3NEkonKE2s4x8ewz7WQ@mail.gmail.com>
Subject: Re: [PATCH tty v1 11/74] serial: 8250_mtk: Use port lock wrappers
To: John Ogness <john.ogness@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, Petr Mladek <pmladek@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tony Lindgren <tony@atomide.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_210717_203904_15340D06 
X-CRM114-Status: GOOD (  17.68  )
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

On Fri, Sep 15, 2023 at 2:38=E2=80=AFAM John Ogness <john.ogness@linutronix=
.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> When a serial port is used for kernel console output, then all
> modifications to the UART registers which are done from other contexts,
> e.g. getty, termios, are interference points for the kernel console.
>
> So far this has been ignored and the printk output is based on the
> principle of hope. The rework of the console infrastructure which aims to
> support threaded and atomic consoles, requires to mark sections which
> modify the UART registers as unsafe. This allows the atomic write functio=
n
> to make informed decisions and eventually to restore operational state. I=
t
> also allows to prevent the regular UART code from modifying UART register=
s
> while printk output is in progress.
>
> All modifications of UART registers are guarded by the UART port lock,
> which provides an obvious synchronization point with the console
> infrastructure.
>
> To avoid adding this functionality to all UART drivers, wrap the
> spin_[un]lock*() invocations for uart_port::lock into helper functions
> which just contain the spin_[un]lock*() invocations for now. In a
> subsequent step these helpers will gain the console synchronization
> mechanisms.
>
> Converted with coccinelle. No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Replacements look correct.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

