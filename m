Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387DCC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lblTg+DW5IyAr7NfBZYwDBaLtJi0MMcqILce+Dx7lF8=; b=rCSpip05pjkd1b
	UvO3EoMBDpuxAb3D5Bx8uff1mhUwBmxEfUZ/6QvsiheNvWgNKKTwYVfttz7qPzNsT0QkDJzUqtMa2
	equSYQ+tvyOBemcntlbM4yXuMGDvLiN8f9cdj4900gUXNZjbhSPKPPhakAPl8Ju3axPTIRggtLpkC
	r2WqJExvrzdULDNFwiQrd+XI7rUEVTPBZBxcqQqAzflwjq6uzRd2qjsV+f8qPxhPLpTayHECJ7D1s
	3r8yPX71GBjRhkRAlk3GNMdmxCYsw+eDRG5tmafdM82tJn/DtjDXy2kG5fjXUaJbQxRvhVBM72TNc
	K7DQoJBLTAUA8GSCUC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkkh-007peO-P8; Mon, 28 Mar 2022 08:29:27 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkkO-007pXz-UB; Mon, 28 Mar 2022 08:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1648456149;
 x=1679992149; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6lodqU722XqqMCnjzMd3/cpwy1KHIQLMRjx1NSCdEKA=;
 b=bmoKzdZbOoDczM9gP8WTvMbePY9cGnaXFIyE6WkcaTPDdme3CKXwv3VW
 /+JJDCZs1dylym3EQbWyh4/wj3mULtSyJgNz5Gk1ZfM4jwMIN1JB1wi4d
 6XwnNb7gnt6egQYs6XQbE6BVd6bxVm8J/SQM6I4DS0Gnq9ocUD85Ana3A
 FG6972DU0Ug9D2HcKITaMEeii2bVuwlj3LOf/HxQmPBh7iUuQxbGZn9F0
 DlvW6ULgm5Ijvj9JGOpCe+ZKppnQFKQFkLutSzyx/GkpbPL86ZP5Kh+FF
 ZFsYINfWsIbshHOYCuZ2DBw/J6VJ+yWT8GxyNy1eMF/tsdnlCf07e/Chi w==;
Date: Mon, 28 Mar 2022 10:28:58 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Ansuel Smith <ansuelsmth@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-actions@lists.infradead.org"
 <linux-actions@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@axis.com>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-rpi-kernel@lists.infradead.org"
 <linux-rpi-kernel@lists.infradead.org>, "chrome-platform@lists.linux.dev"
 <chrome-platform@lists.linux.dev>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
 <linux-samsung-soc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "kernel@dh-electronics.com"
 <kernel@dh-electronics.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "linux-oxnas@groups.io"
 <linux-oxnas@groups.io>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "linux-unisoc@lists.infradead.org"
 <linux-unisoc@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>, "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <20220328082858.GJ7371@axis.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328000915.15041-2-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_012909_460294_54774F9E 
X-CRM114-Status: UNSURE (   7.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ansuel,

On Mon, Mar 28, 2022 at 02:09:15AM +0200, Ansuel Smith wrote:
> - Categorize every dts in arm directory in subdirectory
> - Fix Makefile to address for the arm subdirectory
> - Fix any arm64 dependency
> [...]
>  arch/arm/boot/dts/axix/Makefile               |    3 +
>  .../boot/dts/{ => axix}/artpec6-devboard.dts  |    0
>  arch/arm/boot/dts/{ => axix}/artpec6.dtsi     |    0

All ARTPEC platforms should be in a directory called "axis".
Otherwise LGTM.

Thanks!

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
