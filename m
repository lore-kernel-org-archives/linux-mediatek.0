Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63129C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 23:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JaReLQUfE4IrabncSWk1xLybodLh/kWe0m74/xginYQ=; b=RLP4v5fdZkDKnFQNjfbRh8yt8A
	xoZLNYV8TaFN828X/ms5Go3no4GfQFAswiTVsDm3T6FrMmfeBSeSv6azCYLI/Jbw2YLOvfbBAKkja
	QL05rmWd1I2PJQrFzchhRifMl+fVRqTlx9Qvr6av1WZ7lk9wUhgmb9Fxge1XX+ld00y575vbLgGMH
	1Sp+6MiuQhtKsDXuYpAdSLXWN7V8nr4C+NAIVkoXKIOD3EEZ/yW5YGOX5NHwwPhv0zfTP9hpZ8nad
	ropNj16fs+gQ5CFZ+GuWPwrTIEx3pHWDrD5dyvolBCt8xXWZ3h0mrGIn5aJZneBbmv1zvK/u81rwB
	BzeyBFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUxPE-000000042o8-0Lw0;
	Fri, 19 Jul 2024 23:52:56 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUxPC-000000042nQ-1mQe
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 23:52:55 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-260209df55dso1066003fac.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jul 2024 16:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721433173; x=1722037973; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaReLQUfE4IrabncSWk1xLybodLh/kWe0m74/xginYQ=;
        b=vy2vLNcX12LENSaZUiwzBQMsJ5nTfQ/8hubCi6HbHgJNQyYFpgepQUY59c+ZBMWxNH
         Rew3LyqdTnADlARZXgGJWnpGtal0RFhwDQJ7F8+yQXMjfY7ASk3NLWuJwW925eAlGsTp
         FNQeJWCY6Guqsai4an06+On+3Plnf6Oi24D89NQH40dSEU3DNEylo4HGD1mIveB3BVll
         Pel5ge2RMK7XAeW2S75MfZ1UxtADC4lJmb83pYrgmoGOGXLtOOjDVOpeqamJrnrtepBP
         luyB49f2t4yrcuBkEzk0oyreK3R4Jl+xIv+wd1GWkwskgy1YgFo3fVHQqqoxRLpirp7P
         vv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721433173; x=1722037973;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaReLQUfE4IrabncSWk1xLybodLh/kWe0m74/xginYQ=;
        b=OsDQqHwL3lMrslrl12nTTJB9/xkojXqcY2DJ2jRrzRlZEbF5agzaJHeed5Of7EbNx9
         8DP2I4/4yQXqx5/wGot4oaq4c5VWTj/Dm6Y0iKTQPKAoyh1SOrJa4Wtnc7gX0yA9PaT7
         rsp31pp22wImUBd3CNpptUTXzcM//qUqp7/vOVgLxoiMyzjPZe6lNbFp4id4tJz13RLV
         UUHvCTbgcPWtpqS5Sf2OPlGb7SHtkSkprS+OqkJqAXmqjC7d9X+IZxVhMsQQfjNoV3YM
         Y2NaJYarn4XqiJYtK3V1pX0E4eLJrUhd0RKSEOvH1AT1uQ+ztXbyzW/8K+TQGzhtNOG8
         ZL3g==
X-Gm-Message-State: AOJu0YxRAdZldgU7wmPI3W9KikiXTLTUU/fXYevzpKCgDtk0DrN4ry8K
	qjJtwfiwo89jUxN+p0JfkseWitR0U1NTVC9sVcd2AbK+uXgbJzkTHs0aaLIsG/b0OHRF61/6dOv
	+0/4=
X-Google-Smtp-Source: AGHT+IHqp2guF8f6tH5KBwj84R9JPOxYleEzH+UlXr/iSKNho1HL+oUUSGXNmDIXSfYp8+0WTDmLqQ==
X-Received: by 2002:a05:6870:449:b0:261:1eb4:dd8f with SMTP id 586e51a60fabf-2638dee5028mr84483fac.2.1721433172798;
        Fri, 19 Jul 2024 16:52:52 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610c716a51sm534636fac.7.2024.07.19.16.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 16:52:52 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:52:50 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] net: mediatek: mtk_eth_sock: allocate dummy net_device
 dynamically
Message-ID: <4160f4e0-cbef-4a22-8b5d-42c4d399e1f7@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_165254_485286_E0963A11 
X-CRM114-Status: UNSURE (   6.50  )
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

Hello Breno Leitao,

Commit b209bd6d0bff ("net: mediatek: mtk_eth_sock: allocate dummy
net_device dynamically") from Apr 22, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/ethernet/mediatek/mtk_eth_soc.c:5061 mtk_probe()
	error: we previously assumed 'eth->dummy_dev' could be null (see line 5041)

drivers/net/ethernet/mediatek/mtk_eth_soc.c
    5037         /* we run 2 devices on the same DMA ring so we need a dummy device
    5038          * for NAPI to work
    5039          */
    5040         eth->dummy_dev = alloc_netdev_dummy(0);
    5041         if (!eth->dummy_dev) {
                      ^^^^^^^^^^^^^^
->dummy_dev is the last allocation

    5042                 err = -ENOMEM;
    5043                 dev_err(eth->dev, "failed to allocated dummy device\n");
    5044                 goto err_unreg_netdev;
    5045         }
    5046         netif_napi_add(eth->dummy_dev, &eth->tx_napi, mtk_napi_tx);
    5047         netif_napi_add(eth->dummy_dev, &eth->rx_napi, mtk_napi_rx);
    5048 
    5049         platform_set_drvdata(pdev, eth);
    5050         schedule_delayed_work(&eth->reset.monitor_work,
    5051                               MTK_DMA_MONITOR_TIMEOUT);
    5052 
    5053         return 0;
    5054 
    5055 err_unreg_netdev:
    5056         mtk_unreg_dev(eth);
    5057 err_deinit_ppe:
    5058         mtk_ppe_deinit(eth);
    5059         mtk_mdio_cleanup(eth);
    5060 err_free_dev:
--> 5061         mtk_free_dev(eth);
                              ^^^
But it's free here.  (NULL dereference).  I really would suggest moving the
free_netdev() to the release function.  The probe and release function are
easier to read if they're in mirrored order where every allocation has a
matching free.

    5062 err_deinit_hw:
    5063         mtk_hw_deinit(eth);
    5064 err_wed_exit:
    5065         mtk_wed_exit();
    5066 err_destroy_sgmii:
    5067         mtk_sgmii_destroy(eth);
    5068 
    5069         return err;
    5070 }

regards,
dan carpenter

