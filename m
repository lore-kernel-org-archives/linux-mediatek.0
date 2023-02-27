Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C7AC64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uJkhkcyw+YCo652cbJy90MfhJa/odF41bwjtMLAeNIk=; b=Ggqy/VCXBPAzq7RIqxluAPtMN+
	ssy5lUkyZBj0lC+PJ7sZVEjJrkqTdRwVUeXRAUynGAeb2ZGN196aeXfA3JeWFE9Z8DEcaE2fO6XcE
	yfDPzgkajo4DEIGm4PLLucpbh9bjVxt6kESynes7doyi0iTnbEhbl0rBfe3110YnvNHlyjLVV5ivu
	Q5RjqzZqBSg0MYTgmQou9n4PNDExXQU3gcCYMhznhg58cNVzGXm/ZxZ4xQtHJ4ABdTLdlYKpdqkh3
	OKhhOMNwM3Bt9lJ4+vbey77ty8WzlGuYbubfCCYF6gqukNBiDyT1B++iE7mB4KkjU4byESTTybbD1
	GXTEYnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWbeW-009MU5-2e; Mon, 27 Feb 2023 11:26:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWbeS-009MSz-Va
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 11:26:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so6852974wmb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 03:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJkhkcyw+YCo652cbJy90MfhJa/odF41bwjtMLAeNIk=;
        b=I8DJ4R4mY3qM6LJfuoOc5sWEglN86Bn6qN7fE5U3snRukx66IsbHq0xHzEZhZAz2eh
         AjHjJmx3SNfdzoX99c35EDO9sIU9CDnP8ltFRn2S4VI459gg7AC6MbE6ThEgrx/TXdge
         rVEgCvfb3nxIa7zLRHZmy0AlNmoRpK0sv+wErKVmbtPDd28lYcrSGPiZOfoptxX2Vbow
         E+j4Xzc/9mJPnyn65Km/aaz3XpJSdy2JSd6IqQv+kmiaZoKMGjz955v4BE8fxpoqmAKJ
         KNztNYTVFuEgWMSuVFJ3dT7JUQvqxYwSW0xrmOVOw0L4rBHDzZQNNKaApOlkU1Ngk7jL
         Shcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJkhkcyw+YCo652cbJy90MfhJa/odF41bwjtMLAeNIk=;
        b=R7Z1tJdrr41u+lbFbdP0cdHM/InA78cR7Jd9JLSmhdkIlEH2xSspi3dBM2XKTJtqBO
         RwJk7dDIcraKSG6MkYfxhz78fDegrX2ANZzMxtRXVsMPfyxm9Rrlybv27SmgARdGai0D
         /v4XXc+YRamo6OAos6At7cizy5zbIejWP8JCx3D2Pl50n17fTG0ux30D6s/5w8W7q3T0
         nQy4eiAa71kQ2kesU/x0Pce7HqNnQqK8rBad7I0+CBSjfHfre5m5vq2rtQ4AkhzWCTQy
         MfbJLLzR+3tNwbouQZFqTBKlhLkcgICyD+EenPiuXYsa+k2IrRCmnAkL0Wktk56eN+fE
         ib1Q==
X-Gm-Message-State: AO0yUKVkNWwVxxcgIOXaqgYRbzYhv1+zzL7pHiYd7JF/ji5xk1tPrJwB
	zEa1F1+RmbUICRKEeZpFp/4=
X-Google-Smtp-Source: AK7set8JaGUU/ejyFbK8vANqItq8nP5VI5XJzamLuDLbt0B8Gg7MjSYEzUbAHgIk13cwKIwS0QjM5Q==
X-Received: by 2002:a05:600c:3512:b0:3df:9858:c02e with SMTP id h18-20020a05600c351200b003df9858c02emr6311165wmq.3.1677497198575;
        Mon, 27 Feb 2023 03:26:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c00c600b003e21dcccf9fsm12084392wmm.16.2023.02.27.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:26:38 -0800 (PST)
Date: Mon, 27 Feb 2023 14:26:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: bchihi@baylibre.com
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] thermal/drivers/mediatek: Add the Low Voltage Thermal
 Sensor driver
Message-ID: <Y/yTacHF8TvAkxdj@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_032641_041136_4CE42D45 
X-CRM114-Status: UNSURE (   7.60  )
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

Hello Balsam CHIHI,

The patch f5f633b18234: "thermal/drivers/mediatek: Add the Low
Voltage Thermal Sensor driver" from Feb 9, 2023, leads to the
following Smatch static checker warning:

	drivers/thermal/mediatek/lvts_thermal.c:562 lvts_calibration_init()
	warn: not copying enough bytes for '&lvts_ctrl->calibration[i]' (4 vs 2 bytes)

drivers/thermal/mediatek/lvts_thermal.c
    555 static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
    556                                         const struct lvts_ctrl_data *lvts_ctrl_data,
    557                                         u8 *efuse_calibration)
    558 {
    559         int i;
    560 
    561         for (i = 0; i < lvts_ctrl_data->num_lvts_sensor; i++)
--> 562                 memcpy(&lvts_ctrl->calibration[i],
    563                        efuse_calibration + lvts_ctrl_data->cal_offset[i], 2);
                                                                                  ^
This is copying an array of known ints to a u32 array.  It should copy
sizeof(int) instead of 2.  It only works because the data you're on
little endian and the data is small.

    564 
    565         return 0;
    566 }

regards,
dan carpenter

