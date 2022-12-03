Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D74C352A1
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FoIrF7kCNUtvu8wYA9TbwcdtJkwsf3xKM7GSL38E1UY=; b=KwFgdZ9met7lelDcTCwQImjeoJ
	9aDyV2WyPUfaUBVf13gRRrON5sIdm0GyvtxyddsGXpTF4YhNlebwrgAPSuSs0ZKJdmMArwVOjW9ny
	RaO1hj9dQBU4PsyaziZOLhws+Cnsyq9Sx6nT4x0KpShzZOkx2HTv+DV2BBzhve1JVIvHHfN6CYnmB
	0EPB5XgXqld6k0LA3sIuPYhSppWffg+egYWmVa6u3vtwYQO6lK9hz6ABNucOZpae4/2RVOy8FHskw
	7NM/7etYyfN1Z1c9chMhTkXs7obPKBHedpWhrRhaIjAQVeRRRyMWtw0W8jUFo7i1B5/s7NgfC35DA
	Ag+iQtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1S3l-003YFy-KE; Sat, 03 Dec 2022 12:56:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1S3j-003YFS-Jm
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 12:56:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay8-20020a05600c1e0800b003d0808d2826so3515086wmb.1
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Dec 2022 04:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FoIrF7kCNUtvu8wYA9TbwcdtJkwsf3xKM7GSL38E1UY=;
        b=B/A+yde22CoSRt1erNSW9PIkw5uDNbCXjfPiWd6DgUkYxprrUD0GWDbRlPdmwKogdt
         xnv176ctbxHL+wa5NuovkgoRvGr81JimgEtVPgvGFhO9sQzcr5sWGf2QtI9/KOXgSOY7
         go7rFA1A90ed3w+OtFc8Cg/spmN0CvT20zWj60Ti1CGfDwuemjXrJo1B+/WnM1ylvak5
         6YPwneMzBadTLqnyHIf1SGyUOWNf6ElPY4EyfMmyMn0nr+uX5QJaasG9bjQR7ucRCPhM
         mGvJ7DsPfNnkZIkIMR2ATHC0sCG1XhmL+J9usIviSMIWt3w2pFpCbL9U47RDffZCmvWu
         c1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FoIrF7kCNUtvu8wYA9TbwcdtJkwsf3xKM7GSL38E1UY=;
        b=Yw/6QnOFmYHERKZR+cUlZS2xJ6X3xCfqdKHSOhhrPafnncKSwynYgyxS9wYur89YV8
         7HNJYKdTMqoakEzm3GH1p543P8kjALb0/SVK/cvjX5R58Co9Tq5omhjoguelvBzodjXn
         HNL62sFPoEsEuz23EGWf6t3IiVjpph2+GkK2ywUpAXIkMnuT+xHeBuu5F1YACFRvt1RC
         NjnC4+P7K02r+Ywab2olTiQR4K4DoRl8STwCM4oP4rkZbQpyczdWNUD4ccFyVrsvbvCG
         L/RajBBEdVdQtAvbN8br3YmJun6ag6PGFTJFJN5u03PiLLnZxprCysMsXNjVOf0iIOym
         0F0A==
X-Gm-Message-State: ANoB5pktgh9py3Vow5wgYhJHEPfB0mLYf5/hGN1FMspopXTm+WxFQvLj
	3kVFoOkfc0n0ShT0yX31Wn8=
X-Google-Smtp-Source: AA0mqf68LQWYxzcpEE4UyZ1RNDhyoFlE9YQyZCuImQDl33nlRfA943Xd2rrT4EGiTuC72/qHAVYx4w==
X-Received: by 2002:a05:600c:3d08:b0:3cf:e84d:6010 with SMTP id bh8-20020a05600c3d0800b003cfe84d6010mr45826052wmb.197.1670072157348;
        Sat, 03 Dec 2022 04:55:57 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j3-20020adfd203000000b002366c3eefccsm9546293wrh.109.2022.12.03.04.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 04:55:56 -0800 (PST)
Date: Sat, 3 Dec 2022 15:55:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: shayne.chen@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7
 (802.11be) devices
Message-ID: <Y4tHWWBKBU4GaMkX@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_045559_694997_2CADF334 
X-CRM114-Status: UNSURE (   6.02  )
X-CRM114-Notice: Please train this message.
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

Hello Shayne Chen,

The patch 98686cd21624: "wifi: mt76: mt7996: add driver for MediaTek
Wi-Fi 7 (802.11be) devices" from Nov 22, 2022, leads to the following
Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c:72 mt7996_eeprom_load()
	error: uninitialized symbol 'free_block_num'.

drivers/net/wireless/mediatek/mt76/mt7996/eeprom.c
    55 static int mt7996_eeprom_load(struct mt7996_dev *dev)
    56 {
    57         int ret;
    58 
    59         ret = mt76_eeprom_init(&dev->mt76, MT7996_EEPROM_SIZE);
    60         if (ret < 0)
    61                 return ret;
    62 
    63         if (ret) {
    64                 dev->flash_mode = true;
    65         } else {
    66                 u8 free_block_num;
    67                 u32 block_num, i;
    68 
    69                 /* TODO: check free block event */
    70                 mt7996_mcu_get_eeprom_free_block(dev, &free_block_num);

free_block_num is not initialized if mt7996_mcu_get_eeprom_free_block()
fails.

    71                 /* efuse info not enough */
--> 72                 if (free_block_num >= 59)
    73                         return -EINVAL;
    74 
    75                 /* read eeprom data from efuse */
    76                 block_num = DIV_ROUND_UP(MT7996_EEPROM_SIZE, MT7996_EEPROM_BLOCK_SIZE);
    77                 for (i = 0; i < block_num; i++)
    78                         mt7996_mcu_get_eeprom(dev, i * MT7996_EEPROM_BLOCK_SIZE);
    79         }
    80 
    81         return mt7996_check_eeprom(dev);
    82 }

regards,
dan carpenter

