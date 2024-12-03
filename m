Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408BBE64AAA
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kf7crbb0fpn1qjE7M5Xj2inOsmMty268qLui5ks7IFo=; b=L5wwn7G9P8d3K21aiLIui8mW5V
	V37YRNg9IsQ3uTnCD6yCGrrjsg4ZAalnZ+MbkShjdxXohz2u1dnFDsJDpyiHG5d5SvMUDht7EFV82
	q8/JVBLdktzoAdOZ0I8YUZOJwqYO1BPAiPTaqwFUdmXBjEfJJF/qHjBjol7omqTFGjllkP6uNuF9+
	ZCUSGovKac3r86S0a/nIpMnyGAIzg+yeWIC/0qZY+iOKShOj+h5YaA3KiWHJ6fm2dL/AJOMcyAC2+
	3Ah3JfvPHaRT/4nto3NF5yhpSfajqCruWhrfqXsn2FM++LF+ssVimsH2p6IErncOGAuSVTf02mG4o
	29s/cTvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITQr-00000009hzM-0lJC;
	Tue, 03 Dec 2024 13:59:17 +0000
Received: from [2607:fcd0:100:8a00::2] (helo=bedivere.hansenpartnership.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITQK-00000009hqY-2Y10;
	Tue, 03 Dec 2024 13:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733234313;
	bh=7NNwpckgQb/l67lVPPgzzJ1thEv5O/hEE7t3+p7Tpdo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=HLHxETwehA3Cu0w4lwkW4nLObpF8Giff37u3+xj5dkxb4nBTSHgrTtWMnR+w58SOE
	 yEYBvXR2CCr/Kc1wmc35T5+9wQoejSmzftZx9/tmvGj615/rjVQ8eb6mbyvYpjuerz
	 gvQLnlkjlWO9gVzyf/ZR5y3X9FcM7fRyWzEozQGI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id EA9E31287992;
	Tue, 03 Dec 2024 08:58:33 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id fwoc-_7eWgu1; Tue,  3 Dec 2024 08:58:33 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733234313;
	bh=7NNwpckgQb/l67lVPPgzzJ1thEv5O/hEE7t3+p7Tpdo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=HLHxETwehA3Cu0w4lwkW4nLObpF8Giff37u3+xj5dkxb4nBTSHgrTtWMnR+w58SOE
	 yEYBvXR2CCr/Kc1wmc35T5+9wQoejSmzftZx9/tmvGj615/rjVQ8eb6mbyvYpjuerz
	 gvQLnlkjlWO9gVzyf/ZR5y3X9FcM7fRyWzEozQGI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 2A12D1287986;
	Tue, 03 Dec 2024 08:58:28 -0500 (EST)
Message-ID: <8eb7c0c54b280b8eb72f82032ede802c001ab087.camel@HansenPartnership.com>
Subject: Re: [PATCH v2 00/32] driver core: Constify API device_find_child()
 and adapt for various existing usages
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Zijun Hu <zijun_hu@icloud.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jean
 Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,  Martin
 Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Andreas Noever <andreas.noever@gmail.com>, Michael
 Jamet <michael.jamet@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
  Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>,  Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Dave
 Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, Takashi
 Sakamoto <o-takashi@sakamocchi.jp>, Jiri Slaby <jirislaby@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,  Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Lee Duncan <lduncan@suse.com>, Chris
 Leech <cleech@redhat.com>,  Mike Christie <michael.christie@oracle.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali
 <njavali@marvell.com>, Manish Rangankar <mrangankar@marvell.com>, 
 GR-QLogic-Storage-Upstream@marvell.com, Davidlohr Bueso
 <dave@stgolabs.net>,  Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>, Andreas Larsson
 <andreas@gaisler.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>, Jens Axboe <axboe@kernel.dk>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Ard
 Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
  dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
 linux-pwm@vger.kernel.org,  nvdimm@lists.linux.dev,
 linux1394-devel@lists.sourceforge.net,  linux-serial@vger.kernel.org,
 linux-sound@vger.kernel.org,  open-iscsi@googlegroups.com,
 linux-scsi@vger.kernel.org,  linux-cxl@vger.kernel.org,
 sparclinux@vger.kernel.org,  linux-block@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Date: Tue, 03 Dec 2024 08:58:26 -0500
In-Reply-To: <b9885785-d4d4-4c72-b425-3dc552651d7e@icloud.com>
References: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
	 <g32cigmktmj4egkq2tof27el2yss4liccfxgebkgqvkil32mlb@e3ta4ezv7y4m>
	 <9d34bd6f-b120-428a-837b-5a5813e14618@icloud.com>
	 <2024120320-manual-jockey-dfd1@gregkh>
	 <b9885785-d4d4-4c72-b425-3dc552651d7e@icloud.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_055844_651092_E84F45F7 
X-CRM114-Status: GOOD (  19.22  )
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

On Tue, 2024-12-03 at 21:02 +0800, Zijun Hu wrote:
> On 2024/12/3 20:41, Greg Kroah-Hartman wrote:
> > On Tue, Dec 03, 2024 at 08:23:45PM +0800, Zijun Hu wrote:
[...]
> > > or squash such patch series into a single patch ?
> > > 
> > > various subsystem maintainers may not like squashing way.
> > 
> > Agreed, so look into either doing it in a bisectable way if at all
> > possible.  As I don't see a full series here, I can't suggest how
> > it needs to happen :(
> > 
> 
> let me send you a full series later and discuss how to solve this
> issue.

It's only slightly more complex than what we normally do: modify all
instances and then change the API.  In this case you have an additional
problem because the prototype "const void *" will cause a mismatch if a
function has "void *".  The easiest way to solve this is probably to
make device_find_child a macro that coerces its function argument to
having a non const "void *" and then passes off to the real function. 
If you do that in the first patch, then you can constify all the
consumers and finally remove the macro coercion in the last patch.

James


