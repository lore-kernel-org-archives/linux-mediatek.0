Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1D5C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuJguxIEPkbou1E9SzWNY1wTKDsYLc1cMFVDqF+N5ac=; b=y95ESbch9hdkOu2YPYgO0Lgenn
	zhEtpmunHVKeVSfSWCUrYJKrT73WcoKUrjDmiAPLEu/GOxF50PjWauiXFjyN//7z1kkM9B3YD2cdv
	9AP3lHYoxc/QhcV3BYDHmVxjhMpQneCfeJzKowu0ino3WP94qpzhgXX/if4BtIB5xI0Zpwkd6hjTJ
	vGyPtNZY242qo0of0D7GIh7Bvk3qhlIUGyHNi3fu+j8YB7HsG0AC8NlpHXaRREiOJbedbzp8OEUUv
	0iHzNsHNcqNBEc6/yXij7rDAshrENYjdtdAz4u1l/r2AgXaXv1bub3WmHXPyfxjMnuKktRqdV6gnY
	lThgeisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlJu-00BOVT-Ed; Wed, 22 Feb 2023 09:21:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlJj-00BORK-Eh; Wed, 22 Feb 2023 09:21:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E548BB81219;
	Wed, 22 Feb 2023 09:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F7EC433EF;
	Wed, 22 Feb 2023 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677057695;
	bh=DRkaQ2QMTyMKbMBa3g3UbF86U6cHs28JPVEbBudftnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sthjhPV/ygHRM90sn5uoL40X+PmEwYLN4KRsfvMZc1pMNEazN7rm3DP/AGzmJN7Y3
	 C3fkZ+GGvaNnAteYtCQEv5Fj8jXdIntNaZNcaZ+wL+Ls7XRcOXevFObW4ugzDLziFN
	 UqwDJn8tzCEuefzPfGG4FJNSizb4tihIkw2svo5w=
Date: Wed, 22 Feb 2023 10:21:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
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
Message-ID: <Y/XenZUmT7Nh2qGP@kroah.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
 <20230125143503.1015424-10-bero@baylibre.com>
 <8c348b39-67f3-9210-1929-8b2f093be24c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c348b39-67f3-9210-1929-8b2f093be24c@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012139_678211_288814D2 
X-CRM114-Status: GOOD (  10.08  )
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

On Wed, Feb 22, 2023 at 09:17:39AM +0100, Alexandre Mergnat wrote:
> Hi Matthias,
> 
> This is a gentle ping to know if you can take this patch please.
> Sorry for the double mail, I screwed up the first send.

It's the middle of the merge window, we can't take _ANYTHING_ now.
Please wait until after 6.3-rc1 is out.

thanks,

greg k-h

