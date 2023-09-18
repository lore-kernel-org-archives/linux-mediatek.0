Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBEBCD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKPac6zE+fNhvn7oLgB9Jx+SWpnwgIlv4ZYdieivis4=; b=ZM7CGWuzq9dr3GDvxGdFXaOGY8
	a7F/ftrTe7trWBWYnaT722k5wTgOLxR/CBBx/ZsjvBxFOJ6Lw3KOTtuQTDWarm8f/iu7F/8Ih2tK5
	FoEZFYZoNihQs32xztm/uF5RXdno8EEGHKagMAfS6eYoniVQtR/HXjYFhZafi30ly8rpa3TA0H7gZ
	ZkhtrNQ4Rn/jeUzzULu015pIrOv+PKVEOuvRYf3iaGS8xRkme6uItdwDInzzpDHbKjAWQHCztdsbW
	I2aHcgoG4wtTNaDKTlsUveYqQ7IzJiTDTC3CgzJnN2hCgvDM/0AyKyeHA+hU3aUKFvW9J2WtoeRFG
	2mIIVbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9vG-00EsjS-2W;
	Mon, 18 Sep 2023 08:48:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9vB-00EsiF-13;
	Mon, 18 Sep 2023 08:48:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4750366071A0;
	Mon, 18 Sep 2023 09:47:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695026875;
	bh=PQUHws8Z1w+TcF0jCRyePlr50AeNkNWESN1De6xP8dY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cLEYwxEiW2Z8laabejsz3E+oq39RdP0AVM6njg/u5/bbU+4eLVyrUT9RPaweN01CA
	 Pb7vMLBcp/lm5f0rhZ9kNADin2MewwuuMpDZmRNTmIca4b720JCsbPI3d5D0mRNZan
	 AUGUyZn00oQmQe2i6Dt/ppeU3eu50jjq4klAD85PWwu4+cW5vSg+wK7KVgxQilm+uf
	 LzZ5927BaNwAdV4r6hQbNEB7VtyiSadwF4YHvvS9UL7XElzBhPjD76fa9m50MS9+oA
	 m4tnB2kBGJD/gpspLH8tKOQ5kidqMxVSmaT40X4bhX0zD1RqI+QA3CtKz8KkDGDPz3
	 ggIPipT5GMKcA==
Message-ID: <9acc8d99-e3db-3df8-4051-21d95450b28d@collabora.com>
Date: Mon, 18 Sep 2023 10:47:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 3/3] dt-bindings: hwinfo: Add mtk-socinfo driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230915152607.18116-1-william-tw.lin@mediatek.com>
 <20230915152607.18116-4-william-tw.lin@mediatek.com>
 <3e7bc476-ffc7-fb07-8e64-246427da736c@linaro.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3e7bc476-ffc7-fb07-8e64-246427da736c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_014757_500680_71C04A95 
X-CRM114-Status: GOOD (  21.58  )
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

Il 17/09/23 10:26, Krzysztof Kozlowski ha scritto:
> On 15/09/2023 17:26, William-tw Lin wrote:
>> dt-binding documentation for mtk-socinfo driver.
> 
> Here and in subject, drop driver and instead descrbe hardware.
> 
>> mtk-socinfo driver provides SoC-related information.
>> Such information includes manufacturer information, SoC name,
>> SoC segment name, and SoC marketing name.
>>
>> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
>> ---
>>   .../bindings/hwinfo/mtk-socinfo.yaml          | 48 +++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
>> new file mode 100644
>> index 000000000000..74f03f1dc404
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwinfo/mtk-socinfo.yaml
> 
> Nothing improved.
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
> 
> Thank you.
> 
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwinfo/mtk-socinfo.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek SoC ChipID
>> +
>> +maintainers:
>> +  - William Lin <william-tw.lin@mediatek.com>
>> +  - Matthias Brugger <matthias.bgg@gmail.com>
>> +  - Kevin Hilman <khilman@kernel.org>
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  MediaTek SoCs store various product information in eFuses, including
>> +  Chip ID and Revision fields, usable to identify the manufacturer,
>> +  SoC version, plus segment and marketing names.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,socinfo
> 
> What happened to compatibles? No, this is just wrong and no explained.
> You ignored other comments as well. Really, that's not the way to go.
> 

Practically, having different compatibles for each SoC is not needed, as
the only thing that changes between SoCs is the eFuse(s) that you read to
get the information - and that's all.

So ... we either use this driver with devicetree, giving it the right eFuses
to read from, or we duplicate the mtk-efuse driver, or we statically assign
the eFuses in the driver itself and we set compatibles like
"mediatek,mt8195-socinfo" to select that... ideas?

Cheers,
Angelo

> NAK
> 
> Best regards,
> Krzysztof
> 


