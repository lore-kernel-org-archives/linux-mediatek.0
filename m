Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FA2C3ABAA
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 May 2025 05:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtiRpeVXxR9eCvOOBV922sOn/8w2n9LL1EWjuBecP8U=; b=grspNA/WAif4CITVhAgm2iEyFt
	I71VUjvyCJqOSHS3so63r2gVCNFkFgyUesOyoX5A8irnbh6DPKq/S4V4Wek0EyWFqHO8guyldh9Xc
	w4VihPrGNih8u+665Eq8m3Xqj0t7rsA0OxxQNjCWusuryKBm17+mNDCa8OLsFeSdeD4HsLuaOy4Pm
	O7eMtusYwb7p3zgWMx+gRcUcC269zFYFtdr4ShU2dnXqQFOo+K4+BHYqrvI3EKc+x2xxxBDcxbANn
	DpEV8W9+eNFW5KX2uEL7/dlhaOoGENN5lYM2+Dj0/p3Pw9x39/p8r470irKWwhb4x9h35RjX2npff
	7PjeTYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBoUY-00000006S09-3F4R;
	Mon, 05 May 2025 05:35:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBoUV-00000006RzT-3iKB
	for linux-mediatek@lists.infradead.org;
	Mon, 05 May 2025 05:35:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso31094465e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 May 2025 22:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746423346; x=1747028146; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtiRpeVXxR9eCvOOBV922sOn/8w2n9LL1EWjuBecP8U=;
        b=B5HSxdmzRQwGno9mNLD52HutNIlCmMO66qG9lSmvKA8Qf8iaYb/I+WrkE0RjMdK8q6
         acBqdv1jDJZFHsFJiFabLqGJ+FINZIi9A4pq8Weu/eUrz6bB8M/PDYsLmFERoSSPNuSh
         swUO1ZeSh5ehCO0+edwlYipXHYLdWk08PY7qKAwJ8Hy8TFX/RYCW5ttAQbG6Jz6wxR7l
         IJ4zViwo93V3SdpH1a72bXHs9B6yXJe7x/mlWCH/3Y0pKixMdCerfi5jpfTjUB3evhD5
         vijfH8RQeDOqOCqojV/P20cBwh5L/SiihOjt6KHrJcgOoZVXIAxLuy+xCjHW/rBdL9z/
         U4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746423346; x=1747028146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtiRpeVXxR9eCvOOBV922sOn/8w2n9LL1EWjuBecP8U=;
        b=FbKqhn0m9aMhXjKU2aEZuunKPmc9rVYP8nCJWPI7Cpw2FmMt6qmMl6pNtT52xVIPRk
         9XtN78fPRQ2BpTMtUiPlD3MbkF/RIKPEUEPws2oRw0+9ZSkCPw/yVkfAds4dV6ASSLEV
         MJa4nzC/aBQliDd3BTubnhdNZGBCFxqhXijFcdI7iYMyMOGhVzKN6LebGuAj5LjDRbw+
         eMLJS6i9gzeOeAv17bfFrCCetonROqt3cdzBDn/vl2hbMFMToi/rX8uFHNhXCKfrtOdl
         DmCxXbhudXHV5N/Gp543aOE9fXeM2reuIUd1HbOlX8dOEEwY4BdaPJAnTDyARo3QdjL3
         Ypyg==
X-Forwarded-Encrypted: i=1; AJvYcCUgw1sHvl6J3MdsVJhDp9GuH6guIn4Y5+f2zwUwQyf22aXw+44HIDEtMUiollDUIP5Rys6wvxWKIkNvnQMPfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5zAjnrILNC8ZAXrBlULhEHMBLf6NJMGSkVaWvrm5QTz3bftD3
	17qTdlMr7bHFEfBtFtxV2Zhx7QahjFDpxi+rgZ/LxDbxJ8e+6q6aU/OdpxuZAto=
X-Gm-Gg: ASbGncvqRCok6FF5Dag93tYVmhVQ0Omw/XQ5LzRrvQDwJOaZlN5IcOWN10MrABXFOLt
	kAkJvvdqW9RozD3nN8Kdny4tIYB5jS1tWx219r8uFZOmOROWozqeMH8VVe21JhG4+0Os4CReOjG
	DXmh68reIoBIaBXvgfRyCMbhVM5iXsIFQzb8p/qcJQyZiRKi+FVZ2LAMqN4q4y2JZ0ntVGKOT/d
	iXetpzY+EabaG93ETVdZ97BcTMaAQQ2tgCzjKCgvehvmBgbcrWKBzUJqk4MSpQWHGBQapZvaOfS
	0TI1L+bKvhfeOJRwIVT9fsNLZMm+0e8WQ2fGfw8S9RRGcZ2qdNOzptPYixOc7riRNYkM+Z1Y4KG
	VYbKr
X-Google-Smtp-Source: AGHT+IF9Cgs7u7g3N65e59enpUAXh9IV5tRS5n72PCqZAt3FK4OAibdOBXfsQEdn8nqmP06W58BwVw==
X-Received: by 2002:a05:6000:4285:b0:39c:16a0:fef4 with SMTP id ffacd0b85a97d-3a09fd770a6mr3798232f8f.24.1746423345714;
        Sun, 04 May 2025 22:35:45 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a099b172a8sm9361125f8f.91.2025.05.04.22.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 22:35:45 -0700 (PDT)
Message-ID: <c3a3ab95-0129-4cae-9494-817d7e2b49be@linaro.org>
Date: Mon, 5 May 2025 07:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: remove unused
 lvts_debugfs_exit
To: Arnd Bergmann <arnd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Julien Panis <jpanis@baylibre.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>, Colin Ian King
 <colin.i.king@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250505052502.1812867-1-arnd@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250505052502.1812867-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_223547_942818_703FBBFB 
X-CRM114-Status: UNSURE (   8.59  )
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

On 05/05/2025 07:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When debugfs is disabled, the function has no reference any more:
> 
> drivers/thermal/mediatek/lvts_thermal.c:266:13: error: 'lvts_debugfs_exit' defined but not used [-Werror=unused-function]
>    266 | static void lvts_debugfs_exit(struct lvts_domain *lvts_td) { }
>        |             ^~~~~~~~~~~~~~~~~
> 
> Fixes: ef280c17a840 ("thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

