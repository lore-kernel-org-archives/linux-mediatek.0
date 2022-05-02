Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC73C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFo9hTW51WeoX6ouH3uZcc7lHB73hrUsVEPJO+mi1k8=; b=w/2mcYmR1wNcAL
	0ogCYTTyf62z0BkXq8lTbCjqCh92l6LshpIxL+p9RcYsvOhhtgcBINgLY2/s4d4wgHk9n1dqcSIh5
	QAoyr0RHqVdHCph9Zj7Iozhe/km/kcMYSqpTEvCK4/z9Rr3qQ7oOvaBMVlnaPNXlARUvn8CEuQKE8
	2esQTVONN4w0qWpuZQwxeS+cxBEWWwd31k2+up1+k20CFYUa/xyussISbq1Skspu6s2pBWDj7Ct4P
	tDP+mUxB8f/ARrnOYaJyETUNq8i1nnzMurhPvr+SSvZ2jFFG+SafzqFjpk2ug/6ilNKuQAbg2DMSz
	OMsNEV5R7s3k/6blY0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRpr-000TiO-Bh; Mon, 02 May 2022 08:55:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRpf-000TgF-7f; Mon, 02 May 2022 08:55:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8D15D1F4305D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651481701;
 bh=3BW+nxuTRA49LbcdXaeq9ZCmg12LIlVHpHv79umm3nU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jDPcTXu8R4vBjXC9eYZzcXigt/dEgh9fzk8DyL5ipvwVNXD+kb9RvR+nBzl0A1x+1
 n8waVx/o+73r2krzd2TsWxU/5vPWvSFWAGsfOUPeXPuvbBgsJ7CU2hDZDu+E5yMeSF
 ZUKxBlCmoYazE+C9EJWr45b9h7vTlyTO1TkD9zuE93hQWuaCByEnWCExEZ3wS07Sxf
 FejKSb9B1B3bEwUUOijFwtLJ2iMe2xxHSGAkjn/zsemHMihFSA0aYne+VdDuMS2NIe
 v3IzKoMOS6UjYgmLQwJ+N8BA4oh1lf2KYilAKr2usTB4Q9LoAWmrD2O8bVmfvnWyFr
 QdAMettwC+Pig==
Message-ID: <c56464d3-d33d-1797-2c98-67bec34df756@collabora.com>
Date: Mon, 2 May 2022 10:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 12/16] dt-bindings: reset: mediatek: Add infra_ao reset
 bit for MT8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
 <20220428115620.13512-13-rex-bc.chen@mediatek.com>
 <839978c5-c337-7784-a04f-26b9883c703b@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <839978c5-c337-7784-a04f-26b9883c703b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_015504_496026_41B43962 
X-CRM114-Status: GOOD (  16.92  )
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

Il 29/04/22 23:13, Krzysztof Kozlowski ha scritto:
> On 28/04/2022 13:56, Rex-BC Chen wrote:
>> To support reset of infra_ao, add the bit definitions for MT8195.
>> The infra_ao reset includes 5 banks and 32 bits for each bank.
>>
>> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>> ---
>>   include/dt-bindings/reset/mt8195-resets.h | 170 ++++++++++++++++++++++
>>   1 file changed, 170 insertions(+)
>>
>> diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
>> index a26bccc8b957..463114014483 100644
>> --- a/include/dt-bindings/reset/mt8195-resets.h
>> +++ b/include/dt-bindings/reset/mt8195-resets.h
>> @@ -7,6 +7,7 @@
>>   #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
>>   #define _DT_BINDINGS_RESET_CONTROLLER_MT8195
>>   
>> +/* TOPRGU resets */
>>   #define MT8195_TOPRGU_CONN_MCU_SW_RST          0
>>   #define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
>>   #define MT8195_TOPRGU_APU_SW_RST               2
>> @@ -26,4 +27,173 @@
>>   
>>   #define MT8195_TOPRGU_SW_RST_NUM               16
>>   
>> +/* INFRA RST0 */
>> +#define MT8195_INFRA_RST0_THERM_CTRL_SWRST	0
>> +#define MT8195_INFRA_RST0_RSV0			1
>> +#define MT8195_INFRA_RST0_DISP_PWM1_SWRST	2
>> +#define MT8195_INFRA_RST0_RSV1			3
>> +#define MT8195_INFRA_RST0_MSDC3_SWRST		4
>> +#define MT8195_INFRA_RST0_MSDC2_SWRST		5
>> +#define MT8195_INFRA_RST0_MSDC1_SWRST		6
>> +#define MT8195_INFRA_RST0_MSDC0_SWRST		7
>> +#define MT8195_INFRA_RST0_RSV2			8
>> +#define MT8195_INFRA_RST0_AP_DMA_SWRST		9
>> +#define MT8195_INFRA_RST0_MIPI_D_SWRST		10
>> +#define MT8195_INFRA_RST0_RSV3			11
>> +#define MT8195_INFRA_RST0_RSV4			12
>> +#define MT8195_INFRA_RST0_SSUSB_TOP_SWRST	13
>> +#define MT8195_INFRA_RST0_DISP_PWM_SWRST	14
>> +#define MT8195_INFRA_RST0_AUXADC_SWRST		15
>> +#define MT8195_INFRA_RST0_RSV5			16
>> +#define MT8195_INFRA_RST0_RSV6			17
>> +#define MT8195_INFRA_RST0_RSV7			18
>> +#define MT8195_INFRA_RST0_RSV8			19
>> +#define MT8195_INFRA_RST0_RSV9			20
>> +#define MT8195_INFRA_RST0_RSV10			21
>> +#define MT8195_INFRA_RST0_RSV11			22
>> +#define MT8195_INFRA_RST0_RSV12			23
>> +#define MT8195_INFRA_RST0_RSV13			24
>> +#define MT8195_INFRA_RST0_RSV14			25
>> +#define MT8195_INFRA_RST0_RSV15			26
>> +#define MT8195_INFRA_RST0_RSV16			27
>> +#define MT8195_INFRA_RST0_RSV17			28
>> +#define MT8195_INFRA_RST0_RSV18			29
>> +#define MT8195_INFRA_RST0_RSV19			30
>> +#define MT8195_INFRA_RST0_RSV20			31
> 
> These are not proper IDs... don't work-around usage of bits with fake
> reserved IDs...

Hello Krzysztof,

Actually, I get that it may seem that Rex is trying to cheat with fake
reserved numbers... but it's really how the registers are laid out: there
really are reserved bits in between used reset bits.

I don't think that the reserved bits are doing anything though, so the
best way to proceed is to just remove them and map the dt-bindings IDs to
the HW register's bits in the driver instead.
Even though the current approach is very simplistic, I agree that this is
not how it's supposed to be done (and I'm sort-of sad about that).

Rex, please map these values in the reset driver so that, in this header,
you'll get something like:

#define MT8195_INFRA_RST0_THERM_CTRL_SWRST	0
#define MT8195_INFRA_RST0_DISP_PWM1_SWRST	1
#define MT8195_INFRA_RST0_MSDC3_SWRST		2
#define .... (etc)

Cheers,
Angelo

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
