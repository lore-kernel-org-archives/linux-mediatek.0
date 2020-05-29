Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384D2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 11:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0740D20721
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 11:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uTfn0Pfu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="GOwvPiiR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0740D20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4i2Jv8CcdplSNlRIAhxlUtQ5yxCI0UkhcPCCM/LwLaA=; b=uTfn0PfuWXRHyi
	+SozKjxFdsp+qZBi7WdutkfRRjvrB1EbzAlAF+hCshU8ySbsad3DhxMS6nilKcOxkzGUphGBjd8CO
	fgWAPXnTaBN4wjCRteKNNMPDZAUy5bz/wpnsgINuGenBBtE13tRS3qtuT1RnkYzcHGyB38oB0Zzst
	7ksqT5ltwo+YRiHSNRwQR6X5+d82Ugzoz8Nxq3ofbC0Zof/4bZBemO+8NdgUl5BwS/0x+MuMS8Sjd
	+Lfli1qwC2zZnrLzfQLsS3Qts24HZkxHj6JhRFjOyhEL3O6aqHTP2lvFwcbNLxRPOQHnvH3o/fZhT
	2GN8huDxCF6aglrvBJmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jed6Z-0007oP-85; Fri, 29 May 2020 11:23:15 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jed6J-0007c8-21
 for linux-mediatek@lists.infradead.org; Fri, 29 May 2020 11:23:00 +0000
Received: by mail-il1-x144.google.com with SMTP id r2so2067959ila.4
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUz26vjSD65L7rN0EMN41DDMniwEhIkYrxKCsVJaPWQ=;
 b=GOwvPiiRbY2HA5dCwu8VwnakJLKuRTiwHSxEhSn4bfkxf6clQ/mmYJCGELf36Bynqx
 UFiqy+qXToyoSj7qbN3JgB7IwP32L7BKpjepWT21dV39n+HUyViFpownpjOP5Dk8b3Jq
 AoxC0bUc4Jm7z788Xp+J3aj7bghXACx0pZbroaqTx1inet6fdyIAdFPTHl53DkrRGXTp
 BtUSoRjI4Zj/4fAFit7YsPUG8l82exuxEtRdr8oir3Y1tnhSPFPLTl5RZBvMo4UFJ11I
 Hu/yAnsBSrSJCuytnLFUS38yj7A0kY9qrbPOBo3JSyZg48QVZaL2hqqjUMO5OOzvIS5J
 T30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUz26vjSD65L7rN0EMN41DDMniwEhIkYrxKCsVJaPWQ=;
 b=dzSpzAz5z0F49b2X5DErn74pRXZweh3EUqmwLoltlwiPW8/eiH4RKFUg+RFXH58ukg
 RSGbSs4jbZiuAT1LbQ2cPCsRGCKE/c4bfP97DRsxWMdsKKyPOT4r0b0JKdGPNcsA+MkZ
 w/8aH1a0MuekIxjCkh/mF8FLWa7IViVIU27djFo2TgZhZgulf0A5jivZg6QLMmiu6+wY
 X7ibAh+WOBCCYGfg13lNZP7ILRKkcXYhGBFgTUqBC6y73fVHaHItJk/eGJasTz9pr2Az
 UDRx+Dh9AB4ncMFIPQatlJxeQl0A9K3u/4zlMrDk1hiy59NyJluX28TVHy0A2Fyo5fKj
 2eSg==
X-Gm-Message-State: AOAM533+gd3cHXzFvOrY6cJeDF3lohGzjuuwViGXPZs5Fb2GlpflE9P2
 MZPZ827C9BjxbaLdSSPbTwER4WUf2ftDHkv0Jkes2g==
X-Google-Smtp-Source: ABdhPJwec/2VZU+1E/3GRAXji8VYXzHfBrNsBh8GmHVuKkblNQOV25jI2GiT7eGXCnLm1V2eWPp2ycxf0M5Oq/IRueA=
X-Received: by 2002:a92:b11:: with SMTP id b17mr6846581ilf.257.1590751374596; 
 Fri, 29 May 2020 04:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
 <20200529110915.GH4610@sirena.org.uk>
In-Reply-To: <20200529110915.GH4610@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 29 May 2020 19:22:43 +0800
Message-ID: <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_042259_102902_9992A429 
X-CRM114-Status: UNSURE (   7.18  )
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 howie.huang@mediatek.com, Takashi Iwai <tiwai@suse.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 29, 2020 at 7:09 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 29, 2020 at 07:04:53PM +0800, Jiaxin Yu wrote:
> > Supports DMIC one-wire mode. Adds a mixer control to enable and disable.
>
> What is DMIC one wire mode?  This doesn't sound like something I'd
> expect to vary at runtime.

It means: 1 PDM data wire carries 2 channel data (rising edge for left
and falling edge for right).

The setting shouldn't and won't change at runtime.  Would you suggest
putting it into DTS binding?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
