Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C1C46CA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi/HSQcBTgkWdwcBQ0jNqMVNBQZNEmq6pYFwdDEOWmw=; b=aKW2nDTKwQdXdWlXl6OFjPLB6K
	GQmpItmrYhJlQLJhJUDy2uUaqCF81sTzwq7Yb2HGnLL9ZtcBY5fETl4iFCX3n+HBq+jbD1r+cXumR
	Eng465fKHC6/dZB+6tNxmI3on6MR/6OhHacVPvzen5l7Fp5ZiTlkqTBoAQjPG7vVUf1UZmdZKwDPj
	7c8nssOq/FQse70RsmAL5iA8wiEivNncGy/maV7RwTW8KUAfvBpe7N7MR84xcee/GZR0G9JEopNQd
	5CGT/cIwgrnWmQ3U+LumvyOSzFSfJcF9WguZkG4c5+46l56xVj8q2oJMld3U5GmVYHWMIiEtrtGmE
	dF+SbN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8gB-003S8g-1j;
	Fri, 15 Dec 2023 13:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8g9-003S6n-16;
	Fri, 15 Dec 2023 13:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qi/HSQcBTgkWdwcBQ0jNqMVNBQZNEmq6pYFwdDEOWmw=; b=kyWftHqHOYjDw9PWk2EM37UmQo
	YCJsa94FYM+HnjTG2lVY5LCgiSXbp+/dTAc7a4jVnAbVzKKD98xzWpCMXTOtj8+HAPurbmLE151m7
	nKuXkF8IZeB1YynqoM2VFOmUW45MWUIDD541irKHnqDocg2Yb0BUFk7JWg0EU5FkKYpwYVtCU71gq
	7fs6dKK5vx+bXEYzyb12/eAj7yhy1ogGoEFSrj2PUFAKAdaKrp7fI3PtiUcAEsi7eLXRsC6MNQD9P
	ILdL8yqgcWNsfgnNGzIbuzYIt90LN9YNwXlVeVExmljWl1p05KK2jnWjYYJH2x1XHNP4SJFJ1DVnm
	vjTvCEcw==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8g0-009vVv-1k;
	Fri, 15 Dec 2023 13:56:35 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 93045212A0;
	Fri, 15 Dec 2023 14:56:03 +0100 (CET)
Date: Fri, 15 Dec 2023 14:55:59 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
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
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] treewide, serdev: change receive_buf() return type to
 size_t
Message-ID: <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_135629_154588_C2F3A1F8 
X-CRM114-Status: GOOD (  21.51  )
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

Hello Johan,

On Fri, Dec 15, 2023 at 02:36:31PM +0100, Johan Hovold wrote:
> On Thu, Dec 14, 2023 at 06:01:46PM +0100, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > receive_buf() is called from ttyport_receive_buf() that expects values
> > ">= 0" from serdev_controller_receive_buf(), change its return type from
> > ssize_t to size_t.
> > 
> > Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> > Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  drivers/gnss/core.c                        |  6 +++---
> >  drivers/gnss/serial.c                      |  4 ++--
> >  drivers/gnss/sirf.c                        |  6 +++---
> 
> > diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
> > index 48f2ee0f78c4..9b8a0605ec76 100644
> > --- a/drivers/gnss/core.c
> > +++ b/drivers/gnss/core.c
> > @@ -317,10 +317,10 @@ EXPORT_SYMBOL_GPL(gnss_deregister_device);
> >   *
> >   * Must not be called for a closed device.
> >   */
> > -int gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> > -				size_t count)
> > +size_t gnss_insert_raw(struct gnss_device *gdev, const unsigned char *buf,
> > +		       size_t count)
> >  {
> > -	int ret;
> > +	size_t ret;
> >  
> >  	ret = kfifo_in(&gdev->read_fifo, buf, count);
> >  
> 
> Why are you changing this function? This is part of the GNSS interface
> and has nothing to do with the rest of this patch.

good point, thanks for looking into that.

from my understanding kfifo_in() already return an unsigned, both
__kfifo_in and __kfifo_in_r return unsigned.

With that said this is used by 3 drivers:

= drivers/gnss/sirf.c:
= drivers/gnss/serial.c:

The driver just use it into the actual receive_buf callback.

= drivers/gnss/usb.c

This driver does nothing with a negative return value (that is never the
less not possible), it just check that the whole buffer was inserted.

To me the change is correct, with that said probably this should have
been explicitly mentioned in the commit message or a separate
preparation patch.

Francesco


