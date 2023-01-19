Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFCAC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FjNSgC9PNpMtziDrd9ruBkmkyh+1reW/KDGscQa04o=; b=a2vMChPVt2pykInYwEdOfwnfz1
	gr5TZNL0Gik+3GSaQa4O+8OVqqu4qmHa7EIxVW0DPCpksB5Uzkdy49ajJlSPM6h5uhXhYdRgiliwH
	r5cj6QjKrN4MCetg9zcGn3s5PRtVxYGY3AyZgGxBGzL+km4eWk/Yg7VU8XgL7L/N2B9Bc9Xa8ihJk
	RGzvB6/Jia4ntsbkPhA/lzJXQ/lrZMTXecongl17rlNRNUYlmXNDhisiHZ02JP9OnEBUws0KzmSri
	fMqHOD6KRhWe+ynDGLBijDYs2YmNYGcdIeEog1iX063ygVT0gtN239/g/DMIR+Hb50hfnqKgYraq2
	/03xdrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXhj-005wef-3s; Thu, 19 Jan 2023 16:23:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXh2-005wHx-4i; Thu, 19 Jan 2023 16:23:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2DC261CBD;
	Thu, 19 Jan 2023 16:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558AEC433EF;
	Thu, 19 Jan 2023 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145391;
	bh=9XkQ6Kh5SPmyhSqvvmawvoCpf0X2h3RYxZuu4mVuKj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mhVxmzglOWJSu89yWeFQi6iQ5tTnKejNhTohxAlP+wgZWWjM29G7zrCkBpmPBc8hm
	 t+kySzbzVLCvJ5kkGT3YxqEXkxC+a7eQq5xJKGAyO1aNBiqSYihrnHNYmWuDbk0HtA
	 CPAtuqp1S7rnTFF2raM6K4HfHIXup7y9yIhwCIVGaJ/2AuCbrUjkAwpt/vslWKEV1J
	 sul8kKbsaxbWkmUobWivgLht9x+KCisv9emImjSoLmelyofUcNQ3fQYR6AUKOss1nT
	 YTPKEoGDHYX2TG12KCWF7kUq8CAClqAfD8WCGp5X2wm+2v6FlBrLj46P8gQMLnG+Zo
	 9NfnxNn3tvmRw==
Date: Thu, 19 Jan 2023 16:23:02 +0000
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
Subject: Re: [PATCH v4 08/11] leds: pca955x: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8luZjY4LJ3RM4Ds@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-9-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082312_421522_C040BC1E 
X-CRM114-Status: GOOD (  11.85  )
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
>  drivers/leds/leds-pca955x.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

