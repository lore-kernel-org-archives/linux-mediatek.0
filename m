Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F57CD8C9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Nov 2025 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0jrR3573DfEeE6mK2J+RTXekLmf87bfO87MMshSXLY=; b=O429G4tiB7KTKj
	Wo3t6H5l8df8e3ekTJyWWDABuAXnzqpdHQXjwFpflRgdryjq9psreqbriw5RvCNp4Ypi3dg/xAcRg
	6qrmFTAlpK9CI5u8XyNrxDJUBMi5ebZE17MsrUbL+CHWSqkLHT6j1wBcl4hsAw8N+kA83tWqbySGl
	QnvNKMoKjgbGCHBDuQ+05bsNamYExGI56Eh+K+cPUNU+05S2YmEsBr3T7QwVC6Rk1+t7vIfxIHEBh
	lZWMEzoPsupHLaSDybE/92vYGL6YlAcq98JhjNLAD1iDCvoDFqyt0QRJ4HO1/UdL3AyJP1Xt3yInx
	3FE+xmK1BbT2Z2Sl8djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa2V-0000000AmpI-41fc;
	Thu, 13 Nov 2025 16:19:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJa2S-0000000Amnr-2eLp;
	Thu, 13 Nov 2025 16:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763050749;
	bh=ZbbaaHUsQVLypoOUIIZkHe7iZlm+xeNap25LcZ0bsIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L08N9R9H05FYgeI9He5wHagRWiiNK1wBzRiAIi1E0bwjHP0B2EawoC/wrhPwCN6Y5
	 jhuQHRwtEgVNqhy1K8RlbKaA6mevZjcmqSfVk09V1KBpkYqzapV1YnScBMrbOIYjOX
	 VO4RxYBGG1jvY89tItdFBj+QnC0NoujI7MTpkhy770bdBzoC53sQLi2f8D6yMnAv+L
	 XslBpTDc5Z4swz4lXyOEr3alCOFf9ZUXdjRUlAQxuWVXekfL64byL9cFcYkfNoWBly
	 iuaXggnvrQNWwSLGZXDdPxCELz6+ayfY5Rg8wYmCTxE7/qW4zGxeSh5vSq1nYDiIdg
	 60E/apd/bqVHA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:9cb8:f653:99e7:c419])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B644117E00B0;
	Thu, 13 Nov 2025 17:19:07 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: daniel.lezcano@linaro.org
Subject: Re: [PATCH RESEND v3 3/9] thermal/drivers/mediatek/lvts: Guard against zero temp_factor in lvts_raw_to_temp
Date: Thu, 13 Nov 2025 17:18:59 +0100
Message-Id: <20251113161859.280743-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <84b9fd00-ce75-43bf-a53b-48818628f7e2@linaro.org>
References: <84b9fd00-ce75-43bf-a53b-48818628f7e2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_081912_840348_69282A67 
X-CRM114-Status: GOOD (  20.55  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, laura.nao@collabora.com, kernel@collabora.com, bchihi@baylibre.com, robh@kernel.org, nfraprado@collabora.com, wenst@chromium.org, rui.zhang@intel.com, colin.i.king@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org, srini@kernel.org, rafael@kernel.org, u.kleine-koenig@baylibre.com, krzk+dt@kernel.org, lukasz.luba@arm.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Daniel,

On 11/10/25 13:42, Daniel Lezcano wrote:
> On 10/16/25 16:21, Laura Nao wrote:
>> Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
>> division by zero and ensure safe conversion. 
>
> Is the temp_factor something else than a ro data statically initialized by the lvts_data structure ?
>
> It is pointless to handle the case where the temp_factor is zero. If we read the temperature the kernel crashes immediately (which means it was not tested).
>
> The temp_factor is an internal value of the driver. If the temp_factor is zero, the driver is buggy and should be fixed.
>
>

That’s right - if temp_factor is zero, that indicates broken platform 
data. I propose failing the probe instead of adding a runtime guard, 
since this condition should never happen in a valid configuration. This 
way, we make the developer aware of the issue early and avoid a kernel 
crash at runtime.

I'll send out a v4 to drop the "if (temp_factor == 0)" checks and 
replace the warning with an error:

if (!lvts_data->temp_factor)
	return dev_err_probe(dev, -EINVAL, "temp_factor should never be zero; check platform data.\n");

Best,

Laura

>> Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff configurable")
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>> Reviewed-by: Fei Shao <fshao@chromium.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>   drivers/thermal/mediatek/lvts_thermal.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>> index 1c54d0b75b1a..4ef549386add 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>> @@ -284,11 +284,14 @@ static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
>>     static u32 lvts_temp_to_raw(int temperature, int temp_factor)
>>   {
>> -    u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
>> +    u32 raw_temp;
>>   -    raw_temp = div_s64(raw_temp, -temp_factor);
>> +    if (temp_factor == 0)
>> +        return temperature;
>>   -    return raw_temp;
>> +    raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
>> +
>> +    return div_s64(raw_temp, -temp_factor);
>>   }
>>     static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>> @@ -1346,6 +1349,9 @@ static int lvts_probe(struct platform_device *pdev)
>>       if (irq < 0)
>>           return irq;
>>   +    if (!lvts_data->temp_factor)
>> +        dev_warn(dev, "temp_factor should never be zero; check platform data.\n");
>> +
>>       golden_temp_offset = lvts_data->temp_offset;
>>         ret = lvts_domain_init(dev, lvts_td, lvts_data); 
> If
>
>
>
>
>


