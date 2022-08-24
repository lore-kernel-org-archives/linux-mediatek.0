Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445BDC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O7Y3wJVPgnkwy4P2rEemJaId32uZhPl7XRxR+A9aIE=; b=Bp/sW+Ct15KJTDOmh3lo/OzTxK
	V9pkPpotoGwOWR30RhBfOLKDUeQnDTvvpHqxTkFlPppZfQx4PSjPmgyoDaxnITlvy6egfUF0+R0xg
	DN0BEEt8LOpuI24P1Gxonj7yzPgPb1yXSFpDwQDKK5cZbTA28P5mKioTxlFsmEVmzueIfyZmyjS4D
	3FnMCFcf7+ZgR2YCGZK8HKTXMQTM8fiBST8lLRApvyV4UCghaksVljUN62htqzPbWE0mzAPtKZotn
	C2KZGh1cK7YO4t5FDhxsDuWp3Ox0nYJx8JrqCg4lPnUbQndkknz5hdc5AKqsdU/pTunqev4/QsmHK
	fxp360Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpqQ-00CxNM-O4; Wed, 24 Aug 2022 12:50:54 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpqB-00CxGe-4n
	for linux-mediatek@lists.infradead.org; Wed, 24 Aug 2022 12:50:40 +0000
Received: by mail-lj1-x229.google.com with SMTP id q18so15325164ljg.12
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=0O7Y3wJVPgnkwy4P2rEemJaId32uZhPl7XRxR+A9aIE=;
        b=Yam95mWyIq0L0MGw6weU1DlJz4RMqiQEoSPqdYdcFy81HXgQk97ePlQVxKanlngc+K
         HPCgJ6gROEYSRn95DexG04ODFwjr+N7Vov8Vr2319AMy3HTwssnYvlvI8S8ckOSaR9kp
         uFRFJX9mvjDuNMkDBCYKiXmY316JHSzxe4vmilL/mRC+n5oIkUkCEVVF0vAT5OGhMcvh
         RORPoEGTw2uHQV/6Xr8/cWXvH5txQJ/4+SdXqP5BuQb+Gip2Euj4geU9z56JJcTPko2k
         txxzU7CB4NUVazI7dVgVoyYBcWNFP82sY6KhI7URrk0ZIkj/EvEMdoGFuXERGWMD6GR5
         2LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0O7Y3wJVPgnkwy4P2rEemJaId32uZhPl7XRxR+A9aIE=;
        b=yQvBVdbRh/y+RXMm48lS67/BnWRDmS0U59UEuTUDFjeRhtMFByNBIcB1COzK+S8rfD
         5JETZ0vs8mIs04rVSbsoQywyXmWUxeS/onTGZH0uvNVgrJrNAdyz2OGlwokIpv6yOQed
         Zh3IH3npEkKjVZOLQN3b7t+yLVUmldRs8tcU/H4MsNYsunbPKkk/IfFqfnL+8IA2MqnE
         Ar8Tqs5ArTdF1gSq1HTqaz4w386C+t7XxOOdcH4rYUv2F99Y+/FHUJL9K7lxyQXkJutr
         sVRdjkd+sJFpYAFWC+iyD8zmV9lnFaKkvbhrzCWrktNDT0r56zEujSkoNoqoD831Mr/c
         BCzQ==
X-Gm-Message-State: ACgBeo1rqtQVb/PVA9CQ7XoUVS6wkQfPeGmJXunDNheTzCe5b3TvX1sv
	1Q+qMiswBXETkxOa8Q58j0kNwg==
X-Google-Smtp-Source: AA6agR65hBbDRBSJCxuxnnZFSQvwtE6BrqpyaIPRWhBHpgpzD629PE3LDaZFuYdEe3dkvWfNHYdAyg==
X-Received: by 2002:a2e:9cd0:0:b0:261:e257:dfe9 with SMTP id g16-20020a2e9cd0000000b00261e257dfe9mr898830ljj.209.1661345437595;
        Wed, 24 Aug 2022 05:50:37 -0700 (PDT)
Received: from [10.243.4.185] ([194.157.23.230])
        by smtp.gmail.com with ESMTPSA id n8-20020a05651203e800b0048b13d0b896sm1312261lfq.141.2022.08.24.05.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:50:37 -0700 (PDT)
Message-ID: <fa3aae29-3445-328c-e400-5b91cb2da4c4@linaro.org>
Date: Wed, 24 Aug 2022 15:50:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for SOF
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
 <20220824122319.23918-2-chunxu.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824122319.23918-2-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_055039_238514_F314DB2D 
X-CRM114-Status: UNSURE (   8.90  )
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

On 24/08/2022 15:23, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be
> retrieved, from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be
> specified from DTS
> 
> Signed-off-by: chunxu.li <chunxu.li@mediatek.com>

Usually first name(s) is separated from family name(s) with a space, not
dot. Looks like you need to configure your system.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

