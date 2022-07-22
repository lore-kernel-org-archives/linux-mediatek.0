Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE333C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVXTfWq6g7pX6SqLcxLypGoR8wWB8iMmyBjMriD4olA=; b=iq2es4T2meilw6ovqk8TZwMPlw
	wKjuHbUjK7yp73op0MoXOUb/c3kwLiKcwc5KdFX6q/8NXRHxqVcaMd82xjCXFktD+vE6K23hIcimN
	a9URFsrR8fOPxpvCN0qK3I3XoIIoTOv/1braqVQlgC44uCgBFmO/OFP0uPF5Jm4RW4h07Ma4ti0pK
	r7uQRSRb+cWOFOk+PZ1udhYfHC3p9rk3jbXkPoCCAkN7qa90DIU7qZW2sw4IIf/1/sIRiMnDGXsqf
	9YUqeBd5KYHPy/fya4RJNWIpMdNjYacbSPAW39gE//oh+cwWNkI5xCP0PDVMw+QrEOkSKtjOUwlYD
	qmg/qUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEoNJ-001Cw3-52; Fri, 22 Jul 2022 08:51:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEoN7-001CoY-3G; Fri, 22 Jul 2022 08:50:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A82CF6601AC4;
	Fri, 22 Jul 2022 09:50:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658479855;
	bh=64MEcYd26mgc62O6DF4etIzTxMQl7QOWdieKUap4UbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T/A40FtZ280EKJL8nX/BLp/cTUlqftolv8yxEvbb7h02PmxTUkEp/D8v6nsI1IlZl
	 iYriZPWn2vB2le9rlbYyjoUxaWOxcYPkVxilpoXZb1bgJzebDsYFsZqamgNkXCd2N6
	 m9s1r5ptDyFOQkPognV/cNobJS+c7QFpmzcj9vhsZ0pO/u2Zyhqwlo92trow/cOb9t
	 NmokpkY7swg/QNv4Ug7xGBSxY2WEwXKBTy7820JiJZTJoS1Y4yM5SgARxiMATkNwph
	 Z95/4B639NYvL79r4hRY6WXWLw1xDCqHssf1Po1mrNV1QHn6vAOKGvK5b0aafe7NpI
	 r9Nu4FnsyamYQ==
Message-ID: <d96a2f25-cfb7-7440-9fc1-ffd36852495c@collabora.com>
Date: Fri, 22 Jul 2022 10:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/7] MediaTek Helio X10 MT6795 - Clock drivers
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
 kernel@collabora.com
References: <20220629110254.184213-1-angelogioacchino.delregno@collabora.com>
 <45ff2e82-caeb-9575-ce73-1bd43c37c0c5@collabora.com>
 <3c781dd6-865f-e59b-17dd-c583e79ef152@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3c781dd6-865f-e59b-17dd-c583e79ef152@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_015057_388255_D2FF1EDA 
X-CRM114-Status: GOOD (  12.66  )
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

Il 21/07/22 18:38, Krzysztof Kozlowski ha scritto:
> On 21/07/2022 10:53, AngeloGioacchino Del Regno wrote:
>> Il 29/06/22 13:02, AngeloGioacchino Del Regno ha scritto:
>>> In an effort to give some love to the apparently forgotten MT6795 SoC,
>>> I am upstreaming more components that are necessary to support platforms
>>> powered by this one apart from a simple boot to serial console.
>>>
>>> This (very big) series introduces system clock, multimedia clock drivers
>>> (including resets) for this SoC.
>>>
>>> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
>>>
>>> This series depends on, and can be merged on top of:
>>> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=640122
>>> [2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849
>>>
>>
>> Gentle ping for this series...
>> ...I've got a lot of commits to send that depend on this one...
>>
>> P.S.: The dependencies in [1] and [2] are already upstream.
>>
> 
> You sent this message to Rob (not to others) and you did not mention
> whom are you pinging. Rob provided all necessary tags for you.
> 
> If you want to ping someone, put proper names in "To" but best - mention
> by name.
> 
> Best regards,
> Krzysztof

Right. The ping wasn't for Rob, as he reviewed/acked all of the dt-bindings
patches in this series.

Next time I'll be more specific - thanks for that.

Cheers!
Angelo


