Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC33DE64A8A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEJ75x+TqYUJVxmVF6uQZZWFOEl0WJRfUhXN2h5KpKM=; b=rStZb/7xMPn/0kV0CHYd0qLiwS
	rHvFEGuWf4SvFpjeKnXvdR5vBKemi6m9XSFIMokWSbEXoGeMwMX0TgIN1POu0z4HC01yVht4mWuzo
	uwPP1x0HlNSe4MypjByIqtDxuKQQrjmi2GSVevsHq/1Dvcu5jWodu3x0QDbvQmrt836+iKNwOPwJZ
	WLuo92Mj/cQfugOKUgKuU9JnKeOOqu2fLL9ohP7BRsSKLwIaojctGzGs9u9gQAHwAm2Hv6o3EMSbo
	lBSFWSN/Pj8hWHIA8l1Mo1c5bxOvax6Aw6q2Wupwc8eQKWQRQnvC1SE3EZ26qD8O1/3+0Mj3vl8SH
	P8ooLAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISku-00000009Zm9-3MJG;
	Tue, 03 Dec 2024 13:15:56 +0000
Received: from mr85p00im-ztdg06021801.me.com ([17.58.23.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISZD-00000009XOY-0j4J
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Dec 2024 13:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733231020;
	bh=QEJ75x+TqYUJVxmVF6uQZZWFOEl0WJRfUhXN2h5KpKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=Kc4yhuXugc/D/qtZZ41v8wAnuwEzwggEWUway63IXkClqixwU1cfn/v3YVm8Qsiaw
	 28NLlORRwJjFZX7JY4DZlIgrQ1s8zKvPJAQ+RXHBAEkcNRuUPk0OyxBiAs9kB0GBL/
	 4jgwTolEa8TiqyUyeuv6tr/7DG898UMLRPOw8P2qzUVkHb/i6BK0gmuVjOCVuRaOL4
	 yVOUtS8ijY+iNGs/3oFthLPmtWg3RPz3zQCNIexvybyNTkT8kJ+0hPmRIWLu7xxlpo
	 9HqUza+TM66+s3TNEHqlu5QAj7PkxbSr1VPZfaRzmcsea2BKweNx4LzKqRftuLVcUB
	 Ma8BwRHqOq26Q==
Received: from [192.168.1.26] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06021801.me.com (Postfix) with ESMTPSA id 67D49442839;
	Tue,  3 Dec 2024 13:03:18 +0000 (UTC)
Message-ID: <b9885785-d4d4-4c72-b425-3dc552651d7e@icloud.com>
Date: Tue, 3 Dec 2024 21:02:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/32] driver core: Constify API device_find_child()
 and adapt for various existing usages
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <2024120320-manual-jockey-dfd1@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CNFmwAOF9NCRr2KajfMjTjtFd_qlM54K
X-Proofpoint-GUID: CNFmwAOF9NCRr2KajfMjTjtFd_qlM54K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_02,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412030113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_050351_210233_21E46805 
X-CRM114-Status: GOOD (  16.71  )
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

On 2024/12/3 20:41, Greg Kroah-Hartman wrote:
> On Tue, Dec 03, 2024 at 08:23:45PM +0800, Zijun Hu wrote:
>> On 2024/12/3 20:00, Uwe Kleine-König wrote:
>>> Hello,
>>>
>>> On Tue, Dec 03, 2024 at 08:33:22AM +0800, Zijun Hu wrote:
>>>> This patch series is to constify the following API:
>>>> struct device *device_find_child(struct device *dev, void *data,
>>>> 		int (*match)(struct device *dev, void *data));
>>>> To :
>>>> struct device *device_find_child(struct device *dev, const void *data,
>>>> 				 device_match_t match);
>>>> typedef int (*device_match_t)(struct device *dev, const void *data);
>>>
>>> This series isn't bisectible. With only the first two patches applied I
>>> hit:
>>
>> yes. such patch series needs to be merge as atomic way.
>>
>> Hi Greg,
>>
>> is it possible to ONLY merge such patch series by atomic way into your
>> driver-core tree?
> 
> Nope!
> 
>> or squash such patch series into a single patch ?
>>
>> various subsystem maintainers may not like squashing way.
> 
> Agreed, so look into either doing it in a bisectable way if at all
> possible.  As I don't see a full series here, I can't suggest how it
> needs to happen :(
> 

let me send you a full series later and discuss how to solve this issue.

> thanks,
> 
> greg k-h


