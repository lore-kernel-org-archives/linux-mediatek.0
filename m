Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 23:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPrj4aupA01gz+jNX3iU3uJS5X3i2gvYEhMf7gG1NB8=; b=bkN4KNf1ZAhSzd
	4MaEFZ3IweWT4mNcL4yA5ucSTl6p/DvoKpJMpFgqpcOUCbiS6MsV/fz8lS8q5m/lrultDCySn23eT
	e5gQRNcsT/y+zIM3eYyTkmrWhmOYRrooq+PTFeUKl6QM5HWAeaPWxhL8ATZMm4o5nZy3Ro//Ef4Iv
	ZnQkHfh0bsKPtiWwDEKX25PvbTjj1qXyV7f4u6kj81f8D850g8KpdB+EyVRgY3PMNbWS+pwckxH0J
	k73TahpevP3bfmk+v6EjhtotQNjLz3PcC01Z7xvF5w5nVbRQjSHR8uTPLoeEGF7i8VQTD5hrRHbgZ
	eVb/nVZdBLN+6xw0Ivpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvSYj-000LTh-JH; Thu, 09 Dec 2021 23:10:41 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvSYh-000LSb-AH
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 23:10:40 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so7879161otg.4
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jwQ3/cvUvZwvZqmL1mCJROo89LdfAWk6eb0jRU/PPfA=;
 b=bleUAVWorez5jOJY3nEoJbhU7GbSzr7+LS0r/JZcBeOWYf5aC10+VHh1ubUWal9iJd
 cve8rftd0oSuPhuyK7h5v8ibpurBcfClv8FKcPwStqgxE+CzFri8DEFVIMMa6LqUnAZ5
 s7qiYV96LEsYjQWMsgZ+hx+gTGbr6JYOD/71Jh6mDb3igAoMD2tjfxy0XFWfonv4iC6W
 L+hKdh1GAzFl02VL/sCz8Qc/U74qa0skgCKkwXCBDdoSKC+Nv4gi22eJ4jeHjrVat7j7
 mbSVPxIYpxe9vMpMFzmYxEQzCwCnVhEz7p2vBjDQY9ZvfrxX1CGEj5e/fwcBz1EtGT++
 N7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jwQ3/cvUvZwvZqmL1mCJROo89LdfAWk6eb0jRU/PPfA=;
 b=gUtN/Eih8d5EkqoRkgnwqq1EXmSHw5tx8T/+u2/a1hag++D5x/1FABAJS2Sk+M1GdU
 oO9g5wPkM6xAdbZeWVUsiecDDMSCL2w94CurUQNwbD6HBNXXBGi5KE99h7+fMTH0sWRM
 n1PDGoRYgrqSROxoJ9obXiIkjITPTMMaRyyyJgZwVz0qO9BG0PRTEDb2dtb6z5en8g0o
 HkOj+p2EoYCvI5I1/zlixYCCSqCWQ+W3vJxSYkt6QOcHnfLdu2LadZOLDBOMyP4vMV4f
 jVhr5ZwfWHF+yBbJvmNI1nJ1KwGaiqdQnoqdWwn1j1gXB9alu+84NkBR5fESfROScKm6
 c1ag==
X-Gm-Message-State: AOAM532dfiY/zHR1au1bGbAx+AyKe1ArkLRysCBHkbBBEQiFIP2qr0+z
 fe8ULRUe+K+j8K3n1n7mrh2G17nJMQkBdau33WscNQ==
X-Google-Smtp-Source: ABdhPJzo+Qn3beEC2GCP40Dln8g3w03FB1cYts0c1cuXhM0sKcR+azpj0wOy3oZM9W3SYZUtgtldhp9j0UCVfnGVgMc=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr8426847otg.179.1639091438012;
 Thu, 09 Dec 2021 15:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20211209113456.33977-1-andriy.shevchenko@linux.intel.com>
 <YbI2Xb7gBfN4Kyid@smile.fi.intel.com>
In-Reply-To: <YbI2Xb7gBfN4Kyid@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Dec 2021 00:10:26 +0100
Message-ID: <CACRpkdZxWpygHBJFmuXft5yWhA9SWJzEubC6Oac0dUsLeFAjSw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pinctrl: Sort Kconfig and Makefile entries
 alphabetically
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_151039_403772_30A24297 
X-CRM114-Status: GOOD (  12.62  )
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

On Thu, Dec 9, 2021 at 6:05 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Dec 09, 2021 at 01:34:56PM +0200, Andy Shevchenko wrote:
> > Sort Kconfig and Makefile entries alphabetically for better maintenance
> > in the future.
> >
> > While at it fix some style issues, such as:
> >   - "Say Y"/"Say yes"/"Say Yes" --> "Say Y"
> >   - "pullup/pulldown" --> "pull-up and pull-down"
> >   - wrong indentation
>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v3: fixed more grammar issues in AMD text
> > v2: rebased on top of very recent pinctrl/devel (Linus), added some grammar fixes
>
> I have noticed that you applied v2, thanks!
> Do you want me to sent a followup that fixes AMD help text?

Nah just pulled it out and applied v3 instead :)

Thanks,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
