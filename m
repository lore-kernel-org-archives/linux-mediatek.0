Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4146BC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnxOUI0gSpV8hG2Jd9EBkFsm+VLyG+zvfjtl3jmBTzs=; b=4nltNsqXxTm9J6v9BrwVQyhHVJ
	PvR/fTuMD9gtpljicFgdgAUW90KruE6ZQQYvnYwwFqnVX5pUb/bb4CNoW2q9cbF5g9URjcmSu5C+m
	VEp+pxvEjGcR5cTl+Hvzz2k0LXgitGOI7Fj06aew/kzxZX/4UqRcc/pvKTi9ZshQF2UCHngSZyFjg
	TX9OUTjtiZq7RbXjaw4NT3uSyxcA8UXsa0A5JuTM9fzTiGrKAVdGV9q/iQWES3uRe4cn1CohvUucU
	91oZZgNcUbORHc8z41EnX9PsPUu8WKZ7GJY4Y61D9F75HNd1AEAWMYYg4S7/JKK1tzzbX2S+uG5dd
	JYmf95qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXcO-005uDZ-Vg; Thu, 19 Jan 2023 16:18:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXc5-005u5y-2R; Thu, 19 Jan 2023 16:18:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E88661CBF;
	Thu, 19 Jan 2023 16:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F26C433D2;
	Thu, 19 Jan 2023 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145084;
	bh=KPB9grz4uvPJpF4QpoFc6YTHB9fcdI0QZLt3JLksYgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KseCt10wUfr4FTjsx7zyulL8S7ZmllLdt7pkJu2f3aEYLGrvbT9L32Lvp8V6vizWe
	 TGkRUL7kNvurFIHTVBuviKZXPNFvh1r0Kclr8cyMed3fXBDz/4Rcnn2gCYmlABo8PW
	 baljXHIydxYZON3PyeYiiV8HjfHw+u7n0+fhlPrxevP9IZn4wk0YfEbKgh9EFz0ugi
	 CMO+CIflYwFFsIYqgr7TQWLQQQa896zXdqX9JovSP84bdmz3kAJVaGmQmiey5inXId
	 pElZ1dfzyuMowMlXbzC8579IIqd+rzxb+02ozF8fG6IaIHVweUltagb9hq4dxHOVAk
	 VIVBclatYXxMw==
Date: Thu, 19 Jan 2023 16:17:56 +0000
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
Subject: Re: [PATCH v4 03/11] leds: an30259a: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8ltNNM9aeWQnlNL@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-4-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_081805_272774_11355994 
X-CRM114-Status: GOOD (  11.49  )
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
> ---
>  drivers/leds/leds-an30259a.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

