Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 07:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfFiU73893T1Fa/5dggtBlPlTtldotWba2sU/rCkP7U=; b=CSkgzGN5fHpYYP
	AUI4J7L/5kLpKtPr6rEvYd0+E/G3o8CSUhOYmNy90l5PjoYBafvlKe9eTR37lBqc5KB0sNzBdpgMg
	5/OyLbM67BBBfm/8TMF2wAGKpAuiNiDPVA7AEZ1/7eYTtzxOryQ6uMClKAHbQF5qsVchycYsIdWWC
	C2kmrROFa3VRk6mCM2xSddip3xgJRT2hBvdyNnm2ZRU3GaLgWxAA7CL0Dl+uCcGXKyBxUwMK6sznT
	HFSGB8Vhzz3gxZz9XKw5sBRnk3Ke/x+tyHr1cqyEUmW7Y1lvlZB4XbHmnAs7BwS55Z2YMdOS0Zct/
	cBBIyktWgR+w2rteoJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqVC7-006TOh-U2; Mon, 16 May 2022 07:31:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqVBu-006TI0-Ge
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 07:30:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id k26so345506wms.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 May 2022 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=NPhY2bRivndPO9ypmcyDBMt4UFQv/RM1UMuCHVzxwwo=;
 b=Dp55FezJWQYvlBXps2+7sCaZUcdWQklUQKfUoJn1oHUMJtK1jBetICi9NYGPQ/gMAn
 zn2dkZUl7MnKjarvXEx65nuZV8I8kTUq4hBC6yy2/HEyiocWa60DnbvpX9cdZClwEMWj
 0PuUHm3UJV/J9GZWuq+lpDyrFwYJyqo6BE/EaR2w0h4y1qwJC8FUIO54/ue8kHx4Y9C+
 H/WPgIAB/G4A9CTpZoa91EMucJH54IenI+1M5wAlGAIgwkxF0ZWIo2nwsxqdwFZd3o/G
 UxizcWclR87hKlrN6UXiX3ejmu8N+LB9ZXl62v82ekHb1V1GS2LsWpuKMNv/QdVaatUe
 SIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=NPhY2bRivndPO9ypmcyDBMt4UFQv/RM1UMuCHVzxwwo=;
 b=ZYhL3xL7c0n7n1Ssi4GBfdpIexuh61U4hiDhZDh8On0HJnbJThUUe73aBg/EYc75Qq
 1Hqwre6v5UoNk40b/rZ+cTuAp6I4SrpJfMlP+ZqX04oAVXVN0LdUdkdcfyAXpjwxJXW0
 +BgdsJBaPLtxh1ND30xnrVqRcwC1h0Nv3xUzC4wuP0l7589YZFgcvkjicEwPun8N//9V
 pKGvMNNPy9H+KXwwfEjl+uJY6KStscMviVt3aOWG1j5NSmG6ATWGS0vZTD4eriSQ1TFf
 gixGHmdQ4f+3BylX/dSp6peZ18YDqaoLzmUVhTadn/X5NF3O/jEWxLniwldHpxTn5Iyt
 2O5A==
X-Gm-Message-State: AOAM533PpSlrxNyK8QVuDsW1us9rrz0vJ1POHNfDuVaGZVu8KS0SDste
 FU8kTyf77c1M7VJ1Ce7XHzey4w==
X-Google-Smtp-Source: ABdhPJz6+ODhxpvzTQwFkv//+c83ewq2117c0KUzKdjqeGZoLLk+h26lrIkZ2M2yCFw4KQ19w6kbCw==
X-Received: by 2002:a05:600c:26d2:b0:393:fb8c:dc31 with SMTP id
 18-20020a05600c26d200b00393fb8cdc31mr26114507wmv.129.1652686250915; 
 Mon, 16 May 2022 00:30:50 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:6d30:f384:3f7:365e])
 by smtp.gmail.com with ESMTPSA id
 n19-20020adfc613000000b0020c5253d927sm8772239wrg.115.2022.05.16.00.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 00:30:50 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Kevin Hilman
 <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 2/2] Input: mt6779-keypad - implement row/column
 selection
In-Reply-To: <YoHfUYmq49V5Bygd@google.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
 <20220513151845.2802795-3-mkorpershoek@baylibre.com>
 <YoHfUYmq49V5Bygd@google.com>
Date: Mon, 16 May 2022 09:30:49 +0200
Message-ID: <875ym6kk7q.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_003054_588300_830E9985 
X-CRM114-Status: GOOD (  19.65  )
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

On dim., mai 15, 2022 at 22:21, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Fri, May 13, 2022 at 05:18:45PM +0200, Mattijs Korpershoek wrote:
>> The MediaTek keypad has a total of 6 input rows and 6 input columns.
>> By default, rows/columns 0-2 are enabled.
>> 
>> This is controlled by the KP_SEL register:
>> - bits[9:4]   control row selection
>> - bits[15:10] control column selection
>> 
>> Each bit enables the corresponding row/column number (e.g KP_SEL[4]
>> enables ROW0)
>> 
>> Depending on how the keypad is wired, this may result in wrong readings
>> of the keypad state.
>> 
>> Program the KP_SEL register to limit the key detection to n_rows,
>> n_cols we retrieve from the device tree.
>> 
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> ---
>>  drivers/input/keyboard/mt6779-keypad.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
>> index 23360de20da5..653dfc619696 100644
>> --- a/drivers/input/keyboard/mt6779-keypad.c
>> +++ b/drivers/input/keyboard/mt6779-keypad.c
>> @@ -17,6 +17,11 @@
>>  #define MTK_KPD_DEBOUNCE	0x0018
>>  #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
>>  #define MTK_KPD_DEBOUNCE_MAX_MS	256
>> +#define MTK_KPD_SEL		0x0020
>> +#define MTK_KPD_SEL_COL	GENMASK(15, 10)
>> +#define MTK_KPD_SEL_ROW	GENMASK(9, 4)
>> +#define MTK_KPD_SEL_COLMASK(c)	(MTK_KPD_SEL_COL >> (6 - (c)))
>
> Would it be clearer to say
>
> #define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 3, 4)
Per my understanding, GENMASK is mostly used for build-time constants
since it does compile-time checks with BUILD_BUG_ON_ZERO.

Since "c" is defined at run time (as it comes from keypad->n_cols, which
comes from the device tree), it felt more appropriate to not use GENMASK.

Looking again, i've found examples in sound/soc/codecs/cs35l41-lib.c
that use GENMASK with a run-time value.

Will send a v2 using GENMASK, thank you for the suggestion.

>
> ?
>
> Thanks.
>
> -- 
> Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
