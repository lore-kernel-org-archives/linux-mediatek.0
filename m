Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA25EC4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kk5etcf9dUcnm7dWGL+iuziMYTZmGe/tLxwpcuiJuSE=; b=aV+1jma4Ssw0HSeqVPg++QjpjM
	n5sEly/AxogMw6p6Q2OTGu6mR22ZaLO1DT8UDJyKyPSUTlsqjtstPNmKteFO+NLR0fmSFRp8eXf45
	sI1sHfiAdTNhs/UN135rc9DAyL65sUdMFj0VjVgR0+1nKl6RLv1UDgcS08gYMcHmL+drsylbC5fgi
	c/L6RLq4TVellky7Jsq5wcu3ZoYdh0EXsEMa0hukbkgPSX86d4p0VK6BVHv5zJs5SnY0zLzUrY6cY
	UnzQOdRYqQJ7tjcgXfQP+WQLttSvfxrfWpHoP4oihHC0+NX1pTShyslXhvPnJIN5i95V6ZC8Tz+D7
	twhbTzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRs2H-00Bcpi-1L;
	Mon, 22 Jan 2024 11:00:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRs2E-00Bcp1-16;
	Mon, 22 Jan 2024 11:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705921208;
	bh=G6ENMbYnSExmBsiKgUE0XhOt+HRgA6TcZEvQKVF8gYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cYEV9FRWZv8f/lwYnr1LE0PtXwV207uuNisL4vf0YddAd0RXp9RHIaf4/q/wCjtbU
	 FpV8G8RlBORFfIcTuP9PQuqDPg7R4hvv80O9bWsBOFFfutvgLvOJOxxsqNKUi0QUZ8
	 nFM1eza4JYtCyjVwSkYtNgDsmUOuEOxJJNcTe86FXUkHGTYoag+8ANXsHSYmPL6qPN
	 LgnKUB1Kb5BVP9JKW5fCFqAcb2a5xB6W+dsWZ/28tqIKK3WXGgTt3CvgM35UdYyrsm
	 jB+Szy8JSGGNe/OvQwDibrr2pcqeExSJ/JUKQBSQmEKV6trMa5MzqsCWqTfEocXr/X
	 MYq3Tl12vQK0w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E8A613781FDF;
	Mon, 22 Jan 2024 11:00:07 +0000 (UTC)
Message-ID: <2f8d6e4e-ba01-4a87-94d6-65421db765ed@collabora.com>
Date: Mon, 22 Jan 2024 12:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: mtu3: Add MT8195 MTU3 ip-sleep wakeup support
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20240112133222.240038-1-angelogioacchino.delregno@collabora.com>
 <20240112133222.240038-2-angelogioacchino.delregno@collabora.com>
 <5bf2910f-c184-4681-a474-69bea8ee7b71@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5bf2910f-c184-4681-a474-69bea8ee7b71@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_030010_531257_41A84D9B 
X-CRM114-Status: GOOD (  14.46  )
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

Il 22/01/24 08:58, Matthias Brugger ha scritto:
> 
> 
> On 12/01/2024 14:32, AngeloGioacchino Del Regno wrote:
>> Add support for the ip-sleep wakeup functionality on the three MTU3
>> controllers found on the MT8195 SoC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/usb/mtu3/mtu3_host.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
>> index 9f2be22af844..85f49e00e8db 100644
>> --- a/drivers/usb/mtu3/mtu3_host.c
>> +++ b/drivers/usb/mtu3/mtu3_host.c
>> @@ -34,6 +34,19 @@
>>   #define WC0_SSUSB0_CDEN        BIT(6)
>>   #define WC0_IS_SPM_EN        BIT(1)
>> +/* mt8195 */
>> +#define PERI_WK_CTRL0_8195    0x04
>> +#define WC0_IS_P_95        BIT(30)    /* polarity */
>> +#define WC0_IS_C_95(x)        ((u32)(((x) & 0x7) << 27))
>> +#define WC0_IS_EN_P3_95        BIT(26)
>> +#define WC0_IS_EN_P2_95        BIT(25)
>> +#define WC0_IS_EN_P1_95        BIT(24)
> 
> Not used, shouldn't we drop that?
> 

Hey Matthias!

Thanks for catching that - yeah that bit exists, but cannot be used in MTU3, so
it has to be dropped.

Sending a v2 in a jiffy....... or two. :-)

Cheers,
Angelo

> Regards,
> Matthias
> 
>> +
>> +#define PERI_WK_CTRL1_8195    0x20
>> +#define WC1_IS_C_95(x)        ((u32)(((x) & 0xf) << 28))
>> +#define WC1_IS_P_95        BIT(12)
>> +#define WC1_IS_EN_P0_95        BIT(6)
>> +
>>   /* mt2712 etc */
>>   #define PERI_SSUSB_SPM_CTRL    0x0
>>   #define SSC_IP_SLEEP_EN    BIT(4)
>> @@ -44,6 +57,9 @@ enum ssusb_uwk_vers {
>>       SSUSB_UWK_V2,
>>       SSUSB_UWK_V1_1 = 101,    /* specific revision 1.01 */
>>       SSUSB_UWK_V1_2,        /* specific revision 1.02 */
>> +    SSUSB_UWK_V1_3,        /* mt8195 IP0 */
>> +    SSUSB_UWK_V1_5 = 105,    /* mt8195 IP2 */
>> +    SSUSB_UWK_V1_6,        /* mt8195 IP3 */
>>   };
>>   /*
>> @@ -70,6 +86,21 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, 
>> bool enable)
>>           msk = WC0_SSUSB0_CDEN | WC0_IS_SPM_EN;
>>           val = enable ? msk : 0;
>>           break;
>> +    case SSUSB_UWK_V1_3:
>> +        reg = ssusb->uwk_reg_base + PERI_WK_CTRL1_8195;
>> +        msk = WC1_IS_EN_P0_95 | WC1_IS_C_95(0xf) | WC1_IS_P_95;
>> +        val = enable ? (WC1_IS_EN_P0_95 | WC1_IS_C_95(0x1)) : 0;
>> +        break;
>> +    case SSUSB_UWK_V1_5:
>> +        reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8195;
>> +        msk = WC0_IS_EN_P2_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
>> +        val = enable ? (WC0_IS_EN_P2_95 | WC0_IS_C_95(0x1)) : 0;
>> +        break;
>> +    case SSUSB_UWK_V1_6:
>> +        reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8195;
>> +        msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
>> +        val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
>> +        break;
>>       case SSUSB_UWK_V2:
>>           reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>>           msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;




