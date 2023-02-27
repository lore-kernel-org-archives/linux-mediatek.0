Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B460C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3owx8bm935W6dFgfi76X403PJDDk983z5ZT3LHH1Acw=; b=J/5Df8P6WopxT4Vpyd5MooZhDv
	kavZ3yW7/vKXO3XF52vDLew/Y6axkH5ztuGVijQZE6QU57YNCXJ7K0EOBrvsedOvsyFh3rtKcQuEQ
	5/G2hPfdBKH+ZlLcvjHG9lvQcwALMwVwimKQsKoZIqyGWALwVDvc9+DCL6ROTFLYhMAI08SVRUxI1
	v2iHo3xzRVizSChI+SU0w5l3ZJ90heaJ4B6aYEsRtwvaSVL3hui0Z5FcpglYwSKyzz248J4+RbuK+
	8tdX8RDGmipg0RnpOnhQyEc7r0mwQF1d7Ed32+C5Gy7vfKvAecksW6MWZB+jXtLL4n2XgVRpGaLdj
	nF22SZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeVE-009yD4-ED; Mon, 27 Feb 2023 14:29:20 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeV3-009y9m-2S; Mon, 27 Feb 2023 14:29:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id o15so24101776edr.13;
        Mon, 27 Feb 2023 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3owx8bm935W6dFgfi76X403PJDDk983z5ZT3LHH1Acw=;
        b=IJmZsh7fYD7T16wncmSllWFtkg8kJqqVSHOhmRRb5OcSnsLnAtAHSE2/qeXUGX8xdk
         tISARXjOjZypqmIb64hTDftc1PTiaSBzjiX7IDLENKao0z+q8hD9nIVwpflTZF3042sV
         ktNlgFg7hEprtUmKsQo9UTc51Pw7G216iGd3pxHLCbthIhBXLAQ4he2bGfJrfHLPoh14
         mZGx3ZqVp5VpQsdLR6jq+Fzq90IAna8KFRSSDmRRdltIosjYs7F3Vnb8qPaiARYJeAFL
         rpWyA7vH/8UwZuC9DLJok/NXICAmKGJMHwn/d5jALIU7LLgivEZRZQev7m8sq4xv7DCh
         zXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3owx8bm935W6dFgfi76X403PJDDk983z5ZT3LHH1Acw=;
        b=eo1vMQH25Y2ozYw5SzbXBuiIPou5zJ84EbSslMnFSz2oWPl541/y55tKaI4gs0yi1E
         jYHIVZvo5L8DQR7COBiq+vvcQQymoy8LN6MBj1pk75c5wSZZGzBQ4r2wm0GjbSTY/5Mp
         lGB7PjX+oiwlGXo32K64nI3GKXy9pbiKm0SiRv/umgUZnfPXtAlZ25Mf41zYXSMiKK42
         HWMf77uzZWxAx/N4JiUoS9hosZRY9bZ2eqqdQ2wHdOuggjgWreH5vOOSvcM7cWh26Qw4
         ALf3466roSS/vlcH1z1w/nEWYsCLtTH4DYGS3FqPfy6jOaCz6J6yQcsj4ha3rtUdWvp9
         Vpag==
X-Gm-Message-State: AO0yUKWW86zwcfu6kl2LE6cHebF0sH40V/Gxb3eVrrR2UK5KgasSYgsl
	erlciVc0Q7mfKoZl4w7fOaN1AcCJpxmHyi6QDJc=
X-Google-Smtp-Source: AK7set+0CkCmG9Ei5HQCw/IfAgBc87KenY2hXkZDhwv1TKtYAnJrh+LmG+gnLJZC6R3xgxWU0R0R0p5BHh5UHdH/V5M=
X-Received: by 2002:a17:906:195b:b0:889:dc4d:e637 with SMTP id
 b27-20020a170906195b00b00889dc4de637mr14651060eje.6.1677508147369; Mon, 27
 Feb 2023 06:29:07 -0800 (PST)
MIME-Version: 1.0
References: <Y/yxGMvBbMGiehC6@lore-desk> <20230227135241.947052-1-void0red@gmail.com>
 <Y/y5Asxw3T3m4jCw@lore-desk>
In-Reply-To: <Y/y5Asxw3T3m4jCw@lore-desk>
From: Kang Chen <void0red@gmail.com>
Date: Mon, 27 Feb 2023 22:28:55 +0800
Message-ID: <CANE+tVq=djTShowm1o86184c34QYEax0_4Ls=y0_qFL=wo+EsQ@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: add a check of vzalloc in mt7615_coredump_work
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: angelogioacchino.delregno@collabora.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, kvalo@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	lorenzo@kernel.org, matthias.bgg@gmail.com, nbd@nbd.name, 
	netdev@vger.kernel.org, pabeni@redhat.com, ryder.lee@mediatek.com, 
	sean.wang@mediatek.com, shayne.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_062909_154910_7B3D7821 
X-CRM114-Status: GOOD (  17.91  )
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

Hi, Lorenzo

Thanks for your suggestions.
I totally agree with you.

Best regards,
Kang Chen

On Mon, Feb 27, 2023 at 10:07=E2=80=AFPM Lorenzo Bianconi
<lorenzo.bianconi@redhat.com> wrote:
>
> > From: Kang Chen <void0red@gmail.com>
> >
> > vzalloc may fails, dump might be null and will cause
> > illegal address access later.
> >
> > Fixes: d2bf7959d9c0 ("mt76: mt7663: introduce coredump support")
> > Signed-off-by: Kang Chen <void0red@gmail.com>
> > ---
> > v2 -> v1: add Fixes tag
> >
> >  drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/=
net/wireless/mediatek/mt76/mt7615/mac.c
> > index a95602473..73d84c301 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> > @@ -2367,6 +2367,9 @@ void mt7615_coredump_work(struct work_struct *wor=
k)
> >       }
> >
> >       dump =3D vzalloc(MT76_CONNAC_COREDUMP_SZ);
> > +     if (!dump)
> > +             return;
> > +
> >       data =3D dump;
> >
> >       while (true) {
> > --
> > 2.34.1
> >
>
> revieweing the code I guess the right approach would be the one used in
> mt7921_coredump_work():
> - free pending skbs
> - not run dev_coredumpv()
>
> What do you think?
>
> Regards,
> Lorenzo

