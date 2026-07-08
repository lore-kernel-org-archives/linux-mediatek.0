Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33705C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 23:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcfqpyklPdRJm8BTRultdJ4ZxpQ7NoW5CVhgwgaydYs=; b=JYu6hI2SixtqFO23zWMQamEOko
	2R+qvYZE8pATlektbV/jWlySeoQv15KSAI2ewKFsZU0lsh3LkalUGRL/CsHKa9/EozwEYJhcbbHUe
	yYGsyPf/KiGkwxhhBr6ugqB3wNDRMKL8qydZoBmnB5caduPwJ2sL8zu+Xp+3l1DdNT/0pSkHYYe3e
	XcDfGVAp+BNIvAHhlFYVVdzepbFUs25u0YB3vX13VlKYXCMH1MLRZmOT7J8Sl2oYX/Wl+s3ySp37H
	V7MqVLGwcU09LCuF3lMDZeSAGxe49fBrQs7RMed1yJ1ivrLD+di80/ezijWJMckTzaHsMrQsvcdJW
	mwAIdOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmk-00000000bPj-1Fae;
	Wed, 08 Jul 2026 23:34:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmi-00000000bO2-0U3Y
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 23:34:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so221273a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 16:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783553671; x=1784158471; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcfqpyklPdRJm8BTRultdJ4ZxpQ7NoW5CVhgwgaydYs=;
        b=WMiy4xmW1hIznjBb7OPkjBfWwd6mlCDwDS5qwYs4eaR47Zj+uXoaXwFml/Ksvgp4p+
         IekTrpY7CkNzJOjJ8WO3dOZGflgrkHFRVIaqI5J7E0+4tcHIWzfjmSO2xM58vOWsB/X/
         IOz0n1j0E73j4pbkffB5WAkvKeYrt3rgilZgCyW5SNunJpJaUt2p1UCm7cZ9ywo4KAwh
         h0b8v6wj+Lw++y5VPDm/G+HmFev63ZSwPkFLSJ3CLgQ0KrLpZ8N8dn1nfDBz9ZfJMG9S
         ppEWTElXBjm+s/c9++yixz2kiZK63P9xcyLAFK+luAn497XSiW+sH9JwvIDr5z2YiYY/
         30Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783553671; x=1784158471;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcfqpyklPdRJm8BTRultdJ4ZxpQ7NoW5CVhgwgaydYs=;
        b=V7eKBbvJcrwDrljk0GGu2r42epzluxjcCDhiYLaSc3NpkccSeF3jnEhyq768iWXOzA
         CzuQEBI9X6klbwzFXxjWwrm/MR1DI5YzlptIgzylAt78HX5hg3tLaVq2YepdysVm9rTK
         XzUxC20AEzmXAgx5bBHjpdyAfKFqVowkJKCZDqAVAGX0RrfW3Wi4uwj5pZ5CAo01Elm7
         6HDt6zjdc0vTKQnAeNOITyZyG6stx8m38CmK5syszqlzv9M2UCpTwAoUkl5UpcvAXstK
         h5Qn8b37M8hSMZOE42uIv1m4CWNykQFvcm/7RBWopTxo3nPEOLn196QJAJqsal9sIf2h
         p8Dg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5Fs/TMqvFWYgw3mgPPbep6F1TunTAgscGHngT8yMjlU3MK/nQjuvVu8pKbgWgXUnrGp0EJHALMtzcSHWVwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI3mHMHnDpeBlDb4tbPjFB/CP8mnzIpbX9mVB9I8W1w9fqL8s+
	+aHcc7oUKrxL3gxv0CngK2QE7FTXehib2TxR2eZc8kVPY+avt1sR3us44KNbftbhSwA=
X-Gm-Gg: AfdE7cnpUZsmptIFYMDDQ3r6yGtrdeTVPJ3WBHk3YtUygcSg9yLdhPCVvtsoL8DcX0v
	xQpnd89Cp3kS44V0W+tv8cEOfHQUUV/Z1jCCopxsqoMrwGzoRLV0PBFCg8vWBkp+zPhhy2qpnUI
	gmpwSzb+IvWLp+Xe/KZ1WNdcg3KwHwR7RGu9eSFbqH1+WWhFlUdHm68ugSXlsXKdV0QTEHm5mh+
	UwNSq8H6Qc4iGK50IoG0z/B2wxVzYgrFU/MPOuAhscnKvnSRmyvifaV/961eB/uYIjrN0qFfzJ2
	7wSuOdY0OiDEN/hLDTyyyYvLYYU+UFzL67+TvKCks/qcr3qQ51XBb8AeG8foeK5BEo+EfvaUqPH
	uEGINgicz5m8TzNHPerDl1VwYULjGd8FAms6su6AprWwLOBSus/srYyOnTFLujzURPkfxdLn255
	mGlzVyXg==
X-Received: by 2002:a05:6a21:3a85:b0:3c0:9c18:d5ac with SMTP id adf61e73a8af0-3c0bd237362mr5073243637.73.1783553671195;
        Wed, 08 Jul 2026 16:34:31 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm2927638a12.32.2026.07.08.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:34:30 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/5] net: phy: mediatek: split Airoha code to dedicated source
Date: Thu, 09 Jul 2026 00:32:00 +0800
Message-ID: <178355366449.113894.1139754683497248912@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260708102341.53919-4-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com> <20260708102341.53919-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_163432_155683_58E5EF58 
X-CRM114-Status: UNSURE (   5.72  )
X-CRM114-Notice: Please train this message.
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

Hi Christian,

One minor typo in the new Kconfig help text:

In drivers/net/phy/mediatek/Kconfig, the help text for
AIROHA_GE_SOC_PHY has a leftover "d":

    Include support for built-in Ethernet PHYs which are present in
    the AN7581 and AN7583 SoCs. These PHYs d will dynamically
                                            ^
    calibrate during startup.

Should be: "These PHYs will dynamically calibrate during startup."

Otherwise the code split looks clean.

Best,
Wayen


