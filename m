Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD13EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLquJa6vX3cAREt2G8PV33YRnBnR13Onc50DdWvUBjI=; b=QTvrUcwL053AEaBYRQhkhrRpKI
	0OlhijfZS8BQT1FwXHaE+RezoH82R1kLbaGQ1K6gq163r2P6wy2adc1OcTDxu7aKH8+4hYHVCX2re
	iskpakwadZqegoIPUT/n8J0GIi9Jp16n1HFrfCJmYIl6v1M89nDsI7OZ5ob1zgGC4ibcWPFBtCMFS
	vHUgHa+/yMuFpoQiS1IRNv3sIm7EKirb9MHkxPrZLdxjO5Y/Ho1FeoUnGzCzpNuiL7Xwxeuvz6gi/
	+nezGvO3qIED/eszvt8QduJLL8hY8T64TyTUy4WedmBqfTRIJUfc/LohJMM513vbQJkIWlkiLdQhW
	EqGkTssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHln0-004lau-01;
	Fri, 07 Jul 2023 13:46:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlmv-004lZx-2x
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 13:46:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1959371f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688737580; x=1691329580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLquJa6vX3cAREt2G8PV33YRnBnR13Onc50DdWvUBjI=;
        b=JukIsPb//XimtGRT49yHPUHgpppuoDXUTu+fAvL8jy7/foZHz0PX+0PzonWP0PqKoo
         89HKFrhwgclR0ZGSMHeplvb7XtpA2U+Cl+T41DNJFMZWNKD1gKpnUxuwhWRzwncHdK5d
         Nghj/8rmLvI4Fgy6dIzBr37VpDSIKICDxKuO/SKomwxL1qNlBooxwzvvMgc6oVTKCWSB
         ZWAQMZpCz0s2ghMSE3Yf2SFIapPDURM5SasNTVuNMGYeOvNzqu68RBJS0R+uNqlMqSkz
         Co+v9tHp+gIH2hcEdfYWYitaISsJb+Cx/IRQgDYEoWF1RScEhcN4w+jructAyya5nZs/
         b1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737580; x=1691329580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLquJa6vX3cAREt2G8PV33YRnBnR13Onc50DdWvUBjI=;
        b=h4Ht15oGF+8EX1iA1MidCjG2+p3O4Md3eCcga6SvSRaitVnvlNjso+PNlwDD48UjKf
         stgNnv0+gQF5RH73Vni2rKAuNtXh62gqwcpARa2WwHRQAWlD5Anw+z/+XfLfzP1ih2jY
         5sY2mOgh8wYDXMKGnKGSq3M3IgitcWvNIDDlYYMBkt2pKr0QgV0fWSGhLy1zBPHHZPi+
         PmjmWf4lkmwaavJFutINc8LOHYsdaBWRazmjf2AAEcWuh8JwTJ836YMTVr8HWwsHbo6v
         AtML/QlJGgVEZFRLhC2dOYiJEnA8PX1R+6DF6khrEXCvtXZSK/3m67k2zSCaKRv9v6ZS
         cTYw==
X-Gm-Message-State: ABy/qLadAP4mcbMzieuhgeZkf9bjfp5IhR02AxkaxuCqobbfYiFKS9oS
	O3PJqII5bmF5glylVtbSWiQMpw==
X-Google-Smtp-Source: APBJJlEsux6Oo02kwH3/IRVRH3BiGhQYX8+9sbO0AtWvUSWIsDDiKlL12o7SlmgJvLhe5I1F/TWvzg==
X-Received: by 2002:adf:fd47:0:b0:314:268b:21f1 with SMTP id h7-20020adffd47000000b00314268b21f1mr4248772wrs.18.1688737579718;
        Fri, 07 Jul 2023 06:46:19 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id k15-20020a056000004f00b003140fff4f75sm4542205wrx.17.2023.07.07.06.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 06:46:18 -0700 (PDT)
Message-ID: <6bf8d06a-8c65-4d7a-14a1-13597cd9a2de@baylibre.com>
Date: Fri, 7 Jul 2023 15:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/6] thermal/drivers/mediatek/lvts_thermal: Handle IRQ
 on all controllers
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230706153823.201943-1-nfraprado@collabora.com>
 <20230706153823.201943-2-nfraprado@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230706153823.201943-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_064622_169553_E5626029 
X-CRM114-Status: UNSURE (   9.74  )
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



On 06/07/2023 17:37, Nícolas F. R. A. Prado wrote:
> There is a single IRQ handler for each LVTS thermal domain, and it is
> supposed to check each of its underlying controllers for the origin of
> the interrupt and clear its status. However due to a typo, only the
> first controller was ever being handled, which resulted in the interrupt
> never being cleared when it happened on the other controllers. Add the
> missing index so interrupts are handled for all controllers.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

