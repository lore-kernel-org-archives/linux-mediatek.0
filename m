Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F460C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgjPE0OFmRFHo7Z1uCpz96jqkXmo7ld9GDJYygtj7OA=; b=GKaVifTU+N0jw7tHAtnBQVxCXr
	ZaR4WXsBOfGYGq2wOi6Oa6dUPWWkaAntr6hljP2AmYz+mTulhiefGhtZ6c0Ou89k6rpyDfDvK9ABl
	MEngzwlkFzBFQd3z+wcXcCxmrz4iTTTpH4BO9lq4KS6nY1rLf8CDcCe1ovefW3lWFxujl4h1gtzqT
	9o3bY0E7huuunxqsDXyAGR9TeeuMa0jcrWQRKN4ViE2UweocolT8px/4TB/BtrZib975WlnCqACM8
	WCLexkO28Z5KxfHbKX+7bN+qoJYfUUICF+7/DUm8V2IfqCfDa1qmhtSv772w9WDqhCAngAemSwsJX
	ILupEBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncMZ-008fCM-R9; Wed, 26 Oct 2022 09:06:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncMO-008f9Y-UZ; Wed, 26 Oct 2022 09:06:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id y16so14770682wrt.12;
        Wed, 26 Oct 2022 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgjPE0OFmRFHo7Z1uCpz96jqkXmo7ld9GDJYygtj7OA=;
        b=TXFYGCkJ8ubmCcJC1JNK3EZ5PvBpOgwIocdGz+ZZ49Blh8RmcAgWcQZ7q6oLIEduND
         Y1d2r/CERU86YkwReVEZv78aG5ypTcnzRGcpoZ6zJlwvJKslbHI/R9FVleMzpG2mTeZ7
         TgcRl6tAPi1iHpJlmz2lSlW0VgrtzhhqgLihstKFM6UmOtGpVPxvfeYtEV3zbzl/Sr4m
         DH6NOqpiSL6POYb6Kn8NrqRIvvje5lpiSkdAk2IPuuEsDCPn46JgvFdIaVY3NBy/zmVz
         dsp1UlMClBcZlsxO4aDPcihonWVaKDmKT6/hWt1xje/LYtNkbQFKKa9tL/nEm8CSnmBy
         sl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgjPE0OFmRFHo7Z1uCpz96jqkXmo7ld9GDJYygtj7OA=;
        b=vDsuDOvX6cYXKJTjCNqt0RqJHcAHUu0I5Gn4hsKaPo6Fq5Mad9engH9b0pEw8WQkvO
         2j0cPT0dmtq7+ESlUb+k2rrHtX6eZWlLsC2UVX8sep2HH8ud8sCr1XEX2+8UgB2JCj2O
         0PRp/e62TJwwh847xMcJfmovi7Yzous4Hlh0jUpDP28DuLxkqb43wVWy+UHqlwudIWk+
         hSA8m7h30uKKCpv3L7rQJtv7didBNqdXe1uO9p2sKVN1YytSWwbDq5tOQ/7bYcOGjxgx
         4ri04oqxvCE6r2y8pa/eB4mUiymIhkB/RFodoFMLxQmQ/xbsPpvJQTb5IKLeWgUICnaZ
         RRkw==
X-Gm-Message-State: ACrzQf2SyFhIB2KX+SoG6oVdz3UA0276bClj/WIt5hWG71Pju2TJC2zE
	u31YeDh6kYkS1CTgEKTElUG/ZPCdP3jMgduyPO0=
X-Google-Smtp-Source: AMsMyM5NjNV21C5WeMi+mlwJIutp+UfyKLwakzav8DhEyMkznmycOJk1o62D9YtjDLWqniVDB1/7DpEEGCBcsLeMo0A=
X-Received: by 2002:a5d:6d0d:0:b0:230:1b65:a378 with SMTP id
 e13-20020a5d6d0d000000b002301b65a378mr28943423wrq.406.1666775156703; Wed, 26
 Oct 2022 02:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <Y1aCiReTZDbPp/rS@kadam> <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
 <Y1j058PsWYj0MQrC@kadam>
In-Reply-To: <Y1j058PsWYj0MQrC@kadam>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Wed, 26 Oct 2022 17:05:44 +0800
Message-ID: <CADiBU39z_h=QLF-cGztz6Wq86+rMahVb7owHNt4RpvFPFYDs3w@mail.gmail.com>
Subject: Re: [PATCH resend] mfd: mt6370: add bounds checking to
 regmap_read/write functions
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_020605_011130_0C07F760 
X-CRM114-Status: GOOD (  18.89  )
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

Dan Carpenter <dan.carpenter@oracle.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=88=
26=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Wed, Oct 26, 2022 at 03:24:48PM +0800, ChiYuan Huang wrote:
> > 2) normal register access with negative length
> > Unable to handle kernel paging request at virtual address ffffffc009cef=
ff2
> > pc : __memcpy+0x1dc/0x260
> > lr : _regmap_raw_write_impl+0x6d4/0x828
> > Call trace:
> >  __memcpy+0x1dc/0x260
> >  _regmap_raw_write+0xb4/0x130a
> >  regmap_raw_write+0x74/0xb0
> >
> >
> > After applying the patch, the first case is cleared.
> > But for the case 2, the root cause is not the mt6370_regmap_write() siz=
e
> > check. It's in __memcpy() before mt6370_regmap_write().
> >
> > I'm wondering 'is it reasonable to give the negative value as the size?=
'
> >
>
> Thanks for testing!
>
> I'm not sure I understand exactly which code you're talking about.
> Could you just create a diff with the check for negative just so I can
> understand where the issue is?  We can re-work it into a proper patch
> from there.
>
Here.
https://elixir.bootlin.com/linux/v6.1-rc2/source/drivers/base/regmap/regmap=
.c#L1860

From my experiment, I try to access 0x00 reg for size (-1).
Testing code is like as below
regmap_raw_write(regmap, 0, &val, -1);

That's why I think if the size check is needed, it may put into
regmap_raw_write() like as regmap_raw_read().

> regards,
> dan carpenter
>

