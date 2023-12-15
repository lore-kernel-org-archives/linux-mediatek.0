Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0930CC35274
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tbt1bur1fD/ajvxWORzBVrthSkqSKkGunZNsTKnb4k=; b=OVM5MeVEjN12nsUy2DR4YdYdPE
	urNvLex9X3pFSmVMHmrltjxYBaYPUArCws9z5AnDkVlvN915poi4aD0G/XryjhRxJrI5gtALRJtjx
	aFUeXuuKH/HgmqKQhCZRbbkNlQkY4IwrArlir74MhrTeU4aymmUYfZPsQCGfkz4zITC+HOZH+8z6N
	N3bAoCWVWJHVgji8slG37S9X5SlHpi/q4hPXwhopTsm/8M0ngAa6qXt+1Y6U8n+oastDvPqn21kTz
	QfGnLDAaNPCvW5MBtQ3ZAuVIiCquhNtRxHPaMg7i9Zegr7BoQYc1kkeKN5gZD60pR2EDOrMGtSXd+
	gQcmKsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8v9-003WHX-0F;
	Fri, 15 Dec 2023 14:12:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8v3-003WGW-2N;
	Fri, 15 Dec 2023 14:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 33DD1B81D96;
	Fri, 15 Dec 2023 14:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A407C433C7;
	Fri, 15 Dec 2023 14:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702649515;
	bh=xcqVasPR7/6/BGkmp20d/mwFZY/qYeQV954kXhulne0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6hwq92XJhZCx8YzkUspQ2BH8/Bmyvmss0bwdDEeI685r5m21J29uMKmzEeKRlHGf
	 gFtB8lAkg2zQd+t/qN4A5hvSsaF9WE8iyeEfKkXx0TQFMfFJwajt9rs2jMLAA5UQ2Q
	 ttSYSzrZbXILZ1muKg4Fnpy5jIEyvmZtvtb8oCHY=
Date: Fri, 15 Dec 2023 15:11:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
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
Message-ID: <2023121544-hastiness-unhinge-b8d3@gregkh>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_061204_119171_D71D8F63 
X-CRM114-Status: GOOD (  18.55  )
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
> 
> Greg, please drop this one again until this has been resolved.

Now dropped, thanks.

