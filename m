Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98258C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a64PphIANYfYU3YFLL9kNsbZDLTdfcW0ohHTpNjtP80=; b=iUDsa81v4YONrl
	S03KRVils0Pm+f5lrE3TYpdvdUAW+E9FDUTBw7I2ByJserq83VNSm3d/zOfEVw4oQBpVqQlJ2u97k
	Vlr8gsEr3BMwOs26+Dv+IPkrtU6sbGwBNF5If0ahiByBJZ7kmsq/6FeywpHu4UwMlTwb5s1DRQEpv
	NGnHqCT49QKvazbpa2AM0ohq3lJt2anXFoBTWnbY6Y8vz/BKLIxfpCn7ymuNjhLBYCZ+9Ct6QcpI4
	fGo1YlSRkTh2l9qJq0b/yBbb4tpXbGQtm/ib5vrfyOYmtIzD6KWQhZf9fws19ipJ2qSrRdD4RCb7L
	O4HRjVDCzbbe8SbZYMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny8r3-000LG2-VJ; Mon, 06 Jun 2022 09:16:58 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny8r1-000LDb-E2
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 09:16:56 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 25so17660632edw.8
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=cmfLbqhoQiFLa5E1pfLk7y/mThg1wpsTvl0u1dgvBk0=;
        b=DfsN10T9CbmLe9U9m96Z1IaxmGbZ0TDZVgsUyWOX5qThqhfWdoOyHYVl5PbE4BENdX
         bAShDJrsPNXAA6j9S856T8kCzwUZ3d5jjkzumK2hrI7z0x/hireWPz3uQ0xMF1cLdAhm
         rOHZvrTxYtfeA/QD8+MKY4wM6/ax2EIJF+I7WSZjOtFsB4on29anw/lTywjujrxhwS/7
         e0o8/gLd2EC5aCcP5e8MJrqPgvNnmZzZrTO4TwI/YUqx/t4/YuNkHCWfPnzpeGcM2zmv
         XJ46EUMQgHG7MXU7O40xAHZEH5EcpB4lg7nCx0XZe6c45pQar8yYxyqY8DnuMg+O8cG6
         u+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cmfLbqhoQiFLa5E1pfLk7y/mThg1wpsTvl0u1dgvBk0=;
        b=SW0vMyEoS6cuEf4N/w6ziOW6Um2UDWad/6W8wW69zs4wA25S24y0YndDVIyk5WB+bt
         dbxlmggSiv5eRbH+kBpvGmDkXRly/TIXmNu+/wtx192iJw3CblzHZn8pagoTLPLFOehm
         5QGhgVjMy8u57LYYEO6nfu+Etje5iRjEYYCJ/29hP8mB0jCOt11XEWoV2ZuSKlRAEToc
         JXZ5DsonmIicevOvFn7kSn6KlGlGzxK4Z2q62tl+9soXKn6po6zWOb3HfqfMbTZfU2xG
         +L/C8DDy2yUhRms8CVUlNMB2r2qQynDPdmi/ZZ9JHG/Pom57s0DUZoZPdKm+aX2o5wz6
         rLzw==
X-Gm-Message-State: AOAM533wIabtQc432eowIKd/z4Zq68arHAcSsMAxzik0YPI64HD9Dvla
	S5RZtz3IEcdVaGixmCNbQ8a++Q==
X-Google-Smtp-Source: ABdhPJxjQO0yREoFPWIXHNb12VVyOH3vwlE+zaXsSP1AND8vy6C1Ufxo5Yw3+8L82h6QG+A8RMCxSw==
X-Received: by 2002:aa7:c444:0:b0:42d:d1d9:e4d8 with SMTP id n4-20020aa7c444000000b0042dd1d9e4d8mr25824860edr.145.1654507007953;
        Mon, 06 Jun 2022 02:16:47 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h15-20020a170906590f00b007081c5ce04dsm5846061ejq.58.2022.06.06.02.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 02:16:47 -0700 (PDT)
Message-ID: <b6cc31fe-1d71-376b-31ad-a149d2224d53@linaro.org>
Date: Mon, 6 Jun 2022 11:16:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] memory: mtk-smi: add missing put_device() call in
 mtk_smi_device_link_common
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220601120118.60225-1-linmq006@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601120118.60225-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_021655_535961_4ED28CC0 
X-CRM114-Status: UNSURE (   7.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/06/2022 14:01, Miaoqian Lin wrote:
> The reference taken by 'of_find_device_by_node()' must be released when
> not needed anymore.
> Add the corresponding 'put_device()' in the error handling paths.
> 
> Fixes: 4740475 ("memory: mtk-smi: Add device link for smi-sub-common")

This is not correct SHA. Read:
Documentation/process/submitting-patches.rst


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
