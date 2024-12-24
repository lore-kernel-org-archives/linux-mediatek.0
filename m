Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FDFE77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3kiho8TfVhUdQIW4loxFW4A6GTk7CzgqqA6rmZLle8=; b=BiIFUqXjfruvAwrtXIIeeMenaK
	zTQwnY3ogQ/y0md7tt78Bdz30S23qAmJ2Q9d/C08p2FK8ul5pJIlJoGKk4Lhnuz17Ezta9tzOLfRt
	5nCzNtoXixLL/WNORUSOxdrxBeN2gaylC+TiIbhrbhzdART3BcSJztzcASpiWhFJeUdwicS1wpAeX
	PvKMczujO+HvGfEFUKMG0LnJBJRWJSbjrA0RghlHCBRfMqJa1sdNB1kEbDo+3PVv84rhZiXR21tC6
	C80sI3k4UQGBJ0ph8ntxD8ofVDpDaGS7ewvkkATqQizzVW2o6olfN0fEVDHNhUL6kAOfJmPElndNr
	xfRmvdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4V2-0000000C0RL-3Zo1;
	Tue, 24 Dec 2024 12:59:00 +0000
Received: from pv50p00im-zteg10011501.me.com ([17.58.6.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4V0-0000000C0Qq-01YF
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 12:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735045132;
	bh=h3kiho8TfVhUdQIW4loxFW4A6GTk7CzgqqA6rmZLle8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=lCyJhxt8u8AX46T2X/wvu3PmNuUXKCcKs4cLekyBu/8uAMfnysIzbGe1AlUCBV4Uf
	 p0xefkStqlMGem4pR7zaumh1oJJUrgckAhBU5gPn3YZaqdSuC+g1hpDvQGSKVPXlUE
	 gVVAyGn7g10BMn4kokWDpQmaCH4LETsoPF2UCml5q50IPrfFe96UG1vZSL1JZ1jjfT
	 iQ9r04XiXcSIx0lDb1MRDBJYXuRgSi1nxnIwzLWnyg7rs3uK5Vnl7NMN6YPpri02uN
	 JQ6jRpFZ5EFje1YrJkMdYeBe92ukQdxhfilb5OrZFswHLC6M/j99Wf06JWIPJAXXhh
	 Fj/5wZNF7w3WQ==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 297F14A033A;
	Tue, 24 Dec 2024 12:58:41 +0000 (UTC)
Message-ID: <5d7531da-5ae9-4c31-93c6-f2bca4c2d814@icloud.com>
Date: Tue, 24 Dec 2024 20:58:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] cxl/pmem: Replace match_nvdimm_bridge() with API
 device_match_type()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>,
 Alison Schofield <alison.schofield@intel.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-10-583cc60329df@quicinc.com>
 <20241223204852.000021d5@huawei.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20241223204852.000021d5@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5BM9Ll3OJODDbXjCMiiEryY0SGhaSZXP
X-Proofpoint-GUID: 5BM9Ll3OJODDbXjCMiiEryY0SGhaSZXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=791 clxscore=1015
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412240112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_045858_056105_47BAE45E 
X-CRM114-Status: GOOD (  10.55  )
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

On 2024/12/24 04:48, Jonathan Cameron wrote:
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> Static match_nvdimm_bridge(), as matching function of device_find_child()
>> matches a device with device type @cxl_nvdimm_bridge_type, and its task
>> can be simplified by the recently introduced API device_match_type().
>>
>> Replace match_nvdimm_bridge() usage with device_match_type().
>>
>> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> I don't see any uses of is_cxl_nvdimm_bridge() other than this one
> Drop that as well?
> 
will add a optional patch to drop is_cxl_nvdimm_bridge() in next revision.

> This one is a bit of a trade off because the way is_cxl_nvdimm_bridge()
> is identified is kind of an internal detail, but it's been true for a long
> time so I'm fine with this change.
> 
> Jonathan


