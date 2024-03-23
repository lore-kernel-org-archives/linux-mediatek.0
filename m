Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC43C54E58
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Mar 2024 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWPh5pRiB0YC24HBvCgf6JyT1jdUNaQ40siKoMbbwOE=; b=ssmIGt1zBONN/IbChe0x1G7hH8
	7VxdQDrfBuR0c25LR8R7SZgvLXp+4uGTjefGmlmSIYFZshzOCY6NUUel91LNqSVgr9pmTu26jeNDS
	AHjQGVsYKZMWmw7c9ubsWpIqtf4sf5Y7++J60lcdNB//1+7TnD3NEG4uvgN4Ftyf67bGnQynTjrsY
	JIs23FaSDQhytEe7memzn4jUIfNmckOJdIgOBewR3ApbHULyotPU15x2gSVlDukDBD9MexM4LanEI
	Yq1ZMHYhI0V54KbRoTNY6MoNdDxN2xdI2J8qe0HsI29OVZCoib8h9f4ZbJajKxSLPD6bWm6auql/Q
	9L8R+CsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnxYS-0000000A3fK-3Xdv;
	Sat, 23 Mar 2024 09:20:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnxYO-0000000A3e6-2AEG;
	Sat, 23 Mar 2024 09:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 352B7CE0959;
	Sat, 23 Mar 2024 09:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C0C433F1;
	Sat, 23 Mar 2024 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711185636;
	bh=aGTQuZy7vZpxuhlc2uWM1FWO2cNVLUpXYHPr+30NYM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmGkF125xegySFWAiHvPntmZ+07s8hZQPC/0IVIftdkxYeMJTqDHDoBaq087Sl4Ry
	 qKx2QcAVw6S410SG7j4biAqt4/h5dTjc1vKUs5R8LJBjxtJSQyMNE1PxZTAhzLwpa+
	 ZvDOHlqhfPGo+3K1JP9tq5K11rxRL31gNRIYe4fcfJjyAcpNQmozM0AzDwGqt7aAAm
	 vL1bo7yWAyyXHWJXICav98Il7syCI5t9aEO0HLvfyTQ7cJVQX5WfpHiaD8JmvRG1Zm
	 VmI4taBLphr2uo/nVmCk1uj3x3TE6/IYqaCXMkAcTk/3yvQe9KoaZIneVeSaGY4Thk
	 hCCXd6I1k2Bcg==
Date: Sat, 23 Mar 2024 10:20:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-actions@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 00/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_022041_074435_A061D9D8 
X-CRM114-Status: GOOD (  19.86  )
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

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:53PM +0100, Wolfram Sang wrote:
> Okay, we need to begin somewhere...
> 
> Start changing the wording of the I2C main header wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. This first step renames the members of struct
> i2c_algorithm. Once all in-tree users are converted, the anonymous union
> will go away again. All this work will also pave the way for finally
> seperating the monolithic header into more fine-grained headers like
> "i2c/clients.h" etc. So, this is not a simple renaming-excercise but
> also a chance to update the I2C core to recent Linux standards.

yes, very good! It's clearly stated in all three documentations
that Target replaces Slave and Controller replaces Master (i3c is
at the 1.1.1 version).

> My motivation is to improve the I2C core API, in general. My motivation
> is not to clean each and every driver. I think this is impossible
> because register names based on official documentation will need to stay
> as they are. But the Linux-internal names should be updated IMO.

Also because some drivers have been written based on previous
specifications where master/slave was used.

> That being said, I worked on 62 drivers in this series beyond plain
> renames inside 'struct i2c_algorithm' because the fruits were so
> low-hanging. Before this series, 112 files in the 'busses/' directory
> contained 'master' and/or 'slave'. After the series, only 57. Why not?
> 
> Next step is updating the drivers outside the 'i2c'-folder regarding
> 'struct i2c_algorithm' so we can remove the anonymous union ASAP. To be
> able to work on this with minimal dependencies, I'd like to apply this
> series between -rc1 and -rc2.
> 
> I hope this will work for you guys. The changes are really minimal. If
> you are not comfortable with changes to your driver or need more time to
> review, please NACK the patch and I will drop the patch and/or address
> the issues separeately.
> 
> @Andi: are you okay with this approach? It means you'd need to merge
> -rc2 into your for-next branch. Or rebase if all fails.

I think it's a good plan, I'll try to support you with it.

> Speaking of Andi, thanks a lot to him taking care of the controller
> drivers these days. His work really gives me the freedom to work on I2C
> core issues again.

Thank you, Wolfram!

Andi

