Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E110CCCA47E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHsawi7GFeUNITSXWDFXC/pLKfZmjkcuQKQBm6T5Dm0=; b=l7KLFZJJSy80AI7oJz7PGKZ+9P
	GdsCdB1tYMM2v87YqvrrBULLyEe0dE1zTcZNZzANNDWDk1XhFFgee9nLN7QF9AsbE8qjJPyn8PxTv
	iSn7Rwf2smnlz97SqEndki+AKZsApRBIuY2qao9TU1jH87ycN76KE72q+qiaH9xgmTmrVjqpyPUE9
	9YF2aQsFCMOvHCtL379y2PhwohovnnAPWupGZ47DNorHQ8votaXMb8gOObCIqeNKU9POJlkMNmu3L
	RDY44psnVcj6sTTZfisTGZMFzW/mO+Nv8HOGaXwOlCy02ODzbJJ4vDV8W7E4sU5BFoBvjSgIVo8MG
	oRzOyfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kR1-00GyrT-KD; Mon, 27 Jun 2022 08:49:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kQq-00Gyi8-Az; Mon, 27 Jun 2022 08:49:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CB5FA6601828;
	Mon, 27 Jun 2022 09:49:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656319754;
	bh=o4KMjR/ZJMxFhZCtqu5FCmZbc0KpnWFELMON025GNow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YEcKuN9F7zr9YHZJ6SYqEkxZ03gQ8MkukZCgHEIgsdT0jrBqRB4H8xzKH2yIUiVix
	 uAwnTIW0oa2ltYINpE6E5EWHfcW4oOXAinDlHd/Wk3VrObMjKuC9vN3CByop4pWHJs
	 +PdewMxVydIslZSVxLsSTpRhzJQR6KvHtcPRvMr5r+mhDd+ZCAEJRBhph4SETfcs+6
	 wqR+2tgzir/S++iNAm6++irP1L0fP99p7p1SPHrnGvAdwK53KGJ2EY9OFGyEHqpudc
	 dD9MzF2c1ffEb8GtoDzj0wWHAQDjK851hRs+TffQlba/Mo7dLBSlDKKV7BzhuZO7ON
	 iu3d7G+wgu69A==
Message-ID: <9554982a-c48b-e902-2d96-b317c46df698@collabora.com>
Date: Mon, 27 Jun 2022 10:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: Add MediaTek Helio X10 MT6795
 clock bindings
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
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
 <20220624093525.243077-3-angelogioacchino.delregno@collabora.com>
 <de5a0e6f-411f-0c7b-ae1e-1117a4126d2d@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <de5a0e6f-411f-0c7b-ae1e-1117a4126d2d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_014920_560627_55542CFF 
X-CRM114-Status: GOOD (  11.74  )
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

Il 25/06/22 22:30, Krzysztof Kozlowski ha scritto:
> On 24/06/2022 11:35, AngeloGioacchino Del Regno wrote:
>> Add the bindings for MT6795's clock controller.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>   include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>>   1 file changed, 275 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/mt6795-clk.h
>>
>> diff --git a/include/dt-bindings/clock/mt6795-clk.h b/include/dt-bindings/clock/mt6795-clk.h
>> new file mode 100644
>> index 000000000000..9902906ac902
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/mt6795-clk.h
> 
> Vendor prefix.
> 

For consistency, I'd really like to keep the filename as it is.

At least in this directory, all of the MediaTek clock bindings
are using the format mtXXXX-clk.h... and that's not only seen
in MediaTek, but also in Broadcom, Renesas, RockChip, HiSilicon,
nVidia, etc.

Thanks,
Angelo

