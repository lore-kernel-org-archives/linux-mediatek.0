Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C19C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 03:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyTMBz18HEVHXfOC75XF/XwAigYY1J0VD9d41fPcrqA=; b=4rngfkl/2y+vUf
	oK7Fdu5Xv4HB8VnPk2K+wr2zyWS+Vlgzmei3Eia2GWmcS+53twLI9dZFi1PLbUZSiraTNKN8KNxcH
	PLN1Lxlwb9gbXJIq3RgWDww1O/+ilvFdhqiDkGDPd/pYIFKWjErA2K26mHbGjReaKruPxQUtAjQDM
	f/s/TMHRbcHiqBxJfxYSctWmTJfwlgI932Uy+Lo9ZYdxTjO1NJB7QzXnDMHbPdruDTO88DVCg8Ok8
	SIV5ne5LLmv8vCSc5+zGmQEQzkZAqTchmXVcAmewCtFn5GD1/IP8IfhACekxokIkQgoVJ2TjMZ8T7
	VrL2UfVgOI3P0WFOFrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS9c9-00BCFH-9J; Thu, 10 Mar 2022 03:37:21 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS9c6-00BCE8-6w
 for linux-mediatek@lists.infradead.org; Thu, 10 Mar 2022 03:37:19 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2dc28791ecbso44692917b3.4
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Mar 2022 19:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8yQTKhKZiy0dUPmGqJVBdGvAVphmdM4bBbUG0dfDJxA=;
 b=l8ZoaPWHxwzbVpBhjmxinUTGj1j+Ig58rGZSi3+BJqEfohJetEebkCtGVXGmOi88as
 RgOeKfLY2ZX5wH72NwrACWu7i3CfsGj5AHezzZzN6Xn3IYWVfFZwtjSwCFCfnCmZCqBg
 2URYSWoyX1aaT67mpJbQp4uHKr91W+6dsxTzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8yQTKhKZiy0dUPmGqJVBdGvAVphmdM4bBbUG0dfDJxA=;
 b=vAhIcjeoTNDJQVyiAUT8s5bFG5cX+EMX8km4YmFbaxHRFaJmYrT4p65EX+ejMB7+tY
 tCHHDtNYnrEfUwegtUfbRaKuamEBalEA2SI3mmCoYfqOdk0+3ozKhUbnwGAyK0BTokqG
 isAl21gqxn9UEmq8dzaqzH6GwhAHGdrYrzY1LCVczeqApQp8Dau90AoxZEzt341xibLB
 LEnyoBar+TPJ2XmgTMjoT4G9M0hAg7I4cUca/+p7Tr6xmpP6TdSFyMr+IJ9Le+cyweQy
 o0oUmAGR9eTzlYdks10SIjbslDStoGeESXXZvD/brhuGRZTlGFqeL50htDVBjEUSrJoL
 baRw==
X-Gm-Message-State: AOAM530ozbefAck7w6orQ6xujH0PBaOeMG4UCxnoWT8gBZcrmmO8N0zO
 GnrQ5ruoiy9wqd9NjFZ+Dnrxm3Z4l2TsI6BnQonKJg==
X-Google-Smtp-Source: ABdhPJzD4At+0kNDeSdaPownG05HBBbm9XR+dPHBAUs2dzK5t7RTrvr+pZUyJbh1iI5EfuV1fzcc2FvG6pci0IJKTDk=
X-Received: by 2002:a81:5791:0:b0:2dc:4a64:56f4 with SMTP id
 l139-20020a815791000000b002dc4a6456f4mr2475820ywb.286.1646883437469; Wed, 09
 Mar 2022 19:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20220308100956.2750295-1-wenst@chromium.org>
 <20220308100956.2750295-6-wenst@chromium.org>
 <400cf2fc8cbc3887a90f50709f40adc0662ec0f4.camel@perches.com>
In-Reply-To: <400cf2fc8cbc3887a90f50709f40adc0662ec0f4.camel@perches.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Mar 2022 11:37:06 +0800
Message-ID: <CAGXv+5F7pQt28m7wjS22io-MF=ms-HAWOSGC2iMz8cX=zhd1wg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: paris: Drop extra newline in
 mtk_pctrl_show_one_pin()
To: Joe Perches <joe@perches.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_193718_289051_53D458AB 
X-CRM114-Status: GOOD (  19.87  )
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

On Thu, Mar 10, 2022 at 4:01 AM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2022-03-08 at 18:09 +0800, Chen-Yu Tsai wrote:
> > The caller of mtk_pctrl_show_one_pin() is responsible for printing the
> > full line. mtk_pctrl_show_one_pin(), called through mtk_pctrl_dbg_show(),
> > should only produce a string containing the extra information the driver
> > wants included.
>
> Does this function have another caller?
>
> It looks as if this function doesn't need to be EXPORT_SYMBOL_GPL
> and could just be declared static in the file instead.

Judging from the commit history, I suspect there might have been plans
for using this in another module?

I can do a patch to make it static until that ever happens.

> btw: using %1d is mostly senseless as a control, but has some
>      documentary use as a value < 0 or >= 10 will be always be
>      fully emitted anyway.

Ack. But we could just leave it be.


Regards
ChenYu

> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> []
> > @@ -634,14 +634,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> >                       pullen,
> >                       pullup);
> >
> > -     if (r1 != -1) {
> > -             len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
> > -                     r1, r0);
> > -     } else if (rsel != -1) {
> > -             len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
> > -     } else {
> > -             len += scnprintf(buf + len, buf_len - len, "\n");
> > -     }
> > +     if (r1 != -1)
> > +             len += scnprintf(buf + len, buf_len - len, " (%1d %1d)", r1, r0);
> > +     else if (rsel != -1)
> > +             len += scnprintf(buf + len, buf_len - len, " (%1d)", rsel);
> >
> >       return len;
> >  }
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
