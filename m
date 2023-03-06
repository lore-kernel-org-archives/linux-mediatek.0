Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D55C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 05:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjgpYDB9cuSbrvyTRy1uSEFIcHS/9x4v4T8O2RNqj/4=; b=FyZLTS4QU8OcjkmpiPefG4RxWr
	RNhKBFlyeJ2o0+LOd8a9CjEykoFwjVsbkYUA4ijFdue1wlxQXtB1vLPxrLH/WljlGXQaDu2yuj1bu
	FmnddyHICQWLrm8FfPVmrTw6/6xbPnVogDRhPBmkokRD6uyXc/AbnSgCFlBkfOfDewMDRBxxHShpk
	yMcgnGBmF+EkgWmDjYDbZx5WGRGvvpWa+v5A7OxNGPHXYqrg5OmzZSUQ1n+7OikFaqB9takwst/wK
	9WpCmA3ZFfAFrR4eKoDLQEsgKGqwQlNn/FpV48Qy1pgT3TFY5K93D8wsaKfT5eOYnhLIEMAeRl5DN
	XgrdCrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ3aq-00BPep-OH; Mon, 06 Mar 2023 05:41:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ3ag-00BPcc-Gr; Mon, 06 Mar 2023 05:40:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37F8560BA4;
	Mon,  6 Mar 2023 05:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264E4C433D2;
	Mon,  6 Mar 2023 05:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678081249;
	bh=ozxEJ4XFCHc0BADBdwIy4ELSX5qpfo2qbo1MrODvuy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHN+kMHiv4Jyy7FXsPSetvL8Vkg+/m76gScZIzvwjPNjP0ox220En3ejMyHiO+hFc
	 6kjMM2s7Cp9EK7OjylRuauBE0GQH6mJS59b7ZL0ffSqHwky0cchlvSfZq8MDm6OiGt
	 vGigdCflbB3O+hNGcHtpvPfI0rPp1qzxz47eFH98=
Date: Mon, 6 Mar 2023 06:40:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
	maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
	matthias.bgg@gmail.com, daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com, angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com, zhiyong.tao@mediatek.com,
	khilman@baylibre.com
Subject: Re: [PATCH v9 9/9] arm64: dts: mediatek: Initial mt8365-evk support
Message-ID: <ZAV83gLh+qNqrHrg@kroah.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
 <20230125143503.1015424-10-bero@baylibre.com>
 <8c348b39-67f3-9210-1929-8b2f093be24c@baylibre.com>
 <Y/XenZUmT7Nh2qGP@kroah.com>
 <CAP2ifjPvsvPyF56=YXrc9Ti6ZSLOxEXbMCOP-Qa4ZSempfod=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP2ifjPvsvPyF56=YXrc9Ti6ZSLOxEXbMCOP-Qa4ZSempfod=g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_214054_931668_11036663 
X-CRM114-Status: GOOD (  15.30  )
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

On Mon, Mar 06, 2023 at 06:02:03AM +0100, Bernhard Rosenkränzer wrote:
> Hi,
> 
> On Wed, Feb 22, 2023 at 10:21 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Feb 22, 2023 at 09:17:39AM +0100, Alexandre Mergnat wrote:
> > > Hi Matthias,
> > >
> > > This is a gentle ping to know if you can take this patch please.
> > > Sorry for the double mail, I screwed up the first send.
> >
> > It's the middle of the merge window, we can't take _ANYTHING_ now.
> > Please wait until after 6.3-rc1 is out.
> 
> Now that 6.3-rc1 is out, can we try to get this patch merged? All the
> i350 driver patches are waiting for this to land.

$ mdfrm -c ~/mail/todo/
1459 messages in /home/gregkh/mail/todo/

Please relax, it's only been out for a few hours, and our review queues
are large.  To help out, please help review patches from others to
reduce our load.

thanks,

greg k-h

