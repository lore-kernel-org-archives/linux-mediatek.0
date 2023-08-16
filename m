Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840E2C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbB0m9jG4429KI47XkJsVs85hA3EGeFnXeCiJDrb/4k=; b=mLDlw+V8pqEsF4I97IcHomwSgd
	4VgwKUFsLZnoH1TmT3ULYFyhN+SGxsWTs+6baLDUGsZusBh77Dxc7v630RTZ2mza0UNuf06IOdSh+
	glO42eva1FmDi20rzNj/Jp4iE4arJnXMRdm7boc0ZQbigyxOD1GSSL1AwrvlsGA1WCHn0oplxLxLb
	CpnwVerxpci0bWuyNiO4ngMJNaOOU4WM2pojI4O939MNfTpWl7LKKCzgJp2fj50XA+p6OysI3HMYm
	M2qBlmnQhA3MZsC6uV8I8ts0XN/7YaTun17B/ZpzE2t26dLyKsBMl42wMXxLfEopTH6Q+NTqDcTDF
	Fan3RzRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDQV-003hHP-1W;
	Wed, 16 Aug 2023 10:06:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDQT-003hGS-2E
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 10:06:55 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31972944f30so2792996f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692180410; x=1692785210;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbB0m9jG4429KI47XkJsVs85hA3EGeFnXeCiJDrb/4k=;
        b=r9gn5CeiUSXfg+w1EI5cqkxp28xR87PUwiWYn2eefFZJfOqMMFn1CDOOzLMg0e2e/D
         2lMbEqH6MulqSl63hi+Bd9TrMcfAJCy+/JOzr7cWjrhrn4lCmcKQIOLqcLmBxvs9GtMD
         Rtocrug9Rnww7uuW9jFAPsEV47g5pVmz0vXDozvIyzqvfwiP4lOri+WD/9iE/v5v7rWf
         JxVf0eSsbGeNl/CT8SqtUGA61x+Q+gnPbyQrAwqRe2qDwL/CE1KNV03a/gY9eXqj+Lbq
         K9JkPpBnsNq/Ae2MraylUXCrwD/IuKSkDJEQRQF0la12TAoZGgrMtXJ3d96iFfr2EGzJ
         B9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692180410; x=1692785210;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbB0m9jG4429KI47XkJsVs85hA3EGeFnXeCiJDrb/4k=;
        b=W/8JrI6ASRol8nhEhmCsK+4/o4oCQDZ7rBOc2TRk42uQQ8k2wS4jAUpBStIilAmSjj
         F8/TSWoOrh00vmElp9dAwYYwg2JuBWFNueBi8d6n6RX8Z5J6JIAM67NZHuGQz6Fqx2WD
         2UoBd8wpDFpjOIq6j0TnBFhiq9/W9lkOjnr7VrhkLGLniWW2IHRIvDeAZMg6Z/0pffHi
         QuD7q9FYgJ93uT4xtwKsSYWlZ3Aye9dBLm3x+rwLm6PeHwcOyAw6wDejzcMN5DMDqRyX
         abhy4mCq1xmpuWZz3e44obpIu5eHxtlm5jJ4vNg3DbccAJzgt8pkAuvpKFenAvifTIF0
         ypHw==
X-Gm-Message-State: AOJu0YzUUJwoR6MQpfX+eSEAn8xZlQhAvn3kRwUlRVyNS+k8VEwyaDnW
	thmHgURpXvgymkm4+GxZeWtQ0Q==
X-Google-Smtp-Source: AGHT+IGWY/WCLAfZebyqWJoXw+L01sLw0TskurC4DcPHDorGVHqeHdru6MlwysH4nH9IQcec3JPUCQ==
X-Received: by 2002:a5d:456d:0:b0:315:ad00:e628 with SMTP id a13-20020a5d456d000000b00315ad00e628mr1033039wrc.47.1692180409880;
        Wed, 16 Aug 2023 03:06:49 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l18-20020a5d4112000000b003144b95e1ecsm20731349wrp.93.2023.08.16.03.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:06:49 -0700 (PDT)
Message-ID: <5545c715-0c30-7da5-fe5f-d414681ca7e9@linaro.org>
Date: Wed, 16 Aug 2023 12:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -next] thermal: Clean up redundant dev_err_probe()
Content-Language: en-US
To: Chen Jiahao <chenjiahao16@huawei.com>, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, bchihi@baylibre.com,
 wenst@chromium.org, robh@kernel.org, frank.li@vivo.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230802094527.988842-1-chenjiahao16@huawei.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230802094527.988842-1-chenjiahao16@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_030653_733683_60053A1B 
X-CRM114-Status: UNSURE (   9.06  )
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

On 02/08/2023 11:45, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant.
> 
> Removing dev_err_probe() outside platform_get_irq() to clean up
> above problem.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


