Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3334C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AO4lr/+ykR7at5ZWUBr/+uIgYvDZreeIrFXysninrcY=; b=yVX3p2BmVXX/5+WXf5b+/jOIoZ
	TrTtmYnsjE+mcPPLSAv6QKr/e5mHILYqMuMX5fgpQ8b5NcSz6sun+YUDEZXnRfpivL++HPCgAgqxe
	3hkeMQ3c11vxCAlCz28CnM1PR9/VvdRiL2PUCEp4zMOSceeKeiQIVibPHuh1vA05PadLPLdc5c++v
	tZEjQKTfbsdUUKYXZM3mj6bNHxuU9V+GOQwJOF6H3egljzIVfdKF34DwFdw7GhylIRF/4lwuoa+br
	f9YQuY9KhA723FLfQFddFGCTW78f1BrAUeS8q7T5hPVolziwn7tR5snpvkl0sx+kmJ/LcUe9Vo6oP
	sVP8F7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOKgz-0081HJ-2N;
	Tue, 25 Jul 2023 16:15:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOKgw-0081Ga-36
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jul 2023 16:15:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27099617C9;
	Tue, 25 Jul 2023 16:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EE4C433C8;
	Tue, 25 Jul 2023 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690301717;
	bh=xqlw2iIuNZ8RmRxmld2WCrbbgaZVmEpoe/5HMRU1b80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlPXAGQ7eqaIMub5FpN8nIArRxufNeMkt6r/ZdB6OPS53Ts5dB1eCEDYCU81gk6oJ
	 kBgCtnAN46CI+AjaBC2/p0qxPAElD+L+VIU3rAHfz0hxmReoxgO4lNDOOTepeUYD05
	 sYt9ZdS8ZnXxqt6CoQg1AFXKi+yt7bSeCCm+iYD8=
Date: Tue, 25 Jul 2023 18:15:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: mtu3: Convert to platform remove callback returning
 void
Message-ID: <2023072550-blot-moonlit-0b91@gregkh>
References: <20230709163335.3458886-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230709163335.3458886-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_091519_057073_51F7C13E 
X-CRM114-Status: GOOD (  19.70  )
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

On Sun, Jul 09, 2023 at 06:33:35PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> The function mtu3_remove() can only return a non-zero value if
> ssusb->dr_mode is neiter USB_DR_MODE_PERIPHERAL nor USB_DR_MODE_HOST nor
> USB_DR_MODE_OTG. In this case however the probe callback doesn't succeed
> and so the remove callback isn't called at all. So the code branch
> resulting in this error path can just be dropped and then mtu3_remove()
> be converted to return void trivially.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/mtu3/mtu3_plat.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

This patch causes the following build error:

drivers/usb/mtu3/mtu3_plat.c: In function ‘mtu3_remove’:
drivers/usb/mtu3/mtu3_plat.c:460:9: error: enumeration value ‘USB_DR_MODE_UNKNOWN’ not handled in switch [-Werror=switch]
  460 |         switch (ssusb->dr_mode) {
      |         ^~~~~~
cc1: all warnings being treated as errors

