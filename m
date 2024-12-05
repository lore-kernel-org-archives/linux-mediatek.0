Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DCFE7716C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DV2DLIPPHvXQjlEWI+ismKBgnjP6WxidLPVJKGZHkhg=; b=vhK+sJ+x62xwRpDbCyk5HH1Uw/
	cFoKGpqNvvRJ+MlwKaZXZS7bcdggupIlM98mpj9M5tKxR2hQOHGdruS+kq6OQVOEBRzr8VLOE/V+L
	7bOHgpnlP/2xkTViyBcWyqUKRgWusAlD+n6qdtW7NdLaVBOvs+aTq9SKcIRBxu0QyK2IEpUDMwFzK
	LHEbvbx9HfVJ7xclw/vnTGE2o2alf7XcUgWG9Kfq+GLBB7NuEgVpHMJ/CoYheiru/UJvD2XPxDnFu
	/In5aNp+DaFitD9o2RpJNWhfJlSdAHrj6jw7A8UvArAW6F6aeBR6caJ4r7oPbqhMbdRyfV0vpMGY9
	0HMhCeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCqv-0000000GKX8-3iLk;
	Thu, 05 Dec 2024 14:29:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBii-0000000G5fX-2zhr
	for linux-mediatek@bombadil.infradead.org;
	Thu, 05 Dec 2024 13:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DV2DLIPPHvXQjlEWI+ismKBgnjP6WxidLPVJKGZHkhg=; b=XMeKAbS690WcFy90dhSUNk1eL2
	TymCkH+QePCfttc/yhHCQ5HH8syWg1tpE6c19W982hqxmfXHtvJNDtLGgDxHQpOHMboPWayPE7mwO
	e2qRxdsTUZWWVq8QziWVdioUZd4uY6wKTc+iN2bY82mKrNTsSRCyIgNzin5OMAW4pUr0LaIPUHT2D
	SAy4qAIzsFH+bUdAbYAfz0H9Fbav8jmm/oKooWYHVGHGg1V6ooeQDBlf7eAbcbaZK4+zW1xq0tzty
	tzplS4A4VgjaDkFhuSmUTp0bANXW2iPMJwXJWawxBB0H+HJL0GlT+L44GfHy7npAw1xt904I6vyrc
	KCtQ+zpA==;
Received: from pv50p00im-zteg10021301.me.com ([17.58.6.46])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBif-00000002tdU-33P7
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 13:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733404584;
	bh=DV2DLIPPHvXQjlEWI+ismKBgnjP6WxidLPVJKGZHkhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=MjPupEdG3LXOunytThOaHzAK+bVhMpwfidC4n4MdvWKwaw8FV9EPV38plq0FTVN0C
	 xl5AJriUjHfG5OmhTjUfel+BiaQmCJ2o11t+HqLNUWEQy+m6PrJy5nTRDH5pAAFr3F
	 J4kdsm/wsRNS1dCZBzSVcqt6FSBCyESPY4vVf8wVpfRnxrXl+Z7US8BNL1A1OPWxLK
	 2GRk6Q02wvLPjNllCH4Kvi6WwRClOdscINadBncjANCtZiOXEyTZMT5H3N1gTMvQCq
	 3a3ozKHsj1VnZvyfYLPMLSg23wNQ6MfFLBXVef/l3ga5iNw4NVuLybECqVK+bdE1jb
	 2YeT4c6Wiec4A==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id 5F7A7500292;
	Thu,  5 Dec 2024 13:16:16 +0000 (UTC)
Message-ID: <d4d49b0c-7766-4f06-b098-ceee54ceeefb@icloud.com>
Date: Thu, 5 Dec 2024 21:16:12 +0800
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
 <h4pndknfwvck5yjnbs5rdmrxkqeksfxldwj4qbjqyvdzs5cjbf@i4afsjsg3obw>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <h4pndknfwvck5yjnbs5rdmrxkqeksfxldwj4qbjqyvdzs5cjbf@i4afsjsg3obw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LL8r5U1rSRzQLinnfL26afznvBJlVJho
X-Proofpoint-GUID: LL8r5U1rSRzQLinnfL26afznvBJlVJho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_11,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412050096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_131638_039886_BA8A11A8 
X-CRM114-Status: GOOD (  10.73  )
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

On 2024/12/5 18:41, Uwe Kleine-König wrote:
> On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
>> diff --git a/arch/sparc/kernel/vio.c b/arch/sparc/kernel/vio.c
>> index 07933d75ac815160a2580dce39fde7653a9502e1..1a1a9d6b8f2e8dfedefafde846315a06a167fbfb 100644
>> --- a/arch/sparc/kernel/vio.c
>> +++ b/arch/sparc/kernel/vio.c
>> @@ -419,13 +419,13 @@ struct vio_remove_node_data {
>>  	u64 node;
>>  };
>>  
>> -static int vio_md_node_match(struct device *dev, void *arg)
>> +static int vio_md_node_match(struct device *dev, const void *arg)
>>  {
>>  	struct vio_dev *vdev = to_vio_dev(dev);
>> -	struct vio_remove_node_data *node_data;
>> +	const struct vio_remove_node_data *node_data;
>>  	u64 node;
>>  
>> -	node_data = (struct vio_remove_node_data *)arg;

existing code has such cast
>> +	node_data = (const struct vio_remove_node_data *)arg;
>
i just follow existing code here.

> You can just drop the cast here. But maybe that is better be done i a
> separate change.
> 

agree, removing such casts may be another topic.

>>  	node = vio_vdev_node(node_data->hp, vdev);
>>  
> 
> Best regards
> Uwe


