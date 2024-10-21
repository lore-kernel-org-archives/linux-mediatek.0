Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC49D15DA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqNfiZEfyDg/Xzyd/wdhSFkCd9cWx8IKi4PXqxUx9iE=; b=D8lx7RxmaGdusaiQ3QdDGWd20b
	84nFwVpL9UnpGLCSGeYOlsirW06bLGesSJOkjf/NFpuCSfnzLDKbD+sWjKzOHFXy7VlcKHPhf3NGX
	4YhnyFEfiq9jbqDTwGcMEC/h9aFp44pQ/k1YU1XMFll5g1V3nxchI0LFr9Juw6qbEv7V/1yIohvV9
	dtRt6dS+I/TFyYgsE8h39O35YHYxJtKiEfFo809Vswj2XjwS7tw71rErOqzHA/Eb61shpl2SG96BD
	qLwpdbB9oJYW7Fcg9Z8EboC5hrAemftGDXb9e5aSuKPACs1tj2NmAFukZS/mAyKmJpCYl/YjWwwR+
	zqEMBKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ts0-00000007haC-0lSQ;
	Mon, 21 Oct 2024 14:58:56 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2thu-00000007fVQ-2Isj;
	Mon, 21 Oct 2024 14:48:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5cb74434bc5so861485a12.0;
        Mon, 21 Oct 2024 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729522108; x=1730126908; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lqNfiZEfyDg/Xzyd/wdhSFkCd9cWx8IKi4PXqxUx9iE=;
        b=YrE8XwPOWZnoNK1pMj8wQJTOsn5PT4AR6ZRfdDhEXAsCm+XloW104ijw1NZmPlR+c1
         bXQFu2++Q5/BxDPqtH/VVT48FxFNfWNtCYviczMSYdzqF5Seoh6JAMxvjw2iy0kOZqtx
         mZQueoKsBOW/I1MleDpu43LI/Ok5WEMCuhFOyzDe5lEZeqociXN1oxuyTsH9H6Nos5go
         a/1wvC6K0nhhLcuNUpmFwxHp7lZZqD1nHzBZUM+QiENzy2UXHo5RBX2/iVrrF5iq8467
         5qWetdIJY2GyaO4daGOxNbCn6e0VFWNOvyBwgJGsRt14veoNHA3B4ErfHoW9WxU6/eLT
         DzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522108; x=1730126908;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqNfiZEfyDg/Xzyd/wdhSFkCd9cWx8IKi4PXqxUx9iE=;
        b=jsDOTV4dl20gpgVI79bfRJVVxfsDHmYvcPU4W5AyhIlqsZg/BTAht9lvLZ5hDQwRjF
         D1pilWd8ru4Wsw8/dcQYve6qHoSxTWpt8sHRYT3/8WBof/JrbAO+k1VfsxJN7C7tmGVV
         WLIss4lbtQnkH8XQwP5RCp6eVwJSIHYKA/AIqtOw3Q5lSOpdLdLY0t/DMSWZ9ydg1mjL
         M5YfD8u+1BvzHzD/+U2y9REdw22GtHcSTsqg5Nkc3s/xn2DwFRdl3pzxi5TbCOulZ6jJ
         ks905HnQpuo3AXjnjtuUftKYDj2r8xhPwuWabZ3AaeTBEhKzMowbPYP5la8On3SLpI7u
         T05A==
X-Forwarded-Encrypted: i=1; AJvYcCViLG7xlI2PixZkkGbnrR4BFTgkinnYMV2X2NW9YuOxL8NDKgxbippwrvUnPe+FXdwDIifirJEvs/sM3VBhNGew@lists.infradead.org, AJvYcCXzB54IsI8RAbkOuyQljDzNVoGevHyWfHkWKFHSCS6YglIS0JRb26qsnimQ1iUtKYfA8o40e8ja17QLJb6xHto=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8P7f23w47sQJPC5pBDKjDz9D0yDti18NfrgnE7+f9Tkpdydrs
	XjWnGL0Nx4NEKqXy63yOysZKEpzN8fHWz9uGMXzXmPl7R1vhFYhw
X-Google-Smtp-Source: AGHT+IH4U3SXhrAaQiY7SVXU0+/eI8eKxa5cP+eHUn6309fKUSYC/NaCMjDZs7vXcbpGn1PYh18A5w==
X-Received: by 2002:a17:907:2cc6:b0:a99:89bd:d84a with SMTP id a640c23a62f3a-a9a69a68f50mr1250232866b.25.1729522108334;
        Mon, 21 Oct 2024 07:48:28 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9159a231sm210780966b.210.2024.10.21.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:48:26 -0700 (PDT)
Date: Mon, 21 Oct 2024 17:48:17 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 3/6] soc: mediatek: pwrap: Add support for MT6735 and
 MT6328 SoC/PMIC pair
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones
	<lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, jason-ch chen
	<Jason-ch.Chen@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Flora Fu
	<flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Message-Id: <HSNPLS.P9M4WFJGIA0V2@gmail.com>
In-Reply-To: <b24d984f-c944-4faf-bce9-96052abb085b@collabora.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
	<20241018081050.23592-4-y.oudjana@protonmail.com>
	<b24d984f-c944-4faf-bce9-96052abb085b@collabora.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_074830_778890_F23C8F89 
X-CRM114-Status: GOOD (  32.41  )
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


On Mon, Oct 21 2024 at 15:25:00 +02:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 18/10/24 10:10, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> Add register definitions and configuration for the MT6735 SoC and the
>> MT6328 PMIC which are commonly paired and communicate through the 
>> PMIC
>> wrapper.
>> 
>> Note that the PMIC wrapper on MT6735M has a slightly different 
>> register
>> map and is therefore NOT compatible with MT6735.
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   drivers/soc/mediatek/mtk-pmic-wrap.c | 251 
>> ++++++++++++++++++++++++++-
>>   1 file changed, 248 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c 
>> b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> index 9fdc0ef792026..b9e8dd2a5999d 100644
>> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> @@ -3,6 +3,7 @@
>>    * Copyright (c) 2014 MediaTek Inc.
>>    * Author: Flora Fu, MediaTek
>>    */
>> +
>>   #include <linux/clk.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/io.h>
>> @@ -100,7 +101,7 @@ enum dew_regs {
>>   	PWRAP_DEW_CIPHER_MODE,
>>   	PWRAP_DEW_CIPHER_SWRST,
>>   -	/* MT6323 only regs */
>> +	/* MT6323 and MT6328 only regs */
>>   	PWRAP_DEW_CIPHER_EN,
>>   	PWRAP_DEW_RDDMY_NO,
>>   @@ -121,8 +122,10 @@ enum dew_regs {
>>   	PWRAP_RG_SPI_CON13,
>>   	PWRAP_SPISLV_KEY,
>>   -	/* MT6359 only regs */
>> +	/* MT6359 and MT6328 only regs */
>>   	PWRAP_DEW_CRC_SWRST,
>> +
>> +	/* MT6359 only regs */
>>   	PWRAP_DEW_RG_EN_RECORD,
>>   	PWRAP_DEW_RECORD_CMD0,
>>   	PWRAP_DEW_RECORD_CMD1,
>> @@ -171,6 +174,23 @@ static const u32 mt6323_regs[] = {
>>   	[PWRAP_DEW_RDDMY_NO] =		0x01a4,
>>   };
>>   +static const u32 mt6328_regs[] = {
>> +	[PWRAP_DEW_DIO_EN] =		0x02d4,
>> +	[PWRAP_DEW_READ_TEST] =		0x02d6,
>> +	[PWRAP_DEW_WRITE_TEST] =	0x02d8,
>> +	[PWRAP_DEW_CRC_SWRST] =		0x02da,
>> +	[PWRAP_DEW_CRC_EN] =		0x02dc,
>> +	[PWRAP_DEW_CRC_VAL] =		0x02de,
>> +	[PWRAP_DEW_MON_GRP_SEL] =	0x02e0,
>> +	[PWRAP_DEW_CIPHER_KEY_SEL] =	0x02e2,
>> +	[PWRAP_DEW_CIPHER_IV_SEL] =	0x02e4,
>> +	[PWRAP_DEW_CIPHER_EN] =		0x02e6,
>> +	[PWRAP_DEW_CIPHER_RDY] =	0x02e8,
>> +	[PWRAP_DEW_CIPHER_MODE] =	0x02ea,
>> +	[PWRAP_DEW_CIPHER_SWRST] =	0x02ec,
>> +	[PWRAP_DEW_RDDMY_NO] =		0x02ee,
>> +};
>> +
>>   static const u32 mt6331_regs[] = {
>>   	[PWRAP_DEW_DIO_EN] =		0x018c,
>>   	[PWRAP_DEW_READ_TEST] =		0x018e,
>> @@ -394,7 +414,7 @@ enum pwrap_regs {
>>   	PWRAP_ADC_RDATA_ADDR1,
>>   	PWRAP_ADC_RDATA_ADDR2,
>>   -	/* MT7622 only regs */
>> +	/* MT7622 and MT6735 only regs */
>>   	PWRAP_STA,
>>   	PWRAP_CLR,
>>   	PWRAP_DVFS_ADR8,
>> @@ -417,6 +437,8 @@ enum pwrap_regs {
>>   	PWRAP_ADC_RDATA_ADDR,
>>   	PWRAP_GPS_STA,
>>   	PWRAP_SW_RST,
>> +
>> +	/* MT7622 only regs */
>>   	PWRAP_DVFS_STEP_CTRL0,
>>   	PWRAP_DVFS_STEP_CTRL1,
>>   	PWRAP_DVFS_STEP_CTRL2,
>> @@ -481,6 +503,50 @@ enum pwrap_regs {
>>   	/* MT8516 only regs */
>>   	PWRAP_OP_TYPE,
>>   	PWRAP_MSB_FIRST,
>> +
>> +	/* MT6735 only regs */
>> +	PWRAP_WACS3_EN,
>> +	PWRAP_INIT_DONE3,
>> +	PWRAP_WACS3_CMD,
>> +	PWRAP_WACS3_RDATA,
>> +	PWRAP_WACS3_VLDCLR,
> 
> Are you sure that you need the PWRAP_MD_ADC_xxxx registers in here?
> 
> Since MD is relatively big on its own, I'm not sure how to proceed 
> here.. it may
> make sense to split the MD part to a different array, or it may 
> not... I do need
> to understand what's going on.
> 
> Can you please point me at some reference code to look at, so that I 
> can understand
> the situation a bit?
> 
> Besides, I'm noticing that the "MD_ADC_RDATA_ADDR_R(x)" are 
> sequential registers
> and that's on more than just MT6735: instead of having 32 more 
> entries, it might
> make more sense to set only the first and declare the number (or 
> size) of regs...
> 
> Something like:
> 
> enum pwrap_regs {
> 	.....
> 	PWRAP_MD_ADC_RDATA_ADDR_LATEST,
> 	PWRAP_MD_ADC_RDATA_ADDR_WP,
> 	PWRAP_MD_ADC_RDATA_ADDR_R0,
> 	PWRAP_MD_ADC_STA0,
> 	PWRAP_MD_ADC_STA1,
> 	PWRAP_MD_ADC_STA2
> };
> 
> static const struct pmic_wrapper_type pwrap_mt6735 = {
> 	.regs = mt6735_regs,
> 	.num_md_addr = 32,
> 	[other stuff]
> };
> 
> ...but again, please, if you can point me at an implementation that 
> actually
> uses the R(x) registers, that'd be better ... so that we can choose 
> the best
> option to add those in there.
> 
> Everything else is great: good job :-)
> 
> Cheers,
> Angelo

I just defined all the registers I could find. We aren't using them for 
anything yet so it's also fine to keep them out for now.

It seems that in the downstream kernel they are only initialized once 
and never accessed again. This is the only place I could find where 
they are accessed:
https://gitlab.com/Tooniis/linux-samsung-grandpplte/-/blob/master/drivers/misc/mediatek/pmic_wrap/mt6735/pwrap_hal.c#L1254-1290



