Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4028C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 12:43:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A51E72073B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 12:43:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LyyU7eB5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SjVyZzwl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A51E72073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9moR4bCicsJ6gjOcb+U6ijZ67ixT7eBO/TvFVoJg9+E=; b=LyyU7eB55oxJMa
	ALAkrTVVIogA1SBCFSxbUC0VgH6+1hQU3o5/eVYbY4gg06gESznA4ERR6xBePppcJMHD3b1gk4hnh
	Tjsr4SCUpUF7QIdRm9b9UMF5rtmODj02b/uljHr2s9bt8lxgRAiaZG9NItpU9JkSBYe1FEtrb9rfN
	FRQbtBjzVobIAcxc4FFrH2MszSpsl/md85x3ZNrdgFrzN5rfDD4okMi8/FEM1A9y0UVL5URAWiuny
	fYb4RAaAM3G9tgg9MPE0FGCYPqyf+l3/nxN3mPKPQc3poNmXagib9mbHV2XjSj6u+2txncGVNJiVB
	/s/UmUOGHB0Cg4/rVL+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieerU-0002Ua-Kt; Tue, 10 Dec 2019 12:43:32 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieerL-0002LQ-69
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 12:43:24 +0000
Received: by mail-vk1-xa42.google.com with SMTP id x199so5537437vke.6
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2019 04:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rmEiSSp96CqMy1Ppsk8W6nnDKAAqnPQ9Fp0EYBdV+7E=;
 b=SjVyZzwl1gFe4ZV18t5rV4aLho7lO9k6u7FJV6ZAqeuFB7bj2OpZ7m0NdHHPB5P/9J
 F1GRcZF8vBqkPBqBMbXJp1yuJ+IAcubDftWI51y+mNDpGrT6YxHSHu3zzeoVuKOXTUL6
 ofai+5OMyCUrw7aMsKCreGKjupSo3Hr8MQseWJ2xCsncPzWOMFL/Zih9GO6A6c/ZjqzK
 JyQZpoeWVRpPl0H1oX5XjRDyHL02eQQ9+RL/TZcZdazLKImnbYsdmtz0DQPBGEJMtLj3
 8uxieE2T+RpsIhE9/Ytd6ACKGxx+oh90ka0loPrxuxNct8VjQ+3Ll7M3kAKlYy5U84kC
 DmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmEiSSp96CqMy1Ppsk8W6nnDKAAqnPQ9Fp0EYBdV+7E=;
 b=mLm12TnibqmmJyL9V1EqlA8g34BV6iODnlBj7CVqGNmApk657Ynh7lMVKPoY/pETmG
 z6S8QZkIRX+k6rBqJJBSIlDiLmEb7OsDoe88M81UFi00zRBayza+CMiZ/gPHiKekKJ3I
 Gbdt7pQng02R1OxsIofd4V9s18++kEhvXDY3UXLVRCJDAgXJ1En0WcQNmBYEE4sJiNtL
 0276r39kxTDY8CpWvn5kQAGXg4CV00GG9UmOzVDhahPftuV1E3yIw8ef1UbbmGGHEdAM
 sFGrQe+kylBr3PZ8E0BpF6qkbLkKbAJkDBpuim87acCRZsC3X0MdnFrmie4GT9NmBP2Z
 vMUw==
X-Gm-Message-State: APjAAAXiMTrmvE7dW4wpLbhybjfPj6msKZdZt2VpI5MhRIZd2lwiWAKD
 L6U2KYrgXD2Prvj3mDsCqrjatpRSPCQuxfzqwdCAUg==
X-Google-Smtp-Source: APXvYqwYeuWm53/m5Bq2qBEuOXIjm6v1jerpImsqqYFfOVtKgHeSeKsZzlwtHErJOzdB13a85RtG6b5LG2BU3bpzpc4=
X-Received: by 2002:a1f:4541:: with SMTP id s62mr8918335vka.59.1575981801902; 
 Tue, 10 Dec 2019 04:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20191204071958.18553-1-chaotian.jing@mediatek.com>
 <CAPDyKFo9Z2yj7zC5VOS-iX_LyavPp1A4n73eAp7VD-Q+dpoqpw@mail.gmail.com>
 <1575979419.7714.1.camel@mhfsdcap03>
In-Reply-To: <1575979419.7714.1.camel@mhfsdcap03>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2019 13:42:45 +0100
Message-ID: <CAPDyKFpCjzpxOLi+bfawgHJNXve16tkJmg-Z0Jqjf3zJ5UxV_g@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: fix CMD_TA to 2 for MT8173 HS200/HS400 mode
To: Chaotian Jing <chaotian.jing@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_044323_238867_E9ED0331 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@google.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 10 Dec 2019 at 13:03, Chaotian Jing <chaotian.jing@mediatek.com> wrote:
>
> On Tue, 2019-12-10 at 10:51 +0100, Ulf Hansson wrote:
> > On Wed, 4 Dec 2019 at 08:20, Chaotian Jing <chaotian.jing@mediatek.com> wrote:
> > >
> > > there is a chance that always get response CRC error after HS200 tuning,
> > > the reason is that need set CMD_TA to 2. this modification is only for
> > > MT8173.
> > >
> > > Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>
> >
> > I have applied this for fixes, however it seems like this should also
> > be tagged for stable, right?
> > Yes! should be tagged for stable.
> > Is there a specific commit this fixes or should we just find the
> > version it applies to?
> >
>  this patch should be a fix to commit:
> 1ede5cb88a29bba1aad1b68965c5fc8e00b20ed9

Perfect, I add that!

[...]

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
