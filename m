Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F73C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSuTQc2/9jWNrNFP7AdFrBcpFSfJiI3B/vtGJ4lkM90=; b=aSrt/yntG1I3pLh+Hwpuh0TFnz
	okReVgQVp/vwOzWwkAlBeiwz4ladNZcPP0FbGmLX1HXUHuEU3NA0qXvSGcRIwNYz4fN/5FYNvirlQ
	TMc++hwFZftSlX1QqKEJqEVJzLSyfhZKqHqMtCd/eKgNGw+7HNvCzxQWkIsgkis0nyCAgYyxlt4n4
	Cu5fKPtrjgF4DJAtwzmSY4nCnt2omtnJWqvbKLcIPXSparmuODR9dkQ8uKx1sJme+QfQS8POLTcQX
	etBSRcKeIKK2qBE/eSwEQHtjtfeEb6qhZn0rjc4Dwz/+l4gaJM8+uf52Sb3tiM7cnuikPduEwQG2A
	japCn8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXbp-005tyu-Pv; Thu, 19 Jan 2023 16:17:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXbO-005tqZ-QZ; Thu, 19 Jan 2023 16:17:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B46F61CBB;
	Thu, 19 Jan 2023 16:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C94C433D2;
	Thu, 19 Jan 2023 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145041;
	bh=I4UV/ZFa5sN0ljDlr5qmIib/5HOXj3xcEjz22nxpESs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XmRWLBZ9Sj2J4wnmS0yEkR6ZwBpbie8Dl7OfyRAyWr19jxqPveXzvG/qGacYmhp9B
	 WAAqTSQWDP47CvRtTR5BaOl5voYJGf15mCGETDFTzANIhNahQd1Q/R78a1/mEDm/2M
	 n/gUsYXBB+7XK6/EZ0xd+TJ1rvFC1nw1Cb21BJawArxTQCx6G0jB67XL4NO0xfnt9G
	 NkzEA8AFQglFea4Pvd3b4V1wHS8Om6pjcBix6SWifXdy2hqIXG60LkK4boXb9H5M5I
	 QceoS8og/cRl3dePeUzBvnmAvye0RQp4dTBvl45geyCwVFMFrs+GgI0uPGXZT8USHN
	 qWX/oE53Z2IvQ==
Date: Thu, 19 Jan 2023 16:17:13 +0000
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
Subject: Re: [PATCH v4 02/11] leds: Move led_init_default_state_get() to the
 global header
Message-ID: <Y8ltCUMwZdpnNRTD@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-3-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_081723_005301_E47847E0 
X-CRM114-Status: GOOD (  13.26  )
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

> There are users inside and outside LED framework that have implemented
> a local copy of led_init_default_state_get(). In order to deduplicate
> that, as the first step move the declaration from LED header to the
> global one.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/leds.h  | 1 -
>  include/linux/leds.h | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

