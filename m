Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F59C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0gC7Ybw7MaxjF6097llexPcJrfXIfdXWbQkrGypoI9c=; b=ulmooVeYCjm5EulZXlQRzBllXg
	UppWZqj6hgmqwsmTE7kO8kZv2Ozz+gZi9DelnYU3gG96rJUzHuooGz8coDkxFHn60VbTekNMILE7s
	j4V9JNt3Rn+IHlBVqt8AmDiUGEgKwP6X9LXxKvexR+QD+N70HAb2naHYTBNQFslgBBRs08pj8fRMB
	SxF0DV8sr4tji75xrG2FwF78ICUquZ8IM5KOjO4U1q8ylegfqiPSXiaDCCHSBtz0qj0q6aUDO9HCO
	bmexESoCjIGxLhNNro1qrizagrRfXuCIUqMkEg78yGy8CTi2aqzRuZ9QK998DOYsb0GWxrntkQu9d
	AQStSkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puE5y-004ueA-29;
	Wed, 03 May 2023 15:08:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puE5w-004udL-0D
	for linux-mediatek@lists.infradead.org;
	Wed, 03 May 2023 15:08:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-2f58125b957so5281260f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 May 2023 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683126516; x=1685718516;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gC7Ybw7MaxjF6097llexPcJrfXIfdXWbQkrGypoI9c=;
        b=gcTHlpPkM5h1IFaR17waMkGzJkbnPTx+VH3iL/lSm8FpIqoeAorqI2NM8aInDOPm7B
         I3+5ewe2asdSbSZ0TzQZwJHIcu4B6pkhjtY0BYADz2JRQiHpkRpubzebY2io86NDM2Vv
         Vi4flC/O/UKSoqwf8VO8Pzx4H6XC3vq9RBqFL1fUSxYFgI31YUgeanHIi3zE3U4TIvIb
         B4LegAjEYLs4nmI/xHSv2IuYc2gBBDK148M6YY5aXjeUt2PHlHRLpSks0so1+Een0VSJ
         OaLMNNfAF4sfFskTM1lDyMyTeMX1lkMlX9lPLumqhu6MFslVScgRefKywbXVxsTkvUff
         0d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683126516; x=1685718516;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gC7Ybw7MaxjF6097llexPcJrfXIfdXWbQkrGypoI9c=;
        b=IKC2ahpkd9Hu1PzUL1eEH12I5yEhfX7zGT89Wrb2oI3Dou5zhO3KPEi3ytYuxgKu+W
         aC8fz14/szwFtv9Aq86tJKxYPdlH+bqTLxb8wY98GOwaP+0uroK7cfH0avjoNdbv7zos
         f6nNmPiP0RXkkcjnJSe5zBQ7kRJe15GGa+YimMFR3Y5/SFH0ytb5Ln8vLr6e001fKi2b
         1dHp1om+oLHDyqbVEtPvonWMcJ/f1iu6DqFQK9EbdVb13BdQ7Uc/pv/WXG5ssEgF6iFQ
         Tr08wPJBMjdTrQfz7wIoUxpAEzMLjB+yfawht8jh+JmpzPg+APBpDET4MI+bG+RckFOQ
         zKAA==
X-Gm-Message-State: AC+VfDysh0nH0gBz8REXqbLcYo4+RbG/9zKu6RIfUvEw4p7gyD2tDuA2
	vYbJ8WQf/EARztrlzHcP/fMYFg==
X-Google-Smtp-Source: ACHHUZ6lmmFf/0ibwe+WKbI0ifv4OuMglfG9u0X3AiYAWAX4tIOowPkYVHoifUkz419xEj0RG2qB4g==
X-Received: by 2002:a5d:4b90:0:b0:306:3b12:d6aa with SMTP id b16-20020a5d4b90000000b003063b12d6aamr290306wrt.38.1683126516104;
        Wed, 03 May 2023 08:08:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m7-20020adfe0c7000000b003048477729asm24061876wri.81.2023.05.03.08.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:08:34 -0700 (PDT)
Date: Wed, 3 May 2023 18:08:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ryder.lee@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: enable BSS_CHANGED_BASIC_RATES
 support
Message-ID: <9b37d4c2-f6bf-442e-950c-5dbbf8f2a01e@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_080840_104480_1F9852B4 
X-CRM114-Status: UNSURE (   5.88  )
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

Hello Ryder Lee,

This is a semi-automatic email about new static checker warnings.

The patch 15ee62e73705: "wifi: mt76: mt7996: enable 
BSS_CHANGED_BASIC_RATES support" from Apr 14, 2023, leads to the 
following Smatch complaint:

    drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1018 mt7996_mac_write_txwi()
    warn: variable dereferenced before check 'vif' (see line 1007)

drivers/net/wireless/mediatek/mt76/mt7996/mac.c
  1006		struct ieee80211_vif *vif = info->control.vif;
  1007		struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
                                                               ^^^^^^^^^^^^^
New dereference.

  1008		u8 band_idx = (info->hw_queue & MT_TX_HW_QUEUE_PHY) >> 2;
  1009		u8 p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
  1010		bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
  1011		u16 tx_count = 15;
  1012		u32 val;
  1013		bool beacon = !!(changed & (BSS_CHANGED_BEACON |
  1014					    BSS_CHANGED_BEACON_ENABLED));
  1015		bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
  1016						 BSS_CHANGED_FILS_DISCOVERY));
  1017	
  1018		if (vif) {
                    ^^^
Too late.

  1019			omac_idx = mvif->mt76.omac_idx;
  1020			wmm_idx = mvif->mt76.wmm_idx;

regards,
dan carpenter

