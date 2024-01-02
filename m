Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211B7C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeEhYJEkhrqqOFPlKQh6EIVIcojzNxmPPGBpc5k+ESY=; b=jOrQ+fi8rZZ1QVXM84dmC06kyD
	oKOaDxKSTGa5oJ6jfe/Fy1kEUcKK1lZxMD4rnvZidQCX58UaojB0S85wKkhRqMt6zQFlrE9AJtXwi
	0PESAtsO+wnIBa29xrVyC8LitO/kS5o9xnV+UymleedfDfUOkVTdh3HME8COxoDO5TYDE5Ak6EnoP
	F457kgg8eDiyArb1XUkieQFkK9ZHaGxLBXOwNLOk2WBOakAp+4laz0PCuWZmMotC0NTno5PATb+fN
	lhPp3GMIWbKc2ySmXmEbQBoHrhBqQpRHgPbdjyjonQobs5RVVcBZnub0TVDkNHmBFuo4JhPyaTs7s
	HcKTnhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKamJ-007PgP-0a;
	Tue, 02 Jan 2024 09:09:39 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKamF-007Pf3-1u;
	Tue, 02 Jan 2024 09:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704186572;
	bh=0IJc2UOGZ6oMEAmRyC8mL1X+nZIu6VgIRz8xHSvM2KI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P94UWCDeEk5DKNB6KMkv3dEvRD8cI6BmKuy/6krHuaJB+1o+zwQoDoGEVvPdZdaaD
	 8VcqkRQfLaqEvHgRFs7agU3FTdKAfkJlamVTamOQVIwdt3uSITjLpAetWlPu80wFZf
	 uehhpHxvakYiX8ZVTA1yaTuC+CnAk83nY9E6433BXB/8Dj76LWc+nBQLEpnvdL5FFT
	 3jCWAxT7A9JLv4GDNjxCiZ6usIkmyBpWZEdnPCvRwBIpdEYsPeyeyrZd+Wafw3eb3T
	 Fjk8QOqTY53UaB+3ahZDRfpHG77yfGQfiQNVSI+HHhO2EY4wYIXPvZ5runNQEXVMxp
	 B0uah6DH1q7vg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C3C237804B2;
	Tue,  2 Jan 2024 09:09:31 +0000 (UTC)
Message-ID: <a288d5c8-6eb9-49f8-bcbc-f2b41e51c797@collabora.com>
Date: Tue, 2 Jan 2024 10:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: cherry: Add CPU supply
 dependency to cpufreq-hw
To: Viresh Kumar <viresh.kumar@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231229212853.277334-1-nfraprado@collabora.com>
 <20231229212853.277334-2-nfraprado@collabora.com>
 <20240102061123.frvwltggqqh6m7pm@vireshk-i7>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240102061123.frvwltggqqh6m7pm@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_010935_813084_E739ACA2 
X-CRM114-Status: GOOD (  17.31  )
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

Il 02/01/24 07:11, Viresh Kumar ha scritto:
> On 29-12-23, 18:28, Nícolas F. R. A. Prado wrote:
>> When the mediatek-cpufreq-hw driver enables the hardware (by
>> writing to REG_FREQ_ENABLE), if the regulator supplying the voltage to
>> the big CPUs hasn't probed yet, the platform hangs shortly after and
>> "rcu: INFO: rcu_preempt detected stalls on CPUs/tasks" are printed in
>> the log.
>>
>> To prevent this from happening, describe the big CPUs regulator in the
>> performance-controller DT node, so that devlink ensures the regulator
>> has been probed and configured before the frequency scaling hardware is
>> probed and enabled.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> ---
>>
>>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> index dd5b89b73190..505da60eee90 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> @@ -502,6 +502,10 @@ &pcie1 {
>>   	pinctrl-0 = <&pcie1_pins_default>;
>>   };
>>   
>> +&performance {
>> +	big-cpus-supply = <&mt6315_6_vbuck1>;
>> +};
>> +
>>   &pio {
>>   	mediatek,rsel-resistance-in-si-unit;
>>   	pinctrl-names = "default";
> 
> I think the regulator needs to be mentioned in the CPU's node and not
> here ?
> 

Even if the regulator voltage is being changed by firmware with cpufreq-hw, the
actual regulators should go to each CPU node and not in the cpufreq driver node,
I agree with Viresh.

Besides, that's the same thing that we're doing with mediatek-cpufreq as well...
and since we're talking about that, we should also do something about this such
that we stop declaring `regulator-always-on` for CPU cores in devicetree, but
this is probably slightly out of context for what you're trying to do here, so,
read that as an "extra consideration" :-)

Cheers,
Angelo

