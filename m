Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF26C47088
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7iZLbj/0LA/5WX181I6xzw8Ag37adaCwn9reU61rJy0=; b=sMAiorBfaZRSMxlUp9C8ym22tv
	+eJLFunRjZCDaoprzXNTgBCfEzRJVmXHU4pocQhxK/E+mwlwiXa0VQRQfmDGIkpuuXhSeq2gkolLL
	j7eqqX1TLTwv1DctRdv0nf0j6mIRKHvj9rkokvX+8xpQTRr25I/AhCITFblKro+YSQqHPrmlwnjoP
	5YtdBGx78CAnOpiItINLjrcQ4SFwuA9Ap/RNV2kFpdQSjNvyOFqZnhZf2EGtqneoLHJ1Ht2qzpTNT
	PP37KHryMl5WwI/Yh65kJSr9F2+CgGnsCGwaLd0vr6YasnqZa2dzvp8I4a13v+yPxiAbmAK8IB+Pq
	Gr9xbvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1S2p-003YBZ-Mi; Sat, 03 Dec 2022 12:55:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1S2m-003YB3-Ll
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 12:55:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id n7so5401774wms.3
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Dec 2022 04:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iZLbj/0LA/5WX181I6xzw8Ag37adaCwn9reU61rJy0=;
        b=ko9o9HIjwLaWDCBC/d/OlezbL0XGt4W2ywxvuB07QWd9R4jkoGlzOL8USB8ifAgK7G
         zSvOyc0cKSPvulD+NvbYUeNw6iZu9Ck27kI3WQG1qdVCxWq1vOqabMEV1yIjht+9OJ9z
         gZqIkvUeV8obWS7vPx7Qt1OhQd6N0MXh3vq656YK4BbaZ5kJ5wtr4h0trx88gsJc2CxW
         DCfC6i2WUSFhpToLZlqZnxr3F0mou387TeU6PetuS6ChhAgw803qisgR6ef/Gp35a1yk
         Y1vJPLhHBLcWToVO7mcfENCcmlDdDPzdO/CR8H4sGYxm1JTx6YcrY1jI2Bw5uyFM9jeI
         eYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iZLbj/0LA/5WX181I6xzw8Ag37adaCwn9reU61rJy0=;
        b=rsNPF4ILg8kObpVgApd4UMse6YkHShoanU4bWTl/l/rW9WKhVfj70e8DwUgvDzsvl+
         AcfXxe4QYqsDxmCv1+NWPFQnTwD5ojgmwbHudLMZCRYO4VYbLhRfcH/3ErIm5d9I1uyc
         lgFu4U7N66v1V+11cL6U7b6BC+tsOUuIaVdjMZ+hdK6gC1Ai91HITlqehEwCSKQNBRD0
         iNMKvaRj+/IM5BAEYyeGPXFkXugPDhlolC0JAwB9I4fAgiLXYGl91KYSzjUmpm6GtBf2
         hOq33SY9A0nQPHneYU+Nfau5PfHTl/VY1Lua3qIj8Dufh4LdbzxybKrwpUmudjJQtliX
         2m9A==
X-Gm-Message-State: ANoB5pmSEguPJPrnQIZzlQu5iZHy8IpmNDcKsGDDqQ06dmXnQYBndcqg
	mxrKiHLz5QL23OjQP/Lqe10=
X-Google-Smtp-Source: AA0mqf4vRyqthvBgCEePEVOfTmYEo5q8/NMcFBzFddHlvq7JwuSjiCRImSTIrtO31QXqYJjflgb8zw==
X-Received: by 2002:a05:600c:3586:b0:3cf:a3b0:df6a with SMTP id p6-20020a05600c358600b003cfa3b0df6amr57459613wmq.126.1670072097765;
        Sat, 03 Dec 2022 04:54:57 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c458a00b003cfd4a50d5asm17320643wmo.34.2022.12.03.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 04:54:57 -0800 (PST)
Date: Sat, 3 Dec 2022 15:54:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: shayne.chen@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7
 (802.11be) devices
Message-ID: <Y4tHHYLPX/6x6ztK@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_045500_732949_08B8AC64 
X-CRM114-Status: UNSURE (   5.11  )
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

	drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c:657 mt7996_rf_regval_set()
	warn: passing casted pointer '&val' to 'mt7996_mcu_rf_regval()' 64 vs 32.

drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
    652 static int
    653 mt7996_rf_regval_set(void *data, u64 val)
    654 {
    655         struct mt7996_dev *dev = data;
    656 
--> 657         return mt7996_mcu_rf_regval(dev, dev->mt76.debugfs_reg, (u32 *)&val, true);
                                                                        ^^^^^^^^^^^
This code only "works" on little endian systems.  You have to do
something like:

	u32 u32_val = val;

	return mt7996_mcu_rf_regval(dev, dev->mt76.debugfs_reg, &u32_val, true);

    658 }

regards,
dan carpenter

