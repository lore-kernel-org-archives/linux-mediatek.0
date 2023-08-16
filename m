Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB628C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIU+3v620e/qR+OazD/iwX+iJVdPgWNdheqcCJu+B8s=; b=WxbwwHV885SwemSHWx4bt9JvpZ
	tKVBZ1EtXKM1n44QiMan0k2f3RBEYB2O0e9V6C7LkRKmNC1KLiYfBSZrXXAfBLWgWN1EChzgeeHgs
	/DWttb6n0HF7NDJnzlj+2So0ZcsXCb7kjee4dWwpan4ZHYNXoKvO/kt0wZkXnB0iJeNskS467j5o0
	5xffNjAJnRmKUOIdgqe1C5ZZDAnzteczQvBBEO8i6yN5Skqxz0eewdyUZfVRl1TzM9aRsJDlwMXMh
	+UK7q7n36QOTbEgUpnEOY8xC+mv0wF5YgpGBsMmtc36h1P+DuHtNJqz3fjlieDq6aNiaFYnEDzoj7
	ZzDQzNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDei-003ke6-2T;
	Wed, 16 Aug 2023 10:21:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDef-003kaS-38
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 10:21:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3159d5e409dso4428179f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692181292; x=1692786092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIU+3v620e/qR+OazD/iwX+iJVdPgWNdheqcCJu+B8s=;
        b=XnRe27BfuV2jwwNMrL+u9V4IDBUVxlfJKPM1M5IgrS/HSjbTBERx8W8BgAEJ9k/S1K
         fuqBMOXlkf8nKAdKbN1Rf2oa/gKLxRiY2VXLeIyuKLMLesZ23iHlkklfTUw1cBqf+0Am
         zC2cPIxlIcx9o1lnZl4X77ErkCSQoZs7uEWzUW0tpS4S1VYv8QJSFhePwN6NLZE+hmtV
         u+DmutSvbuB5r+XEFbTwJlyeq2pzHcZq8C3p9xXuWpUvhQTpGc1Jw3VG6WG2gbvGyxPy
         sUpypm6yRnCGhuJTLkXYSvTM9ZUVoIi5aJ/hi08TPosBStfrLyH6NYhtKka8WbEv78xZ
         RoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181292; x=1692786092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIU+3v620e/qR+OazD/iwX+iJVdPgWNdheqcCJu+B8s=;
        b=N4Tw3Py73AC7tm1CK07V+DHqXbpgBv9azZoXfM8eN3QQmQtoCjIn+3A2XBC7BSCV2W
         jjqwuO+R4+xlBVDK0y16h5+PDCjCzhMuCKQbBtjVIxXDx5/UnxcIZn31axIEtDO+viMY
         uzB6klhlL/nTciaZv3fEovYciD5NfcE1suf4igO7JU76fYjc0E5ZVgvbZOkPn49C7EP2
         OMzFrRcREha3MaGsEtiAest8erWGJYp18Wnb7npalaGD3xoBQkNhOJAzdqLtu2x0Em59
         QbmqHtlOpoVp/tL2N8yt263QDsDaaEoLUEz983ww+Ebvofjp6g+HX9Isoz9zu/Wk7MqC
         bHUQ==
X-Gm-Message-State: AOJu0Yw/yBazUvNLvCT0/WumEFJ0af/hoCMjhrxQkpRLHwqXuApyOTKI
	C/VYUB6V5k7MSor4ASOfSHqv6w==
X-Google-Smtp-Source: AGHT+IHg7S0wnsIT8U9iSEW8TEsPzDlLOtUItAdmdZ1HCoMKvbEFSom8YJGowp41H1r3hiKJ5Knw5Q==
X-Received: by 2002:adf:e692:0:b0:313:e88d:e6d3 with SMTP id r18-20020adfe692000000b00313e88de6d3mr3427539wrm.14.1692181291609;
        Wed, 16 Aug 2023 03:21:31 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id v2-20020adfe282000000b00317ab75748bsm20771710wri.49.2023.08.16.03.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:21:31 -0700 (PDT)
Message-ID: <89fabd50-66ce-d94f-38c8-6dd6f343958d@linaro.org>
Date: Wed, 16 Aug 2023 12:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Make readings
 valid in filtered mode
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
 <bero@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Balsam CHIHI <bchihi@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <frank.li@vivo.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20230713154743.611870-1-nfraprado@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230713154743.611870-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_032134_007416_0DC80FA7 
X-CRM114-Status: GOOD (  14.24  )
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

On 13/07/2023 17:42, Nícolas F. R. A. Prado wrote:
> Currently, when a controller is configured to use filtered mode, thermal
> readings are valid only about 30% of the time.
> 
> Upon testing, it was noticed that lowering any of the interval settings
> resulted in an improved rate of valid data. The same was observed when
> decreasing the number of samples for each sensor (which also results in
> quicker measurements).
> 
> Retrying the read with a timeout longer than the time it takes to
> resample (about 344us with these settings and 4 sensors) also improves
> the rate.
> 
> Lower all timing settings to the minimum, configure the filtering to
> single sample, and poll the measurement register for at least one period
> to improve the data validity on filtered mode.  With these changes in
> place, out of 100000 reads, a single one failed, ie 99.999% of the data
> was valid.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


