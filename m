Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EF3E64A89
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lvdz4NYpSvXhqvvUM5Arn/eRox7yqZnVcuZIabisLE=; b=TMWffGGOiJ5rKRqCtAyiLWd/kK
	eX2fFTW/PgvfsPxuBBm/KmNxQhoO/lXxqFwr5IguJuETquBNMIC8wVkOMB2wGYy3ofbVW4dgyKAQY
	ZM9OENzZqN9CZs/SDCh8nVph9Ryza0acyu4Psb39MTg9kVoovGQPbh5Pxncrx0ogHQX1Q+Wis5K7+
	3Sv7p5Sy7Fw+wYORrutHpxV0WWv1dBOpfXywTypGfafrE1uZAMhjfTJvqLxyFRTCHfFgFbVeXMqQL
	rqimIa/DvFg2EmPrBJVRqNZ4PEdaTOLYaRa/J7Qqe5xYK9ToEfwsBSlwxoNyYI8dTZ8O4vgPyH+DA
	n0aD8p0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISIT-00000009TpX-3gdG;
	Tue, 03 Dec 2024 12:46:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISDM-00000009STK-2R5A;
	Tue, 03 Dec 2024 12:41:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D707A41571;
	Tue,  3 Dec 2024 12:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C16C4CECF;
	Tue,  3 Dec 2024 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733229675;
	bh=2uEXSo5be+RCYE8wBlDOJXNuB/VT7ARg3i3C+zGOWYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1Unb6vnj0waeqg52vL3tNBxqazZ4YLEkRH6amdDr2bx43L5JPTkkH+pB+L4tMzH0J
	 SCb6eYmqeMGHbFRdUm9eKf56OQESdHkQFoMknfazShRPcJP62eT8Z3A5bIfaHIyzv7
	 mcuUv99lpsVEKyYu6Ycjcf2lp80AbgdlAJGG1ZwM=
Date: Tue, 3 Dec 2024 13:41:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Jens Axboe <axboe@kernel.dk>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org, nvdimm@lists.linux.dev,
	linux1394-devel@lists.sourceforge.net, linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org, open-iscsi@googlegroups.com,
	linux-scsi@vger.kernel.org, linux-cxl@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v2 00/32] driver core: Constify API device_find_child()
 and adapt for various existing usages
Message-ID: <2024120320-manual-jockey-dfd1@gregkh>
References: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
 <g32cigmktmj4egkq2tof27el2yss4liccfxgebkgqvkil32mlb@e3ta4ezv7y4m>
 <9d34bd6f-b120-428a-837b-5a5813e14618@icloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d34bd6f-b120-428a-837b-5a5813e14618@icloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044116_764375_A75D604E 
X-CRM114-Status: GOOD (  17.53  )
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

On Tue, Dec 03, 2024 at 08:23:45PM +0800, Zijun Hu wrote:
> On 2024/12/3 20:00, Uwe Kleine-König wrote:
> > Hello,
> > 
> > On Tue, Dec 03, 2024 at 08:33:22AM +0800, Zijun Hu wrote:
> >> This patch series is to constify the following API:
> >> struct device *device_find_child(struct device *dev, void *data,
> >> 		int (*match)(struct device *dev, void *data));
> >> To :
> >> struct device *device_find_child(struct device *dev, const void *data,
> >> 				 device_match_t match);
> >> typedef int (*device_match_t)(struct device *dev, const void *data);
> > 
> > This series isn't bisectible. With only the first two patches applied I
> > hit:
> 
> yes. such patch series needs to be merge as atomic way.
> 
> Hi Greg,
> 
> is it possible to ONLY merge such patch series by atomic way into your
> driver-core tree?

Nope!

> or squash such patch series into a single patch ?
> 
> various subsystem maintainers may not like squashing way.

Agreed, so look into either doing it in a bisectable way if at all
possible.  As I don't see a full series here, I can't suggest how it
needs to happen :(

thanks,

greg k-h

