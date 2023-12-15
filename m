Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqnWI6H3xR+X77+L82DguL3IVXDS8TZ9J0FB5BPolzM=; b=HAjtWpfAB0j2t8TRmDiQDrj/O0
	lKprCnh4qEqHx9eEziES9Wo4ui0PrUMkRTqAsxVXjAcViFmNC4U0fxFAx1aCBvXti4EGn9ngArxKR
	6yBg/c+0xHMPpjAS1nqKBAPjsMjSx17Fs4wtyi/7Fc+MpWz84tccbTMfQeUq0FT5kIxrjReT0ZFPG
	Gz2j4+2CKT+tdF8ZxXHvmAZs4Z41TkQMNwiToprLfRsKqkiM+96+j/1eumaNFdCSf0zbNtCYdK2Kv
	VuwVKFk+qCMwKiug6Z10FkgshqYmFU2WwjxNuIhN9Q+L+3XjOOvJLZpTCEXg0+xtnyy0QGyCJ4/bR
	uhoBK3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAty-003qYG-37;
	Fri, 15 Dec 2023 16:19:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAtv-003qXO-15;
	Fri, 15 Dec 2023 16:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F2C35B82746;
	Fri, 15 Dec 2023 16:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FC0C433C7;
	Fri, 15 Dec 2023 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702657137;
	bh=YlcNrdt+0bdBjEoeknJhdd+iUZGMaHxrfBZN/74+PSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7dm0Ddli65bXnpIe+H/ttDbslFE9q2kMgBadq97OkKtouXQIbEiyY2q9JXScuDsv
	 C1TjFxiht6mfl4VICqLkzK7PUWl+CGRGnU6fYOYPcX8M4yYc9TnjF9ZXpkWsSySLmw
	 CyyhNm54GFYsWjy2rItDi4vwFE9/ZhlLtsFlUG5+pOmeb3j63lrLaKJ7ABlRzd4YHf
	 FIPEL5mBy+6x1p0RKnf9kDaMW13b61pXy/Df0JjpQnoeYrO6LSmIPopfjK9+e6we66
	 XhmZW3p8qy6Nb89ngBM4O2Sk//rED3kWw0q23oLG3uetyunnmSGJbQZLPq0L+Kbm4x
	 OaRnvmY/t7uxg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rEAto-0000VW-1C;
	Fri, 15 Dec 2023 17:18:52 +0100
Date: Fri, 15 Dec 2023 17:18:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-iio@vger.kernel.org, netdev@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] treewide, serdev: change receive_buf() return type to
 size_t
Message-ID: <ZXx8bCVyxJ9Ddvqm@hovoldconsulting.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
 <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_081859_652673_2260C739 
X-CRM114-Status: GOOD (  27.62  )
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

On Fri, Dec 15, 2023 at 02:55:59PM +0100, Francesco Dolcini wrote:
> On Fri, Dec 15, 2023 at 02:36:31PM +0100, Johan Hovold wrote:
> > On Thu, Dec 14, 2023 at 06:01:46PM +0100, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > receive_buf() is called from ttyport_receive_buf() that expects values
> > > ">= 0" from serdev_controller_receive_buf(), change its return type from
> > > ssize_t to size_t.

> > > -int gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> > > -				size_t count)
> > > +size_t gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> > > +		       size_t count)
> > >  {
> > > -	int ret;
> > > +	size_t ret;
> > >  
> > >  	ret = kfifo_in(&gdev->read_fifo, buf, count);
> > >  
> > 
> > Why are you changing this function? This is part of the GNSS interface
> > and has nothing to do with the rest of this patch.
> 
> good point, thanks for looking into that.
> 
> from my understanding kfifo_in() already return an unsigned, both
> __kfifo_in and __kfifo_in_r return unsigned.

Correct.

> With that said this is used by 3 drivers:
> 
> = drivers/gnss/sirf.c:
> = drivers/gnss/serial.c:
> 
> The driver just use it into the actual receive_buf callback.
> 
> = drivers/gnss/usb.c
> 
> This driver does nothing with a negative return value (that is never the
> less not possible), it just check that the whole buffer was inserted.

That driver also knows it will never be negative.

And you forgot about

	drivers/net/ethernet/intel/ice/ice_gnss.c

> To me the change is correct, with that said probably this should have
> been explicitly mentioned in the commit message or a separate
> preparation patch.

It's a separate change and should not be hidden away in a tree-wide
change that goes through a different maintainer.

Please drop this change from this patch and resubmit it separately to me
if you want and I'll review when I have the time.

And when doing tree-wide changes, please try to follow the style of the
driver you are changing (e.g. do not introduce inconsistencies by
changing to open parenthesis alignment of continuation lines in code
that do not use it).

Johan

