Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509A0C04A6A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJfh6GC8aHch959POkYyqkTUnj4NnXdjMKw7FcRwKoc=; b=g2Lsr23fLOO7hHlGJ1eEsS5tb9
	eIrq8ygw8EbU7twZRv6owIKrKfUt7XKFNZtMBM7Z6e+9qbHID02XtbLsekOgo6MLA+LAIr2kRS+aW
	HTs/sHdUaktbecToM25y/20lkWxRxUfVbVp0+bJHHgl1MCK7xUiRsNDws0sanZHVeFMARBF5AUjU/
	jrTUOzPu+DmeL7CZpDeMUnqbQBwxwK/i3b0oo1gKkWgC6mZLehSCZLF0XU7DMsBNayfjciF5RtNOT
	ms3yR481+Gnt5BnZLZH5nfCTgOQ/K/jfcRDLcZC4HEE1+clmYjH0r38myFkboCAyTBwz1l1Wtj1Ij
	rfRIstWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFm7-0049wY-0k;
	Wed, 16 Aug 2023 12:37:23 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFlw-0049tB-1O;
	Wed, 16 Aug 2023 12:37:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3514AA06;
	Wed, 16 Aug 2023 14:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1692189428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJfh6GC8aHch959POkYyqkTUnj4NnXdjMKw7FcRwKoc=;
	b=u8hsom4F23QN+Q0vmRp43G18VGyk4NagNu0MBrNjIj82pxXy7IdgNV1LyTKVVledQSz0Mr
	yWqNrOj03deQUT0jvO8ZmrKfCDriYz9ymRcOGi9FU2T5d0Wbs/p088U7l0anJN/JvEFOu0
	gEvQd+3d60Qg3aElZTBAvP9OJPTrCzb1vUnAhZJGSMps6CWM1kQ58UFp+laD9NR5/rcw1n
	C1tWsUsHbPCaeKpN9GnRRcpO5a6NkVK9RA7baa99xytvA59XKaUtFl0ZpgUs+d54oRVXFg
	NgpVc/pmdUwmfzBl1mXRHjIQvgjjrtSl+fT8m9Qo4GCuwQtGVtSDq9dtjW841A==
MIME-Version: 1.0
Date: Wed, 16 Aug 2023 14:37:07 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal
 )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
In-Reply-To: <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
References: <20230816104245.2676965-1-hsinyi@chromium.org>
 <6702bac712daab13698b9bb9ad81d49e@walle.cc>
 <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org>
 <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
 <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
Message-ID: <ecfe1bc6799755d1f2c6f94b8cb59b27@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_053712_664951_44DEABDF 
X-CRM114-Status: GOOD (  18.48  )
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

Hi,

>>>> like a fundamental problem and that commit 39d1e3340c73 ("mtd: 
>>>> spi-nor:
>>>> Fix clearing of QE bit on lock()/unlock()") is broken in that 
>>>> regard.
>>> 
>>> what's wrong with the mentioned commit?
>> 
>>         } else if (nor->params->quad_enable) {
>>                 /*
>>                  * If the Status Register 2 Read command (35h) is not
>>                  * supported, we should at least be sure we don't
>>                  * change the value of the SR2 Quad Enable bit.
>>                  *
>>                  * We can safely assume that when the Quad Enable 
>> method is
>>                  * set, the value of the QE bit is one, as a 
>> consequence of the
>>                  * nor->params->quad_enable() call.
>>                  *
>>                  * We can safely assume that the Quad Enable bit is 
>> present in
>>                  * the Status Register 2 at BIT(1). According to the 
>> JESD216
>>                  * revB standard, BFPT DWORDS[15], bits 22:20, the 
>> 16-bit
>>                  * Write Status (01h) command is available just for 
>> the cases
>>                  * in which the QE bit is described in SR2 at BIT(1).
>>                  */
>>                 sr_cr[1] = SR2_QUAD_EN_BIT1;
>>         } else {
>>                 sr_cr[1] = 0;
>>         }
>> 
>> "We can safely assume that when the Quad Enable method..". We cannot, 
>> if we
>> don't have 4 I/O lines. The quad_enable is just the op how to do it, 
>> but not
>> *if* can do it. It seems to be missing the same check as the
>> spi_nor_quad_enable(). But I'm not sure if it's that simple.
>> 
> 
> I see. Then extending the if condition should do the trick, as
> spi_nor_write_16bit_sr_and_check() is called after setup. Something
> like:
> 
> if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
>     spi_nor_get_protocol_width(nor->write_proto) == 4 &&
>     nor->params->quad_enable)
> 
> Is this what Hsin-Yi is hitting?

Hopefully :)

-michael


