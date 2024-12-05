Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A0CE77172
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeIIq7By5hb3j6D6u79xafAimRNm6W+G83In10fjfT4=; b=qHao+Hfke81l06aOJy6OBRlLwv
	kyw1h0JkfpZo2Fem+UcLwD8FtbNTlO4K0kvUBLwBq1VMqsYL9uA2b4A6fUf3YezR/c+IaKWFSP+xz
	q9LIp5S66aYL/rmPHIjZB4CbrpYKQ2adcQb93YRYCvaxST1/Oqv3PVOlQ/eFn61ITScQKMaTks7Gy
	KkiBLVvwdidKq3Wpns/se3WQHMN6pUs9dbD6sXCnpLI0sHC+/wV1TVpQyQI0XvVGSw2v8oIlVfOY1
	+KYZkBM+DSI8/3xTCacN1bUAcM7klCTMJ/C4IeRj+vQu6OdQE4eODUU82tYGkXhrvqoySR1HrH3+O
	H41j0Svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCqw-0000000GKXY-2Ytd;
	Thu, 05 Dec 2024 14:29:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBlW-0000000G67V-3I3e
	for linux-mediatek@bombadil.infradead.org;
	Thu, 05 Dec 2024 13:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DeIIq7By5hb3j6D6u79xafAimRNm6W+G83In10fjfT4=; b=mnlF7cl0BSKUYoQvp3XhBw2D/o
	wXjhZxqhwyd8U5hYra82r8i/DD5YDyQf2W7+OOoq3dckcZnyKvYNi63hvpq7hUq2CMXO1Ct5ocO0V
	GcJttslhgiAnvLukyE6qwHGUGGPZ57IpGxfpPQPr3ExC3A8DzKQRgzSxDfbKjXHQUu4Fnur7kU8Rj
	uzGk3zM8TkDRhYKsFL47q9L533TIdTBQxxK/QkAB6Dc3W+TZD+Fixjxnc0vaNwecICDfaXcihCYvi
	V2OLH/7k5YhV/cKsj11OB5JY3o0KyJAbnTDcifO1eLX+9W1UAOsk4JIlsSNoYGbQBDwpXrQOen1GN
	xu8w7WWw==;
Received: from pv50p00im-tydg10021701.me.com ([17.58.6.54])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBlT-00000002tp5-1pEH
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 13:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733404763;
	bh=DeIIq7By5hb3j6D6u79xafAimRNm6W+G83In10fjfT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=IN6sqLn/x5OCaqJO4vF5gn/fcjmZc3fZlyeytDMJnKp7XQ3de7PoFnmqSe0zeC9a5
	 vUwI0Tptt7E+4Q3DWUqdgUpD0xOI9lBpQ4RQvwZlnJGvBh2ctgzycf7q159ExifH7K
	 a8AIRvkTNSgebMbC7lLYAk5B4kjmGYrIRQclMfECHJrJ1+KGG+jAbVUk+xSHPoDbnh
	 1e9j8QEBXLJX5ZxwWzRD/5Q41qX+s8eZZmLJoAKcnBcHGPNxbbfWDhHq6Q/v1949Vm
	 rVciEGx0K4GT+eFIHW+pi7hnAXPVyGUzlxkEJ6XEG1lJhoSlPxkPp1AOo8we43GZSE
	 xVpU9Q2Rr6i5g==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10021701.me.com (Postfix) with ESMTPSA id C58AC3A1052;
	Thu,  5 Dec 2024 13:19:06 +0000 (UTC)
Message-ID: <f150fd45-7f84-4036-aa0e-32bd04fbeb67@icloud.com>
Date: Thu, 5 Dec 2024 21:19:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 quic_zijuhu <quic_zijuhu@quicinc.com>
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
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
 <7ugfaj2h3sy77jpaadco5xtjalnten3gmvozowcle3g7zcdqs4@sqf5l47onbsi>
 <ac42e652-4128-44ea-976e-5234360d8183@quicinc.com>
 <eyu7nm5hvwfqxgysnrzsvianzf7abvlovpxfo7snsxowmuuhpj@tah3gkqm5ldj>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <eyu7nm5hvwfqxgysnrzsvianzf7abvlovpxfo7snsxowmuuhpj@tah3gkqm5ldj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2qHgOEYCHFJo6csSrQf0NeEl1TvG8_uZ
X-Proofpoint-ORIG-GUID: 2qHgOEYCHFJo6csSrQf0NeEl1TvG8_uZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_11,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=736 spamscore=0
 phishscore=0 clxscore=1011 suspectscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412050096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_131932_176483_F0EA6C11 
X-CRM114-Status: GOOD (  10.20  )
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

On 2024/12/5 18:37, Uwe Kleine-König wrote:
> On Thu, Dec 05, 2024 at 04:37:08PM +0800, quic_zijuhu wrote:
>> On 12/5/2024 4:10 PM, Uwe Kleine-König wrote:
>>> On Thu, Dec 05, 2024 at 08:10:17AM +0800, Zijun Hu wrote:
>>>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>>>
>>>> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
>>>> Remvoe the unnecessary wrapper.
> 
> Just spotted: s/Remvoe/Remove/
> 

this typo error is my mistake, will correct it.

>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>>>> ---
>>>>  drivers/gpio/gpio-sim.c | 7 +------
>>>
>>> I think if you move this patch before patch #4 in your series, you only
>>> have to touch this file once.
>>
>> the precondition of this change is patch #4, it will have building error
>> if moving it before #4.
>>
>> actually, we can only do simplifications with benefits brought by #4.
> 
> Ah I see. I thought that device_match_fwnode only got the const for the
> 2nd parameter in patch #4.
> 
> Best regards
> Uwe


