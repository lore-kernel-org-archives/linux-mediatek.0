Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E63C27C52
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUCeKEvxZz0HcOYxIJIcV5v8P469mjR1k6zX1etfeFc=; b=m8tqPES5ta9URsV9eXEVnBBLJp
	SOckZQMEQ8fumYzttW9Osxl0CpWCzlkxH+t5Pbx7Dac+dIxOveN0hEl3UcXsKg7geDpOSa8JS6nbm
	Pav+Z2tSxeLuqp1iuls3xlUIHZtKp4PHUonNZF4+rxRhpFTcVIfVdFC2AiEovDLnme8ll5QYmsIwY
	L8zMLpuvJd7ZR/Bul0pxhC2MNNz3f5k/eU4EBDB8kwWjiG6cjMUrCK1CHoa+NHH48Mtl/EvmGxpAH
	NuDdvdb5MCgRm+LzcBNb2thJ/dNNoLPljlLNs8HigAMko6Ws8KxmMG2f/YxQ2n7bLWYv98yaA4pXj
	iTkAbjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWzg-000000037Ae-10Eo;
	Tue, 04 Jun 2024 16:26:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEWzd-0000000379j-0R5f
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 16:26:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-354be94c874so4826468f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 09:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717518394; x=1718123194; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUCeKEvxZz0HcOYxIJIcV5v8P469mjR1k6zX1etfeFc=;
        b=pF8KpmeO2ANTKLI9BQdsMwUGHYFF68TLYv2CWiyn0VIfiSqptSxF4pqoztHWaOLdnG
         zpVm1n9nZKp+132hqn7ZaEIdk8dViKmxslUI8oQdNwy4juSEKVDOgy5bCrpLm8CyCrnR
         3WRixvX/TWzslei10ilTrxvV6O/N5bk5d5kDE0HG1NuUFnhl0L1IHdrxZOK3bSkCnMBr
         M2hSbdMK6nV4nKq6Nrcwuq1x98rxHftjpvctit3OIVKkV42yHGPHlDC9OqdiXbgm5Boz
         hu2qnTeqolPGtHJPpmA5koo1TzDC+/qfW09Lnjcu/80usUUM9ulbIArItqr9yMuM6xaM
         Ex4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717518394; x=1718123194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUCeKEvxZz0HcOYxIJIcV5v8P469mjR1k6zX1etfeFc=;
        b=ii7+kcw+BxdZvpetqOkoOQc5djFfSh0eM2t/oZUiXjKEKp/awWlCddArkFpjA0chCw
         TdYTkAmSOM6hGK1awOGoA4HNLZ2FOeCss5nLukrTwXORefNqtirtRynP/LDN94Ep3YXO
         b737hPlBNi1Hnwr8WAfslu9LWms2T5lU13xs7VOLciV5wXUNWSsPIgg9wc71Rq1pB6F3
         z56hWEeffHA4NppsNHjzqZz01Z0bqrjtSZYl0Xmzft3ywoNi/AKNMZmSN5EkGAznJzkh
         iLe+jP4fB5HZYCOr0IISSLs6EX1qCVNd4AuZEFna1i+FRbW30UzfJOMvy/zrjn1940Nt
         CuCA==
X-Forwarded-Encrypted: i=1; AJvYcCWc7brERfOqFnlCkCIs/Ws85g3rXununXgUoyiSE2Gq0bvhd8OsGvnjuMKW3wZgZAE8jd5MZoM21b2ef8b5daLD0/PkDIP1ZhuB/ISWtr0WKbXb
X-Gm-Message-State: AOJu0Yxmumwl/niOviQ9p/OxVtLU/PTRifYl5ApegCd/tqoDO+vFEFro
	BuNvJ3WiqJoqWinaPJ0u9Fv6XHiSHrvfXpz7vHA7WsLTgHYImqjAPjBleW/Dl+Q=
X-Google-Smtp-Source: AGHT+IGK57QEvZAxhgQzPqjoqwkElo9aa4K3ynD1xAtn0P8/VrG1nhjr5im/3WDHATMN2L5PdEq7og==
X-Received: by 2002:a05:6000:b90:b0:359:b737:51e4 with SMTP id ffacd0b85a97d-35e0f2599f2mr11664148f8f.2.1717518394363;
        Tue, 04 Jun 2024 09:26:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e559:5ee:5c4:82bc? ([2a05:6e02:1041:c10:e559:5ee:5c4:82bc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35dd064dfd1sm12164509f8f.108.2024.06.04.09.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:26:34 -0700 (PDT)
Message-ID: <246f3565-8d54-4569-a9b0-164b653b3f81@linaro.org>
Date: Tue, 4 Jun 2024 18:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
To: Julien Panis <jpanis@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_092637_175292_74739ABF 
X-CRM114-Status: UNSURE (   8.14  )
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

On 03/06/2024 14:06, Julien Panis wrote:
> This patch prevents from registering thermal entries and letting the
> driver misbehave if efuse data is invalid. A device is not properly
> calibrated if the golden temperature is zero.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


