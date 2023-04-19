Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C0DC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCm+IgLcW6GU2C5O6111M1l5269Z3huwJVqMgl2CcbE=; b=ZZUb3T6luna7jyf/jo74z/IQnS
	LWlgpuul+pVU4AhQTmE4NhefhiTFmx6HnAZaaTeVSq0z+GlYHzDJ/4oL3Xi9nx5TMYoUr6Moy9lAh
	PTqmbXk44gGOvSopDysMWZ7ygASMjRqazcpTG8QoFL1+hc5T4QimGPMM2xiH29NJa6eyJkSunZmsj
	2/Iy4trqHHoShPpaXgTqLxSuIOrh4MSh8Tlq6K40CWwr0tWIuOYt1GmiHdpJI8e+341nC2BpzOO5e
	OS+6tpOVa62SL6cF8XBeUmjeqeJlXxZy/uPtS4BUyKjQ8wkSye7rOpea5Dskm0y2mcYB8wRgGjBLR
	O1alH2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pZ-005g6C-3A;
	Wed, 19 Apr 2023 14:30:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pX-005g2i-2b
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 14:30:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f09b4a156eso23525075e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681914640; x=1684506640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCm+IgLcW6GU2C5O6111M1l5269Z3huwJVqMgl2CcbE=;
        b=m3j4mDzif3R3xAC9As18EgfUFgTbUvwaDJKU8oKJW6vg3SW6fF+Oo17L3fBuKD/qQP
         oda2A9rVjuznyh6BFoX88TPNLolaaz6NcnQ/uvOmwb6G5blao3E9RBtVKCogfd2OY/+W
         p1okWH5XbYrGrc4pGbaLhWP3Qzl6k7R6SC887U5FM6urhfKfkTGLcWsvZv/1YP7yyhjN
         2mmeQOIX2LXhc/DryN7vvTuGMRAlk5Sz617pzHO7GeGj/RpaqiXL7jTL8N8+dSlX8S5o
         Za+8cG4Dk9Xg76MQ162YZe1iIIJtibhqokaEd67in8M21KYmVZ+mKup84z+QbURKa5xA
         QDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914640; x=1684506640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCm+IgLcW6GU2C5O6111M1l5269Z3huwJVqMgl2CcbE=;
        b=L3MMnG5YBF30YrTPyBr2JSiSUivQTEpOq74NEZEpu7lyBHwKMVVL4iEE5SJKqSdT0R
         6sIn2noVC1xWESEGmsm0W7EbcCtR/dMVo4HehBHPE7jH326/7vOmB+a7KbTOvlOapHW7
         zfP4jEMMPSnFxtgbw+VtnS2wTPacd+VtJVS30WDJgbhAjQ+g2Ol2XhrBef9Iwk1mVXaH
         zuxQOgwdseHLFTxz0EU88cFlPGG+WP3By98QIx2hq1F3MTMpGnSkcNHmb1K7dxXNIWmm
         64zA8RCklxsPFQVCI8hC+hzEGVqRqhTnIe+eO9Q6D7NaTYSZMZ5UW10bfmlfqDuu93Zk
         /uGg==
X-Gm-Message-State: AAQBX9fypJfsRwImOwlqSrOlpjy2A+ecEI1++x9gWr4oh6/xoD5DU99E
	IRVdx/FY1+qSbXOGYxvjdZlE/clKcxrpDp5nD+jOKcQA
X-Google-Smtp-Source: AKy350aP3pcnz64DP3IwwNvE6n2eHRNMSVqTAobG4MYC1T0hN8TvI73wS34lRuvuDbmawZ+KZzIJXQ==
X-Received: by 2002:adf:ee8f:0:b0:2f9:ae41:5b07 with SMTP id b15-20020adfee8f000000b002f9ae415b07mr4598114wro.44.1681914639987;
        Wed, 19 Apr 2023 07:30:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d6846000000b002fa5a73bf9bsm8306794wrw.89.2023.04.19.07.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:30:39 -0700 (PDT)
Date: Wed, 19 Apr 2023 17:30:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: granquet@baylibre.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] drm/mediatek: dp: Audio support for MT8195
Message-ID: <71a035db-4a1d-415f-813f-9061a0dccdf5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_073043_841881_09496814 
X-CRM114-Status: UNSURE (   5.77  )
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

Hello Guillaume Ranquet,

The patch e71a8ebbe086: "drm/mediatek: dp: Audio support for MT8195"
from Sep 1, 2022, leads to the following Smatch static checker
warning:

drivers/gpu/drm/mediatek/mtk_dp.c:680 mtk_dp_disable_sdp_aui() warn: odd binop '0x30a8 & 0x3'
drivers/gpu/drm/mediatek/mtk_dp.c:692 mtk_dp_setup_sdp_aui() warn: odd binop '0x30a8 & 0x3'

drivers/gpu/drm/mediatek/mtk_dp.c
    676 static void mtk_dp_disable_sdp_aui(struct mtk_dp *mtk_dp)
    677 {
    678         /* Disable periodic send */
    679         mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A8 & 0xfffc, 0,
--> 680                            0xff << ((MTK_DP_ENC0_P0_30A8 & 3) * 8));

MTK_DP_ENC0_P0_30A8 is 0x30a8 as the name implies.  So 0x30a8 & 3 is
always zero.  It's not clear what's happening here.

    681 }

regards,
dan carpenter

