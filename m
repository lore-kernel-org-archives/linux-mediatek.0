Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EB1C48BC3
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 23:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbH9uymS/8c7/s6JqpxYO8BrELFkxi0FtyBb1T3F1as=; b=uMWawBxBdmtSoh1ccbw9CYxFnl
	ktQM5Y0TCz2MU08P5FR969KRwHIuUPTelXS3Vv90Us9fbiQnDL0A8pjPzM+7tVxmSwixLgMvcFV7V
	lt6zT1mqW/lYwLPo8rYRqHs9+g8TcL78GIsO9ooXu3gViQWsEPt/mNZRECz4YSRxzIdIBoF0sNF07
	GsGSOS5DGdbLtnvxXPtFPPDVnM8FSVOHpwGcpN9ArntqVGHq0W6KZAdl65UwCpO80EhHTw3/0rFxG
	5yusuTpPm0dyQx3aKohVHr/maXUrJCwFqGqTF+90zV5hKH20ppmAXowbrTht+DeLItybK1rtz29E0
	JF9fXoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbU1M-00000006aLD-35k4;
	Sat, 17 Feb 2024 23:23:00 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbU1H-00000006aKJ-1K4g;
	Sat, 17 Feb 2024 23:22:56 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3c1333b0974so2490235b6e.1;
        Sat, 17 Feb 2024 15:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708212174; x=1708816974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cbH9uymS/8c7/s6JqpxYO8BrELFkxi0FtyBb1T3F1as=;
        b=nK8Q15xIn2PDk4uR+igDEujzWsLRrpQX+y3xYrmm5Y8xlzaYOUpgNHyGSU2A8jma4+
         rjBDiI5u+Rdwux8dS6vw8tpoHcV+m+8Yin9DRUZc5ko05EE4+Caz9bjx34tFq+qaKoTe
         405dZZkzoHs6xBt/lnfU0t1Gz6+nPvche/dAUmnWdRYhW7MMg8Z3SaMqWDZ39cjsWCj0
         PqnyMtKgbgR1sWZ1NtHUkC7907uEvg8FQ+ARb8ZCbNtKWJIdJqSZLUEQzZxSI5MBdWws
         0lN1Ny7C5ocsv4LONtYjZIsX0YKc1dTJ01qvkFJdrQQatUZQz1tqXNGCxx/AIro/Sm9S
         eMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708212174; x=1708816974;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbH9uymS/8c7/s6JqpxYO8BrELFkxi0FtyBb1T3F1as=;
        b=McPRPe27b1+iQBGZdA/7WVQXhogRYGTPxbpPRuHC1VmllPzs7m4ZBQWPpcGfE0kzjQ
         +j8UyrSdCFmIYsiwU/9dr9lVDYQG+HA7n+47Q6iah9lmlnavt//eygr3UIe4e5Fz3Oao
         PwLoPZ8FXS0fvPqz039y21WMAy6M2mNiH5oxqJXYrgoMR3rikb22JiEpd4LrG6yPmg33
         3ohqrCfM1GBefRXJYs3DcyMzWHQmiU+yBQmIJEQB+4z6szXB+Shj5K/oBHzw9JWSWxHA
         evcPaPGKjSn16ce3kb1xFUOXmOoEprv4Ri4+OoOtjTGGyYhoDdeKpUCEcpBDwleCg6zm
         lx4w==
X-Forwarded-Encrypted: i=1; AJvYcCXjo2ApCshBRXfnWY4y+gkz/xM8qN1oS3upM7ygHtQacj2auoH1YKP5mfsVCNdkz3maoY6ZW0cG/8vACryUVeOl/iogk9AFOob6MGQwDmpcg5+W2N1G3t+seWUd9lKxrK7JU2GzJSgKtSoxUNx131Y1VsZe2Db8Nj0Mwcr0uYGncbgDBbeBsOlQYGvydp6jImueJXimpCwUqeyd4os24JMb7PXTVBJ9hZLgO7rBfKdwhp52gL0gMRW3CfNcVsaTLg==
X-Gm-Message-State: AOJu0YxZfKNK7WbxIatp+9+m1WrYagq3LLOSs6/6V3dqeZGrovMmLyOp
	gFRDqJcBT9H5PNwqgfBlNJWHK+EQs5pwa/wDLS+8zghX6oprr5Lo
X-Google-Smtp-Source: AGHT+IGQKGBOkmuDc5gI2jIBVXWXAkHQ3X9wz3V5z8Dx1FdEbbwkWxIBFI2JRf0mUeEdUoy2E0VubQ==
X-Received: by 2002:a05:6808:2a4f:b0:3c0:3b90:ae1f with SMTP id fa15-20020a0568082a4f00b003c03b90ae1fmr7196758oib.49.1708212173842;
        Sat, 17 Feb 2024 15:22:53 -0800 (PST)
Received: from Ansuel-XPS. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id qm12-20020a056214568c00b0068c88a31f1bsm1518837qvb.89.2024.02.17.15.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 15:22:53 -0800 (PST)
Message-ID: <65d13fcd.050a0220.88fe3.665f@mx.google.com>
X-Google-Original-Message-ID: <ZdE_xfQcwQ6hninK@Ansuel-XPS.>
Date: Sun, 18 Feb 2024 00:22:45 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	UNGLinuxDriver@microchip.com, Peter Geis <pgwipeout@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>, Xu Liang <lxu@maxlinear.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robimarko@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, rust-for-linux@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 0/3] net: phy: detach PHY driver OPs from
 phy_driver struct
References: <20240217194116.8565-1-ansuelsmth@gmail.com>
 <ZdEOpB1oVDE8+Qhq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdEOpB1oVDE8+Qhq@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_152255_387344_650E407A 
X-CRM114-Status: GOOD (  30.97  )
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

On Sat, Feb 17, 2024 at 07:53:08PM +0000, Russell King (Oracle) wrote:
> On Sat, Feb 17, 2024 at 08:41:11PM +0100, Christian Marangi wrote:
> > Posting as RFC due to the massive change to a fundamental struct.
> > 
> > While adding some PHY ID for Aquantia, I notice that there is a
> > big problem with duplicating OPs with each PHY.
> > 
> > The original idea to prevent this was to use mask on the PHY ID
> > and identify PHY Family. Problem is that OEM started to use all
> > kind of PHY ID and this is not doable, hence for PHY that have
> > the same OPs, we have to duplicate all of them.
> > 
> > This is present in Aquantia PHY, but is much more present in
> > other PHY, especially in the BCM7XXX where they use a big macro
> > for common PHYs.
> > 
> > To reduce patch delta, I added the additional variable without
> > adding tabs as this would have resulted in a massive patch.
> > Also to have patch bisectable, this change has to be in one go
> > hence I had to use this trick to reduce patch delta.
> > 
> > Other solution to this problem were to introduce additional
> > variables to phy_driver struct but that would have resulted
> > in having 2 different way to do the same thing and that is not O.K.
> > 
> > I took care to compile-test all the PHY, only exception is the unique
> > RUST driver, where I still have to learn that funny language and
> > I didn't had time to update it, so that is the only driver that
> > I think require some fixup.
> > 
> > I posted 2 example that would benefits from this change, but I can
> > find much more in other PHY driver.
> 
> Would it make more sense instead of this big churn, to instead
> introduce into struct phy_driver:
> 
> 	struct mdio_device_id	*ids;
> 
> which would then allow a phy_driver structure to be matched by
> several device IDs?

Yes that was an alternative idea, but is it good to then have 2 way to
declare PHY ID?

Also the name should be changed... Maybe an array of a struct PHY_ID,
name that ends with a sentinel?

> 
> We then would not need to touch any of the existing drivers initially,
> and a later cleanup could be to identify those where all the ops are
> the same for several phy_driver structures, and convert them over.

We have many PHY that already have macro to define the same OPs and
change only name PHY ID and mask.

-- 
	Ansuel

