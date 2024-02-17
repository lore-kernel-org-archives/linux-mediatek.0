Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC944C48BC4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 23:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMrVfGL8XXE/jIciEU8DHBE7OsIbpwslFPo8E5272EE=; b=fr8nCTy3UIoL48t3MdSNlSx8SM
	MI94syqe340utLNywKWtYW6TaluARa1RvjFU9ifQmTBcX13zo5YA5ZYvtcYd4Puw+OMsiilZ7zj2E
	TP2Da/FCUvdF/mC2Y4966DG4g/O7h+ra0D8CRRG796aquWeSBAqp3t6QYF7ZSIxowGgp6CXkLzLN0
	1K9P/9DKFuOMg/v0qWripkHAQ6LcC3fpnio1hZPULsF7e9D7UuO/cLjCzrf6e5uxRU15yRN4xvlIh
	aIBlosrelZyiifc/VKNaqiet6VzGVbSoOfnEhzfDb1CrUVlhgEI9pND9/zMTAeUaea2g6sMirLnWK
	Hoox/QvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbU6H-00000006bSo-0rFP;
	Sat, 17 Feb 2024 23:28:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbU6B-00000006bQp-3TAn;
	Sat, 17 Feb 2024 23:28:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33d3b43c492so137351f8f.3;
        Sat, 17 Feb 2024 15:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708212476; x=1708817276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yMrVfGL8XXE/jIciEU8DHBE7OsIbpwslFPo8E5272EE=;
        b=Yt62JUjglZNFWk1RiRFfTI1UeZ+YUI2lMD3f4UCTFKCdPIo9dXQUgl2wDoyHHoKsx1
         mRZaprf16mKJCEXmWcoUjyXAltb8LQXLu/p5ko6LLDF5BcrOR1glHcTGqlPVC4BcgjeH
         KCFgK3f+n1YFAkxBPn42KfNn/m9Zh1mMKwVBJDVSmk7VAo74p+Kiiict8Xgxp+sVEBMZ
         6Cm/1p4NzN8r1VKMe9ZeNMXe0UadljxAMjkDdhtTqimi+n+VTWozUI5oNUoPP+YMbW9i
         G/uBn73C9tulGThrZTmESsh+GBccka2sjTeGHByCk36MbRjCXPrD+BNPj3Ebzfv/eFTK
         erww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708212476; x=1708817276;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMrVfGL8XXE/jIciEU8DHBE7OsIbpwslFPo8E5272EE=;
        b=Sfg8DqIjppWyF2DnwX/eVDp/QHvR4mJykTB/w408AB2vQDyBuTmMmbA1AJWXwl5c0Z
         lVKaLQ3IA2NXPs4/2ZCtoHiU6MZOcFZIpng6FRpvNLFoUpRg0eSygrYXd2UvhzxFdShP
         bqWJc3UM2QQ90AbBhLLdiyfEblkG3l8GlHC9TiVQwDTXOsnD9u+NFfAjU4pMRhUoODMQ
         n7I6F6XT7a3io3D+c/yeVSwkd8Gre4KwEsg80k6uOmsupC2saVkrONwZ+7WUZTERNBbP
         A4kB0WZrmu8sGFNppFIE3uvi4A7pPBmyy5Z2RY3R8qp0GNd8JZM2Ox+uqs7A5whV1kka
         AMbw==
X-Forwarded-Encrypted: i=1; AJvYcCU30VJxZW8r1qiAUmdPW6lZrHMl1jDCQlV/KLKH93vTLH0S5o8eicmv4OjXJ/mja1lzup1rBqeBBUp2UcsIAuZSFwCAnIitEhWpi6wCC6XGCgwIaDspby1BgrrAmAhA4zpfNmE4VsgwwRI1Ip0CGJZI5k1gSc7F2+FDboy1GPQovMMeXxpEmz+F/cl86yHsQc16gkQkJ26Q/uRt0Ckoc5dnfV5oFQ28uMHYQSCxX+YGN7r6mF/U7jiqRM9cOb028Q==
X-Gm-Message-State: AOJu0Yx+fb+bv4jZk4uEjNUbo1FfUDqIU8yHLtmjEYvIuL2H1lQqyYBD
	JmyOMbripKHjZxLsq86p01zIhFUPrLMNMhqHWMryk4UhX1V+bEFl
X-Google-Smtp-Source: AGHT+IG06jEr4fsAxNzMuyQQWttNohqo0lQwW0nhEwlH4qFAtb/RroN/efm+DbY1uKKfB0jPXgmHPQ==
X-Received: by 2002:a5d:588f:0:b0:33d:2b3d:a02e with SMTP id n15-20020a5d588f000000b0033d2b3da02emr2093502wrf.46.1708212476161;
        Sat, 17 Feb 2024 15:27:56 -0800 (PST)
Received: from Ansuel-XPS. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id m2-20020a5d6a02000000b0033d071c0477sm5962470wru.59.2024.02.17.15.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 15:27:55 -0800 (PST)
Message-ID: <65d140fb.5d0a0220.81be3.7138@mx.google.com>
X-Google-Original-Message-ID: <ZdFA-ehmbYzM3DvW@Ansuel-XPS.>
Date: Sun, 18 Feb 2024 00:27:53 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
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
 <a804e21d-fe1d-41e8-90fd-64b260c9bcc7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a804e21d-fe1d-41e8-90fd-64b260c9bcc7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_152759_896089_8E35001B 
X-CRM114-Status: GOOD (  27.53  )
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

On Sat, Feb 17, 2024 at 11:21:44PM +0100, Andrew Lunn wrote:
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
> 
> To me, this makes the code look ugly. I also expect many text editors
> which understand indentation will be unhappy, saying the indentation is
> wrong.
>

Yes, it was done to limit the patch delta, if I had to account for the
tab for each new section we would be in the order of 2000+ changes I
think.

> >  64 files changed, 737 insertions(+), 291 deletions(-)
> 
> These statistics are not good. If you had deleted more lines than you
> added, then maybe it might be an O.K. idea.
> 
> Sometimes KISS is best.
>

Well IMHO these stats are a bit flawed, the additional code is really
just extra check if ops is defined and the new .ops variable in each
phy_driver.

If you check patch 2 and 3 you can already see some code is removed.
Also while minimal the final .o produced results in bcm7xxx going from
53kb to 45kb and the aquantia driver from 48kb to 45kb.

I understand that this major rework might be too much, so I think the
only way to handle this is with introducing support for declaring
multiple PHY ID for one phy_driver struct.

-- 
	Ansuel

