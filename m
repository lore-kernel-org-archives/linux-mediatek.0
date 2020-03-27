Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E5BC43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 10:31:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1DD20578
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 10:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hm0TYxnt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v8SnBAIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1DD20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgmCEJ4tw16dCxLgz3kv5wBJWQnmU54rsGkfEj4C/mA=; b=Hm0TYxnt4L5+qd
	j1IbqOKHV89Rg7bonAF2P19UeiTKNHHdSXMZlYNGZcd5ngcT+YFyPh6dYaH3FiAVzcWMPAJy249W4
	WzRUre2cPUkQT5+BhixOfFd42Op1cZWc+WBqJHFl5vGAS25JyRqUHImYx8lcoS2T6Lv3/0DS1Eo6x
	4fJBx9tWkVFE3nguCaNWP2i+xNwsO3gugI7Q4sZGa9zNiTNRA629owe1t5sXsMbJxcW1oU1/Ar38C
	WrMktkliFPWKGQe05f06u0/v25YF2OwoJhP+T7rPsyvN23oz8QaO7ewhjHjkJbjJHJ9Rjno7ntFD5
	1uMNjshvDFUe9hPG4VaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHmGj-0004m4-8s; Fri, 27 Mar 2020 10:31:17 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHmGh-0004li-GG
 for linux-mediatek@lists.infradead.org; Fri, 27 Mar 2020 10:31:16 +0000
Received: by mail-lj1-x242.google.com with SMTP id n17so9628901lji.8
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2020 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9GPFegNFppAtG8VfOK1hzN6DX1neujiFhmSroslZ3A=;
 b=v8SnBAISUhe4O2X68nvq2mTQ4IESHbhhK/DdVTGF6QQpxj+HBRN/yyyodYhymC+PzS
 JAFdSEC2fpQdWWwymmeF4F7Gv6hDx0LMnRAoHX2Hv/10PnazJ3ZE2H5l++8BZLS7G864
 MDArlHjA1tW1RQcDzi8mNdDB6rwpORj2r3S1sxgesBj3TttPQBwKjY6oDCQRmwRnomHt
 T+5YUciUeMpRSj/VsI0hGrOMhNfaVUdroln9DIKVTKn7ACGvcu+rQF/w6717o6nKyw7s
 +K1ZRkdSA3UaQo5WtepoU2x8h1WD6bBW87YeTPBJPZ/8OeN/4SKFC77CrK09NYv4o46P
 2tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9GPFegNFppAtG8VfOK1hzN6DX1neujiFhmSroslZ3A=;
 b=TNTS2tAtyzkCi4e8zYmjTSQ7pqVEa8AbsFrbH8P+DlI7XsInvZVR/hgVTO2kfOJNXn
 KKPlzCt1FFvi5bowFMkisM+RC23lL1Sl+YmVJ0JjwXS8SkP48Q1WYt34Dkd/Wz/4UTaW
 uNZdN231LH3hglee/W25BTyJr0ywH9zCsMOMgs6/fxF7pOrzPMe+xooFBycWe4C0jU1A
 cTgDbAWRec4E5crL3CTRhVWw3sJLFf7dIcx23p93xbueOIlL6htMpFhyrdviIz3XdcmF
 rDkwEFdSmRVpVanDiABIM5lAbQYarE5rAzjp/nNQ9t16UyU8D1sgMo8fdpVHq3IK1Ym0
 3g6g==
X-Gm-Message-State: ANhLgQ0ViC0H/LhAF8hS+vbCh6Egqi5uQ3qCYtmyo12qpi0ThO6FH2Jl
 ivLfUwG8xfTRcFQlYu38c0D0LG6CSJleiXB4Z+BQZA==
X-Google-Smtp-Source: ADFU+vvzNuB6yrUNJcqv0peX2lxUzuEUOGbmXMaFpa4JyDohIZuKl0tKEbyR5jYlOofIttkCHl7I8ntnC39UZAJQJd4=
X-Received: by 2002:a05:651c:445:: with SMTP id
 g5mr7734981ljg.125.1585305074115; 
 Fri, 27 Mar 2020 03:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200311090644.20287-1-tiwai@suse.de>
In-Reply-To: <20200311090644.20287-1-tiwai@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Mar 2020 11:31:03 +0100
Message-ID: <CACRpkdYBQ4tqy8Ji6rMwkAjOyx9zZFb-CYyYdLAfkDg3c+iPTw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Use scnprintf() for avoiding potential
 buffer overflow
To: Takashi Iwai <tiwai@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_033115_556227_07789610 
X-CRM114-Status: UNSURE (   6.31  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 11, 2020 at 10:06 AM Takashi Iwai <tiwai@suse.de> wrote:

> Since snprintf() returns the would-be-output size instead of the
> actual output size, the succeeding calls may go beyond the given
> buffer limit.  Fix it by replacing with scnprintf().
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

No reaction from maintainers so patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
