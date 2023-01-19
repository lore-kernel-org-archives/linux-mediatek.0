Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1689C46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AI3KPUIQBnzfJy+fBgM0aRds3MLa6M/rKQfXw1R8FE4=; b=ATWiUaioLUup8S4FJOdThmqA16
	TDjwDzjKVGgZNWoYebHJY0W+Ts6xoqoqPYNWjwOhDEaMAJB/ORZOyykIVFKz6WMP1FDgxpfYUwAR5
	zgxLs0KJlA7cVzbYTwl9136Lnf3Cs92QZAHtBjbouz5Wk/I8v2VR4L8h/Xz/P4ow6grtAD+shFueQ
	qGomQJfDCg3RPB12ufpaoKGShujQF2Ie4n8lCXtEBVMZz161ABaJw95RfNZ115VTHFxo632IPt9j/
	q7fCJbm9FDMlH6ZXpoqFPLtAsosgq4VblifvNYNasrnB32utHc2DTsgIwsGBYr6Fx452uhRrmMVV5
	Q8RyLe0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXeZ-005vFd-1i; Thu, 19 Jan 2023 16:20:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXe7-005v5K-Jc; Thu, 19 Jan 2023 16:20:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2485761C7B;
	Thu, 19 Jan 2023 16:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919C2C433F0;
	Thu, 19 Jan 2023 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145210;
	bh=rtqy/4jzWUKYzufv20wtz3Q4NRBKbXZ0tWFYpyC86SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQoFOGi7OdAifp5AcLc3j3TfX3u3pABncPkLJ7uhzc9S7buteUyqpaM7r+fwN31Fx
	 7FwT9y4UgsktGOa0c5BEwEKOq6IMBVdSIMar4nWZumQ3/5nGK7E2n7dvyZQ1LMyaxG
	 xxYZqiiBXRt05tPS4troo2WsU8Rz1fqzoPGtHP3Z4Pw8zNWHF+QF4jrY+Wu/OWAlVd
	 DYbFfFMDMp9HQfKtPgPwBYhN8VAFT+BHaz3ODidaGTXuePCoCwJn8yK83cUpKLcfUQ
	 TYvBFXPqrxYvgMm2XGPQCRb3YScL6A4Ro4F2RtCmlHfpTvDJW9JhfGe3Ik9WUT+AHu
	 hqWoqd+lqnecA==
Date: Thu, 19 Jan 2023 16:20:02 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v4 05/11] leds: bcm6358: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8ltsrSpD4bMT+qz@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-6-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082011_757999_C34D1CA4 
X-CRM114-Status: GOOD (  11.59  )
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

On Tue, 03 Jan 2023, Andy Shevchenko wrote:

> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/leds/leds-bcm6358.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

