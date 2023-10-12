Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D4ACDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5VRMgvCnEA8kgiHSYk2SxnRT5MMPGrktxGH8s2RgpHQ=; b=f8Akr3FDKAAbtIrHNuZ3kvXUG5
	iVopw1ZkCxOm2GdW6cs8kgrvI6+nQ8uQ3Se7wEmqLzOdIYIsefC60HyUc2X9qaVn8qcmS/Eg6ejjo
	w7R9KixzNDU3g9xnA0OBDni/KCEjyLo7b4zAm/kDjXiCI+YZiGEjevtpDRt7ed3A4Rbt3kAuHSQs9
	S6qhNVwutG3AGcMyIjjThNUCgxip0IHSRSCXoGRSdrqnJSn+8Zh3gCEuWfgA6rQe/fxuuslVTUhFy
	8Sgc3OPgaF+y3WgJb0CXR6lSfglhsn/eWAW4oIGYH4aVlswC5OmAx8owSkIQDpWrQtV0jLSbUYCvP
	3TZspkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsDs-000QbU-03;
	Thu, 12 Oct 2023 09:43:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsDq-000Qb6-0G
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 09:43:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso7645265e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 02:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697103792; x=1697708592; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VRMgvCnEA8kgiHSYk2SxnRT5MMPGrktxGH8s2RgpHQ=;
        b=zTt7eKLezxu5XXj+wLRlezPKv7507INpl+yIwQNNXwC0s2BePbNtbuoxfIwZeb84tP
         1hhLmmuoRd+tlovKFiIrNNCV6Z/XbzIn/mwFkJaiOl4AS0LandtE7aaV6GNLiRGSDTmc
         duTOY5a9OlPYA04NK+fcoyfe4/qTvUjWbKkSamcW5kCIsDtQ2BqY0HzQyvZj2kzY5xlv
         1k8K7iV7ZhwuxMlCSbOR2tMaOS7tjNO4RV4Ju4iu2VBXn5a2Y6JPkKE90ZqzuryJA20w
         vrVAdODPUZ5RUExqyBvnH6CuWLQXvRnRfuwvYRqUPl/msT8DTb5DQnpXH/lYfev5pFyf
         JZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103792; x=1697708592;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VRMgvCnEA8kgiHSYk2SxnRT5MMPGrktxGH8s2RgpHQ=;
        b=e/Q7m3Hws/xva4iUUG+Z92osDFVTd2e+3YTXKdpsek4Wc+w8Q44i/pxUZQGS0xoDl4
         5ES9QaIIniyBeMkmS+PseM4l5DAsZQmuPp+U4q+uRsBtlPRCeHxTfZJ6I3tsbCH1sl5W
         rRLG2UX60EIm+z5UOJe+tgMQwlTOWkhKg9C9dD8xAkZogN+u6RPoCv92AxlAm8YsSOhq
         7lTPIQMQj4VMnrG+r3IKANU81XNO7pwlEhg2k1mwJwEKD9yfu7dQzH3TbdbtYvJwmTAR
         VbNffBrlWlo5OoHO1R3GWppHt5Lq3sE+1w1hfjJr/+0NDQVLrxwhy3zAI8UB/IEJ3OfS
         Qn1Q==
X-Gm-Message-State: AOJu0YyFFtP4mrWQFI27M+koW9XUtGBjUHiWXr7zTwUpGLImubDWiU69
	+xl7/1RgcyZU3NFTePm4Lq51jA==
X-Google-Smtp-Source: AGHT+IHCwgBj3x6+SrOcE0hptJkfx2cSC4duQpC3JPxcT2Y6Xd5RJTwKY8iaIIwurvg/O0MkOUlW+Q==
X-Received: by 2002:a05:6000:104a:b0:32d:8b1a:31ad with SMTP id c10-20020a056000104a00b0032d8b1a31admr2201712wrx.24.1697103792493;
        Thu, 12 Oct 2023 02:43:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w15-20020adfcd0f000000b0030647449730sm18076443wrm.74.2023.10.12.02.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 02:43:12 -0700 (PDT)
Date: Thu, 12 Oct 2023 12:43:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: fix race condition related to checking tx
 queue fill status
Message-ID: <4af93047-2767-4859-b41f-82be7fa2309d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_024314_129778_A0AE6E30 
X-CRM114-Status: UNSURE (   4.13  )
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

The patch 0335c034e726: "wifi: mt76: fix race condition related to
checking tx queue fill status" from Aug 29, 2023 (linux-next), leads
to the following Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/tx.c:348 mt76_tx()
	error: we previously assumed 'wcid' could be null (see line 342)

drivers/net/wireless/mediatek/mt76/tx.c
    338 
    339         if (WARN_ON(skb_get_queue_mapping(skb) >= MT_TXQ_PSD))
    340                 skb_set_queue_mapping(skb, MT_TXQ_BE);
    341 
    342         if (wcid && !(wcid->tx_info & MT_WCID_TX_INFO_SET))
                    ^^^^
This assumes wcid can be NULL

    343                 ieee80211_get_tx_rates(info->control.vif, sta, skb,
    344                                        info->control.rates, 1);
    345 
    346         info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, phy->band_idx);
    347 
--> 348         spin_lock_bh(&wcid->tx_pending.lock);
                             ^^^^^^^
Unchecked dereference

    349         __skb_queue_tail(&wcid->tx_pending, skb);
    350         spin_unlock_bh(&wcid->tx_pending.lock);
    351 
    352         spin_lock_bh(&phy->tx_lock);
    353         if (list_empty(&wcid->tx_list))
    354                 list_add_tail(&wcid->tx_list, &phy->tx_list);
    355         spin_unlock_bh(&phy->tx_lock);
    356 
    357         mt76_worker_schedule(&phy->dev->tx_worker);
    358 }

regards,
dan carpenter

