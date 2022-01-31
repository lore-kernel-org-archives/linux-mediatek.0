Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rdg/gfIS+P7q+BZnk0uYC/a395aNmD3SmtfuMB3MYE=; b=Br16XsVEG/DBwt
	N7+JNV6dyVVWp2AH+1Yb/Isg+g/2NdP4xZUDQ0Omzqlmu+9BbzBOzbPX6Mx5fBIQBPAXiq/acIdAG
	DpWw4V8gYKg4UAot1Fc5xxekZNOHW0o55UujwSA5ILb3mP6XO/44QBvjwpCPf6nJLwNSLejnZpU+4
	PbkZrZ/nwqGTo4FgGcgAtV8PrK9nXP/vDrTocAFeY5cY/AZfOAdxEm5Uff0VmGC/MiLtKmaVDZrfd
	O7sCkeWS3C+EyO60tu4kKvv2ZGhwKdgXLcCKoFihzPGeCIlm/SzysgOKgYJkyDH6+AMIIKLpA1fiZ
	tAxlFJaqvmgoX2kchIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWUK-009S29-34; Mon, 31 Jan 2022 13:12:56 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWUC-009S0X-9t; Mon, 31 Jan 2022 13:12:52 +0000
Received: from [2a04:4540:1400:f600:38a4:8fb:af3f:40b1]
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <john@phrozen.org>)
 id 1nEWU3-0006KS-Hy; Mon, 31 Jan 2022 14:12:39 +0100
Message-ID: <e3ac8800-e0b8-7c7b-a5b9-e32dfa795731@phrozen.org>
Date: Mon, 31 Jan 2022 14:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v9 03/13] ARM: Add basic support for Airoha EN7523 SoC
Content-Language: en-GB
To: Robert Marko <robert.marko@sartura.hr>, Felix Fietkau <nbd@nbd.name>
Cc: Luka Perkov <luka.perkov@sartura.hr>, Russell King
 <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
References: <20220130145116.88406-1-nbd@nbd.name>
 <20220130145116.88406-4-nbd@nbd.name>
 <CAKQ-crhDHXZptWr5rO5Rb9JttQREoPqE4YO-6nzC2OWc-z06_g@mail.gmail.com>
 <04c91b4e-e7c8-ac6a-f60a-0453a49122fa@nbd.name>
 <CA+HBbNE5nRmFAR44gYMW+Uqi_5e4s+4wBGoQTUbnhC0Pdkc6iw@mail.gmail.com>
From: John Crispin <john@phrozen.org>
In-Reply-To: <CA+HBbNE5nRmFAR44gYMW+Uqi_5e4s+4wBGoQTUbnhC0Pdkc6iw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_051248_559853_9D2677A0 
X-CRM114-Status: GOOD (  18.24  )
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



On 31.01.22 14:00, Robert Marko wrote:
> On Mon, Jan 31, 2022 at 1:57 PM Felix Fietkau <nbd@nbd.name> wrote:
>>
>>
>> On 31.01.22 11:51, Luka Perkov wrote:
>>> Hello Felix,
>>>
>>> On Sun, Jan 30, 2022 at 3:56 PM Felix Fietkau <nbd@nbd.name> wrote:
>>>>
>>>> From: John Crispin <john@phrozen.org>
>>>>
>>>> EN7523 is an armv8 based silicon used inside broadband access type devices
>>>> such as xPON and xDSL. It shares various silicon blocks with MediaTek
>>>> silicon such as the MT7622.
>>>>
>>>> Add basic support for Airoha EN7523, enough for booting to console.
>>>>
>>>> The UART is basically 8250-compatible, except for the clock selection.
>>>> A clock-frequency value is synthesized to get this to run at 115200 bps.
>>>>
>>>> Signed-off-by: John Crispin <john@phrozen.org>
>>>> Signed-off-by: Bert Vermeulen <bert@biot.com>
>>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>> ---
>>>> index 000000000000..ea23b5abb478
>>>> --- /dev/null
>>>> +++ b/arch/arm/mach-airoha/airoha.c
>>>> @@ -0,0 +1,16 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Device Tree support for Airoha SoCs
>>>> + *
>>>> + * Copyright (c) 2022 Felix Fietkau <nbd@nbd.name>
>>>> + */
>>>> +#include <asm/mach/arch.h>
>>>> +
>>>> +static const char * const airoha_board_dt_compat[] = {
>>>> +       "airoha,en7523",
>>>> +       NULL,
>>>> +};
>>>> +
>>>> +DT_MACHINE_START(MEDIATEK_DT, "Airoha Cortex-A53 (Device Tree)")
>>>
>>> Since this is Cortex-A53 core is there a reason why this is not placed
>>> within arm64 directory?
>>   From what I can tell, it's a stripped-down core that only runs in
>> 32-bit mode.
> 
> Hmm, this is new for me that you could do that to an ARMv8 (A53) core.
> I know that you can run ARMv7 code but not that you can reduce it to
> 32 bit only.
> 
> Regards,
> Robert

the bootrom and vendor bootloader do not support 64bit more.
	John

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
