Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 02:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jb3fVk40B1z/c7SN7BFsm3QyCVab7G2zJZbmLjc9lb8=; b=ckyw8lPeHctxOz
	8+uAutnLGZLse1D4wpv2SXU8RHYVZxOD5KX90lP7C7581z6pQ3HXk+f0plL+9a7JWU3k8v0a/QChl
	SbAUhkKspRRT7iVhuJ1cnLEkXWIxzuHm9H/nYUw5HAZibUVBnZ2ncRGdAn+/GNcaqtrunBxSLDVop
	0ICFe+tBLouYqKktnSjcgT7GYNq8K2uqOpHlqP1iADeAXnvPswFlpCuodne2d4h+YSgFGD9udbGxL
	cCHhKxLiVf9l/c+HK/2Ec4wc7olD7yhdW7qGpmz+r9kVrzRcwTEd8UqY7nfPPug7GkXJHKuQJDipE
	egnQgOZTp2aIT5Lo7Qmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv9H8-00ElOL-Tz; Thu, 09 Dec 2021 02:35:14 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv9H6-00ElNb-Jj
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 02:35:13 +0000
Received: by mail-oi1-x235.google.com with SMTP id u74so6768900oie.8
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Dec 2021 18:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QkYYBxG7+xkJfoeCkvBx0tM2ZRRAe/vl6ALDFgfyHAg=;
 b=FIQ65O1yjezrQmg7r9mJ/s8Kxh8W71rtG3CkJcCiqvQUC/lnYquUjO3rqGmmhLMoK4
 Xdozh0OShZPkaLTBTR4twiGTKFUWVaNhbDZJ/+2lEWrGEQmQbL+9+0+cavqr5BU/WjGJ
 zxmK1yqMPDC57eM89TfLh1l5euq1GkWyDnEIhGMwcszzUSaIk0tnaz8asW6Yi9ApSK/m
 dFj2OxApmTguKrL8Grp4TwU0BtCklaziaxqCqpUky4wHMaGnlM9IBrUNrE+8bJ4i+kH0
 qg7iRt12iReld3M7cRUON0C2g3UUXSeLlzcPzpLhVLPWkv7s+xVSioPYDN5GtnXc4/7b
 LDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QkYYBxG7+xkJfoeCkvBx0tM2ZRRAe/vl6ALDFgfyHAg=;
 b=eYwiOhryehmw7Am8dC4Aj8dvmxiM3WT9HyvqefTEva7zYi9V+8X+Y1BEw1cfqBHaqK
 SNeEzlaT5W/NG61gUB0KLQSm0EJPf/wJh56eUPhUMZM+dhDQRAMleVW0350RTQ4jR5xe
 ZYuPwUt0KmLwa9ul1y5DtAw/3Gs67sgGCiuH+Fz64goH5Pi8hc9n84xjBHwbIcPRa4Ng
 Y1LyNNe5iNPjpJfIQYikA1avPd/TtQ5dHk6gczJlBsDIPrDFVS6HLe82LfAEU/KaVCXg
 omaM9s78zkTa/xV9rJNvm8MBa8glIgx6bRYUbviFdc+t4E5F7ES6Fg/x2UAXrUelLdpQ
 2pog==
X-Gm-Message-State: AOAM532kTngz6+hWZp6z9vjMrJ84e/iH3shs8v/xvzN67sTe4RvUfLe3
 LuKsxNoDlV49wCLGCRtm5n0QULT/YQs/2S12FtWKnw==
X-Google-Smtp-Source: ABdhPJzFSQeklOMErFeLeaff/3FgFFHy71R372ruyJJz77X4iahE6mksIOiCRzCSA9lDUer7hWhqZ2tSP9rHAnYpR/Q=
X-Received: by 2002:a05:6808:60e:: with SMTP id
 y14mr3214046oih.162.1639017310823; 
 Wed, 08 Dec 2021 18:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20211208092049.20792-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211208092049.20792-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Dec 2021 03:34:59 +0100
Message-ID: <CACRpkdb2ZnH7gi8TAQ_8hvbaAw=hqBZBjQftPOtyNMLR+c541g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: Sort Kconfig and Makefile entries
 alphabetically
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_183512_679162_D1D49670 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, Dec 8, 2021 at 10:20 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Sort Kconfig and Makefile entries alphabetically for better maintenance
> in the future.
>
> While at it fix some style issues, such as wrong indentation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Nice! I tried to apply it but I was queueing patches from other
unreviewed threads and creating misc problems.
Ideally I'd like a patch close to the merge window,  but if
you rebase this on linux-next (or the "devel" branch in my
tree that I insist on using) I can try to apply it again anyways,
we need to take the hit at some point.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
