Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 03:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnAq7dLPxieCTyHQQxAPQ3BjU8v2teIC9GZlGnLpsVQ=; b=yHvUtDnBdTc1e9
	3DaYN3gEldaQsDytOPFAjFMFzh9z00lEQXqAq8wq7LbT28r8S/cVJtFhnK1Omexy0pDyVw/I75ek7
	Xl6Sh+yO87BB2i0ceKePp2K644dISfy3dRPyGQrH1PXhXlw7MF1YI7x+p6nA+53fuNZeIruiZnjQF
	S9kebbPIywNMDsX+U50h+8gksv9dgw/boZKCASN4F0jRQibuXh0RfbZ/A2FnfSDiP75/bS0Znp+or
	G2HtmWb9NTUq71mgdPoFQJrCVcvO8qNo2u3JXP/UMNNUteBkGy3NCOH3RW9uUqSck2yBLoo+PdDKt
	vz55GdVu3FaY5t8AU2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9fdJ-0004vZ-3I; Tue, 18 Jan 2022 03:58:09 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9fTJ-00HaVx-29
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 03:47:51 +0000
Received: by mail-lf1-x12d.google.com with SMTP id x22so65349906lfd.10
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 19:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZoCI2SqwGc7GNqA0zNC1cVCgm/xs2asSiAlYIoId6Go=;
 b=SaAYwj4o39rFa3sCb89Esu/rDQ+q4s/xSSfF3TxAYYQBv+CctKjiZ9I8uhFJIVV1ae
 1tpFh5nDKelPu8nuF8BWKLnXMHak4K2vIAWJgd4zjBoZr/KqhbQdDCeh9h2Ba+xubXxF
 Rv/TA7kVDT3EsHNoctH2Uf0awr9EZjGD4TYaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZoCI2SqwGc7GNqA0zNC1cVCgm/xs2asSiAlYIoId6Go=;
 b=NvEOkxGQwDqaJRYK7Rq0yp6NCU5dwM2NIS4/8rbdBDNZbH6IGpt4Wg0lNDtotk15Jz
 ybInTahvlXKea1jN8EUe7JXpX4GyFlv1YKjVzhZUppgR7ogNaEjTvOZTKoL/vg/PaIIM
 1Dfr2Mg8o0F7x3nhDzhwKXjh5CoS4S4jdqDbakbB8klPJi1CZrg4olRhdv75FeNjWoNH
 DwmAZKUl39AjNY7p+bvTQ7lkOZDK8Ur3uo2V4QHbpDdBleL7dDV8+ihej/Qpuf6phObV
 TWmytYPz/CUleQri4Ujh/gzrc1sxim+/9ZyT5tD2YwViwedUkT8BbjKR8X/Q6OIl8G4v
 6nCQ==
X-Gm-Message-State: AOAM533I0GnP2mliuSzg0KFC7KFgk/s4FrvzNrpoZXakXpWg9q32UOs0
 dXHXK9hfxxYfNiJQxwVOOdH2rJ8e67w47FaXeAqWkw==
X-Google-Smtp-Source: ABdhPJxaIye+D/H/s7rfEmIb8hQu9SJJU4FDDE6UaYKC50XEKqRDR5UAYARAqMvP+gAZcOfxbFUriiaP2zRCUCXa5hc=
X-Received: by 2002:a05:651c:542:: with SMTP id
 q2mr506484ljp.201.1642477667182; 
 Mon, 17 Jan 2022 19:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org>
 <CACRpkdZCtEwZiVwoW+QNL4nTf-10fBDRfGkwVJavf1n_w-8q_Q@mail.gmail.com>
In-Reply-To: <CACRpkdZCtEwZiVwoW+QNL4nTf-10fBDRfGkwVJavf1n_w-8q_Q@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Jan 2022 11:47:36 +0800
Message-ID: <CAGXv+5GRqQFHsxZMaK0VT534rQvQTx5-h1U63mFSUQuAHRGmkA@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: mediatek: Fixes and minor improvements
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_194749_144695_5CA3E565 
X-CRM114-Status: GOOD (  10.71  )
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

Hi Linus,

On Sun, Jan 16, 2022 at 8:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jan 11, 2022 at 12:22 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> > Here are some fixes and minor improvements to generic pinconf and the
> > Mediatek Paris pinctrl driver.
>
> Looks good to me, can you rebase this on v5.17-rc1 once it is out
> and I will queue it!

Thanks for the vote of confidence! I think patch 7 still needs some work.
I will likely split that into two parts:
a. pin config readback of the advanced drive strength mode into
   PIN_CONFIG_DRIVE_STRENGTH_UA, and
b. Supporting setting advanced drive strength mode via generic pin config
   properties.

The latter would require modification of the bindings in a way that might
not be describable. More about that is in my reply to patch 7.

In exchange, I will add on a code style rework requested by Angelo.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
