Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25609CE7A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84D7PUCePQFRdDvu62AGfV5k8flmGsh21RMLVVMuFo4=; b=nRi13MNcMd6W2aE1gtP6pi0duk
	xmO3Y1XFgJ26ao5feN4/SaxEGijMjFmP7hPke+9kZlllBs2s8pn7eWiBNHmdqy2pkz68agz0eXqfx
	yYH6BqPZdhyd0g9YLzDXIFF8xByJ8ddc23LZ+nQfrid3hFqXPi1E5MSO6TeLhQBs/RvXilWBIE5Oj
	uV0W3gZTEHz6EqTJgnf03eC2e9MSBUH+/F11zBZ2qmTjmrIllQ9IyWYrIkGhEo2j7bOUHk4N2AgSh
	Y1pKSQC5jXu1KM/8n6oTrkAfFwsZpFwCUdlj6LeO+1DUkiaTGETE52ZemY2xaxmCGkqbXDg/x09vu
	v5IKz/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklto-00ENUp-06;
	Mon, 25 Sep 2023 13:45:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkltj-00ENSI-1E
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 13:45:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso802765266b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695649511; x=1696254311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84D7PUCePQFRdDvu62AGfV5k8flmGsh21RMLVVMuFo4=;
        b=N+W+MJ4XvIuCBjy7wAn7XvsT9eUMW+AnEIWD/L5W6UscmzLzgRQ5xKG7BYkMVPahIC
         AA3Zs/+q7fdj3TpNzyNzsaZsiK8vmK1qp8zBbUCFETvhKh4MErH+AWaSwkIUxUrspCN3
         z8oyBj22uwEBQRNlT4uP57h+4m2S4MIcna+kHsGJkG6NyxtrE+zHg7t1696Xf0yYxV/1
         h+h7fq49M/lt8oB0jsprrhRg5K6zIjOZGbUQUQrN1AqTQQtY86mq73eXPSSYmm3dGq85
         Q2GZdmLNH4Kw+A7nYcpLb+BBV2b5cVpTEK88pyhbnlhn8XSg1oJSV3FS3FlyYrOF9bJL
         sBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649511; x=1696254311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84D7PUCePQFRdDvu62AGfV5k8flmGsh21RMLVVMuFo4=;
        b=B4JUK2SdPYyhgG01HWdhJZyRGUt7t6HD0QHXAjbel1G/MzcHXLx/kdGCbTwqZ4rq66
         RR0YOnzsOnE0Ov2wOpd/BUJk8VG3444Xex0YLjVHsgjvuK4gvb6ISa/ywZpKOqp4Yvdo
         pcJFKnVq6caO44b40v5D5qLKJmHv9FBNtCoBE147xOXcrKuKkQRGTQXhaQZLqGseNSlf
         EXcVJWcsOE6wHSsqdaWN5oe0uJaIioUICDHpMxazddgYnWRKbAYaGXuz7V2jFxJwgBmX
         9N+z5u6ur79Tsoi6Ig1V3143Dpmj+21EAkdph2JEzInYpPqCrswnyix10DoNfnYGNpj5
         FjMA==
X-Gm-Message-State: AOJu0YxHxW4xC3pDtEEf17OxYnqeNX+IRx6lHf3VWaPNeZxoyEydYNXI
	/06JenaUjZvFw2s12ujVMiTibQ==
X-Google-Smtp-Source: AGHT+IHvPWYEayt34nl/PR7DhItXzsockASsra1AeLMx+QWFmGE2UZXNROAwEZtXhcRI1+w8Rhf+dA==
X-Received: by 2002:a17:906:2258:b0:9a9:f2fd:2a2b with SMTP id 24-20020a170906225800b009a9f2fd2a2bmr4920386ejr.73.1695649510994;
        Mon, 25 Sep 2023 06:45:10 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id dt11-20020a170906b78b00b009ae482d70besm6275624ejb.134.2023.09.25.06.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 06:45:10 -0700 (PDT)
Message-ID: <93cd247e-3491-d8aa-ed02-6c77247023dd@baylibre.com>
Date: Mon, 25 Sep 2023 15:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] thermal/drivers/mediatek/lvts_thermal: fix error check
 in lvts_debugfs_init()
To: Minjie Du <duminjie@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Balsam CHIHI <bchihi@baylibre.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: opensource.kernel@vivo.com
References: <20230921091057.3812-1-duminjie@vivo.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230921091057.3812-1-duminjie@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_064515_615540_AFAF384B 
X-CRM114-Status: UNSURE (   8.12  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 21/09/2023 11:10, Minjie Du wrote:
> debugfs_create_dir() function returns an error value embedded in
> the pointer (PTR_ERR). Evaluate the return value using IS_ERR
> rather than checking for NULL.

-- 
Regards,
Alexandre

