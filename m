Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD266E7716E
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDbYa+5DWmHdZ9lmVLNA7xMZvJoZ/PCpc6Zau1xliNU=; b=4FHodDEDFRKr/Y/oxbHGcLl3kD
	pwiAzF8JbrAeojVKsSFjPqzwoVwGujhCMtgMP520EHz+pEJQZecV2M5jiwzmnsPPk4iWi1rZ6QBXD
	FV1WPwR11QCeLW96yeSJd4Y5zoDaRBQx4WVvYBVT/m0/LOxKf0c9v/y8Gonw3zc7RYTs+yX/orr9g
	4PZWx239omzW4cX8OTfdF+uOOjtNhovT1RdsQtcElYlAFNKpbvaFrxF0qn4ZzJ6he3AR29nSl8FaQ
	RoCN56R+0af+9CXgZFuuq67H/kaPB/IVAivt4fAzSjWDBP6wMnFPxes15GV/3LMl8THAxZu1nmVMr
	avHHBznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoUC-0000000CW40-36nk;
	Wed, 04 Dec 2024 12:28:08 +0000
Received: from pv50p00im-zteg10011401.me.com ([17.58.6.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoTF-0000000CVqp-2ZKo
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 12:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733315226;
	bh=tDbYa+5DWmHdZ9lmVLNA7xMZvJoZ/PCpc6Zau1xliNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=aDx0LVkMUXFI75QpCfQtwEzziTl2NnjdGJ/9Nl6EjkD9AoNOPkj0pNJDmDS0yOxmo
	 cFAXLbMOmPcOl5uunRBBrqBVYZF5ppxfVoWTl3S1fXUPYvDXVgmxgrfgiOzuzDhljR
	 JXz5mSklSuuNIhx7A4INyoL4v8SXD0un9r9AkY3EWP5hUjq0cVMBNRe3UAI+WH+UEp
	 aQcXPRWXKjSKZb3dQybv2/fEczrg8mOY6isUSLdmtOWnHvZ0W1/xlosR4mnRECds2h
	 6Ay6kSNLijQWwdsoHl1pqn9BntMizpWoDbFHr5J8zkhSqKMjCSXP0KeQ2EZIN5IQ7P
	 WHMoRxUFUJF5Q==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011401.me.com (Postfix) with ESMTPSA id B793434BA6BD;
	Wed,  4 Dec 2024 12:26:37 +0000 (UTC)
Message-ID: <235ce0a9-1db1-4558-817b-6f92f22be5ab@icloud.com>
Date: Wed, 4 Dec 2024 20:26:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/32] driver core: Constify API device_find_child()
 and adapt for various existing usages
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Jiri Slaby <jirislaby@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>,
 Mike Christie <michael.christie@oracle.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nilesh Javali <njavali@marvell.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com, Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Andreas Larsson <andreas@gaisler.com>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jens Axboe <axboe@kernel.dk>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Ard Biesheuvel
 <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, nvdimm@lists.linux.dev,
 linux1394-devel@lists.sourceforge.net, linux-serial@vger.kernel.org,
 linux-sound@vger.kernel.org, open-iscsi@googlegroups.com,
 linux-scsi@vger.kernel.org, linux-cxl@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
 <g32cigmktmj4egkq2tof27el2yss4liccfxgebkgqvkil32mlb@e3ta4ezv7y4m>
 <9d34bd6f-b120-428a-837b-5a5813e14618@icloud.com>
 <2024120320-manual-jockey-dfd1@gregkh>
 <b9885785-d4d4-4c72-b425-3dc552651d7e@icloud.com>
 <8eb7c0c54b280b8eb72f82032ede802c001ab087.camel@HansenPartnership.com>
 <8fb887a0-3634-4e07-9f0d-d8d7c72ca802@t-8ch.de>
 <f5ea7e17-5550-4658-8f4c-1c51827c7627@icloud.com>
 <108c63c753f2f637a72c2e105ac138f80d4b0859.camel@HansenPartnership.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <108c63c753f2f637a72c2e105ac138f80d4b0859.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ptou9-aUclkqdkvBrep0JqLqpE5OAxzN
X-Proofpoint-GUID: Ptou9-aUclkqdkvBrep0JqLqpE5OAxzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_09,2024-12-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412040096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_042709_680292_FDF143EB 
X-CRM114-Status: GOOD (  13.47  )
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

On 2024/12/3 23:34, James Bottomley wrote:
>>> This also enables an incremental migration.
>> change the API prototype from:
>> device_find_child(..., void *data_0, int (*match)(struct device *dev,
>> void *data));
>>
>> to:
>> device_find_child(..., const void *data_0, int (*match)(struct device
>> *dev, const void *data));
>>
>> For @data_0,  void * -> const void * is okay.
>> but for @match, the problem is function pointer type incompatibility.
>>
>> there are two solutions base on discussions.
>>
>> 1) squashing likewise Greg mentioned.
>>    Do all of the "prep work" first, and then
>>    do the const change at the very end, all at once.
>>
>> 2)  as changing platform_driver's remove() prototype.
>> Commit: e70140ba0d2b ("Get rid of 'remove_new' relic from platform
>> driver struct")
>>
>>  introduce extra device_find_child_new() which is constified  -> use
>> *_new() replace ALL device_find_child() instances one by one -> 
>> remove device_find_child() -> rename *_new() to device_find_child()
>> once.
> Why bother with the last step, which churns the entire code base again?

keep the good API name device_find_child().

> Why not call the new function device_find_child_const() and simply keep
> it (it's descriptive of its function).  That way you can have a patch
> series without merging and at the end simply remove the old function.

device_find_child is a good name for the API, 'find' already means const.


