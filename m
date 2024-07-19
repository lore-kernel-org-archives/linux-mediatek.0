Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D646EC3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 23:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KAmG1fPljcb5HIP7CE3dUZQFgYrwTJ51yUnXg5JPCLI=; b=BSrChF+EnURB3z39MpLwCivmXB
	Dm+tfzy0L6+6o1TEhnqofC2hrPTGDaRycuaIvtihLANNdda0rPMQuVYw+NOXDmt1Wm6sSBNuOSvAl
	whzZ2HAv7ved39iTIu4szNEAN1yudXgz6+R/nHIuj6ZSFWeYdTnahfISuCtRulVpBgTQE0NsD84BR
	aF6dXxHPPvYCA//+cCn58/3q4DwUUfVaqV2BMQ3HxHMIDVkckwzwy1iN3/xzaW51q7lXre8nCtcwi
	uNn2Q4rAy7EfTlVwMZz30+W0oR0+OE+CboA5jwwWMwaJT29TiWNvGySF9hRQZHinD2/B1r9LfhocK
	IwCo7ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUxP4-000000042km-1m2x;
	Fri, 19 Jul 2024 23:52:46 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUxP2-000000042jf-0eCU
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 23:52:45 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5cebd3bd468so1268991eaf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jul 2024 16:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721433163; x=1722037963; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAmG1fPljcb5HIP7CE3dUZQFgYrwTJ51yUnXg5JPCLI=;
        b=hL3DfLpNdCMVUZ8+v5j6YMkSM4hrFhhJwyV76pD5KTVlkLqLBpV2JHOYwyx4Zjh5Mh
         +US3kThXCXjkW3ohxGBeoEUt1CDmACSNF8kLBnLP9sWYl368VsJKEBJ4ius1ZLiFdt4l
         WdyGV39cT3GPKH2SLVxfGHmZY95p4CejUBfChyzFR5fTBwmsE51gwBzamUAVWsJnhJxf
         7b33WtfGVpbIM7nCrFAoHzmA7L7RxrsYngXIQu6nsiWUUt5NDRbk7V4qD5QWkd+8k678
         3iEevlW5YNO80hAvSFgdMEz2tUkhGi+bH3pLSHaFcb4PXhF4n6WL71eIm0nvQp4Nnbc4
         D1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721433163; x=1722037963;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAmG1fPljcb5HIP7CE3dUZQFgYrwTJ51yUnXg5JPCLI=;
        b=GgFEAtUjf+x1iXjW0DhItrdbvlMLiLtWOBq4xvLdB9Ah43zbgbsdaQI2a8xFrkgnam
         jo6vOaDxdkttGxBOwG0e8QnCNVRpcc6eEzIcF9C8mROOS4pGn9AynbmzwR8R50veeobk
         loq77UpMdWRcSoY2oUhgQLA5RuCY1sb/ZbZQ4QVINYyKh5lP4vIIaLBzll+3YpnI4LoV
         ORsOdRC/GV3jvA7VuxBGph20l7S+Ce57lr4aQ8esSbYm+zZkvUgrdQv9AyB64PdWOSZ3
         tZAqeHtpPh1bWobxD4IpLsFp3d9W0sGbKfE6zYAm6F95JV6Qasb3EyS/BwrKPvXmzAtn
         Pb+w==
X-Gm-Message-State: AOJu0YzBFbxtoQUym9nEsBWbdhD6FKcuEMots/4HPUUwH5nmm8JfzyqT
	CeeAqOmeHHRxAfX7dU7z4cJHEBhtjmo+g5aM1NUcVQHugP4hODNAtSC8oaFnfbE=
X-Google-Smtp-Source: AGHT+IEATijLF++GcczU3C3j0SkiJYy55hvolrUnC/IX0pWvW1VrSukFk7ZiEfG56MMedwSOFozn1w==
X-Received: by 2002:a05:6820:4b81:b0:5cd:2e7:cc6 with SMTP id 006d021491bc7-5d56505d18emr1481787eaf.8.1721433163102;
        Fri, 19 Jul 2024 16:52:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d55aad0503sm428111eaf.30.2024.07.19.16.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 16:52:42 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:52:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] net: ethernet: mtk_eth_soc: add support for coherent DMA
Message-ID: <dd144446-7785-4d6d-873e-6016e66d51fe@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_165244_230422_98E47963 
X-CRM114-Status: UNSURE (   5.76  )
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

Hello Felix Fietkau,

Commit d776a57e4a28 ("net: ethernet: mtk_eth_soc: add support for
coherent DMA") from Apr 5, 2022 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/ethernet/mediatek/mtk_eth_soc.c:3927 mtk_hw_init()
	error: we previously assumed 'eth->ethsys' could be null (see line 3902)

drivers/net/ethernet/mediatek/mtk_eth_soc.c
    3883 static int mtk_hw_init(struct mtk_eth *eth, bool reset)
    3884 {
    3885         u32 dma_mask = ETHSYS_DMA_AG_MAP_PDMA | ETHSYS_DMA_AG_MAP_QDMA |
    3886                        ETHSYS_DMA_AG_MAP_PPE;
    3887         const struct mtk_reg_map *reg_map = eth->soc->reg_map;
    3888         int i, val, ret;
    3889 
    3890         if (!reset && test_and_set_bit(MTK_HW_INIT, &eth->state))
    3891                 return 0;
    3892 
    3893         if (!reset) {
    3894                 pm_runtime_enable(eth->dev);
    3895                 pm_runtime_get_sync(eth->dev);
    3896 
    3897                 ret = mtk_clk_enable(eth);
    3898                 if (ret)
    3899                         goto err_disable_pm;
    3900         }
    3901 
    3902         if (eth->ethsys)
                     ^^^^^^^^^^^
Check for NULL

    3903                 regmap_update_bits(eth->ethsys, ETHSYS_DMA_AG_MAP, dma_mask,
    3904                                    of_dma_is_coherent(eth->dma_dev->of_node) * dma_mask);
    3905 
    3906         if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
    3907                 ret = device_reset(eth->dev);
    3908                 if (ret) {
    3909                         dev_err(eth->dev, "MAC reset failed!\n");
    3910                         goto err_disable_pm;
    3911                 }
    3912 
    3913                 /* set interrupt delays based on current Net DIM sample */
    3914                 mtk_dim_rx(&eth->rx_dim.work);
    3915                 mtk_dim_tx(&eth->tx_dim.work);
    3916 
    3917                 /* disable delay and normal interrupt */
    3918                 mtk_tx_irq_disable(eth, ~0);
    3919                 mtk_rx_irq_disable(eth, ~0);
    3920 
    3921                 return 0;
    3922         }
    3923 
    3924         msleep(100);
    3925 
    3926         if (reset)
--> 3927                 mtk_hw_warm_reset(eth);
    3928         else
    3929                 mtk_hw_reset(eth);

Either of these reset functions is going to dereference eth->ethsys without
checking.

regards,
dan carpenter

