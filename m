Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA42C001DC
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3j3NwAPFY78Qhs50ITu0+2oTOBybcQeJnKlWCP159es=; b=xNbCvYNy8tfemQBnIYO5sYP4me
	LtFlw5pnyaZ/iN1uQSK1K+QtqWmqJTAN2iHKxmdSqBD7dijCJyF0QF7y8GD9WCQYsObDEE80+qTgZ
	0YeJ1Pct20GEUK0Sa+xPeGHNWXm9dCG5K0BU/iOxU1prVzDQ+Ezrxv/nD2o4cSzPVR8qwTO4G3gp6
	YealHS3mIhBTHaoocxLu2u7ajDxQjXOcxDn0Ihbrqoau5wVrYGe5KzvuhDwpNAOxkcD5UI2tB3prH
	kwAI7L2HCIx+gG33UTc0sxM1rWhLuZhwiYSOwVhGptRFKiccFTtnr4O/gQN4gAeHOVX8SLNUvJFzB
	31ABRPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlrF-004m8t-2j;
	Fri, 07 Jul 2023 13:50:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlrD-004m7M-13
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 13:50:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so20992455e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688737839; x=1691329839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3j3NwAPFY78Qhs50ITu0+2oTOBybcQeJnKlWCP159es=;
        b=I1+TSh7b2Q202iHBO0hVfS9/ZziI37tnntx0FsMqkX69+DWkfi8eyU/v0zCNtXb6OL
         4tuLAI42Y184Vgke/lieW0SVC/kyYH5G0hrPG9W2Yl8F/+115Nqfm1pAaxEhiRrDHLDG
         x237vmBWBcvEWIK8n5TIu0MAILF6MaXGiLEGnyYnaXwSTLztju+o1QC+Jqp1CtgOQqW0
         BUG8j7fw2muDJtzkad1KsxPieG/xCFgZRvJPknzUNjZvOWNGvkissjBOF90zoQ/e688F
         TGC33aCJ20gRtzV+C4WI5xceHCURxEorMwc1DBu4fiDHRpKJVQGdRyXQsIRY1LVN/yU0
         7Zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737839; x=1691329839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3j3NwAPFY78Qhs50ITu0+2oTOBybcQeJnKlWCP159es=;
        b=l/Qz5JlhogmHlgCzA/8nIfZ5E3HmlvwiKf90Y7ud2vtmpNIQW5MU4QJp+jgLwXdMdt
         muSTmhKM5oCx7d0f5YaxjW2Alcecqdn9swiU6AKaQWyOwndM9CGBpTlPvNw8YCTuVZxa
         OZ6CXZOQWQ8tlwPYECDTaajWm1+0MvDhPVr1WRuL59bVU9GlG4R7pvtyhUeZO2cEVRto
         vJDpgi4oJzqn5899FI3fdmGtE16HcSO63BxeVc3jn7E/n/KMR93XkwkrGUzX3YC0meJa
         HNEZDZzZPKJ3U6u2rthLDgiIPfuwrokFVYbGxTWHceNhtmxpYLareWKQcfCCTkrWnVb+
         8N9Q==
X-Gm-Message-State: ABy/qLbTDUYHoRHBoIHBEPYB8ESR4TFrHnvIkfYsFpd3jLGvsIt1gbLF
	iSgNDZwrS0C/7qk6rTt3Hu6QJg==
X-Google-Smtp-Source: APBJJlETRcrMTPhEN/HPK4s4f3CyhXH6jBzJpRJpJVuRp4Zn+qZ7qEfjxymL6GD/vVJq5JP8oFpwbQ==
X-Received: by 2002:a1c:4c07:0:b0:3fa:9850:8b1d with SMTP id z7-20020a1c4c07000000b003fa98508b1dmr4038526wmf.30.1688737839661;
        Fri, 07 Jul 2023 06:50:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c740b000000b003fbe36a4ce6sm2542924wmc.10.2023.07.07.06.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 06:50:38 -0700 (PDT)
Message-ID: <26d9e485-e9f6-7217-7c88-4c9a9b4dd9ea@baylibre.com>
Date: Fri, 7 Jul 2023 15:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/6] thermal/drivers/mediatek/lvts_thermal: Honor
 sensors in immediate mode
Content-Language: en-US
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
 <20230706153823.201943-3-nfraprado@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230706153823.201943-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_065047_360917_7CDE3CFB 
X-CRM114-Status: UNSURE (   9.76  )
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
> Each controller can be configured to operate on immediate or filtered
> mode. On filtered mode, the sensors are enabled by setting the
> corresponding bits in MONCTL0, while on immediate mode, by setting
> MSRCTL1.
> 
> Previously, the code would set MSRCTL1 for all four sensors when
> configured to immediate mode, but given that the controller might not
> have all four sensors connected, this would cause interrupts to trigger
> for non-existent sensors. Fix this by handling the MSRCTL1 register
> analogously to the MONCTL0: only enable the sensors that were declared.


Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

