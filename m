Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30338C46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6EQCHTYa+xBwV1x2ww03y3S4iFX93R73mHv/88wTtU=; b=AZ5OgiV9yaC7LzPdJVwuENVRlX
	UPdmDpYsWMYg58NrSzIi3dzL/tG+05CKfrSku15OQPA0T3mupCgnobGf04nZEi30QLrE+jRfXJkQ3
	M6arD7q6hRnkTR1WhUs94fIzPWSgktrgIwm0rd0pPaeKq/izeTBu+1X84OfOOwXtIKWBGS9iNfsgj
	oujV65t0UPjRWkH6c28G8DEvkDnj2L8tMT0tblQx/KUh5HVHe4gqZMaCDwqRsLxS4em2bQGB3vR/u
	soGtu1ihwGivJMcD7JxukBfRVLgSC4gCUlcLEh34Eg7GWCFXvCpOom3ohkTcc+fDQLsM3rbba/dVr
	xocKr4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXdt-005uxI-8H; Thu, 19 Jan 2023 16:19:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXdR-005ui3-A9; Thu, 19 Jan 2023 16:19:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D55EE61CB1;
	Thu, 19 Jan 2023 16:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B973C433EF;
	Thu, 19 Jan 2023 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145168;
	bh=IMLrxZxWaYCzpGqEBY+yM8xhvFB/xzDgIWYBYHHskLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZQiTsvESJOuHyvw3KdDpnIrGIlPCsrH2JdzfdFiId4lUHXr/ernvzN23/jChwVBN
	 yeTBJfguripySoWqml+eB3PFquRSAhHZW5tbDRJk35OPqgR0XwEJB42kErus3sQHfO
	 9QYrYA0r+EnjoC4w4xcle+FHaMROuJTnGjx4xI5umlweOTtntOO9u6P/K0vtdX36+S
	 Z6lque8e7pu3dd6DrnbjMN7ESbFCiwmenOlqBmKIUAAVr2IsTldcB4RMKjpUjHorJ0
	 gw+RIBX5zvr/DoscGBOqtT/CHtdCKXoGFZHlcaKkDUp1E2iJi+MbYpPeVGcThPX4Ym
	 VeZbU4eR9+NNw==
Date: Thu, 19 Jan 2023 16:19:20 +0000
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
Subject: Re: [PATCH v4 04/11] leds: bcm6328: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8ltiLGDxcZVh4Aq@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-5-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_081929_431300_9BCA227D 
X-CRM114-Status: GOOD (  12.01  )
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
>  drivers/leds/leds-bcm6328.c | 49 ++++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 25 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

