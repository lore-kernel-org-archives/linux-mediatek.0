Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6479FD15DA8
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3Rgg0MJCMkfbcr4Si6GxlCe2/XCe13lLM5Bd5Kjvvw=; b=a50rgYMoAYAEgywkIW2gsB8JHn
	zkONryWz7osN3qntA/T4LlIEHUvLyjNyg41oeA6Y1DYCORAeCy4NozhARVEGVVQwfqVAmK248djth
	n8z0ywWJsEsJOr8TT3/S+nWxketDusL5KlZO481OAYIif6dwxBs4jnojTH376Heqq4/uT3ipHnFXi
	cxzNCBSEEpK8gAXdaPx6GG5jUkRAABAWrYsEQ16shsKfkzR9eL28sHxklun9gS3CONsOjAn/cq7an
	kK0iE5iz9hoWYEwV5dXwyEsFeG3ymUou+5o1qqqwaAIFz5/POpaTt+hnVTmAm1lwRwn1fcmyMdrDO
	lkaGANCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ts0-00000007han-3W2y;
	Mon, 21 Oct 2024 14:58:56 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tod-00000007gy8-3gVS;
	Mon, 21 Oct 2024 14:55:29 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f6e1f756so5308958e87.0;
        Mon, 21 Oct 2024 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729522526; x=1730127326; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g3Rgg0MJCMkfbcr4Si6GxlCe2/XCe13lLM5Bd5Kjvvw=;
        b=ORsSqBbOebu1l5vVVCTWvlUi9IySCELX93Vo/KE3h20KZKrMpxX5KZYuoa3/Jxh8AA
         9BGurvN2z03049NAgAgTk4JyW09xPda+5GDKuf6nGX7Y7owetnMFI5APmY6zg7De7AOO
         ykYDAyv2rrZZV3juw2vp1iRHPmIf+CeOrBccV/pKy3H5Eqyu1fqGHPxpHdz23pQMP4dS
         lt5qfAhloUqWw4jxEWZZz9R/xhwdzZPKD22ejpdKVZ3K11IXr7oQNwQxejYcPJSr4CL7
         6V4woWeCtcE1elbpWJLSa8uxLAapJgyC38grg9T31h1l5L3Q2jOHZqYn7z2ClgDwg+Kq
         GGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522526; x=1730127326;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g3Rgg0MJCMkfbcr4Si6GxlCe2/XCe13lLM5Bd5Kjvvw=;
        b=dy3Pi4SSb03fRmTi7JfEvk4HL5N0MrDxKYbpowJAQh+wV+2DUHRcQf6I7UnuTbleG7
         GnGhsitsZiPAPs8vs6qtXX+oN+ZXzPdomjbFxgqYImgWZLnJlMJozOD1qs43PFs9X4EH
         Zu71YXrxjIKv8qr8lBc/9E0eweIaI+hrFRZu+KUL3+yG+/65Mo6+tUvkGT78dhOAtFcd
         MB5NfjKF1uG5+W05vvn1eAHmlQz89LA+7lep3fnpTKqIM6NiWUvpsPWyrFC4EIucYdNO
         Qc5EM9/n8xqaM1NOaZTu6J0MctYnwXO4AHzqEo/FWNKgt+gpmvtMp2b4iE3tqLh3zkU6
         /M0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUPX7P/6VxnRjSCgt89XzaFtozFgdYzc9pBRDZun0RGr5yZkjekIzno78zKThqOY6boJiIRy6nKJRt8m2M5mRm@lists.infradead.org, AJvYcCXmRN9loek+NwRbepx/5xdIhxH1I7MDuKDGsX7Ijf1MADc8CO5l8lhquxGiTg1RvFtXrHiy31LRKTLuTdIR0OA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCgiE5Utin4OhWSuq1uFUyL5IM6OIhLdP2A3PYbrxoclkgaU51
	6M7tCSV2evvo6x8px3hZUTwwL2/TwRS7VsuCzhccCK1UFslKJ1OK
X-Google-Smtp-Source: AGHT+IE+YyScAjvYSe25yG8D2UmU8Xnhqk2eOEorogl+DBh/qWGlnW8rmng8G47tnMj4whqFWuze/w==
X-Received: by 2002:a05:6512:2316:b0:533:711:35be with SMTP id 2adb3069b0e04-53a15229c20mr5991228e87.26.1729522525660;
        Mon, 21 Oct 2024 07:55:25 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9137053csm210335266b.115.2024.10.21.07.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:55:21 -0700 (PDT)
Date: Mon, 21 Oct 2024 17:55:12 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 5/6] regulator: Add driver for MediaTek MT6328 PMIC
 regulators
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
Message-Id: <04OPLS.YYQIIIW9J73R3@gmail.com>
In-Reply-To: <4cf5a3d0-97a2-4a43-a91a-0a35aa2bc7e4@collabora.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
	<20241018081050.23592-6-y.oudjana@protonmail.com>
	<4cf5a3d0-97a2-4a43-a91a-0a35aa2bc7e4@collabora.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_075527_978837_A614A789 
X-CRM114-Status: GOOD (  21.61  )
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


On Mon, Oct 21 2024 at 15:24:51 +02:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 18/10/24 10:10, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> Add a driver for the regulators on the MT6328 PMIC.
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   drivers/regulator/Kconfig                  |   9 +
>>   drivers/regulator/Makefile                 |   1 +
>>   drivers/regulator/mt6328-regulator.c       | 479 
>> +++++++++++++++++++++
>>   include/linux/regulator/mt6328-regulator.h |  49 +++
>>   4 files changed, 538 insertions(+)
>>   create mode 100644 drivers/regulator/mt6328-regulator.c
>>   create mode 100644 include/linux/regulator/mt6328-regulator.h
>> 
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index 249933d6388dd..e9b9faff67f3a 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -862,6 +862,15 @@ config REGULATOR_MT6323
>>   	  This driver supports the control of different power rails of 
>> device
>>   	  through regulator interface.
>>   +config REGULATOR_MT6328
>> +	tristate "MediaTek MT6328 PMIC"
>> +	depends on MFD_MT6397
>> +	help
>> +	  Say y here to select this option to enable the power regulator of
>> +	  MediaTek MT6328 PMIC.
>> +	  This driver supports the control of different power rails of 
>> device
>> +	  through regulator interface.
>> +
>>   config REGULATOR_MT6331
>>   	tristate "MediaTek MT6331 PMIC"
>>   	depends on MFD_MT6397
>> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
>> index 9b69546fb3f65..c1a5a44413198 100644
>> --- a/drivers/regulator/Makefile
>> +++ b/drivers/regulator/Makefile
>> @@ -103,6 +103,7 @@ obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
>>   obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
>> +obj-$(CONFIG_REGULATOR_MT6328)	+= mt6328-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
>>   obj-$(CONFIG_REGULATOR_MT6357)	+= mt6357-regulator.o
>> diff --git a/drivers/regulator/mt6328-regulator.c 
>> b/drivers/regulator/mt6328-regulator.c
>> new file mode 100644
>> index 0000000000000..e15a64404f494
>> --- /dev/null
>> +++ b/drivers/regulator/mt6328-regulator.c
>> @@ -0,0 +1,479 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MediaTek MT6328 regulator driver
>> + * Based on MT6323 driver.
>> + *
>> + * Copyright (c) 2016 MediaTek Inc.
>> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
>> + */
>> +
> 
> ..snip..
> 
>> +/* The array is indexed by id(MT6328_ID_XXX) */
>> +static struct mt6328_regulator_info mt6328_regulators[] = {
>> +	MT6328_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
>> +		buck_volt_range1, MT6328_VPA_CON9, MT6328_VPA_CON11, 0x3f,
>> +		MT6328_VPA_CON12, MT6328_VPA_CON7),
> 
> Can you please fix the indentation?
> 
> Also, all of those entries do fit in two lines, I checked a couple of 
> those
> and always ended up with less than 90 columns anyway.

I can't seem to fit even the first one in 2 lines in under 90 columns :/
That is unless I don't indent the second line:

	MT6328_BUCK("buck_vpa", VPA, 500000, 3650000, 50000, buck_volt_range1,
	MT6328_VPA_CON9, MT6328_VPA_CON11, 0x3f, MT6328_VPA_CON12, 
MT6328_VPA_CON7),

Which I don't think is what you meant by fixing the indentation. Can 
you show me an example? With 100 columns on the other hand it seems 
like they should fit.
> 



