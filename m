Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B5CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 10:39:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E15D20771
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 10:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CpNgg5io";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZ8x8EX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E15D20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KlFBSDH5ss7VCX3mCSCnqhLa3EKtTQvnyaKY4d9+uww=; b=CpNgg5iosGg25Bh2wLFIu/uil
	VEy0Vp+sgR/eZj8C5UmFVABeR3dzD50MiqD4enuAEDtqdyPM0cOBvpAED4W7qwhk0Mnt0mmpXYuTV
	xzBeKcwpLBRkitCLE4zv9QBFOhL37zZLoW/HSqGvOrW73hHwltUv9ZLHflEYwrf/p89WZl5Rv5+7O
	qJjr+bDtW9MqjuI/o8zMM7SqAY2HJuwl52jlrqlqAW5Bm3xVD0WPCXY00tIDCu7jyTQLDLcxCD1KG
	ob5jqaJDpG3HnJQsmTDPGPuGGw8v57L0Q0Id6VstnTrGNGjfttEA+SABlyBgAKzVGoViQmxYVSS8j
	p1k+NM0dA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyC9z-0008Qh-4U; Wed, 22 Jul 2020 10:39:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyC9w-0008Pl-Ov; Wed, 22 Jul 2020 10:39:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id f2so1395597wrp.7;
 Wed, 22 Jul 2020 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TV4ergjkftjaZomx8AqjCOlT/l5mho+qoW7fAiO7DwA=;
 b=MZ8x8EX7EI5Gki/n02pEYgl/ub5LEHKa8Kws1JGFicYu6gEKCb48xFnQso4xw5WDi0
 4vZ/2dgM4g907i/tzKZ0xo0hx8P5UsH46ib2vUDwpXBrO49OiKoBjlSvt6AzLFeDst3c
 CTMARSgJMmxdrMkBfdL3GKnO/UZ3MLqyu2rF55tJ1+8eJgfd3uI1cAKoAM7+lcc8CBHQ
 qPN2Plu/Hf89BTllLBuF9IS/Mw6g2oscSLlAymf8C2NFheG9oLneYJdoHD9yytjJbVGz
 LPLXxDft/uf7v4H05+THcmyNsAwohkImDEntoRi7PVAhKdk95Xj4xBV53WHhiRWFQcfr
 lkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TV4ergjkftjaZomx8AqjCOlT/l5mho+qoW7fAiO7DwA=;
 b=lqBOZHwtv/oCDFjFc0XhSzxoBL5A3pObtaYFjZpeq0unTKszkrSWneMLi2p7xvnjSN
 eoAf1uHkt0mcO1yeVYfo/LAAo5Z0RT3CKdckjSCLZgq2pp2eInN3Zg7kzoIzeNRmIExM
 jyC8qmd/6kn7f7jBnlAf7M3BKVMnp1cvGtxUw+6ge0YuN+xuWQqdobEo/l2lE2/8+ih5
 sgOKuJ9Ln793olajk8eAo1A/6q2fThxm4o6YaFJ9/1kn5YwiWJ6TtCtPcS0ZW2KyJswB
 tMsOUBrsP/jFRL06HKLNWUZKRe5JCqaMDIPwEjlmmCjpWKH4biknlG5fXCB2asowMN8z
 t9Eg==
X-Gm-Message-State: AOAM533hGfnn/0kecHO/2xGFjNsvUbV3eYUGMAzbn4cPB/f60NR364pM
 EfCCY39E4OBWYXSPXlSLm/mu9dJD
X-Google-Smtp-Source: ABdhPJzccNJ8vHlvkA5XruDkm8csHTXrgtgDkPe3q+BBmvVK0PQT9d6D36+7jU8Cpg/rLDybhlBmjg==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr15608967wrn.389.1595414375595; 
 Wed, 22 Jul 2020 03:39:35 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id p8sm29564205wrq.9.2020.07.22.03.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 03:39:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: update bindings for MT8192 SoC
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
References: <20200721122436.31544-1-leilk.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <97bcb048-81f2-0147-4c62-9172c27fff71@gmail.com>
Date: Wed, 22 Jul 2020 12:39:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721122436.31544-1-leilk.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_063936_838385_8D3A43CE 
X-CRM114-Status: GOOD (  17.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/07/2020 14:24, Leilk Liu wrote:
> From: "leilk.liu" <leilk.liu@mediatek.com>
> 
> Add a DT binding documentation for the MT8192 soc.
> 
> Signed-off-by: leilk.liu <leilk.liu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/spi/spi-mt65xx.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
> index 3a8079eb18c8..9e43721fa7d6 100644
> --- a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
> @@ -11,6 +11,7 @@ Required properties:
>       - mediatek,mt8135-spi: for mt8135 platforms
>       - mediatek,mt8173-spi: for mt8173 platforms
>       - mediatek,mt8183-spi: for mt8183 platforms
> +    - "mediatek,mt8192-spi", "mediatek,mt6765-spi": for mt8192 platforms
>       - "mediatek,mt8516-spi", "mediatek,mt2712-spi": for mt8516 platforms
>   
>   - #address-cells: should be 1.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
