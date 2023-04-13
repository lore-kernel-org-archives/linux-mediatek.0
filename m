Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC00C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjH7nhGdWOv9qeyX+wHaW2Tx80LijSTnzNr+7mKBAuk=; b=obFY8LCTNAE9xwPJriIYuPMjdY
	gfZWPjxms1OEiSUddBAxFSPDm91Xswrk6RWSuPxhLiCBaiUS6aVFFQLMkGaMy2BhuzhJoSxQ+xILp
	awtrX5jwuYiXUtbNvSf+bqXvidza3CQT0UDm7FltY39N3sIDdgWp7NSBzl4lv1B+gOSQEHjEwgofV
	vPbvG0g7Sop7Rc677ACFtLO5A63JSQdK1po+boSqk7QHtavFiI5uUk04z0p6UtGLEwiQKu+RrAA3c
	o3OeFWq+UyHMpXQistRrLtJfi9+/1KH6T11Xzk5JvW7cSHe4tVv3TAyNiic69kfAKcYw+23+l44eU
	rkCCuKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsR2-005Qkz-0b;
	Thu, 13 Apr 2023 08:36:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsQy-005Qj1-1e
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 08:36:01 +0000
Received: by mail-wr1-x434.google.com with SMTP id v6so13381484wrv.8
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681374956; x=1683966956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjH7nhGdWOv9qeyX+wHaW2Tx80LijSTnzNr+7mKBAuk=;
        b=W73ulSQRJKYT4gJUb7YNAcstBidLbTyQ3w6d+J/2HWLLSJsGIqpO8cBwjCTh/y3CP+
         djCQqgwfz+UZYPS2FGWs6PUFDq4ogwwJqLWJPCItRQ2TDYN2zQ83Vd8UaQbXRXpKJQlz
         pYdY/Kjv0RfjbBvvl9BEJYGGJdzmXZU78u9GhxDNwG12qDlz9qx18/GaAHUboSdEMb0v
         Zi7j3tJpml46h4/0KRWefPFAtEyhBDfFYPcu/KDsfYqDY08T6Sfk9k9NHPsmu47HLCuk
         xKMCGIkq5fD0zwaMlrAI+o2T7jRCG0lAMmNON+0sLquyBJ6O8GPmq+lGt4WaU8nOJsJj
         uLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681374956; x=1683966956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjH7nhGdWOv9qeyX+wHaW2Tx80LijSTnzNr+7mKBAuk=;
        b=ahYE6IUEZj/rQVaI/PWXiqxvlEitzcWjOB0SEbtdV8yPo+RVdYJ8ARkPE8wvRyrOnP
         gI1kABuxKm9LbogFQJfDB/MmeLRGKYekbbTJkbhPwhePubmZHFCTKH/k7hpgLPOiuZ5D
         mFfCMPg4kotOtsn1c/GiWovT5apBnBFBwEoeTenOGCb7WmBdTVxVdsB9jHMXurA1F2KG
         27HrvxeGf1FUyOu20ahXlCSdlUOgeRq/+b08us8vmhpOpfqOhGIac9teJsqaF9hMUZni
         ynGmMqmS+O8vrtGCugzGQ2bKn0FTvUagiCVboijZ7ykGUjb3uRfUr18HvvYe0tcrkGLc
         OoKA==
X-Gm-Message-State: AAQBX9fkE5hK2ujuefGU0hM5pTJVAakpeBR6BynqHk6PikBTlPfedZS1
	dSqsgzkSIUr+WgVJ3o4B0td3GQ==
X-Google-Smtp-Source: AKy350Z+TlsVs6i2UnAW4a5xD8ts3Fbq8yFX7GeMxaxMkTqOmJx/k1gtnqvpgXLJJDILOXj63b0c2w==
X-Received: by 2002:a05:6000:1a52:b0:2ef:b63d:6a6a with SMTP id t18-20020a0560001a5200b002efb63d6a6amr851327wry.61.1681374956602;
        Thu, 13 Apr 2023 01:35:56 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d54c4000000b002c3f81c51b6sm747306wrv.90.2023.04.13.01.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 01:35:56 -0700 (PDT)
Message-ID: <54d7444e-26ff-da2d-833b-57dd5b8ca679@baylibre.com>
Date: Thu, 13 Apr 2023 10:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/7] dt-bindings: leds: leds-mt6323: Document mt6332
 compatible
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 pavel@ucw.cz
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_013600_591154_3AD60FB8 
X-CRM114-Status: UNSURE (   5.93  )
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

On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
> Add support for MT6332 LEDs/WLEDs with compatible "mediatek,mt6332-led".
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


