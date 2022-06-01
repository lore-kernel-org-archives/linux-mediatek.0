Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D9AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pj68Ppl7iSNoRq9cvEi4EBW2SUjTnteDMfpRBu3Y/0A=; b=Vje5cCzTNIT4yR
	xiryW//7i4f6aemW4G7SHkbn82rXEjwCDhu7aau0zss/pLnetYrasX89fRCTJO4w9OULw5E2CV489
	M9AzcmZBFm31aFSUBzJHz0Ff1sF2mQHk0h/Emf4PjNIOUUtTqpbKpk3INtq5Sav8BJqVxP7ZmL2kN
	E8EsyQ4oPsNOmvCPHZP3GOegB6sgCZ2Gug0C6PNpXXKSKCdk2J/H7Yzn/K5e0qzcHbZNXpGCwCz9o
	ql3+vSNE1hCn2En5jNCpTLiP+DGt4QEMCYp7MZ8mdV79/CDws7uSGjS7T72JI8tZ6Bipdp9r/n967
	wg4HZ95JzSTWp7n9G9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLSI-00FF89-CK; Wed, 01 Jun 2022 10:19:58 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLBE-00F7Gq-Fu
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 10:02:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z7so1420084edm.13
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SCHPOUMOkaORGlqy58IkS3kpUvVCYFXurWLIORn2AWE=;
        b=R+zX7kVN/rZH7znS8QEbRvDrZjdPSwyJ5JfWczekV05ct6k21Z+QNzRMQ4DT3lLH+P
         YGv+8cYMFCE+D6IKLUrFn0DDIz71NsUdzk0zCCbyKq5E88agPjfsSq/Stk0xXIj1kmbu
         R58MwH3N19BBhqt0epKSgNdhfQsoePTIPnN8tfb4PZgrSxWCngSmYVPbhn8zSOLfO409
         feZfytnIiNSrXWHr1t1ObzSgHFHYxacwrK6r+j43OWyQGwuyGosxBPFpDypkatmsjm79
         Wd/4BZ4RoctSTUApmv410sKQkDwOKVwtvq7OE+MPQNZEl+gZynFZ8eQRrS/wc0PmvUHH
         6JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SCHPOUMOkaORGlqy58IkS3kpUvVCYFXurWLIORn2AWE=;
        b=ZqVoVrJi7qlVNaJqhsGSIkt4r0GWScsQ2baPzOH9iV2n7fkm+8n6dZ2OOADsz4yjNV
         06dlipfHeMmocvQX8WAu6g/DVCouAyqt8MwexR9krwaXzRKnhR+RLMbAKU3LehYQ7mGk
         K2MjMtF+bnNIXmYeXhqOweHrI1P8KPjnyWyHAkU+DIrRa5J+PcuQ9V9h4+i0Mmgfq5dJ
         jtBIZGSIodO6X8mGTd6Sc5huwUu3EcLhnGx8YHPPvrm9xyoDAM6YnGpxJqMB4ZERgqvF
         jK7xTiNYypBuupaOKnOKcpa16bQ+wbeKE9KAOORfkQsoiy172pR3dltwQtTt4NoSY5rM
         ghMg==
X-Gm-Message-State: AOAM531uLrmAfGO6mz/pnP4xfkMU13FLbTKFRu9iJKt55S1fSOI/dy1w
	pxtzNx6W+Q3sDjV1AEbOrMJjMw==
X-Google-Smtp-Source: ABdhPJxLqP7ex7CWmzekAAXsNfAbzxWW5D6xCr+9fxNRGYNHw1oPaWfu/s0TxV2jD4YRSiBzoXwjbA==
X-Received: by 2002:a05:6402:3585:b0:42d:d6d9:385d with SMTP id y5-20020a056402358500b0042dd6d9385dmr12945900edc.334.1654077736859;
        Wed, 01 Jun 2022 03:02:16 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lo27-20020a170906fa1b00b006fe9209a9edsm505541ejb.128.2022.06.01.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:02:16 -0700 (PDT)
Message-ID: <8507d1c2-125b-0753-b97a-5d2b8e790dd2@linaro.org>
Date: Wed, 1 Jun 2022 12:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 09/17] dt-bindings: spi: mt65xx: add MT8365 SoC bindings
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, jic23@kernel.org, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
 chunfeng.yun@mediatek.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, Leilk Liu <leilk.liu@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-10-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-10-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_030220_573574_E250214C 
X-CRM114-Status: UNSURE (   7.10  )
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

On 31/05/2022 15:50, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
