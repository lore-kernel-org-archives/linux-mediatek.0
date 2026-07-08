Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF85C44501
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 23:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBxe0wZEJGIu1kkVYecVy6uNbnIpdD9XRHlLQPSVa+E=; b=k+y/aBASGlhN7ii+sEZnbp7bQy
	kGa61EGb6tY05PKA1nVmYhU5uI+c7bpnWONKmFNr7vqO7t82LzavfejECAbCzwUSNGWhFtEYSZDlM
	Gc9XVLVxY9R+ybdmZfAIUN/mYwNvwnFhMFzuDxQORVHRQ6VWSIkAzZNVm9RPO+uJ9A+NVaE8Y7avO
	l36qBR/sqmf1v8R6APvBMMiMEHUI9JDg6BRSfaX5q2Kfcm4tOsSgLZB+v3HsjXC8jRN9929J3am0e
	DwZ2J6P2XCvCLD/S8AQ42I+RzNCSQddw+kpn8K2tMtcaKWEf9fpP2bcMphm24EPONYjS2QIIvqSn9
	b58+tI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmZ-00000000bJr-3G86;
	Wed, 08 Jul 2026 23:34:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmX-00000000bIm-1ujM
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 23:34:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc97653887so14235895ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 16:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783553660; x=1784158460; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBxe0wZEJGIu1kkVYecVy6uNbnIpdD9XRHlLQPSVa+E=;
        b=Vcq8BJACvkFe/tgykdkIXGkvKgYiUk9q98SB/+Ma2a1fNYjAHgLvVjsHFuUDTCzExd
         bgyraStXDl1v8U3epgIdaCtF10yZOxkB1N6i0bFbevB5Qg9Hj1jDOyH3+jwg+bIukiTQ
         Jyrx5+u3NnFYUVV67mlnQwVOMGmmE3GXD/srHEdkBEYRYAxGMuMzVUmzZ6M1EVjnis92
         DcNfet3b4TK38kB012VuRqP9bGCGwpT7Ak1rCTptkslQ0qFuo57ho5kN6l7mQk2iFS6D
         LIlzTeKj0XbRuTIgJsTk8d11FfHMUPh08Kt8MduH1sOBggW9WJv9FRuEQdjRuUq9bK1V
         Ksog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783553660; x=1784158460;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBxe0wZEJGIu1kkVYecVy6uNbnIpdD9XRHlLQPSVa+E=;
        b=ko6R+dv/Wb6xN8jSFt2UTbQt/bo+Mm6DS0vy4s9lcHN73Adq62atdDksZ1JTj4aKP8
         5VFt4d9ALJSGgLoyb5FD1wiyix4Imz/gd0Z3yNMVWnacGV2orOhYqLoFpI8espNzIoSz
         jugevGNTVo40NE/W6AbkEEhWJgLOYu2o7OMSiPsTSlWhjcpNa5nElNsGcSDkz2xLURAn
         p7iPMQQ3W0ARmqkDfxW7ebVC2xD5exM/RnlGGqXnytRMnrAuQGIxCqhN58sN8HPaV56W
         DAXY3Mi70A8/DI/x6nE59nagrhAG8W8DXB0muMq4pc0ccyz2GMN4lP3SrBUE1L7UtpU0
         aZLw==
X-Forwarded-Encrypted: i=1; AHgh+RoXspaXwgz/LQvYTqUeR6dsHnQ4T4D+GvookAT3KWsIpxFTKkhvpwWdNkw+xYiN0IMdi5SA6on2SK1Pr3zung==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeY04WMOoqB7xDCEPhJGkxm+RZ494+v0SX95yWif0fYaHmuE6J
	mKR5TSgVkJCxrfzPHgZiTVuMLgh/V3pWbSNsVnLbxKxAl6jaP6vEMizz
X-Gm-Gg: AfdE7ckCg1hnvbbK0QWM38kU8rrjGHEu3T5qCV89HO1YbnNs3Uk0tDocS/bRLXSz3i+
	iY2/DGLxt2UE0xQazOBWnbMeY7lCEMx186FmdXfVOo3EjvkUP90yP0Cj40x76Da6vw1uHNdF2iF
	ZM0zPX5TwN2/QcQ/3g9lnGr71XtadDyq9SO/UeFH5oCNKqNGEBlc9PN/+x8h4TdaTmBB28js6QN
	g0PGB+DSFsubCKVodTRezx2m1+ZrCODyjPrN+y2IY6XumBrYwtps2hOeGV+YKRXetRhwQezzRlJ
	Ul5TK/QmhgQPVvCSaNPWPkbdL+0p5p5mQgcEw9JCk1ekHcv87VmqYvAxEl+UPdXI0oZKdXWrEqr
	2h2UoNnwQpGXIoekZr2ITfZJk3Xvx+5ZX+muaVzDfX0oTjDidD1Bkl5CCf4U6N2MOTdVsLbtHzP
	KtGgi96w==
X-Received: by 2002:a17:902:fc84:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2ccea2d7691mr53663815ad.4.1783553660562;
        Wed, 08 Jul 2026 16:34:20 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm33898515ad.53.2026.07.08.16.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:34:20 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net: phy: mediatek: add calibration logic for AN7583
Date: Thu, 09 Jul 2026 00:31:00 +0800
Message-ID: <178355365385.113886.4040120167909619643@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260708102341.53919-6-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com> <20260708102341.53919-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_163421_490779_806F9D33 
X-CRM114-Status: UNSURE (   8.10  )
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

A few issues in an7583_phy_config_init():

1) Redundant double assignment of mdi_resister_type

    shared->mdi_resister_type = MDI_5R;

    shared->mdi_resister_type = MDI_5R;   /* duplicate */
    if (shared->mdi_resister_type == MDI_0R)
        shared->r50_cal_tbl = an7583_zcal_to_r50ohm_0R;
    if (shared->mdi_resister_type == MDI_5R)
        shared->r50_cal_tbl = an7583_zcal_to_r50ohm_5R;

The first assignment is immediately overwritten by the second
identical one. Also the two `if` blocks should be `else if` --
currently both conditions are checked independently and the
MDI_0R branch is dead code (since the value is hardcoded to
MDI_5R).

If the intent is to default to MDI_5R and later read from SoC,
the structure should be:

    shared->mdi_resister_type = MDI_5R;  /* FIXME: read from SCU */
    if (shared->mdi_resister_type == MDI_0R)
        shared->r50_cal_tbl = an7583_zcal_to_r50ohm_0R;
    else
        shared->r50_cal_tbl = an7583_zcal_to_r50ohm_5R;

2) Typo: mdi_resister_type -> mdi_resistor_type (same as patch 4/5)

Also the FIXME comment says "MDI Resister Type" -- should be
"Resistor Type".

3) Dependency on patch 4/5 probe fix

an7583_phy_config_init() uses shared->phydev_p0 which is set in
an7581_phy_probe(). If the probe function from patch 4/5 is not
fixed (missing shared = phy_package_get_priv(phydev)), this will
deref NULL/garbage:

    phydev_p0 = shared->phydev_p0;
    phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;

This highlights that patch 4/5's probe fix is a blocker for both
AN7581 and AN7583.

Best,
Wayen


