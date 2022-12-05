Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1954C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSLQ0X3mNkdsosP2nwSWE/EhqCtiFodVErljvAJpau4=; b=eaE3l8QjZ0hCBJUKCbN2lVCHtQ
	fCLAiEDjWDmh7TNK8fLPVzxTuZRTEImQYnv+O56rBhBa2zfvPSX7mUmwvOEVGmXV/anY4gay/JHeX
	jsMHZdlgGjd2Yi3hOQBkXPGnhN6qIPCVBUqb/O7vJVEfPqp1iiJckG46UrprSq4o2NptMdbR9XCPI
	Y4eNIGCC8suuouaZwT4HAOpIbVu765e+HA2hQ8alAviiOqAsQCVo80NXplvPepekYMxSbCOxp3SoU
	FMk/sKK1kDl436uStcb5w2ZCT6qJUt/FqhNunAN1/o+o5/Y9oFL8AC+yaF/zGqVnNs38TjPJd3FRX
	w8BDhzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Asv-002udn-E2; Mon, 05 Dec 2022 12:47:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Ass-002uRd-5E
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 12:47:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0EEE56601DEB;
	Mon,  5 Dec 2022 12:47:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670244464;
	bh=IX5+K1rvElPGfl6ayfERS9NPL9dQCiYw7XQDBInKEz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fFPkiPGfeySh6X8ZoJnx7dFwSc32Woq7Me11PLLB+sprLgTD4njuPtQOZWDYOiCZU
	 9u4FqjLPyXF7tRv0zJTpo+q3FTCgyq07C3uEiaDJdq7CJt9HgkP6Z4i8ino05LwUUl
	 rDPR+2565rCOACH4tdU7SzaOodt/LWoFcRWRt0xS+kkJUU6cctKLK7CD8HETX0cHcq
	 7Uo4qz9AauL3IzA6vWnxHpBZvPptbGFfiUZ3PKaMzI/sJSgq8Bh4RI6sGPSdr9AZlh
	 7sAyzKaz39pFEca9cBE2RnaMAe5HRF+A4JrxlcjZ6cGw9da5DFdO5L2uAxusQ/c2CI
	 s4IeZKrN/CFIQ==
Message-ID: <4411cfd9-7286-32fd-2032-622caa099e91@collabora.com>
Date: Mon, 5 Dec 2022 13:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH net-next v1 01/13] net: wwan: tmi: Add PCIe core
Content-Language: en-US
To: =?UTF-8?B?WWFuY2hhbyBZYW5nICjmnajlvabotoUp?= <Yanchao.Yang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Cc: =?UTF-8?B?Q2hyaXMgRmVuZyAo5Yav5L+d5p6XKQ==?= <Chris.Feng@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TWluZ2xpYW5nIFh1ICjlvpDmmI7kuq4p?= <mingliang.xu@mediatek.com>,
 "linuxwwan@mediatek.com" <linuxwwan@mediatek.com>,
 =?UTF-8?B?TWluIERvbmcgKOiRo+aVjyk=?= <min.dong@mediatek.com>,
 "linuxwwan@intel.com" <linuxwwan@intel.com>,
 "m.chetan.kumar@intel.com" <m.chetan.kumar@intel.com>,
 =?UTF-8?B?TGlhbmcgTHUgKOWQleS6rik=?= <liang.lu@mediatek.com>,
 =?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>,
 =?UTF-8?B?SGFvemhlIENoYW5nICjluLjmtanlk7Ip?= <Haozhe.Chang@mediatek.com>,
 =?UTF-8?B?SHVhIFlhbmcgKOadqOWNjik=?= <Hua.Yang@mediatek.com>,
 =?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>,
 =?UTF-8?B?QWlkZW4gV2FuZyAo546L5ZKP6bqSKQ==?= <Aiden.Wang@mediatek.com>,
 =?UTF-8?B?RmVsaXggQ2hlbiAo6ZmI6Z2eKQ==?= <Felix.Chen@mediatek.com>,
 =?UTF-8?B?VGluZyBXYW5nICjnjovmjLop?= <ting.wang@mediatek.com>,
 =?UTF-8?B?R3VvaGFvIFpoYW5nICjlvKDlm73osaop?= <Guohao.Zhang@mediatek.com>,
 =?UTF-8?B?TWluZ2NodWFuZyBRaWFvICjkuZTmmI7pl68p?=
 <Mingchuang.Qiao@mediatek.com>, =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?=
 <Lambert.Wang@mediatek.com>
References: <20221122111152.160377-1-yanchao.yang@mediatek.com>
 <20221122111152.160377-2-yanchao.yang@mediatek.com>
 <1cca2790-5805-b4fc-f8e8-2c490db487f6@collabora.com>
 <e7d3bfeed57157e8859a24f501b7efb74e21f0f9.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e7d3bfeed57157e8859a24f501b7efb74e21f0f9.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_044746_369490_78E2B288 
X-CRM114-Status: GOOD (  16.59  )
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

Il 05/12/22 13:40, Yanchao Yang (杨彦超) ha scritto:
> On Thu, 2022-11-24 at 12:06 +0100, AngeloGioacchino Del Regno wrote:
>> Il 22/11/22 12:11, Yanchao Yang ha scritto:
>>> From: MediaTek Corporation <linuxwwan@mediatek.com>
>>>
>>> Registers the TMI device driver with the kernel. Set up all the
>>> fundamental
>>> configurations for the device: PCIe layer, Modem Host Cross Core
>>> Interface
>>> (MHCCIF), Reset Generation Unit (RGU), modem common control
>>> operations and
>>> build infrastructure.
>>>
>>> * PCIe layer code implements driver probe and removal, MSI-X
>>> interrupt
>>> initialization and de-initialization, and the way of resetting the
>>> device.
>>> * MHCCIF provides interrupt channels to communicate events such as
>>> handshake,
>>> PM and port enumeration.
>>> * RGU provides interrupt channels to generate notifications from
>>> the device
>>> so that the TMI driver could get the device reset.
>>> * Modem common control operations provide the basic read/write
>>> functions of
>>> the device's hardware registers, mask/unmask/get/clear functions of
>>> the
>>> device's interrupt registers and inquiry functions of the device's
>>> status.
>>>
>>> Signed-off-by: Ting Wang <ting.wang@mediatek.com>
>>> Signed-off-by: MediaTek Corporation <linuxwwan@mediatek.com>
> 
> Hello Angelo,
> 
>> Hello Yanchao,
>> thanks for the patch! However, there are some things to improve...
>>
>> First of all, you have to signoff (in your name) all patches that you
>> send.
> 
> Thank your suggestion. Fix it next version (add Signed-off-by: Yanchao
> Yang <yanchao.yang@mediatek.com> for all patches)
>> Check below for more comments...
>>
>>> ---

..snip.. :-)

There's a misunderstanding here: when I write

"..snip.."

I mean "I'm snipping out lines of code for which I have no comments, or
for which comments are redundant"

I do that to increase readability of reviews and decrease the size of the
mail that's going out, nothing else.

>>
>>> +	u32 (*read32)(struct mtk_md_dev *mdev, u64 addr);
>>
>> ..snip..
> 
> do you mean we should remove read function wrapper?

No, that's fine.

Regards,
Angelo

