Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6B6C88CB9
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROruyasi/7VYHqNQJnr1EPnY/a6QhJAAYuvoNd5SZ7c=; b=oeoA0VcTnAwxch
	8HmPSM1ov12+TLRsN5pSU69zCo5FnuuzANlDTMMqPZlIK05ELhASCvtmwnZuGu3OXkodQya9d9r2P
	b7SwhEA5thL8/yCUisLLHsPEvg6XEeGkCTQhfS5AogvOvwDo+ziMLCAqjFcwWWtdD0oCnbhDIJ27b
	B1Oi/C1RD5ps1OAudgxcmGJfQE6OrQLVMIOXkDklJ2rmKE2C5vI6phqEWACJELDYbE5X7V3fSwHXm
	6AVr2Lz130VrdyWAaLB1/Z/KIYM06eVn7SOoJ2kfTEndvom7VKPQRK7soDhRtBEsYaxrm9LN7yeeH
	ijQMnn+ZYqPaxJ8eb6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSm-0000000A4nr-3fyR;
	Mon, 04 Aug 2025 09:26:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirB1-0000000A325-3FiB;
	Mon, 04 Aug 2025 09:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754298493;
	bh=dNCb1GbU+zMwwHGSEs5J88EmPe3I2aoFVC/o3+7U2F0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PlBHTgSi+7JUOYuxMn8femLuLfq3RszCQHshgoXnZkewKPTRWb22SaKzxCGHhf840
	 FQTF+WkJpIePV9vztC7CZg4vYnqlyZRMQG56aEoIjG7KFvVRT+Kj4scAov60j7U5ec
	 Fzz8Ec1QZUc8YC4G13q8/RbRYSKruZQQxe1PirBbachk/U30E0fnliOldzBjunQON/
	 +dvTmo6jULLhF59a8odkYh/Q+tot5DtamutSrYLrrNMH9Bvnh+GB6u9hPnunLJtliO
	 0tmK/DIrbt53tW3dHiFdNBmZ5ChqnnxHdFu1OtU3dZyHCGWHzIoP9IUvu9EYfsEQhh
	 u/iH0Tx98hw7Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9849017E0593;
	Mon,  4 Aug 2025 11:08:11 +0200 (CEST)
Message-ID: <fe135942-3040-4858-b2e4-a8e4507b89e9@collabora.com>
Date: Mon, 4 Aug 2025 11:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/38] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
 <b7c9f6b8-4f29-4e38-9c93-e22cfed7229d@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b7c9f6b8-4f29-4e38-9c93-e22cfed7229d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_020815_987317_E28FA80E 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/07/25 11:12, Krzysztof Kozlowski ha scritto:
> On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
>>   
>>     clock-names:
>>       items:
>>         - const: aud_afe_clk
>>         - const: aud_dac_clk
>>         - const: aud_dac_predis_clk
>> +      - const: aud_adc_clk
>> +      - const: aud_adda6_adc_clk
>> +      - const: aud_apll22m_clk
>> +      - const: aud_apll24m_clk
>> +      - const: aud_apll1_tuner_clk
>> +      - const: aud_apll2_tuner_clk
>> +      - const: aud_tdm_clk
>> +      - const: aud_tml_clk
>> +      - const: aud_nle
>> +      - const: aud_dac_hires_clk
>> +      - const: aud_adc_hires_clk
>> +      - const: aud_adc_hires_tml
>> +      - const: aud_adda6_adc_hires_clk
>> +      - const: aud_3rd_dac_clk
>> +      - const: aud_3rd_dac_predis_clk
>> +      - const: aud_3rd_dac_tml
>> +      - const: aud_3rd_dac_hires_clk
>>         - const: aud_infra_clk
>>         - const: aud_infra_26m_clk
> 
> 
> You can only add to the end of lists, not in the middle.
> 

The devicetree follows exactly what I've done here, and if I add to the
end of the list (which was wrong from the beginning), I'd have to reorder
all of the clocks in the devicetree node as well.

I know that I'm not supposed to add those there, but this is not about adding
new clocks, it's about adding ones that were missing in the middle.

> Also, please drop all _clk suffixes and aud/top prefixes. These are
> supposed to be clock inputs, so you name them based on this device. Not
> based on the provider's name.

That breaks everything: the driver uses the _clk suffixes and aud/top prefixes
to get clocks by name - I know that "driver" and "binding" are not two words
that go together in that sense, but *otherwise* we'd need to perform way bigger
changes to get this situation resolved.

Those "way bigger changes" would also add bloat to the kernel as we'd need to
parse clocks with old and new names.

Can we please avoid this on SoCs from years ago, which are only getting maintenance
and no new feat/dev?

Thanks,
Angelo


