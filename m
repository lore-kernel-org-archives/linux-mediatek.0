Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B409C982F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=; b=fA21B9HFAEpA9By2qGlt9Ix1uV
	CTzZNjNx+64tZ/Me7K3C7yPMPMXdHKu76WOA5NDstA7nQrYYbA0pKgZWiKhY6BhW1w2Q0wF4nR9SE
	oZwxQpGLBcB/PenSxsWH0DLlNN6XMIfg5PTo/cYUUkk+67rlzk+N+THitTltmYTSCxrl9LGPChEVQ
	lHTe6SieJ+vUe9zXNZSW5veqCtKS0Je29HLqiSOU7I146JsKxYUDZm7B2xJCC+uJpOnEdQtJQBu4X
	sTFx1HJysCne9MPtflSl6EXnLcp6pNhi7hQLeca/chUJrM638Q1qeGfA3zkMgcdw3n4fnQ3N1/4jD
	jCTxGmxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xUw-000000051PW-1bQv;
	Tue, 22 Sep 2026 10:13:14 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xUs-000000051O3-3pOX
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 10:13:12 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5c985f055b9so861801e0c.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 03:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790071989; cv=none;
        d=google.com; s=arc-20260327;
        b=UDOQbsmAj/RQlHSve/cPbR6Y0ZD8ngTLKxp/Jspq8YlEB/S+2mVL4Ef4Ipk/J0WGNX
         jMuRSlPfSKj/ffMmENUIocAr2Tajl/cnVo3ndYBB4Yt4UVMe0MpzZlUfmUpiqNnDgPk5
         iIyInAouCWsmvIRtiUDcSBF7p/oYrqGFrYPt/cZYdV2t53Ezbnnhzx5KSdQk2WWegZN3
         X8O7EudaDXvI4Z9r372/avwSI4Ky0MyMBazZn4Ha8lDhVhTvS/pVj/804LEfDmFMkr0O
         EpYn2SD7PzGA5NSdJq+fDaWm9cUdQVrOIlJDndo3PQuHf0IRPVCua8/9OZkfxbhU8rTx
         MnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        fh=KUw5ySPgXMChTSYI9liY+DPjBxUasWlaCAk/pAjtjmw=;
        b=kn/zY+KXEU9diIArv3gnPSbki81XB9Xy/bFvYQ5uqUnHR6dF6chApkh6yCClQoDcDb
         lxHT4IVttJ27zUa0etpA+BGhjZOcq6VR0yKz3B5pj3z0TqPpvyFo3riXDMtrvYSKlUSE
         QiZq0SxbgaGvQZRvqjeqViAjH1K2mtpT1V9sngDDbH2NsWZwUABt+oyvKER0hCoAALjd
         5ruv2xgPAEfHuDolyNp5p8ty7hyE1qbTkI5iAU3LvVwfP8AiqwD0nx/FQiL+snpuWcqU
         vojcpBhe+yhTXUiZXvxzWhhIrlpwSryFdnbhPdkSRaGyL+s1ab5T6RIH20ap9y/ORdLi
         9QAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071989; x=1790676789; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=DLj1lPRXxjPUnXdRcKdpwXtECsXSa3CdJPkXOnM6BJJJ/rpIXhaGKs6jK/t6nVp/nH
         16KcF0WwFZRJdANtMcY/tL7wAko7YqEPiPTQ+xh8HWe5xzyJZkmN6P25vdMRWxhdWHGd
         z1tSaij3Ikh2WfF7RPG3FH9L2e8MEo5BVU2O31H4zH+VGCtyhvER3ZM4XJnVg5KQrT+K
         Ybxv6OIsXDAAooCnbvJAsZddk3k+le3YDOlmGs9ufW6mDlBhitYN+E3Zp3ns6ENFsylV
         SwtNz+LWIAq+eZMQUsyZG4hLDZJAzr+QGG7JUkenscmEpRkYq4T+GyscmWV2fQVzJl8w
         KQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071989; x=1790676789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=QvWIH7by6EoBHFgTUXzruNy40Aj4MaT7K6sbME4Euy5MHuA+OH3STbwoGW9rsEVeUb
         j59uubmimOGIqC8aP61+v3VMGnwqBEukwX/9i43w4Zu4eaZVkMyLMjB1QXgcj0zm+54+
         IBqpfP/e9rm4Bgi6HZhh+urT/ToB533RokDgGeE13sUKKnuimZrJ8nrs5Hy38UoJJufa
         zwSGXM6D+w0VvwTcGq8vIBSQOb/st12vCQJ+tRiW5lhQ+QWNapGmnebGVmkd4FJr3ZlO
         AO4SjEdR8fukB7aSJslo5CFBQdFU5leRhnsw4z79+Ms402GJpvh+0v2eMd+Hi7Omg3wa
         wM5A==
X-Forwarded-Encrypted: i=1; AKwUvBz6e9NOKJYJpu6j8UWME4vRHBnpHhOQNSLmygVMy/V0SyzNMTDuFWyWsYFhsufaGvRWQTcyHn3UqR2hBXpufA==@lists.infradead.org
X-Gm-Message-State: AFuF++mWI6EtP15IQRmELK0lm63qCdHDSBcZYSFhFathHIk6BGzLO0nb
	7aKkMvwns6MxXoEYars4trR1irBLjIoI4ski8ZRQxpSl5sgcwvGWG5Kvk97NFxFEJt39xlaGU6U
	+QEcHtDlVk474EQ42mmPQc29LBn6OKa8=
X-Gm-Gg: AYBFou3exMt8HaE4CD9FuTIBoYot3zxwtN1SQMUwnEg237REYA0TBV6SQbenxyp+dzV
	FuUbgq0Xyv9igfApxiuWbw5sGH1t+7Grf/3zJLM22XILMY4l54uAiWcnqEgSlBhCWzbVAqezVf+
	h6WbgDUi9PEICOCLrozAekkwOAQ+rpm6tY/NQFEXX1U/jUbd91pcV6F+svF0Bp7c+kIBzKq6k1P
	Y3PuQS0D022F0me+78+A+Z/KSGlV1WorT1rme6c+zGaIekChVONAzngyjMgRCpTHZ7fbJQHjFup
	P8Hr2YJS/gqGatFdJEkEo+LAXDQ7tYA/5UqGKY3kmAizh2yNnAzA2Q==
X-Received: by 2002:a05:6122:2b8a:b0:5c9:9f03:cb07 with SMTP id
 71dfb90a1353d-5c9e343983fmr1483343e0c.2.1790071988975; Tue, 22 Sep 2026
 03:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
In-Reply-To: <20260921135933.7e8857ba@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:12:56 +0200
X-Gm-Features: AcwNN1XO-IQtQQeBFy8m7z0RqgCFyAn_vcQf_nLSSDZxar5hmkBbTIMafTrhl4Q
Message-ID: <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031310_959098_45A26A9D 
X-CRM114-Status: GOOD (  22.59  )
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

Il giorno lun 21 set 2026 alle ore 22:59 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Thu, 17 Sep 2026 01:51:26 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> >
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
>
> Looks like the review for one of the patches failed so it won't be
> emailed out:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916235200.20712-2-ansuelsmth@gmail.com
>
> Are all of the issues invalid?

Only one is relevant, but expected.

The remark on the fwnode patch are invalid. The driver is expected
to return those error as probe defer is not supported.
(a notifier and late attach/detach is used to align to phylink logic)

For the specific Airoha PCS driver it's really speculation from the AI
but HW doesn't work as described by AI.

The only real comment that is valid is about the alternative way
to give supported interface with the .get_capabilites OP.

This is currently not supported as there isn't any user and it will
be implemented as soon as there will be one. It's really to limit
the patch delta of this change and to progress further.

Maybe FIXME might be suitable?

>
> Once the AI review is cleared, some human will have to review this
> and vouch for you as a maintainer. Better still be your co-maintainer.

I think some revision ago there was Andrew that reviewed some code.
Anyway thank a lot for checking this once in a while, I feel it's a pretty
important change but I understand it's complex to handle as it does
introduce a whole new subsystem.

