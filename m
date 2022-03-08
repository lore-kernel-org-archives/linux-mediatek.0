Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFF3C43217
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTv3JjzK3RI3KPJEwHLPdP8ZzcioxoiKhVnqas2TohU=; b=fb/NdkKKhMKenn
	VsENfS8y1SNNtwnNa9MN6t1HXDX2zZXNxYNldNbuvf4r7idhogyg8MQeEdTQQU4dGv+Mg8tfPW9z2
	erAVWmTEExP0D6wq3q6kUgoyOdf/ALl1cKm10AnJcJR0+JMRz/nWWR6Z8wLgHhFHEtBGglFs0k58a
	z8kUR11G8hqb9q7vLfzdeGiGMcS9ldANYQPA/yMwcXa7Dp1UXK/ML0XUDxP5ock6eZ9xmV3ZkPrce
	YWbNVWYDp/P3qHeXQpP2T+BX58jmdhINtJKvWrD1cpfkWGVHyp9iR8Xlws67cDfKttcHvWARr02yD
	9Cya4ADhjADWf71mZxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRb1s-004oZ2-5P; Tue, 08 Mar 2022 14:41:36 +0000
Received: from gateway31.websitewelcome.com ([192.185.144.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRb1p-004oXf-Aa
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 14:41:34 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 0CD422777F
 for <linux-mediatek@lists.infradead.org>; Tue,  8 Mar 2022 08:41:30 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id Rb1ln3pmdb6UBRb1lnfpGP; Tue, 08 Mar 2022 08:41:30 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5NeK/sZmH86+pHk+fuSZ0PXD45byb2lWCHalWlIUKMU=; b=h8d7B9DJGKL+044uhBTcmxMkxS
 ePJXbReChucm7c4uKGaNTYknILfc9fI1YRAzPmF26aWYWP3db9oKKSvFj8ZR2N6esK0WAd6BUiRd/
 vUW6sfGFmLapCNWQ88EsCWXMUjgv8/eGmaxmqxLAQAjV6QnSRO1TBRCJ9LjYcwZBgJvORtQdeDMCN
 3WqZOVOpGePOCsCgbLeOBP5V16VuRr5pfOMGdH/qiVqdaMiZkgTqkHWIbXKbrbT1hsRgR2NcrVInz
 k6T0F5BrvBSJVQWfcXiPgORYC2JL2RiAWS6o88OHEu5LMQOaLbWT634P6b5n3gGxt7gfl1F8oN8TK
 SFZoY+AA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:38102)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nRb1l-002QgF-0j; Tue, 08 Mar 2022 14:41:29 +0000
Message-ID: <0fa1e65c-949f-f492-f769-b1f5ed3b181d@roeck-us.net>
Date: Tue, 8 Mar 2022 06:41:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/ directory
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
 qwen@analogixsemi.com, jli@analogixsemi.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220308073431.1217890-1-xji@analogixsemi.com>
 <YicrpWig4kwdh2lg@kuha.fi.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YicrpWig4kwdh2lg@kuha.fi.intel.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nRb1l-002QgF-0j
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:38102
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_064133_553780_F4FB05A4 
X-CRM114-Status: GOOD (  13.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/8/22 02:10, Heikki Krogerus wrote:
> On Tue, Mar 08, 2022 at 03:34:28PM +0800, Xin Ji wrote:
>> As for convenience use TCPCI register definition, move tcpci.h to
>> include/linux/usb/ directory.
> 
> To be honest, I was still hoping for a better explanation here.
> 
> The reason why this header is made global is because some USB PD
> controllers - PD controllers consisting of a microcontroller
> (acting as the TCPM) and a port controller (TCPC) - may require that
> the driver for the PD controller accesses directly also the on-chip
> port controller in some cases.
> 
> I was hoping that that was explained in the commit message somehow.
> 

Same here.

Guenter

>> Signed-off-by: Xin Ji <xji@analogixsemi.com>
>>
>> ---
>> V7 -> V8: Fix Guanter's comment, remove unnecessary explain.
>> ---
>>   drivers/usb/typec/tcpm/tcpci.c                        | 3 +--
>>   drivers/usb/typec/tcpm/tcpci_maxim.c                  | 3 +--
>>   drivers/usb/typec/tcpm/tcpci_mt6360.c                 | 3 +--
>>   drivers/usb/typec/tcpm/tcpci_rt1711h.c                | 2 +-
>>   {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h | 1 +
>>   5 files changed, 5 insertions(+), 7 deletions(-)
>>   rename {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h (99%)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
>> index e07d26a3cd8e..9c907296596f 100644
>> --- a/drivers/usb/typec/tcpm/tcpci.c
>> +++ b/drivers/usb/typec/tcpm/tcpci.c
>> @@ -13,11 +13,10 @@
>>   #include <linux/property.h>
>>   #include <linux/regmap.h>
>>   #include <linux/usb/pd.h>
>> +#include <linux/usb/tcpci.h>
>>   #include <linux/usb/tcpm.h>
>>   #include <linux/usb/typec.h>
>>   
>> -#include "tcpci.h"
>> -
>>   #define	PD_RETRY_COUNT_DEFAULT			3
>>   #define	PD_RETRY_COUNT_3_0_OR_HIGHER		2
>>   #define	AUTO_DISCHARGE_DEFAULT_THRESHOLD_MV	3500
>> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
>> index df2505570f07..4b6705f3d7b7 100644
>> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
>> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
>> @@ -11,11 +11,10 @@
>>   #include <linux/module.h>
>>   #include <linux/regmap.h>
>>   #include <linux/usb/pd.h>
>> +#include <linux/usb/tcpci.h>
>>   #include <linux/usb/tcpm.h>
>>   #include <linux/usb/typec.h>
>>   
>> -#include "tcpci.h"
>> -
>>   #define PD_ACTIVITY_TIMEOUT_MS				10000
>>   
>>   #define TCPC_VENDOR_ALERT				0x80
>> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
>> index f1bd9e09bc87..9e0338bce7ef 100644
>> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
>> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
>> @@ -11,10 +11,9 @@
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>> +#include <linux/usb/tcpci.h>
>>   #include <linux/usb/tcpm.h>
>>   
>> -#include "tcpci.h"
>> -
>>   #define MT6360_REG_VCONNCTRL1	0x8C
>>   #define MT6360_REG_MODECTRL2	0x8F
>>   #define MT6360_REG_SWRESET	0xA0
>> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
>> index b56a0880a044..3291ca4948da 100644
>> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
>> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
>> @@ -10,9 +10,9 @@
>>   #include <linux/i2c.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/gpio/consumer.h>
>> +#include <linux/usb/tcpci.h>
>>   #include <linux/usb/tcpm.h>
>>   #include <linux/regmap.h>
>> -#include "tcpci.h"
>>   
>>   #define RT1711H_VID		0x29CF
>>   #define RT1711H_PID		0x1711
>> diff --git a/drivers/usb/typec/tcpm/tcpci.h b/include/linux/usb/tcpci.h
>> similarity index 99%
>> rename from drivers/usb/typec/tcpm/tcpci.h
>> rename to include/linux/usb/tcpci.h
>> index b2edd45f13c6..20c0bedb8ec8 100644
>> --- a/drivers/usb/typec/tcpm/tcpci.h
>> +++ b/include/linux/usb/tcpci.h
>> @@ -9,6 +9,7 @@
>>   #define __LINUX_USB_TCPCI_H
>>   
>>   #include <linux/usb/typec.h>
>> +#include <linux/usb/tcpm.h>
>>   
>>   #define TCPC_VENDOR_ID			0x0
>>   #define TCPC_PRODUCT_ID			0x2
>> -- 
>> 2.25.1
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
