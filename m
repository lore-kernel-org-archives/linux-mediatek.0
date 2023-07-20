Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2175AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgJO0hqYDA2Nqh6mu9cc9MRnvY6CGEvkARFrTIY0YJA=; b=akuTmZ0KyJ4fziXMLNeb3Oa0O/
	vqwCiomHigqrDzpdFJwaV7bUveIHf9gcLLEPrepMnBKrnMuhLYKYsEBsnegjrbxGhKGbgNIo/5lwc
	65AJR+WRiElBawsAssc2ECk6d1VA3WBPKaF9xsXAWmpgfvt6/P6af5lLlvH4GE4RpHb/27JX5GmNW
	WEcBcW5BADJxvyMpzg524L7nOJjLEP0S5sXdn9H5hCuPgUcW5c6DHb21/t3eUUe8EJXTrjyhzJv0o
	0MKb5Gqib2t+LWhpGWOQxtHQpx8TVqQ0M3n8uuhXrYAmGDHT16ZXAl+Xn/SIIWHOCQcHA1uANOoe5
	okmUfa+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSLR-00B4Fy-0M;
	Thu, 20 Jul 2023 12:01:21 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSLO-00B4Ed-0t
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 12:01:19 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so1061416e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689854474; x=1690459274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgJO0hqYDA2Nqh6mu9cc9MRnvY6CGEvkARFrTIY0YJA=;
        b=EOnVsmgf5wMcztiewlDLKo7adJCc3hQNng9qGUN5JC8Hcg+x8KA9b2OnMFx6Y0HL21
         BV994Fat4mX+vuYsz8ITdIIyYDIrszAQlgSl/eplNkls4pfBNg4xIAzQghKmT3CG2P6c
         1q74DYVpdC1OL7bkDbZ78t9OLKcAXnBCDUboybEIsiGVBUivIhLWBa/7JKecC8TiKlVQ
         S8vOm3+7srRHbyo7DrkQNI6S/KNUsMYUyF2zkSfKHBh/LoKkON8ede3wZzn61J/JzaLu
         3J/kVU/2stVdKKxvg+2YFEsZt7y8c+hK7msmYqYP0m9VJwiNBFgUsIFVB3z1osESOkdb
         JSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854474; x=1690459274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgJO0hqYDA2Nqh6mu9cc9MRnvY6CGEvkARFrTIY0YJA=;
        b=c3XFgbPe6wvlXE5qP8yGQCRpLytonfJy4mJkf6mUoWCzpr671FsXKsVj2qpBSKNXYv
         Rxa/kOtfKuwwtX7cjbMok0St1qehlcfR/tG+uKYWCDEv3xGDiX5H5jIFlOXtZ/utAPWm
         Nm7vBvffWqeK9i2NDZLF6bx5a8dkDZJA5qUpV9UTByhJ71qk1bj0ND/Hd3zbxs77Px2u
         AIVp7sc4ShxDCGo/75gklUjKj66LZC10oLO5YjPipWy7uHO0Yzmk4V714YxvF664w2AH
         VQoyehinxSfmOKXzZ3GcjVB9D78lKz2f3uxCuhkZI+qI6MdcY1O0i8Mng2pD89o4mN6/
         B2ww==
X-Gm-Message-State: ABy/qLZ2h2FYOhtYNfV9RS3oMjqGsZ1ewU0pbq2ul3/DkPSL/Wpsrlh2
	wfxESPa91kG5ZoJdMLL2YbOSVsMBVOlaqZp3MkQ=
X-Google-Smtp-Source: APBJJlEnYSy7ib/63UPVp8rdhMsFgvKjS/5g6LIpVjoes/s6RzvAdUJsWw142TXV/PG4TnnV8arOQw==
X-Received: by 2002:a05:6512:2212:b0:4fb:844c:a867 with SMTP id h18-20020a056512221200b004fb844ca867mr2658884lfu.9.1689854474121;
        Thu, 20 Jul 2023 05:01:14 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h1-20020aa7de01000000b0051a4fcf7187sm663363edv.62.2023.07.20.05.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 05:01:13 -0700 (PDT)
Message-ID: <a85ee57b-d000-7eef-6817-82539d37ed32@baylibre.com>
Date: Thu, 20 Jul 2023 14:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt6795-xperia-m5: Add DSI
 Display and its vregs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
 <20230720091559.86406-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230720091559.86406-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_050118_317042_A0866449 
X-CRM114-Status: UNSURE (   6.75  )
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



On 20/07/2023 11:15, AngeloGioacchino Del Regno wrote:
> Add support for the DSI display found on the Sony Xperia M5, including
> the necessary regulators configuration for it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

