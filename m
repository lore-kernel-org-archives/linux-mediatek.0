Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C6CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hESFz66pGYPiw3LdS0z2t9AkdnHybf1jrKiYG9djd50=; b=Y2eRMMfmD+OT6nnW9JeAAE3F/O
	E+eg/ifKiG8BPl+LRwR+Cj0ChdRKdql7Kc3Eh6c5ehujq7ZeDbtQiA8AuUPBOdDX99Q8IQ4hK+nNt
	8oUXEDTLLwxMU/9k4bgJuyfuG6+JxLOLtLv8bf9b+2J3FaokAsmD87mrb/S/tN7TZn0xEIw1H/4xI
	azb3V0mbUqUNy8qEDeLF/H7JCaMb5MNKrnqQ5AasbftEpYwUXOn3EoWNp4TJzdjxs+Tcg67vG+3v3
	mshPQF8OQrizRJUp5/gRjNyxp2fa6erz+gAIUQN2mxURW+FPb/XXfCLQv02IPoovr4UEkvG5fz1Fp
	+aNRjnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1owB-002LBY-Hf; Thu, 16 Jun 2022 12:49:27 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ovz-002L7R-BY; Thu, 16 Jun 2022 12:49:17 +0000
Received: by mail-lj1-x22c.google.com with SMTP id m25so1357987lji.11;
        Thu, 16 Jun 2022 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hESFz66pGYPiw3LdS0z2t9AkdnHybf1jrKiYG9djd50=;
        b=HsrfKgDGX5TxR8pSo4XltbKHokxukbGhJItfynC9jGiTojG7IEu3X7DmlesE9zIcDY
         Vs9d2BDPVN4PZshDww7+8XwnJQTMK31HjIW31GtpwYmrQdEKnTqwiF8FNVMXqWONqmip
         JfTqWXNNEKZXJz3MzgPe4JFwW/Vq/IKDnht8bLkXjNE5XvG4U/O1s0v1McOb4WC4/MvU
         zxMD14c0HgWhbKgs9hOfrvwbbVCGlnxzE6SgTjBD8qTQTmDMyYwR1ezsxa3dEqa4oTi5
         UuR3isq5MaMov5+4koDk6oTFEKkvhSei5cuyJuH0kyostJ8J5228wxNnzOSVUAAWq+O4
         S2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hESFz66pGYPiw3LdS0z2t9AkdnHybf1jrKiYG9djd50=;
        b=qgEruehwMs2hKOM1VE8ASy/J69rws1WADF/KUox8wKYYIx+bc0Qfck0vjv0vni7a7/
         XgM3GZZ0urS8O9hqgGTHhXnnoEHoAREF+QAUji39ZPEKcG7HZ+xLuMuMTeyhWTbgE/rc
         TxaOm8+C1VIa1q5ghcyOXbuMKgZCEQBR2ylcJQAsSGa/aXGZhrXaEtYBgNGMmOBqn5xs
         afO/rrbJmKVIYS5+SUwqs4LbpzMXK249tV1k+Z4tTUdtBXQ5+kRGuSytgfPlK3H/BRNr
         nrpszLvTag2qzR5jBFXhhv9tVXRGd4L5r6GRxjLz+GIEHRcCYC1TDWrl+q2sk/Pbpvpp
         caNw==
X-Gm-Message-State: AJIora8xkdIC9uVLKh5XBgv5GD7mlIVbDSxh19x6c9eAf5uW1xUBTiku
	zMvsuvY4ZoxvDszTVZR8FOk=
X-Google-Smtp-Source: AGRyM1tqk0FvUmgFrBjiTkmoBCqC2rb0nk3jQIdRCmFABWuipeaHtdMQkVk00ICE9DYQg7ZeZQLeYg==
X-Received: by 2002:a05:651c:550:b0:255:5b77:b1a4 with SMTP id q16-20020a05651c055000b002555b77b1a4mr2506358ljp.181.1655383749649;
        Thu, 16 Jun 2022 05:49:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-136-92.dynamic.spd-mgts.ru. [109.252.136.92])
        by smtp.googlemail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm238709ljm.122.2022.06.16.05.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 05:49:09 -0700 (PDT)
Message-ID: <aa1f187c-786e-16ca-c156-448108f8fcc5@gmail.com>
Date: Thu, 16 Jun 2022 15:49:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] soc: mediatek: Introduce mediatek-regulator-coupler
 driver
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 alyssa.rosenzweig@collabora.com, nfraprado@collabora.com
References: <20220616094502.15318-1-angelogioacchino.delregno@collabora.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220616094502.15318-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_054915_879848_8802D2D9 
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

16.06.2022 12:45, AngeloGioacchino Del Regno пишет:
> +static int mediatek_regulator_attach(struct regulator_coupler *coupler,
> +				     struct regulator_dev *rdev)
> +{
> +	struct mediatek_regulator_coupler *mrc = to_mediatek_coupler(coupler);
> +	const char *rdev_name = rdev_get_name(rdev);
> +
> +	if (strstr(rdev_name, "sram")) {
> +		if (mrc->vsram_rdev)
> +			return -EINVAL;
> +		mrc->vsram_rdev = rdev;
> +	}

You should filter out regulators unrelated to SRAM and GPU, see
regulator_find_coupler().

> +	return 0;
> +}
> +
> +static int mediatek_regulator_detach(struct regulator_coupler *coupler,
> +				     struct regulator_dev *rdev)
> +{
> +	struct mediatek_regulator_coupler *mrc = to_mediatek_coupler(coupler);
> +
> +	if (rdev == mrc->vsram_rdev) {
> +		mrc->vsram_rdev = NULL;
> +		return 0;
> +	}

The regulator core should emit error message about GPU regulator failed
to detach because you're returning -EINVAL for it.

> +	return -EINVAL;
> +}


