Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE41E64ABA
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmOsZInHNqgdKl9OYDkG+C2ePZH/uf8pU4D17xNPPj0=; b=r4DgabqZgXdj8ASTj9ZRKal+UD
	A4ZPNus//EBgh+/J5hY6Huhl/6A+1dOemkHOKk0uLcGeM31u5yPnpQpAyXza0My9DKtT+W8TewCJD
	M/MYlgmFILD1o9ijGqXiMoGJ4zBYIs8xmKpYEPcbCaikduLUKY3rr+FLhorm1SpMg0ORFh3N+pSEb
	qgLicxaC4hgkoapOFHEh2wNu9Y3o1UfdO/MYbPVyNMivn2JPbyr0wHMMTTZmr36ufw6J199DZCQSs
	ayuy5cf2Y3dyeYIibt8IEQDXIB/sY1GlpWv03ukH8aTlBvlGM2S28DqB1CJ2WyItmMDqsspesz+LR
	7pToG+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUb3-00000009tSf-1NUS;
	Tue, 03 Dec 2024 15:13:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITZK-00000009jJV-32ei;
	Tue, 03 Dec 2024 14:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tmOsZInHNqgdKl9OYDkG+C2ePZH/uf8pU4D17xNPPj0=; b=HvsrwzbE+2hiugOWWbx4yF+JOU
	eh5iJrar7c1DldGouUFaT9cujeB+oZQc64xdAQ+RJWua2twG+WyhUNVzSoTomNYnPMmFo4drqcxZt
	FS+3f/cLFcWrYv0ALzSvwB3UzVUrMBQAMG15QBHE5woKf+mBIeRrAf7tW+rzn1xITFxz3zoDhPySS
	oxmF4i6TpKN/rTuNwGkZ60+2mjGyjI04WaQtMVHz7TI5DaOLje6yqYityIE8tfnb5lIGZ3SvMQlur
	Ahl/99dcB/eZ0WeGHTieeWYfHQ+Fnfly3gDOXlgJgzpXVqB6iuGX1o0s0A/3xivzxmAsBF4xCyeLq
	EhpvGAkQ==;
Received: from todd.t-8ch.de ([159.69.126.157])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITZH-00000002O5l-2tIo;
	Tue, 03 Dec 2024 14:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1733234875; bh=fHTskvsLjld8Oq3wof1WoW/ro1iLNuhMDVshgcSrpsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1SEFC6CwLYUTcqqqze527r7IWIE4XsyoMQ1CGzSu2Lo7wpen1OO065Nb6zA+snIr
	 s3/fB4myqry70R09PnBsloM8UYaMMYtq2RVACVaLKZRaHFcnQ6Cg6M23NYb/aG/4oS
	 rGquyCmF69KPSlVFe8JS1cvEe5EsWFKP+TSwl24Y=
Date: Tue, 3 Dec 2024 15:07:55 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Andreas Noever <andreas.noever@gmail.com>, 
	Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Jiri Slaby <jirislaby@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>, 
	Mike Christie <michael.christie@oracle.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Nilesh Javali <njavali@marvell.com>, Manish Rangankar <mrangankar@marvell.com>, 
	GR-QLogic-Storage-Upstream@marvell.com, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Alison Schofield <alison.schofield@intel.com>, 
	Andreas Larsson <andreas@gaisler.com>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jens Axboe <axboe@kernel.dk>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux1394-devel@lists.sourceforge.net, 
	linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, open-iscsi@googlegroups.com, 
	linux-scsi@vger.kernel.org, linux-cxl@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-block@vger.kernel.org, arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v2 00/32] driver core: Constify API device_find_child()
 and adapt for various existing usages
Message-ID: <8fb887a0-3634-4e07-9f0d-d8d7c72ca802@t-8ch.de>
References: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
 <g32cigmktmj4egkq2tof27el2yss4liccfxgebkgqvkil32mlb@e3ta4ezv7y4m>
 <9d34bd6f-b120-428a-837b-5a5813e14618@icloud.com>
 <2024120320-manual-jockey-dfd1@gregkh>
 <b9885785-d4d4-4c72-b425-3dc552651d7e@icloud.com>
 <8eb7c0c54b280b8eb72f82032ede802c001ab087.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8eb7c0c54b280b8eb72f82032ede802c001ab087.camel@HansenPartnership.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_140759_947133_D0FB725C 
X-CRM114-Status: GOOD (  23.17  )
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

On 2024-12-03 08:58:26-0500, James Bottomley wrote:
> On Tue, 2024-12-03 at 21:02 +0800, Zijun Hu wrote:
> > On 2024/12/3 20:41, Greg Kroah-Hartman wrote:
> > > On Tue, Dec 03, 2024 at 08:23:45PM +0800, Zijun Hu wrote:
> [...]
> > > > or squash such patch series into a single patch ?
> > > > 
> > > > various subsystem maintainers may not like squashing way.
> > > 
> > > Agreed, so look into either doing it in a bisectable way if at all
> > > possible.  As I don't see a full series here, I can't suggest how
> > > it needs to happen :(
> > > 
> > 
> > let me send you a full series later and discuss how to solve this
> > issue.
> 
> It's only slightly more complex than what we normally do: modify all
> instances and then change the API.  In this case you have an additional
> problem because the prototype "const void *" will cause a mismatch if a
> function has "void *".  The easiest way to solve this is probably to
> make device_find_child a macro that coerces its function argument to
> having a non const "void *" and then passes off to the real function. 
> If you do that in the first patch, then you can constify all the
> consumers and finally remove the macro coercion in the last patch.

Casting function pointers like that should be detected and trapped by
control flow integrity checking (KCFI).

Another possibility would be to use a macro and _Generic to dispatch to
two different backing functions. See __BIN_ATTR() in
include/linux/sysfs.h for an inspiration.
This also enables an incremental migration.


Thomas

