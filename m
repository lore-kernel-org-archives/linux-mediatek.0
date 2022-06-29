Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1181C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ys47dedYJ6c8iUWxsII1fH8s2ib3aG1KT+JaByLuhY=; b=NhnoYkPsuYv+SOnhWhQey4zCs0
	xKbEa9Od5Y9H1chR2yeZZi0zlOrmFGE904xNMj9Gjo1FHMoT5G+7OX7bsuJWfX+gzOl/riuPySPFU
	FfV59nGH15aSVc2+HGVonjTOuqR7NwwqUA+1kMuj4H43Y8uugvzqSBnYgNdu90+0BjyyEqDpKZaRx
	8JuqVkulCUM1+KB5UzmUuYjc8XbMN7Uk+McgcdsXjAOMsHkdhHAN4wDZ8eA2Z4iXdKfnDQ8RRpg20
	u23dMdBS3nllmY9xU0INbG67Kt/NqGxlGVSdICjsD1GIAxHP+DOLiMwAvTAKvSlNwY+mcGOzbSXAa
	Jbg+rJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Vbz-00BIcb-74; Wed, 29 Jun 2022 11:11:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VHc-00B9op-Hz; Wed, 29 Jun 2022 10:50:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D792B6601907;
	Wed, 29 Jun 2022 11:50:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656499852;
	bh=VB4xmm1pqPyAJPc0TeGDMO5zgTSwWc/1+kwgXsrt4qs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hm1APcJMp3r5Z/fFRTMizpJTQ1FWIo8qar/oI5Vqac3oOc3XdRouobWFKHlU1Xtb/
	 K2DkYVAqhhGrFnbIFJ9nBPOq77G/jQNnR0NcMpJni5yOtedfJvJUx639JtnEPJYfEY
	 F1wmPeS6XXYQJC48PdoOAb04Z9Pdu7v/rtBzr/NxasiZ42+eu1+HSdpXLEsG5alTls
	 RnmvSxeBeU6eMgXzQWqqPkPu4ABEZrEDViu3/8o/EFdTic/EOnHIblKof6W0q9yqHW
	 ql/1SDvS6yQ9cp/xtFNDZYEmSNad/gM4C5gBG8m9U6ihpJKI4xhmFjQi5hdRFflyb6
	 AP0vfPLUHmeHw==
Message-ID: <603cffde-f8f4-d313-c7a9-ad87b70fa61e@collabora.com>
Date: Wed, 29 Jun 2022 12:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 3/7] dt-bindings: reset: Add bindings for MT6795 Helio
 X10 reset controllers
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
 <20220627085632.23797-4-angelogioacchino.delregno@collabora.com>
 <51748cbc-e895-13cc-6b8e-8c62b211aa4e@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <51748cbc-e895-13cc-6b8e-8c62b211aa4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_035056_894223_5D7D7613 
X-CRM114-Status: GOOD (  12.17  )
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

Il 29/06/22 12:49, Krzysztof Kozlowski ha scritto:
> On 27/06/2022 10:56, AngeloGioacchino Del Regno wrote:
>> Add the reset controller bindings for MT6795.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>   include/dt-bindings/reset/mt6795-resets.h | 50 +++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 include/dt-bindings/reset/mt6795-resets.h
>>
>> diff --git a/include/dt-bindings/reset/mt6795-resets.h b/include/dt-bindings/reset/mt6795-resets.h
>> new file mode 100644
>> index 000000000000..0a6514884eae
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/mt6795-resets.h
> 
> You still need vendor prefix.
> 
> 

Ouch, I'm sorry, I was somehow convinced that I had added it.

v5 coming as soon as I can.

Sorry again,
Angelo

