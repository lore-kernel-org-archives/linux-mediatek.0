Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C7AC352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 12:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCv6zQoq8PKoLW1js9zLzmuf7KmwF9Ll7GspeJwUf94=; b=vx3hmvGuq/t3WNBVu8kjI8bnKM
	PClCYO/lNnc04YeAHfvLqlzDNIlIPI8fDJgwWd0v53Nt1xSadfNeihCavkV5AhWmKC6YFSq7OiYru
	JXNs/cIi3q8FeVzkxmPoqBmYGPWNJV5TDPn27OtPa1kGW8jMKzyznRVZVmkUTi0pCmp6xi2eawtKq
	5LYApS/i+5NyXcAZHHNOncAeKEgOefCoJ39yyPcWJYdZdUgnWeT5J3OxKBMhOnIukSBetBJsXixtP
	DcfvOiHlAtKjhKtx0PLQIg2T4jLd4MjpaNp4cJLNYauklSudhG8AXHrpVesvnNLe6UOoszaEJbC4V
	JQTo42yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Wy6-0093B3-3i; Tue, 06 Dec 2022 12:22:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Wxf-0092u2-U3; Tue, 06 Dec 2022 12:22:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE439660035D;
	Tue,  6 Dec 2022 12:22:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670329327;
	bh=HFhsBPJUZ/W3qeEbtqj0mNmnYKJB/11JNCtWMdGTv88=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JMsgBLF19vGkI7bjFVq2yyNHu0QRemrayTu3nigu593WI7AyVTqCauD9mDxXD/hsT
	 mbaMKCn1Fk40bs0z68zMZPCQimF5KjiR6da/ZD8qHC2BvOnS75PQwmj5pv+uQOKX+p
	 IZbZtZkBzkqGU5pU1Qb17m0uH9snhHja5hA3vx2qKxXl98YmycaA8W/do9/AHOn17p
	 /cCy46ruAiCy/THacT1AIQOuE9+JulTQF5rWLLxSCFmgBjViBTU4bASICxzpV8xtYE
	 ko0tQ8tX/suIToA2tf1/OcuYZ3UCihVhGwVu6BCG9kAqLd+K+Ll+iN86jTsBIJ4+1j
	 fpRs2UUzSJhXg==
Message-ID: <b55ee8fa-7ad6-3bf9-4983-41a90bd75ce4@collabora.com>
Date: Tue, 6 Dec 2022 13:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/9] mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-5-xiangsheng.hou@mediatek.com>
 <50ede482-7f03-ff55-5ad0-aa6249027cbe@collabora.com>
 <149100d0dc205a317ed352cdfb391f2147a2afab.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <149100d0dc205a317ed352cdfb391f2147a2afab.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_042213_414923_F966BEA3 
X-CRM114-Status: GOOD (  13.18  )
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

Il 06/12/22 10:04, Xiangsheng Hou (侯祥胜) ha scritto:
> Hi Angelo,
> 
> On Mon, 2022-12-05 at 15:21 +0100, AngeloGioacchino Del Regno wrote:
>> Il 05/12/22 07:57, Xiangsheng Hou ha scritto:
>>> Add ECC support fot MT7986 IC.
>>>
>>> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
>>> ---
>>>    drivers/mtd/nand/ecc-mtk.c | 18 ++++++++++++++++++
>>>    1 file changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-
>>> mtk.c
>>> index 9f9b201fe706..c2f6cfa76a04 100644
>>> --- a/drivers/mtd/nand/ecc-mtk.c
>>> +++ b/drivers/mtd/nand/ecc-mtk.c
>>> @@ -79,6 +79,10 @@ static const u8 ecc_strength_mt7622[] = {
>>>    	4, 6, 8, 10, 12
>>>    };
>>>    
>>> +static const u8 ecc_strength_mt7986[] = {
>>> +	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24
>>> +};
>>> +
>>>    enum mtk_ecc_regs {
>>>    	ECC_ENCPAR00,
>>>    	ECC_ENCIRQ_EN,
>>> @@ -483,6 +487,17 @@ static const struct mtk_ecc_caps
>>> mtk_ecc_caps_mt7622 = {
>>>    	.pg_irq_sel = 0,
>>>    };
>>>    
>>> +static const struct mtk_ecc_caps mtk_ecc_caps_mt7986 = {
>>> +	.err_mask = 0x1f,
>>
>> Can't we use GENMASK() to define err_mask instead?
>>
>> #define MT7986_ERRNUM	GENMASK(4, 0)
>>
>> P.S.: Did I get that right? Is that referred to the ERRNUM(x) bits
> 
> Yes, you are right.
> I will change like
> #define ECC_ERRMASK(x) GENMASK(x, 0),
> since other IC driver data will use 0x3f and 0x7f err_mask.
> 

I would prefer, instead, something like

#define MT7986_ERRNUM	GENMASK(....)
#define MT7622_ERRNUM	GENMASK(....)
#define MT.... (etc)

instead of a macro calling another macro.

Regards,
Angelo



