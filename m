Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1DAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 20:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGvyMITTi9oXyIUnasPEhVJqtyXv6Y6ZzePRftZhGnA=; b=dLj2Hwx2MslXDu+LxEFcKSfozV
	LOrS9WppCK8+n6lt2Vywzpdw0dnjKW48L4h6CDylj6RwWsw4GwsWKQTwBCddjHwcniJEu8U7Tp8DX
	OkPObwl5frqBwJNe2iXEGNKEnEcaVXPSPgsD5W9s16l8rmVFQL3tJL3NUZosxe9BZuBkOntJCb1MX
	AKrnU2hxfQrpQ8pe5PHLqPIAfW3XiunC8wUNzKCtwTnpI9geq1KFFQIARgkj2rLfW4T8DJ4xQmpDz
	OtZQHdqlHuQvicU8QNudGcXCink9aierNHEyCNnQKGSsihQ6Ul9X69wKqWwGXulv2EWenfaQHWUB+
	E1DDob8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6HW3-000t7e-Nb; Fri, 16 Dec 2022 20:41:11 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6HVy-000t5X-16
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 20:41:10 +0000
Received: by mail-ej1-x62d.google.com with SMTP id fc4so8757776ejc.12
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Dec 2022 12:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGvyMITTi9oXyIUnasPEhVJqtyXv6Y6ZzePRftZhGnA=;
        b=W0V7by09TM3s4cRnh35968yxctyIfGjE/cCRibvsu2bm/46MP7rin+KSTflQzQKadY
         rEhxD62uDF4OtoSmtHWSXxjSW39LnBLIdPIfn0oNAaY4Xn6Z5mjtg+KLIUjlSjVLA1YN
         WnFw7nqrHwYPDpSC6Zr5MtmonMEJTt2kRP5Mc2q2nzvdc1/B4irhSlQV8v9ZVF7z7aLR
         8P7jkFJtcZXLGHDXOOaozD9KgNFS+VQhio/Iqpfvu8kcmN6VEPYkvk+JD5o2COope2MW
         Ywur2jORt6myml1Zpqqg6i6Md2JSWB/OAD3gmXSvlW7XbMoQVSD1oRkJvCU5ZeUKKSTp
         Ex8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGvyMITTi9oXyIUnasPEhVJqtyXv6Y6ZzePRftZhGnA=;
        b=Rn/y+LkioZJspESWLBdkJdgR12s/TO+UfHv85u2ScOeNRaZNPrpBB8Y+BVfUdLkETg
         5Sszj3FFpFTSTQuVSSwa5vuZV54QyPn4GeL89k++kG4pcIj/nnPE7iD+qPv75/SyWY+X
         Ty0cgdW7QGPYnTbI1vQUOyINtg+20WiKVN7lf3P17Ea7WfQTbfnZehg6I6W2qSQLC1CA
         YAGzBnE4UXuCmQdp9roZ+m/sTsEPOT6nuvoFsGV6tJn3/eCdVYW46hWg+Q0PJ8hR3hJx
         5eSPLBGZJ321n5fYZ7SQpXUfwRI6e41Bbdi43Ovp97duQp2KxyQtWOubZgl6I0iJeuwI
         olJg==
X-Gm-Message-State: ANoB5pnbt1QoCo/ZUyHWt2zr+JuQThHb59jFUCo+DVFM0kH3zUPCF3nX
	+Il9rDq3PmgNvBBJUMR/u6E=
X-Google-Smtp-Source: AA0mqf5+bwekE2Ck/RwL71cqJjClxSLICfq5IEg1sgbFYw1RK6V3aTOQKEC9pglUSfZAcAdPZeVJcg==
X-Received: by 2002:a17:907:cbc8:b0:7c1:6e08:4c20 with SMTP id vk8-20020a170907cbc800b007c16e084c20mr23312414ejc.7.1671223261471;
        Fri, 16 Dec 2022 12:41:01 -0800 (PST)
Received: from [192.168.1.101] ([141.136.89.211])
        by smtp.gmail.com with ESMTPSA id dm4-20020a05640222c400b004589da5e5cesm1258695edb.41.2022.12.16.12.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 12:41:01 -0800 (PST)
Message-ID: <7d44c9ed-cf9d-64e1-df85-726a97859e06@gmail.com>
Date: Sat, 17 Dec 2022 00:40:56 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH net-next v1 01/13] net: wwan: tmi: Add PCIe core
Content-Language: en-US
To: =?UTF-8?B?WWFuY2hhbyBZYW5nICjmnajlvabotoUp?= <Yanchao.Yang@mediatek.com>
Cc: =?UTF-8?B?Q2hyaXMgRmVuZyAo5Yav5L+d5p6XKQ==?= <Chris.Feng@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TWluZ2xpYW5nIFh1ICjlvpDmmI7kuq4p?= <mingliang.xu@mediatek.com>,
 =?UTF-8?B?TWluIERvbmcgKOiRo+aVjyk=?= <min.dong@mediatek.com>,
 "m.chetan.kumar@intel.com" <m.chetan.kumar@intel.com>,
 "linuxwwan@mediatek.com" <linuxwwan@mediatek.com>,
 =?UTF-8?B?TGlhbmcgTHUgKOWQleS6rik=?= <liang.lu@mediatek.com>,
 =?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>,
 =?UTF-8?B?SGFvemhlIENoYW5nICjluLjmtanlk7Ip?= <Haozhe.Chang@mediatek.com>,
 =?UTF-8?B?SHVhIFlhbmcgKOadqOWNjik=?= <Hua.Yang@mediatek.com>,
 "linuxwwan@intel.com" <linuxwwan@intel.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 =?UTF-8?B?VGluZyBXYW5nICjnjovmjLop?= <ting.wang@mediatek.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 =?UTF-8?B?QWlkZW4gV2FuZyAo546L5ZKP6bqSKQ==?= <Aiden.Wang@mediatek.com>,
 =?UTF-8?B?RmVsaXggQ2hlbiAo6ZmI6Z2eKQ==?= <Felix.Chen@mediatek.com>,
 =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 =?UTF-8?B?TWluZ2NodWFuZyBRaWFvICjkuZTmmI7pl68p?=
 <Mingchuang.Qiao@mediatek.com>,
 =?UTF-8?B?R3VvaGFvIFpoYW5nICjlvKDlm73osaop?= <Guohao.Zhang@mediatek.com>,
 =?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>
References: <20221122111152.160377-1-yanchao.yang@mediatek.com>
 <20221122111152.160377-2-yanchao.yang@mediatek.com>
 <64aada78-8029-1b05-b802-a005549503c9@gmail.com>
 <8878ed64fadfda9b3d3c8cd8b4564dd9019349b6.camel@mediatek.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <8878ed64fadfda9b3d3c8cd8b4564dd9019349b6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_124106_116853_6B183B23 
X-CRM114-Status: GOOD (  23.92  )
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

Hello Yanchao,

On 07.12.2022 06:33, Yanchao Yang (杨彦超) wrote:
> On Sun, 2022-12-04 at 22:52 +0400, Sergey Ryazanov wrote:
>> On 22.11.2022 15:11, Yanchao Yang wrote:
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
>>> ---
>>>    drivers/net/wwan/Kconfig                 |   11 +
>>>    drivers/net/wwan/Makefile                |    1 +
>>>    drivers/net/wwan/mediatek/Makefile       |   12 +
>>>    drivers/net/wwan/mediatek/mtk_common.h   |   30 +
>>>    drivers/net/wwan/mediatek/mtk_dev.c      |   50 +
>>>    drivers/net/wwan/mediatek/mtk_dev.h      |  503 ++++++++++
>>>    drivers/net/wwan/mediatek/pcie/mtk_pci.c | 1164
>>> ++++++++++++++++++++++
>>>    drivers/net/wwan/mediatek/pcie/mtk_pci.h |  150 +++
>>>    drivers/net/wwan/mediatek/pcie/mtk_reg.h |   69 ++
>>>    9 files changed, 1990 insertions(+)
>>>    create mode 100644 drivers/net/wwan/mediatek/Makefile
>>>    create mode 100644 drivers/net/wwan/mediatek/mtk_common.h
>>>    create mode 100644 drivers/net/wwan/mediatek/mtk_dev.c
>>>    create mode 100644 drivers/net/wwan/mediatek/mtk_dev.h
>>>    create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_pci.c
>>>    create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_pci.h
>>>    create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_reg.h
>>>
>>> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
>>> index 3486ffe94ac4..a93a0c511d50 100644
>>> --- a/drivers/net/wwan/Kconfig
>>> +++ b/drivers/net/wwan/Kconfig
>>> @@ -119,6 +119,17 @@ config MTK_T7XX
>>>    
>>>    	  If unsure, say N.
>>>    
>>> +config MTK_TMI
>>> +	tristate "TMI Driver for Mediatek T-series Device"
>>> +	depends on PCI
>>> +	help
>>> +	  This driver enables Mediatek T-series WWAN Device
>>> communication.
>>> +
>>> +	  If you have one of those Mediatek T-series WWAN Modules and
>>> wish to
>>> +	  use it in Linux say Y/M here.
>>
>> From this and the series descriptions, it is unclear which modem
>> chips this driver is intended for and how does it correlate with the
>> T7xx driver? Is the TMI driver a drop-in replacement for the t7xx driver,
>> or does the TMI driver support any T-series chips except t7xx?
> > The driver is intended for t8xx or later T-series modem chips in the
> future. Currently, t7xx is not support.

Can you add this information to the option description to make it easier 
for users to choose?

BTW, just curious, do you have any plans to add T7xx support to the TMI 
driver, or maybe merge them or factor out the common code into a common 
library? I am asking because I noticed some common code and modem 
components, but that is not addressed in the cover letter. Or is this 
feeling misleading and these two series are very different?

>>> +
>>> +	  If unsure, say N.
>>> +
>>>    endif # WWAN
>>>    
>>>    endmenu
>>> diff --git a/drivers/net/wwan/Makefile b/drivers/net/wwan/Makefile
>>> index 3960c0ae2445..198d8074851f 100644
>>> --- a/drivers/net/wwan/Makefile
>>> +++ b/drivers/net/wwan/Makefile
>>> @@ -14,3 +14,4 @@ obj-$(CONFIG_QCOM_BAM_DMUX) += qcom_bam_dmux.o
>>>    obj-$(CONFIG_RPMSG_WWAN_CTRL) += rpmsg_wwan_ctrl.o
>>>    obj-$(CONFIG_IOSM) += iosm/
>>>    obj-$(CONFIG_MTK_T7XX) += t7xx/
>>> +obj-$(CONFIG_MTK_TMI) += mediatek/
>>
>> The driver is called mtk_tmi, but its code is placed to the
>> directory
>> with too generic name 'mediatek'. Do you plan too keep all possible
>> future drivers in this directory? >
> Yes, we plan to put all mediatek's wwan driver into the same directory.
> Currently, there is only T-series modem driver. So we don't create
> 'tmi' folder under 'mediatek' directory explicitly.

Thank you for the clarification.

--
Sergey

