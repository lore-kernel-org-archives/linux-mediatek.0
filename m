Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6266C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egOPuEF9TqE75gZWwUjjn7qf+5eCfzce3I3zf+IUXOo=; b=BR+FQBmUX4w20rhbdJQNBYYfbM
	4fVMPK7jF+II0iTJkewe/KKpbKfDTXmW+hw9KOy0o48SA7oo5ysnudoXQ4VOPDxO8Jg0rKvnKY4Ab
	JZU035z4bdhLqKv5ek669Ba7Vd9rgTZNh1VN6bs/f/wtVXnf4kS652cEOyEP7Gp0Cf3dUHjxopoLp
	YeiW708LKF7JnEKAuW7yJIzKbQQceSh71IWgzlHgj1LCeQO/SZ9KpcOib1owGAq5BW9b2qpWURJ7J
	DuEvCdk5+XvpoGa+sARPKkTNqexDohZHQmq/Kdx32xwpW322YqaSCClLNhBajYhD/eBHBLlpY8IdM
	IvrVXSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZAt-00A4uD-Mc; Thu, 21 Jul 2022 16:37:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZAq-00A4t4-Uj
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 16:37:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id bf9so3598952lfb.13
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=egOPuEF9TqE75gZWwUjjn7qf+5eCfzce3I3zf+IUXOo=;
        b=lMktJyzrq1TEYow7Koe8TieEr0tXpOkNUlPK+blhOL7s0Kdtidyp+G2N+ZZ4qxbmXJ
         Rp4er8nUP2ZdowjxcqDVBUkgezKRr5hUiYpnrx98MPVLhAM3+X+EQhVKwNyndbiAlJp3
         VH6Olpyynvcz84fZOsOVU59G2lmJ4LI6pWUQxKBLL94P2AplGDGP8lN4I2DLdhUhz7kY
         1xByz8ImHNXldbxUkRDgSNOH5Nawi7AdKQpzfQ1W4cAQ/W4xVS3tx5VH3pskOBv8zBfz
         UlF+ESATrroO7a3GCavLz6U6tF1XOePATh4c/zdgh17bppeuyk23VaHEMB81w+UmMGn9
         deiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=egOPuEF9TqE75gZWwUjjn7qf+5eCfzce3I3zf+IUXOo=;
        b=PqfLwpYFt2DSAr/P7hB0ziWixkn/27+A+2+fyi4Iy42Yb6iJxOYVD8e314YJnBf5v6
         G/IrFLuYfrTWp6aHKQYMr7Lf+ksqe1bIkQDq93b95Fz3u//iSBWkRQdQywen1qxCs3kb
         i3eOOpaWP+SQPeeZGXoDHTFMGlXYC2q7DW8J6gGChweuTHCbel4eL9OMrBQGVBIPTFKM
         rT/CMdOAKMvvbjvXBx9BFPY/PDr+yFUG8DbBNigYp5MozW8vQ2A94KF7mY3L1DaXvHIJ
         MW3bs4QUQLjK9V78wJkxdSUyemkX0JGgZDpnkseThW1YmKxYwATtiyQCBku0Oaekxbei
         l6tQ==
X-Gm-Message-State: AJIora/+HKI+I1SJWc5aCXP/UEbQRPoba+xPtoC2X4ihjglYETGIeH3g
	Ux9vBQNuTvw1MUu/QYw3jJUvMw==
X-Google-Smtp-Source: AGRyM1si6G1spc2SptdyuVnAcORyTN034fH8EFU/ukJye3I59DI2LMn3mMICtmSEXg4uCa3HJG1r2A==
X-Received: by 2002:a05:6512:3996:b0:489:d526:93e5 with SMTP id j22-20020a056512399600b00489d52693e5mr23205070lfu.534.1658421435329;
        Thu, 21 Jul 2022 09:37:15 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id k6-20020a192d06000000b0047f674838a5sm188263lfj.231.2022.07.21.09.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 09:37:14 -0700 (PDT)
Message-ID: <67796aa8-6509-620f-f96a-ff22218f1b0c@linaro.org>
Date: Thu, 21 Jul 2022 18:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] thermal: mediatek: add support for MT8365 SoC
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, matthias.bgg@gmail.com
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com
References: <20220720181854.547881-1-aouledameur@baylibre.com>
 <20220720181854.547881-3-aouledameur@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720181854.547881-3-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_093717_023516_5067D1DF 
X-CRM114-Status: UNSURE (   9.60  )
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

On 20/07/2022 20:18, Amjad Ouled-Ameur wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> MT8365 is similar to the other SoCs supported by the driver. It has only
> one bank and 3 actual sensors that can be multiplexed. There is another
> one sensor that does not have usable data.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Just like in all other cases - you miss your SoB which is necessary for
the chain.


Best regards,
Krzysztof

