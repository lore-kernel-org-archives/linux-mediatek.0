Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99356C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 13:18:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5479420866
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 13:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NE+xJjwM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="YI5fYDIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5479420866
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fvbA3W1/QA+1QRIpA6pDhACa/U4LQuhumLc+5n+pcj8=; b=NE+xJjwMydG4Yo3iIpV3/1Cpe
	meAHdsI7fyzMigCHb/a+TQYniNlCXw3b3hS7MdBvu9rIGhjjj9RUrZrQVXfP/jiRRbRjwCuf4FTx2
	ABEGOm3heRJSnI7zX3XI79QzCUKW0q21L9hfPJIeNNFRqdnqQ1giQwJjZFwNt71z7toR6nj5bkduf
	SxBgiIMt+zq/GiJSrBkwsTK4hknD35MiGp1SHx891bue9tXUAdAmu7u2zN1bNg+yr3ZZduzs7Ofbd
	Wn79gqvF99NzzDtJ7fMepn4MMojJW10Yz3Z480qmZSmF/UO1Y2aZz13wljjefx9LowKWoNjo9DZNo
	URAWQdPSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6ZbH-00012P-AA; Fri, 14 Aug 2020 13:18:27 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6ZbC-00010x-SE
 for linux-mediatek@lists.infradead.org; Fri, 14 Aug 2020 13:18:23 +0000
Received: by mail-io1-xd44.google.com with SMTP id g14so10803543iom.0
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Aug 2020 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2PB/319L1J3UbSsvQXsk+iqaXbh8YEkFfuDe3hnFHE=;
 b=YI5fYDIxlyNW2uGLyD7wh7pch8oOC4a9BM9XzcAV3uzZReGiSnYl8Fzr0GLs8CDPS8
 hbrlmLFTzWfNSKJxC4C7bPefxFdIhNnPRT407Vluos3iBg1hJMvtQHoXZln5na/PQ78L
 yPzVrnSv9VjO5zXwGXHhipg/o6uqzMv7JueLQxV9vudzz95WjoOWWcuRm13N2La14f+C
 UWnlV15BX6PNArrSpyjbkVWLOmpdu+kxCr2jSBZd+UiFBzHhXTCgvoWYwr9F0V0ck2h3
 K1fKgj2AhZGavQoDjUS2fDu/NW4+4MdAvBU4gALuq6tceMnoSbS9VcanPVHg5Zn2SHQ8
 DAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2PB/319L1J3UbSsvQXsk+iqaXbh8YEkFfuDe3hnFHE=;
 b=s6xLphz3rpChWw4oqoVHA473NXnrbaqlTx5GKn1zvcqMT9oqlwx8ucB4UDUAVSDRpM
 hr/8LA32YbdLSrfIUbTmjFx1uk3zLcqvcOMLDsAyBy1MN5cXHelg+Tyg1demhmzdogBK
 cvC5w65F2lAbC2X6jG5D2Qu7GwwudSKQAv4vtYjMMu3RY/WAV9vNikWnqOZMc5KTC7Ww
 6KbWZpSxeahFr1KzNPfaRIM7L1/tDnZmHznh0uAmBlltPujCW/Fs8UgiAnK/gjAZ70GU
 gvCJMNC74hlTIEv5RJKcRvDfJejCgpQ0iVatlW72kwxhzQMF1ktPjpHcWBCHRpeFfpzZ
 A46g==
X-Gm-Message-State: AOAM530BReO5LPYLkgyJF3s7vrPob0aNZRmGoxsNzSlRND8fkGmSXl73
 /WNFfyZvhMy7UOFsPadAO3V1xoDHlXsSliLpDvcAvg==
X-Google-Smtp-Source: ABdhPJwYd8jpI65/wtT2fNRZWRhTYTd4FnLcZufGtZBAixlBWVHmz9K/7rA4kw/6OBJZEDtXxlHLFhaUiHeMnLm74jQ=
X-Received: by 2002:a02:a584:: with SMTP id b4mr2653129jam.68.1597411096065;
 Fri, 14 Aug 2020 06:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Aug 2020 21:18:05 +0800
Message-ID: <CA+Px+wUYYV=AS51i=7sbLDJ980om5mDp=YwVuOYzEy01WxTf-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add mediatek codec mt6359 driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_091822_950759_AFF177D4 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, bicycle.tasi@mediatek.com,
 eason.yen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 14, 2020 at 6:47 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> Jiaxin Yu (2):
>   WIP: ASoC: mediatek: mt6359: add codec driver
>   WIP: dt-bindings: mediatek: mt6359: add codec document

Please remove the "WIP: " prefixes and resend again.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
