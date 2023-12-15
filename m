Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DF0C46CA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uW3Dm5habtWr2/+wahbqZ9sTQtSlEleE4IXffsA+iNw=; b=0asWE/ri5c+DzE0lrVlKjB5GWa
	m15x5F3wOOxruul7bKM9P/RbYmCraoyorrq/+9hrSqsO2/OJCj9/dYaApfSTCAORYX7QQwKJEt1EN
	8jflXOm4JO/5ktiJp2hcqo+aU05Tepw/1tVkpMC3XYGPyCIvTM2BZHBMCWae1RMmv+dEYIYcM2MV8
	31yv9gITdDm+oXYhqBd2uvY5wkYqImIo0/uR8LqVOhZG93/oJMp4p0JzNFGNgqdrCLvN78GcHpi+k
	vBfFZVKVCIpAVrGMeLagjpE3B6dbgObPnFZvZ+2x+XZKJ7fzuQzyxTAmCUfkNikUdtcyRtsVwEVVF
	5CX3HJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8jS-003T9N-0c;
	Fri, 15 Dec 2023 14:00:02 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8j8-003Sp9-1O;
	Fri, 15 Dec 2023 13:59:44 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 402FB212A0;
	Fri, 15 Dec 2023 14:59:37 +0100 (CET)
Date: Fri, 15 Dec 2023 14:59:35 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Johan Hovold <johan@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <ZXxbx+laQk35W56U@francesco-nb.int.toradex.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxZzd1iBOCmnczH@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXxZzd1iBOCmnczH@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_055942_819380_8C9C0B14 
X-CRM114-Status: GOOD (  33.79  )
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

On Fri, Dec 15, 2023 at 02:51:09PM +0100, Johan Hovold wrote:
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
> > hello,
> > patch is based on current linux next.
> > 
> > It has an obvious problem, it touches files from multiple subsystem in a single
> > patch that is complicated to review and eventually merge, just splitting this
> > would however not work, it will break bisectability and the build.
> > 
> > I am looking for advise on the best way to move forward.
> > 
> > I see the following options:
> >  - keep it as it is
> >  - break it down with a patch with each subsystem, and squash before applying
> >    from a single (tty?) subsystem
> >  - go for a multi stage approach, defining a new callback, move to it and in
> >    the end remove the original one, likewise it was done for i2c lately
> > 
> > ---
> >  drivers/bluetooth/btmtkuart.c              |  4 ++--
> >  drivers/bluetooth/btnxpuart.c              |  4 ++--
> 
> > diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
> > index 3c84fcbda01a..e6bc4a73c9fc 100644
> > --- a/drivers/bluetooth/btmtkuart.c
> > +++ b/drivers/bluetooth/btmtkuart.c
> > @@ -383,8 +383,8 @@ static void btmtkuart_recv(struct hci_dev *hdev, const u8 *data, size_t count)
> >  	}
> >  }
> >  
> > -static ssize_t btmtkuart_receive_buf(struct serdev_device *serdev,
> > -				     const u8 *data, size_t count)
> > +static size_t btmtkuart_receive_buf(struct serdev_device *serdev,
> > +				    const u8 *data, size_t count)
> >  {
> >  	struct btmtkuart_dev *bdev = serdev_device_get_drvdata(serdev);
> >  
> > diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
> > index 1d592ac413d1..056bef5b2919 100644
> > --- a/drivers/bluetooth/btnxpuart.c
> > +++ b/drivers/bluetooth/btnxpuart.c
> > @@ -1264,8 +1264,8 @@ static const struct h4_recv_pkt nxp_recv_pkts[] = {
> >  	{ NXP_RECV_FW_REQ_V3,   .recv = nxp_recv_fw_req_v3 },
> >  };
> >  
> > -static ssize_t btnxpuart_receive_buf(struct serdev_device *serdev,
> > -				     const u8 *data, size_t count)
> > +static size_t btnxpuart_receive_buf(struct serdev_device *serdev,
> > +				    const u8 *data, size_t count)
> >  {
> >  	struct btnxpuart_dev *nxpdev = serdev_device_get_drvdata(serdev);
> 
> A quick check of just the first two functions here shows that they can
> return negative values.

This is already fixed. Patches are in next.

There were 3 buggy user of this API.
 - 1 patch was merged a few days ago in mainline
 - 2 patches are in next, the maintainer decided to wait for the next merge window

commit 687d2de93b11 ("Bluetooth: btmtkuart: fix recv_buf() return value")
commit 7954bbcdd7ea ("Bluetooth: btnxpuart: fix recv_buf() return value")
commit c8820c92caf0 ("platform/surface: aggregator: fix recv_buf() return value")


> 
> > diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/serdev-ttyport.c
> > index e94e090cf0a1..3d7ae7fa5018 100644
> > --- a/drivers/tty/serdev/serdev-ttyport.c
> > +++ b/drivers/tty/serdev/serdev-ttyport.c
> > @@ -27,19 +27,17 @@ static size_t ttyport_receive_buf(struct tty_port *port, const u8 *cp,
> >  {
> >  	struct serdev_controller *ctrl = port->client_data;
> >  	struct serport *serport = serdev_controller_get_drvdata(ctrl);
> > -	int ret;
> > +	size_t ret;
> >  
> >  	if (!test_bit(SERPORT_ACTIVE, &serport->flags))
> >  		return 0;
> >  
> >  	ret = serdev_controller_receive_buf(ctrl, cp, count);
> >  
> > -	dev_WARN_ONCE(&ctrl->dev, ret < 0 || ret > count,
> > -				"receive_buf returns %d (count = %zu)\n",
> > +	dev_WARN_ONCE(&ctrl->dev, ret > count,
> > +				"receive_buf returns %zu (count = %zu)\n",
> >  				ret, count);
> > -	if (ret < 0)
> > -		return 0;
> > -	else if (ret > count)
> > +	if (ret > count)
> >  		return count;
> >  
> >  	return ret;
> 
> So please do not apply this patch until the various implementations have
> been fixed.
> 
> Johan

