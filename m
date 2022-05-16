Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD664C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ON+BDQy22Cf1dckFkNqSScodgh9TFjstFqDZWS3iA+c=; b=ebhwgTQ/z+N5C/
	1pn2T0649J0Z3T+e9YzRKd4kOK4TZ7Scx293aL6TtLAJV2ijienpvsS3mrf6C/XnKtjx+60flICnS
	2adqBK5lOUzjUk8pCGq1Pbplwws9SPI3DiIgaP/Fn/v94U1X5SXNqtWiFuPqiTCBDuN0WpNjw/E2i
	Hasz/la73WstDdDZwOhbPB64HOsNCPX8XvGttX5lPIXa1l+0fOZxLZqFKprj6U+fW4HKmXtvCyyP6
	idjuQVRQkkRM/C2Uch0mZ0u78vEh/h5Ru+bul3FwO/jV+BgRIE1rARJekM1JR9xunPsGM4wENmazK
	tBScU+t2UqgKsQxYcZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqVCI-006TTW-Q2; Mon, 16 May 2022 07:31:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqVBv-006TJT-0C
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 07:30:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id r30so1504783wra.13
 for <linux-mediatek@lists.infradead.org>; Mon, 16 May 2022 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=aotE6OIWBWcMAPi2qqhhLJmw3JfHuAoIxd975f4asGo=;
 b=p50ytBaXArwLqIx9ZuK2RaNm29nxjYQrBkovzkLjtC2CeBs8QG0NPGeqEZIzZU3o5h
 A4tP0viD1OY8LtLfwheDor3V/lmTQoUEsXLvHHqNqRyciYxG9I2cXSv+y68LzqQ0hvTU
 IRV0ijY69+GEAj2bv1sq05P6KnZJ4/7Kr+Ziyh7P4yfenHl7PNehvZM5oXk7M3161hw/
 BrTNrIXMFMLVXjVMh5oEyZ9oegGVmOp88ovQKx7VX0Zt+PG/1LNX2owiNHD9knLes+6B
 GJxwaxivXhwAFnXh7T+FTOCUKrGKCpRq7cJdx8WD6uIR3JZ7vPtesOavbE/lEbNeBI45
 kHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aotE6OIWBWcMAPi2qqhhLJmw3JfHuAoIxd975f4asGo=;
 b=QTWI49yM/9zOkOaU/0OBktRIMZM6okQKZfNf3fUl4OtJx+T0bsFe1hxrlGxzY12OYA
 0VxkSzC7h/KPp4tyHM8wYj+L0adk9owAXiNOJzz9y8ZEnsitaN9rc86nM4haKIQJ56Dm
 6zftWGC3sOKRbe47rprbj0YFRRisIB9aSu77DRbyrckYI7u4lPQQsD/bsvSoEZNDhNIB
 bsWb+I2RaFFoY4889rHG3E15oog00JtzWkCnAu8JxdX0TWTDWp3CVa/TzrF/TuZNLSVH
 sg2u7AtSg3yXZjudKZB+xWUM//0eSkaDihUNhzgtcIZ6edfrJNxMvJ/jBbZEnP/4gay5
 kFuw==
X-Gm-Message-State: AOAM532m/Uv9m6izzWBbq+IAiajg1CzCXqkMgG2c0VCSfU59d1stZ9R5
 c2pmTEhN6J6Duq8XEU8ubqPPUg==
X-Google-Smtp-Source: ABdhPJz8SDT8s/y8iDCPKO++gfmDYIj8bfPvrtjBR3u4ZNO4AJVGNlkVbfv1MybV9Lo8reF7IVvVTg==
X-Received: by 2002:a05:6000:716:b0:20c:4cda:b38c with SMTP id
 bs22-20020a056000071600b0020c4cdab38cmr13182687wrb.226.1652686253793; 
 Mon, 16 May 2022 00:30:53 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:6d30:f384:3f7:365e])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a7bc7cc000000b003942a244f39sm14468765wmk.18.2022.05.16.00.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 00:30:53 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Kevin Hilman
 <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] Input: mt6779-keypad - fix hardware code
 mapping
In-Reply-To: <YoHf6Z4HTfh4Y+bn@google.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
 <20220513151845.2802795-2-mkorpershoek@baylibre.com>
 <YoHf6Z4HTfh4Y+bn@google.com>
Date: Mon, 16 May 2022 09:30:52 +0200
Message-ID: <874k1qkk7n.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_003055_146253_93FBA18C 
X-CRM114-Status: GOOD (  23.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

Thank you for your review,

On dim., mai 15, 2022 at 22:23, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Fri, May 13, 2022 at 05:18:44PM +0200, Mattijs Korpershoek wrote:
>> In mt6779_keypad_irq_handler(), we
>> 1. Read a hardware code from KPD_MEM1 -> KPD_MEM5
>> 2. Use that hardware code to compute columns/rows for the standard
>>    keyboard matrix.
>> 
>> According to the (non-public) datasheet, the
>> map between the hardware code and the cols/rows is:
>> 
>>         |(0)  |(1)  |(2)
>>     ----*-----*-----*-----
>>         |     |     |
>>         |(9)  |(10) |(11)
>>     ----*-----*-----*-----
>>         |     |     |
>>         |(18) |(19) |(20)
>>     ----*-----*-----*-----
>>         |     |     |
>> 
>> This brings us to another formula:
>> -> row = code / 9;
>> -> col = code % 3;
>
> What if there are more than 3 columns?
That's not supported, in hardware, according to the datasheet.

The datasheet I have states that "The interface of MT6763 only supports
3*3 single or 2*2 double, but internal ASIC still detects keys in the
manner of 8*8 single, and 3*3 double. The registers and key codes still
follows the legacy naming".

Should I add another patch in this series to add that limitation in the
probe? There are no checks done in the probe() right now.

>
>> 
>> Implement this mapping in bitnr_to_col_row() to fetch the
>> correct input event from keypad->input_dev->keycode and report that
>> back to userspace.
>> 
>> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
>> Co-developed-by: Fabien Parent <fparent@baylibre.com>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> ---
>>  drivers/input/keyboard/mt6779-keypad.c | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
>> index 2e7c9187c10f..23360de20da5 100644
>> --- a/drivers/input/keyboard/mt6779-keypad.c
>> +++ b/drivers/input/keyboard/mt6779-keypad.c
>> @@ -36,6 +36,19 @@ static const struct regmap_config mt6779_keypad_regmap_cfg = {
>>  	.max_register = 36,
>>  };
>>  
>> +/*
>> + * | hardware key code | col0 | col1 | col2|
>> + * | ----------------- | -----| ---- | --- |
>> + * | row0              | 0    | 1    | 2   |
>> + * | row1              | 9    | 10   | 11  |
>> + * | row2              | 18   | 19   | 20  |
>> + */
>> +static void bitnr_to_col_row(int bit_nr, int *col, int *row)
>> +{
>> +	*row = bit_nr / 9;
>> +	*col = bit_nr % 3;
>> +}
>> +
>>  static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
>>  {
>>  	struct mt6779_keypad *keypad = dev_id;
>> @@ -61,8 +74,7 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
>>  		if (bit_nr % 32 >= 16)
>>  			continue;
>>  
>> -		row = bit_nr / 32;
>> -		col = bit_nr % 32;
>> +		bitnr_to_col_row(bit_nr, &col, &row);
>>  		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
>>  		/* 1: not pressed, 0: pressed */
>>  		pressed = !test_bit(bit_nr, new_state);
>> -- 
>> 2.32.0
>> 
>
> -- 
> Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
