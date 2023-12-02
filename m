Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87702C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 21:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHEDt6VQ8LzeSpO7og1P0K/YDfArH7UZrlszyK0VJhs=; b=u4xQgPfnXtI+zqCcddSvLROkvn
	bkEScxhzgtUaRTWlrHmbFFyJAYsti9it8gtzusqF0OLGaKJRmJ3bw6+1iZ3YOI5HQWuPPsfzCLWRV
	2q2gBvbgbvlMjsPLXneXBnowW9q0xoONsxKP7lD71v//+mP8lyoGmIlRCZvJNW4LEYbrnlc0lOOev
	QfvH0YW1VGdcVtrGc0PCeyxykRdKNW4UDnfaj5KL7LSBxhmd9NNzH3uVhJlLmdmfjHC5qHBgbrnPX
	Yz546B1n1KWH/8ka7zurzaM2FQ+2qsFYkbW6dGwV+m3ImYswY7hU7KtGaSoqVBN1Yk+oETcEYMS93
	ci1H+AJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9XWs-00G7UO-09;
	Sat, 02 Dec 2023 21:28:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9XWp-00G7Tb-0w
	for linux-mediatek@lists.infradead.org;
	Sat, 02 Dec 2023 21:28:00 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28613d87c4cso3086607a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 02 Dec 2023 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701552475; x=1702157275; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HHEDt6VQ8LzeSpO7og1P0K/YDfArH7UZrlszyK0VJhs=;
        b=GBgyvHChW2IqlWySCoxCHa3L01tMCH2K7obf0A4BlzjdzxU+uLhaDSlpdnE7v5A7wo
         a3pXg1nGBrVq0UEHgEpufrixtbZoFBPZO9JcsLhXf45pzGwuCvCBZAyHc2thcyi5M8Wa
         DSeLN6phhnhggB5pByOv2ivr0fEGl7Da5fj5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701552475; x=1702157275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHEDt6VQ8LzeSpO7og1P0K/YDfArH7UZrlszyK0VJhs=;
        b=gIkdakMeH0LPFrivn/yncZ9B85wj3AEDA4JuXtaGwv0n6Ptv9HwvVqSvv5vpfzP7AH
         7YPwkPcWcoDDKWPHfRk326aLvZJEQJHteoKAsy6+6Fcewpq9hMJ7aAORf9xcQzceZ5tg
         I2NB7K+33H7Oh8jkQ5pH6t1JQof62YBukw78UB4wfnJ0RE3QKxl8H+C/WrWCtD/kgbpt
         kIV/kmbpSiaBV3FthbTalmqaB4yBtmvKUqrt1qJ9DOw4t2B9UMZ7dONOkV/EqQm5ymM4
         S3+rJjwBziIASCaKkXN2dOq/X/Weola+0+EVGiAqNtZ4qfkfY4Ye+VAKVcdl8Gsr+WfY
         3HfQ==
X-Gm-Message-State: AOJu0YzhBFp1LnXK/5hcA5j62tVtZNBQAYfKNdX7+O1VVTtSTiU4LMZp
	2H104Ldw+qmeuv7Q2AFiVUZqkw==
X-Google-Smtp-Source: AGHT+IFXUE4tSK9GGzbHw7vo/cKKLHlnC44NDlmDCgLl/yvcuTLoq9/NPk2WjmKD8tGBeTcLq2UwmA==
X-Received: by 2002:a17:902:bd05:b0:1d0:6ffd:e2e3 with SMTP id p5-20020a170902bd0500b001d06ffde2e3mr1629422pls.125.1701552475636;
        Sat, 02 Dec 2023 13:27:55 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i9-20020a170902c94900b001cffe1e7374sm5608964pla.214.2023.12.02.13.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:27:54 -0800 (PST)
Date: Sat, 2 Dec 2023 13:27:54 -0800
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] wifi: mt76: mt7996: Use DECLARE_FLEX_ARRAY() and
 fix -Warray-bounds warnings
Message-ID: <202312021326.D3504C1@keescook>
References: <ZVaCNAohuieMmdq9@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVaCNAohuieMmdq9@work>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_132759_327811_2696F11B 
X-CRM114-Status: GOOD (  15.13  )
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

On Thu, Nov 16, 2023 at 02:57:24PM -0600, Gustavo A. R. Silva wrote:
> Transform zero-length arrays `adm_stat` and `msdu_cnt` into proper
> flexible-array members in anonymous union in `struct
> mt7996_mcu_all_sta_info_event` via the DECLARE_FLEX_ARRAY()
> helper; and fix multiple -Warray-bounds warnings:
> 
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:483:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:490:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:492:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:469:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:477:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:479:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
> 
> This results in no differences in binary output, helps with the ongoing
> efforts to globally enable -Warray-bounds.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

*thread ping*

Can wireless folks please pick this patch up?

-Kees

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
> index a88f6af323da..9f516f796d63 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
> @@ -163,19 +163,19 @@ struct mt7996_mcu_all_sta_info_event {
>  	u8 rsv3[2];
>  
>  	union {
> -		struct {
> +		DECLARE_FLEX_ARRAY(struct {
>  			__le16 wlan_idx;
>  			u8 rsv[2];
>  			__le32 tx_bytes[IEEE80211_NUM_ACS];
>  			__le32 rx_bytes[IEEE80211_NUM_ACS];
> -		} adm_stat[0];
> +		}, adm_stat);
>  
> -		struct {
> +		DECLARE_FLEX_ARRAY(struct {
>  			__le16 wlan_idx;
>  			u8 rsv[2];
>  			__le32 tx_msdu_cnt;
>  			__le32 rx_msdu_cnt;
> -		} msdu_cnt[0];
> +		}, msdu_cnt);
>  	};
>  } __packed;
>  
> -- 
> 2.34.1
> 

-- 
Kees Cook

