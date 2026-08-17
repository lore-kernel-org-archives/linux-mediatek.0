Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1338C5DF7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 21:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=; b=yEPf/mAK1f+NfW4Gsmvu+vs1p1
	yva7Jo89c5ITQyVL/rQzFysgT5N6oWeo5FaOFqVXzcW364la+daY+SaMJwFYyTL2EqP4X7jv4erAs
	jiLQy62bHRScmeOp+6gBGUOiKbnymQ+E/Kqy+pw/FgT99rj4c0XgKoU380a7lOeIACBlk2tNddxwR
	OIVemG7IKtMU4S3k1eBRDhz6zBv/wnzfFCrH9BcC/RblSp8qdHDbiIDu8SjUPUTaKKxBM7RxOzU8O
	YdRKbu25n9ngMHVn2F5Z/ggG+lc0uactelD/NXHDCaFgY32rnIALqR+NElz1EUFR3NzgGfFx8+QhG
	fh5WCdjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4Tl-00000006o92-1j7q;
	Mon, 17 Aug 2026 21:02:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4Ti-00000006o81-3IMj
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 21:02:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493b966dd74so25998235e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787000560; x=1787605360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=;
        b=iCx/evyzg5yrMD9AszKws400xVvcOw+wLLYNmIPUVSE86w586TZdgilHKTWvz5fKMw
         sSCwtQOdUB0Z5MXrdYtJQSLKmYtsfWF3xMrXdcc2kji3SXl10kqvhvID3yFDPMTnr0sC
         WdiiP7bUlzf+jCkIRYIcFEWFNfpojKYmseIC2C12y2vE9g9asHWlwVQc+mkjMcYTPfdf
         KZRDAyHBJ3M/WaSDgvh2COe79JmoJtZrEm3Of1BKQVX/Vy7MB9spLaGm1n13WS17nfnq
         Rm3I0YR0VNBPb2iEJqvqMeY0BmgwImKwzEDyw6HAJdak3oAob79rR+inknxKVF1iC8hb
         d9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787000560; x=1787605360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=;
        b=bDg9S0IT2oEu765YTQrDB7C+JRcn81Zwh87F+zKUygQJxLhC2wVFXFP4D+TAKZW4fw
         TECBhAnt9AdtyGghkdv4M/zHl6OnlTzKzU1B1ZdQmv6VkbIWcZfBUDp1cpTggoNUtbYW
         zwCdmSkLpZbco80xvl1IXH2xX5KEWX9VDlYW9cgOykPaQHdfphX++HF2lUO6t+F91ed/
         Ipvu/aXgsem3i/hh25gUGs4wpKT6gtjBaF+E78DN0Ma4qh744vgLmuAnM/n0Xjd7x8UR
         BAot5rtl6mui/Vg/S0vsxdJDbMF3lzKCUScw5LIeNAmQt9tfneadQxRHOejsPB4vGOo/
         jI0w==
X-Forwarded-Encrypted: i=1; AHgh+Rqt+cO4r8UGeKVgVy3v2tXoR0Xkoz0EJAOozUwnEL44tSAgwOio9XX/1wthz4vTU1+G//kyziUoTHMN4X2YUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUSVh2VThOb7xj64W2//+mHRjYuEsK/4TXdMCd90wveX+1EK2n
	CEMm5vJml2XPQ3zbnWCtr9b0wZHec//BYDYZFDbLRXgrf8ZoayDs2ckr
X-Gm-Gg: AR+sD13CXqJagbLih54yBEP5TMUrP96yPGDjV3/m3CBAFoRkXlPv+pqwNHg13poFoC1
	nZVB5iNwM1MfvnfBAYTFYh6HMor1u7vXa/UDWK0oKleGyYe51Isak4i1QLxGiVf4q60aObvZg+K
	nbh1E8VQaq+FfXRek+6DXu57GVCBEnIwoUbX1Nld0f7jVYEp+MID4cF1MFV8a3aAXRQno139PcK
	oWnXfXpirEKweC7COTGk6KFt2JDLUBGJL4TyejQ+8wPL95oMCKvqJ2vepMRmtd6KmuH3DV/taxe
	DQxEnCHqc1WMnaVotayfYH7sc5T0b/94+Rt46hkWh5kSImHQ4q7WgduQTKBn4ubw3o7XEEtPPwV
	SowYYae11+GT0T2iP/61rTbqxtqJwHpqh02Wga9ZFyzlYclr0/QoqhX86Cc0wR/oGWcHOJ5ppM6
	vqtBZijyRDaOXStbgzzuP21N82gYr31R1EKRV5UKygH3DUN/2IFYGi+UB6deZHAY4JwOpCssKeE
	KmpNyXHNdcWGhqNwxgfXLy7/A+Kgcc=
X-Received: by 2002:a05:600c:8209:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4998796f497mr470360865e9.13.1787000560141;
        Mon, 17 Aug 2026 14:02:40 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-21-27-15.retail.telecomitalia.it. [87.21.27.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b81748sm7050409f8f.37.2026.08.17.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:02:39 -0700 (PDT)
Message-ID: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
X-Google-Original-Message-ID: <aoN2606mlY7pWZ-X@Ansuel-XPS.>
Date: Mon, 17 Aug 2026 23:02:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260817134727.1f76d6dd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817134727.1f76d6dd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_140242_845500_E96E9590 
X-CRM114-Status: GOOD (  18.18  )
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

On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> > 
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
> 
> Coccicheck says:
> 
>   drivers/net/phy/phylink.c:1039:31-34:
>     ERROR: invalid reference to the index variable of the iterator on line 1028
> 
>   drivers/net/phy/phylink.c:1364:26-29:
>     ERROR: invalid reference to the index variable of the iterator on line 1346
> 
>   drivers/net/phy/phylink.c:582:7-10:
>     ERROR: invalid reference to the index variable of the iterator on line 569
> 
> I vaguely recall that you're supposed to make a copy of the pointer,
> not just add a "found" boolean. Dunno if it ever happened but Linus
> was trying to make the list iterators override the pointer on exit.

Oh! I wasn't aware of this intention... I have seen lots of pattern where
the last value of the iterator was directly used (if detected valid)

It's and easy fix... I can send a new revision right away if you want,
I'm already on it fixing this in the meantime.

-- 
	Ansuel

