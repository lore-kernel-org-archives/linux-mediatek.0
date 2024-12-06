Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F87E77173
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhyG+EmDBcuL7ITc5tFv2+rP51hoW90ADGxMFzERI+c=; b=jF/XQ9DmeBy+MiWETjhq2NIdk3
	ULsk5Bc7MrYJ9shky8jjdM9P6xBPebTbEc4iM2Zp3vT8RP1S6bsHBt370aaXt5LhQiN1sMB6yIEqs
	ppGIE70HVyolYI8bC4BmMwLBT0hkDwp2teKCgAvSdfubVcud9u+8J6vRNHaXNAzTR57jnpdXqEgK9
	PMVmEPHPzuKp+EMsHGxDcZPRkHWDN5swr25N9fBeR/nI6KQnD46DM1dNyNIXHbKRdM+rI5Y1ERze7
	cGjSB1Ky5HcHo2BQimUvNuqiEkBT/0gdl1sZgBXERgJxMrE5r3aAOGVep4yuMqbF7A88kMK5oaPFV
	Dbuu5a8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWCd-00000001P86-1hHm;
	Fri, 06 Dec 2024 11:08:55 +0000
Received: from pv50p00im-ztdg10011301.me.com ([17.58.6.40])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWCa-00000001P77-1xuE
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 11:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733483330;
	bh=NhyG+EmDBcuL7ITc5tFv2+rP51hoW90ADGxMFzERI+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=MgjiqdzZfTmb/mVFTbzsypOWruuPXKPmqalwnrapBSSPRX9ZBXWuKx/rXEQNHK2pa
	 Owdt0fT/DfIcknjmrc9RiPQm03DTgyCIfZaA0Ct84DRgRPn41GH/9ATt9WarD4oB7Z
	 kp1tye/lvFsVtcUt9wEaRY3KIi4c4XR2lvGXACZO95dn1BzrfkmojzfeVy6LNqPP4n
	 cuKwE61BSO3ibR5Zaj2OZLFYfkZ3aOGDENNFUeS+do+P7PcdFzPCx3SylOoxqhlQzu
	 3vBrnTd0dnstMjHvqU/2HZ8ig8tIq43Kbs7RsrkBBEg+Xa3q76Kaj+3nG3pAqDsniz
	 8LIg8qyWiAoMg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 604B31801BD;
	Fri,  6 Dec 2024 11:08:42 +0000 (UTC)
Message-ID: <71d9c99f-aa7d-4697-8561-17b54cfe97c6@icloud.com>
Date: Fri, 6 Dec 2024 19:08:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
 <7ylfj462lf6g3ej6d2cmsxadawsmajogbimi7cl4pjemb7df4h@snr73pd7vaid>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <7ylfj462lf6g3ej6d2cmsxadawsmajogbimi7cl4pjemb7df4h@snr73pd7vaid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UViy4Z1HSo-8jLvn8-7u7fwR8c_nYln5
X-Proofpoint-GUID: UViy4Z1HSo-8jLvn8-7u7fwR8c_nYln5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_07,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_030852_523108_C7BCCF60 
X-CRM114-Status: GOOD (  14.53  )
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

On 2024/12/6 15:21, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> Constify the following API:
>> struct device *device_find_child(struct device *dev, void *data,
>> 		int (*match)(struct device *dev, void *data));
>> To :
>> struct device *device_find_child(struct device *dev, const void *data,
>>                                  device_match_t match);
>> typedef int (*device_match_t)(struct device *dev, const void *data);
>> with the following reasons:
>>
>> - Protect caller's match data @*data which is for comparison and lookup
>>   and the API does not actually need to modify @*data.
>>
>> - Make the API's parameters (@match)() and @data have the same type as
>>   all of other device finding APIs (bus|class|driver)_find_device().
>>
>> - All kinds of existing device match functions can be directly taken
>>   as the API's argument, they were exported by driver core.
>>
>> Constify the API and adapt for various existing usages by simply making
>> various match functions take 'const void *' as type of match data @data.
> 
> With the discussion that a new name would ease the conversion, maybe
> consider device_find_child_device() to also align the name (somewhat) to
> the above mentioned (bus|class|driver)_find_device()?
> i finally select this squashing method after considerations as shown by
link below:
https://lore.kernel.org/all/3a4de1bb-3eb2-469a-8ff7-ff706804f5bb@icloud.com

device_find_child() is consist with existing device_find_child_by_name()
and device_find_any_child, device's child is also a device, so we may
not need the tail _device().

> Do you have a merge plan already? I guess this patch will go through
> Greg's driver core tree?
> 

this patch series is already squashing solution.

yes. hope it move toward mainline by Greg's driver core tree.

(^^)(^^)

> Best regards
> Uwe


