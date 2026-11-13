Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB360606A89D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rA/KaViy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjhS0lND
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=; b=rA/KaViyRODkcvDzXo0CmZYf8Y
	vtV3bmB0sq/ibjYB1RyRHHHC/lIC2MFmDr9tsp7njb6f6ZHvqrJLAONRbmUaNEhZlUxlhuXUYNA/W
	7hkbIUqybOpTyydDZWmgqm4xfNfgIohVTdU4+kBdMvPMubDuulb9EzrU+0NqO3mJLb3H7TIsLyEWw
	swnVSFS5NS/dkJrhC+9khbTV9EfZFZXXQRsWIGQXfZ0RSjDfthNto73ucEwrxIn8Qg1H1Qo7wFcDN
	xMPpAjSfvuPSFl+G3fvMCNq5lTmKG2evFzxNw9wphAciv33vdexemNH7S1DUlQvJPr6Ud7rnc0uul
	qKCyDRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRv7r-0000000DkYl-2qX4;
	Fri, 13 Nov 2026 17:31:49 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRv7n-0000000DkXY-31Ft
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 17:31:45 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-67be7b9abc8so1004650d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 09:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591102; cv=none;
        d=google.com; s=arc-20260327;
        b=W+sPWplZkokbkPljh6XDuYuKjMoXIQ/W/SQ/lp+jMzvwmjQtFi2FJj99hNE/qQCn0n
         hmHrWZkVU77RYYA5y42i2ihhsfK9qHPUTbC3SEiV4E1Mm3Sh7m+CTn5M8s3Phpb1iaGP
         lCXTi259NmIouQbXvbLMQXp38kC2nFfYUkxWZcUqnlUH0X/+2Q/P2wCkbfDCR0fZtYo3
         UlguIkcpTuNE7SkHzdjKIzIbQ4OHhE89RHYFZyez/csART5tvNxeGOdWM2Rs7B6uVCIp
         +v7PWthE7gPFdT6OGF8qIPp8NebZIqGMLnXf8eV34gRP3rKk70BVzP7JEsFuSX5aafAB
         EgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        fh=3/VJs1JqQ6CJ5Cwbv/lerxMfQK1n+okVzQ6ZkQHEHZE=;
        b=at/W9OQb4O1sSxcop601c9QZOlw+zpL8f7sXL6mIAJsZv0G1aej0X5t5wRFXwU15RO
         G+VsaT08PXqwuWFCZISo2/0cyFtCejL+kF6tuLwtDDIRCTdEorBZ1k8qftg0sIpPXYaX
         Uwo+D/OKAkYGVjGnZbAyeaphvuc+///V2vtBwvPY742jE9bi5oh6Qb7lMddvAbCakPNh
         JEXUmfg+fq+aOzAiceuHt7QGqJtPusELJj/Yk2pSteM8YL2WH9iM//MUk985lTrNn86X
         f1wxogJbwPPYqpHhO4eCkFMoeWca9StYAhfoaxxsZWVt9XtpNd9jK+S+DJ7qFSdwCnFR
         k7LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591102; x=1795195902; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=MjhS0lNDiHuhAVUNoeA2W5ShUt0KLYWb/WHUSdRcQdDTDvOwdnBF4uvivlLDI0k+G4
         RuDlgoDp6+si0fbZQb+QpcFRnjbo8uXJjlJ/kyS1wqpSyiLbJSCQ/qmig16BeLmO7UGT
         ydf74V1V8awDnaNX93c+CxDPhhrpwsVY6uK3mztW/ulk/op3vAUepGUaL+7Xn5MBXCC4
         kpYufUV+UT/u5JTg0btXiWqIGLRull9WrTAPz08ui6EuxEaNDmUsuX61U2cYQ6xm8Q8V
         rFqgZo042d0MyUqgt5VlA/bSlgS4iHj/pr7+nVLSqbYh3qh+bYMKdTwCA4N5lXTwtcf4
         oYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591102; x=1795195902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=zfM//KBLRx+TJiRBhb9qHwkZwivJJMs44uw4nQxIfnlzA/n54IdmnqC4SYGrCDrUvi
         ZsDJqGtYwlkjCFNldyeuSrLu/ou+vevoq/laABkua23Po/TwvXNjQyraruVP0aouZFCt
         El7dzDVdqaBHpFtPk+yqo3QHHMlsi9IkKoye1f+0mUrtI9AQBQ7r4J00TE3KvnIK4UmC
         nsjN9QHKuZkmU+bEe9nHVGMh2eMeHn+NP9mOeiSZTk0jFlLs1khK02ny4LY5LqaHkO9/
         B03XqzGF79y8zegXaYxNnDeLEoK6i2tZYPk+g7HX3TfdAO1I9yrQD1WeEBMmTqBul1xN
         C6GQ==
X-Forwarded-Encrypted: i=1; AL+hErEneq4CqItYts8NusOcfsGWZrNfBUwwLU9oDtWWkMpeyhHcZlgHKMoSpdqaKacus9tg/hhKoDGNyyy9eUheBA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8p88fUPcC8jUGBylZGagId6rDHIDavHNXVSusL4BvozRe4e1l4
	9K9zn102qFGAiUO4kKZqLQBqxtcjJPPH5wkWQty7HEiYhA84HtnAj4OnhhzlHCswmBj5XgoyIjE
	JvjxvRgZse84x00tZIYLGB9lhYSc81Hs=
X-Gm-Gg: AYBFou1NwVJOXj8EVoq4jM6oIVj7xw3JymdN5Do16jWdoTl+ZGKSOOO5K0lutRnNnC+
	nwsKwv2C6wy/BRL4CSQRVsDUyIx5DdSKTjYGfiL8rEMlOSUSwIDfAhJX0oLNvYBRD0Qe0arg+i+
	d1ENqFVE2zl8iT5HO57X0lg6A++XtmVgV1pJ85B58z6Z34a5/pzscF9TmiO/dVB+QHYzNHryYkc
	xFUb2WxE5wuonpriHUQ/sxsVlZ86PQlkA6T6Bkcx6Nx5gZZqdKRKc4RbF4TyLDk1Xpox8ZpjLSw
	1o3AsbL8U4u5kxosnze3T0kL77IQ/qgJjZaoAJEqaEtPRbtBMe53ya8hZjqRi+mjw5cnqSH0cNl
	i29LogXrVtNB0h4uvBz1y7J6SlUf13kSRcPuy7Cp4vQEP95eSMbhRO9A20271sHEfwCkD
X-Received: by 2002:a05:690e:4510:20b0:675:47ba:2183 with SMTP id
 956f58d0204a3-67d89709f2dmr1486987d50.53.1794591102378; Fri, 13 Nov 2026
 09:31:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113003217.197757-1-ansuelsmth@gmail.com> <20261113003217.197757-11-ansuelsmth@gmail.com>
 <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
In-Reply-To: <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 13 Nov 2026 18:31:31 +0100
X-Gm-Features: AclHuK_T9pn_LFNwcoFkFSy1mvqcLyRF0a8TMF1gVMEOv5saT-u9fzFGXIXxZrg
Message-ID: <CA+_ehUxzPo--g+Ksd_0xJZo7_bhYZ-B17wG3OyGtU=3aa6B+WA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 10/15] net: Document PCS subsystem
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
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
X-CRM114-CacheID: sfid-20261113_093143_798843_E175B259 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Il giorno ven 13 nov 2026 alle ore 11:52 Matthieu Baerts
<matttbe@kernel.org> ha scritto:
>
> Hi Christian,
>
> Thank you for the patch.
>
> On 13/11/2026 01:32, Christian Marangi wrote:
> > Add extensive documentation of the new PCS subsystem and the fwnode
> > implementation with producer/consumer API.
> >
> > Also update the sfp-phylink migration guide.
>
> FYI, the Netdev CI seems to have issues with this patch when building
> the documentation, because a new warning is visible:
>
>
> /srv/nipa-builds-contest/testing/wt-doc-build/Documentation/networking/pcs.rst:3:
> WARNING: Duplicate C declaration, also defined at networking/kapi:486.
>
> When executing:
>
>   https://github.com/linux-netdev/nipa/blob/main/contest/tests/build-doc.sh
>
> Logs:
>
>   https://netdev-ctrl.bots.linux.dev/build/doc-build/results/909345/
>

Hi Matt,

thanks for checking this... Yep I manage to reproduce and I fixed it.

Will be present in v20.

