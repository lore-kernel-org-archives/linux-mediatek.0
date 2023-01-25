Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6583BC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Feg0iTteNIzFoBIf++X2HVoIG66mrid39atPcIHV5bk=; b=lvpb41Ra0pk5wYD4QjtNksNwOh
	h/j8E/vUSO41OBWM40wMghRo9jwPqbuIvIMJwGtKO/zCigtjQkJqRNmHXMqsJDfMHrS8suHYeDoqg
	D+NrwWvr+Ul9QVDXFkZ6r15nacGqftbNntyOZp3tamEEpuDHzLOfEwzO30SMnCAaw+pdnwtRekvUw
	UlTkCQjpXa1sKdFfjlW091k6HfFhuge8nv8ACmUh4li6E6/qMIk1yR/QGAMcJiGjLxoYvP//m95dY
	QmQFc1XGgIIy7K3FA76NiEGXIZfb6YEZbuYw8chIsVdGUiHmRxh385UoW45aTCfwTFJGlcyNyLUrz
	yfzeebUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKefI-007GA7-4h; Wed, 25 Jan 2023 12:14:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKefF-007G8q-KC
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 12:14:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so1100353wmb.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 04:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Feg0iTteNIzFoBIf++X2HVoIG66mrid39atPcIHV5bk=;
        b=HYu1xyMpmo9Q7XCBSNo/VtX+wXBOI11zT9gyEiDUK+VJicnI449PNPsUJ9G10V40Gm
         fCAI5vi9s/L2UwTjHsyR5+5FTJn9NcUO1+R3/vdkDVnQrC1I4mPHsnvStbKDsYoSqR2Q
         fNSyONcsOJeVOtHIWmgj0olYCERmoseJrfMyvX6Rm/3D6tN+33tv9JkBtaXIYTo/JJAx
         euHheslEEhKAiBM6vKVBBifhe7+y3SF7z1MS9wMV5Ha5n93XQA8eTEylAjpJxBjes1NC
         2E++Lo1+SO1tjf57E1GTGR2i8YCoajJw/JsvDVTT5ztvRTrrQmd2elvWPfhXjvc9rEuR
         7G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Feg0iTteNIzFoBIf++X2HVoIG66mrid39atPcIHV5bk=;
        b=yARRUYNoF42dx8jQQJBmobMsZYUXh1W8CtGdnFsixn7OJVpoqIo6jiLYL/zv3ohQPP
         SpmIZSpNPlYqcHSJbVDAqOz3kj1NnOyacp4u63HKgWdbPKQnXlZJF9bu+4GTw0lsG+H/
         EGD3iXwMH+RLHPt4YkfMsHfR9Vpge6S4hqZ1y8m44fwmuin8EPDOEH9CXW79eot5Z2+G
         S/0jV30xGg+4Rl5wGWifRYOZqaTg+XpDs8F1ZNupYzTE90jhKXMbnPN641vZvVYOPm6s
         laGloHGJwrW68iDyPD75jbkarF33S9g7UaqPUSmX6WtG9mbit1mXtGBim9ZDZw9NGP8h
         Mg1Q==
X-Gm-Message-State: AFqh2koW2iqhPQeAzpMI3NR6x/F7EOA9m1k6NyjO4sTywmEtF4IRuHM6
	YnWaAQ2fAbGMwToaqd7X3eo=
X-Google-Smtp-Source: AMrXdXs5G7B0+pnnp+00MAuI1epWrKiRq2NOQyGVBgH+QyN713tllt1jXK4DZt3WQ3usrothInZqBg==
X-Received: by 2002:a05:600c:1695:b0:3db:12b:5103 with SMTP id k21-20020a05600c169500b003db012b5103mr32775664wmn.5.1674648842710;
        Wed, 25 Jan 2023 04:14:02 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c22-20020a05600c171600b003db11dfc687sm1597145wmn.36.2023.01.25.04.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 04:14:02 -0800 (PST)
Date: Wed, 25 Jan 2023 15:13:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: trevor.wu@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] ASoC: mediatek: mt8188: support etdm in platform driver
Message-ID: <Y9EdBg641tJDDrt/@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_041405_724175_A15A5251 
X-CRM114-Status: GOOD (  10.63  )
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

Hello Trevor Wu,

The patch 2babb4777489: "ASoC: mediatek: mt8188: support etdm in
platform driver" from Jan 16, 2023, leads to the following Smatch
static checker warning:

	sound/soc/mediatek/mt8188/mt8188-dai-etdm.c:2487 mt8188_dai_etdm_parse_of()
	warn: 'ret' returned from snprintf() might be larger than 48

sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
    2455 static void mt8188_dai_etdm_parse_of(struct mtk_base_afe *afe)
    2456 {
    2457         const struct device_node *of_node = afe->dev->of_node;
    2458         struct mt8188_afe_private *afe_priv = afe->platform_priv;
    2459         struct mtk_dai_etdm_priv *etdm_data;
    2460         char prop[48];
    2461         u8 disable_chn[MT8188_ETDM_MAX_CHANNELS];
    2462         int max_chn = MT8188_ETDM_MAX_CHANNELS;
    2463         unsigned int sync_id;
    2464         u32 sel;
    2465         int ret;
    2466         int dai_id;
    2467         int i, j;
    2468         struct {
    2469                 const char *name;
    2470                 const unsigned int sync_id;
    2471         } of_afe_etdms[MT8188_AFE_IO_ETDM_NUM] = {
    2472                 {"etdm-in1", ETDM_SYNC_FROM_IN1},
    2473                 {"etdm-in2", ETDM_SYNC_FROM_IN2},
    2474                 {"etdm-out1", ETDM_SYNC_FROM_OUT1},
    2475                 {"etdm-out2", ETDM_SYNC_FROM_OUT2},
    2476                 {"etdm-out3", ETDM_SYNC_FROM_OUT3},
    2477         };
    2478 
    2479         for (i = 0; i < MT8188_AFE_IO_ETDM_NUM; i++) {
    2480                 dai_id = ETDM_TO_DAI_ID(i);
    2481                 etdm_data = afe_priv->dai_priv[dai_id];
    2482 
    2483                 ret = snprintf(prop, sizeof(prop),
    2484                                "mediatek,%s-multi-pin-mode",
    2485                                of_afe_etdms[i].name);
    2486                 if (ret < 0) {
--> 2487                         dev_err(afe->dev, "%s snprintf err=%d\n",
    2488                                 __func__, ret);


I guess the reason behind this warning is that we checked something but
we didn't check if "ret >= sizeof(prop)" as one would normally suspect.

In user space snprintf() can return negatives but in the kernel it never
does.  Changing that in the future is impossible because it would
introduce a ton of security issues, so it never will.

I guess I suggest just removing the dead code.

    2489                         return;
    2490                 }
    2491                 etdm_data->data_mode = of_property_read_bool(of_node, prop);
    2492 
    2493                 ret = snprintf(prop, sizeof(prop),
    2494                                "mediatek,%s-cowork-source",
    2495                                of_afe_etdms[i].name);
    2496                 if (ret < 0) {

Same

    2497                         dev_err(afe->dev, "%s snprintf err=%d\n",
    2498                                 __func__, ret);
    2499                         return;
    2500                 }
    2501                 ret = of_property_read_u32(of_node, prop, &sel);
    2502                 if (ret == 0) {
    2503                         if (sel >= MT8188_AFE_IO_ETDM_NUM) {
    2504                                 dev_err(afe->dev, "%s invalid id=%d\n",
    2505                                         __func__, sel);
    2506                                 etdm_data->cowork_source_id = COWORK_ETDM_NONE;
    2507                         } else {
    2508                                 sync_id = of_afe_etdms[sel].sync_id;
    2509                                 etdm_data->cowork_source_id =
    2510                                         sync_to_dai_id(sync_id);
    2511                         }
    2512                 } else {
    2513                         etdm_data->cowork_source_id = COWORK_ETDM_NONE;
    2514                 }
    2515         }
    2516 
    2517         /* etdm in only */
    2518         for (i = 0; i < 2; i++) {
    2519                 ret = snprintf(prop, sizeof(prop),
    2520                                "mediatek,%s-chn-disabled",
    2521                                of_afe_etdms[i].name);
    2522                 if (ret < 0) {

Same.

    2523                         dev_err(afe->dev, "%s snprintf err=%d\n",
    2524                                 __func__, ret);
    2525                         return;
    2526                 }
    2527                 ret = of_property_read_variable_u8_array(of_node, prop,
    2528                                                          disable_chn,
    2529                                                          1, max_chn);
    2530                 if (ret < 0)
    2531                         continue;
    2532 
    2533                 for (j = 0; j < ret; j++) {
    2534                         if (disable_chn[j] >= MT8188_ETDM_MAX_CHANNELS)
    2535                                 dev_err(afe->dev, "%s [%d] invalid chn %u\n",
    2536                                         __func__, j, disable_chn[j]);
    2537                         else
    2538                                 etdm_data->in_disable_ch[disable_chn[j]] = true;
    2539                 }
    2540         }
    2541         mt8188_etdm_update_sync_info(afe);
    2542 }

regards,
dan carpenter

