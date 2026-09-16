Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F3DC88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw432elLmhA4oy2qWRZIhT4M5eB1za1G9hSrgeusNHM=; b=qr7RatZTGjpTg36DMAPR/EgItd
	mzoh7qDWfNtQ1oQDDRnn6K8zVpfj1TdVse/k9iMmo247U2QXT+bMwJoWB/Q9aVDejLbMxB3BUKJdz
	r/+Y2EDZt5pMSDN9t4FziTshq6/QwLUrdAjjfBipg9gmZ58zKetO1n308sejixjpMtx79kCi9QSaZ
	lLalsa+BFerhaq2q+Fy2jyGT1CuCXzej7EVceCt7jdiVfK6BjqF3ngE1ZRjThh1JfIb3rj1+7vD//
	+37xY5OJJXZcN905l7eGTfo1jiEJjainvdJzkxXnNrjWTSqV2JPkLLSMsD+3MjK6y+n+pvWWxaZFR
	RmVbFtRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ktg-00000008hsl-2reO;
	Wed, 16 Sep 2026 08:21:40 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ktc-00000008hrT-1rjj
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 08:21:39 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b91369d18so4271835e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 01:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789546894; x=1790151694; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bw432elLmhA4oy2qWRZIhT4M5eB1za1G9hSrgeusNHM=;
        b=WQSC3Xo326XsLU2+mN5PPx53Gt4YMe9n6eANRF9jqaMzkep/uc/KJ4yvAkkOA2i/39
         +1RPjuQIHB3YTTeM9f6N7CRhN14BrEAaqmw01XO/7fHeXjav90FP0s733c5JNwikOTAK
         YH4wDGBRtG+WlWb/ePfl4azo0fd1Q4YQv5lftj8WXwgNp8qvtjuM3kpThtda1ADX6nge
         MEiFCJOevak2tJ3yfEMeh6ObkkhjxqIoYIqGTcCMmTOyMUIkMwFKFKL1c4550WJVR+Pj
         wmScAcn5vIx6m9r1WiWCjGnEKBrhn1Ugz43QsbSeuh0Z6klHRDOaq+FCMU9o/7DFrlP2
         jqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546894; x=1790151694;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bw432elLmhA4oy2qWRZIhT4M5eB1za1G9hSrgeusNHM=;
        b=buClpJ6MvH/vlIIk04oAy11m9PLTWjtD9y6jkinsfOlTpSZFdEDQyafblOvgqCHKVf
         a0rodmsaCx0lL7Bs4kyHCaMq17uSD2I76G/kK1WMUGd6Izl8gMbKUOt2fQiuPTlvhDLK
         urkSNjrmtpH9wqUhWBNsnwG5s01DxpCqWi20b+Q7MwijLcAKwMw6gfi6RryD/PnQLwVK
         ozpe0fywVzUTo2e0noLzcSE9KD7ziXAKmf+MizjsEI5Cy+IMVUjacHU+hL+hBvqYU7bX
         ygTT80GQCkqoItAmGcS8p3AqzuRUgFyo8+lfpvSX/6ZDTyFgxAU06/5poRzjunLEbNW+
         QhPg==
X-Forwarded-Encrypted: i=1; AKwUvBxwMRd2zcVDEZr6vXpoJwNuwx8K7sI0EcNWfemL0ygCrjm5sQ548kBqN2tbX5D+5AuPX/4NCxeKVDFmPkGvxg==@lists.infradead.org
X-Gm-Message-State: AFuF++mQTtf38Zedk9ekwqTX0jrclN9fr5K1RSKxAi7baTcRxmD8vImF
	zKwvxlG7P+47TC06uk3iB/SFkC+uds7HNxyLjH4GDeCKnlYs5Cid6Pmf
X-Gm-Gg: AYBFou22vbctN0csNK9lMpmC0oGjb2azaBC0Oym0c9+bKEp/iUTm1lR5bUNI3BEWEiy
	Gg1Ew76d2TVdA+jgiKLXe1FRz1wTht7L988XFgNngYwk39YHXXxACC2VrLiNapRSk9MEiIiXVrq
	qt5OtQeiiQrdoBFuezKg68sEMZWf/Oj8gr1U1XczMJdkgWfqpEnhoR4ebZS4wfk68tENy+HmjRW
	nQPBTRuZf6XVHeMrdWwOMYgogixWOYpL9LpeHbkMBWMrl4P++5t1j9TpmAPPwJzd4bAoJ3J9Zdr
	J/rV/0DGQZNXIzilX0gGiQKNAd/89t/wWeQclp+WrdcnjbwNHDMGH1El1o4L+y3VBBJR5A5hhkN
	6VKFUdoYSMUpkLEDq1ibdvKKXUMdA8bAgqPXZyA3b4gzO6V6aSVd87AdBO2jAPJ4Qj+DGuOV6uL
	fypj3s1tVNFLu84XhnnM2sCN7zQz3/d/ovlVGGdidvZ0RaU8MyY1MD2wrerXZe8Nx4BuLTw2zm9
	J5iqBK1TT9CSgceXGBfhZKXmPEEOiQJf+cK1eh3UpxFGjAqEotw1o6bkmi8bsu3eBSytpKxwsmY
	79LRhYZ794WLkQnbcKsMk4lv4ZoUrogPS4lNeMa0LymruSqz/aauag7qxC0ViAx08dcBCJCSQFz
	QAMzZT/kufu2OjxKA/bWXUgpkFGWFN4muJG5iS1rOs3MNDAb8yGZUpJojR23P6lEH/P2wJbchrf
	uT5ej3
X-Received: by 2002:a05:600c:470a:b0:49e:6bce:b0f9 with SMTP id 5b1f17b1804b1-49eb732cc87mr17337945e9.16.1789546893641;
        Wed, 16 Sep 2026 01:21:33 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da071asm73394925e9.8.2026.09.16.01.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:21:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:21:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] usb: core: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <20260916102132.00005129@gmail.com>
In-Reply-To: <aqpOlKtxeROh-G_s@hovoldconsulting.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
	<20260915090223.1346-2-joshua.crofts1@gmail.com>
	<aqpOlKtxeROh-G_s@hovoldconsulting.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_012136_499826_7BCE441E 
X-CRM114-Status: GOOD (  16.76  )
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

On Wed, 16 Sep 2026 10:08:52 +0200
Johan Hovold <johan@kernel.org> wrote:

> On Tue, Sep 15, 2026 at 09:02:18AM +0000, Joshua Crofts wrote:
> > The fail label in usb_new_device() disables pm_runtime on failure, but
> > doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.  
> 
> No it does not, as the device itself is about to be freed. Sure we could
> disable autosuspend again here, but it does not really matter.
> 

Okay, commit message aside, you still need to call dont_use_autosuspend()
on teardown as the driver doesn't use the devm_* counterparts. Currently
(according to my cocci SmPL [1]) there are 195 instances of this in the kernel.

...

> But this one should not have a Fixes tag and does not need to be
> backported.

Yeah, you already mentioned this in IIO once [2]. I found several instances
of patches like these being backported however, so perhaps times have changed.

[1] https://lore.kernel.org/cocci/20260915064327.1377-1-joshua.crofts1@gmail.com/
[2] https://lore.kernel.org/linux-iio/aoQEyeHUiTwWenBL@hovoldconsulting.com/



-- 
Kind regards,
Joshua Crofts

