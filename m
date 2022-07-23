Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A55C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jul 2022 20:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWRtJFxeA8rQDYY14YhCd5s+fzvSzxieLEOwpQYrDOY=; b=T9hKpo2yVaUWOnNIsIA8uxECg3
	RtV1gsx1Om3j3LoIunP9s7iqpZJjXMqq+VzvS0nhHkECaPG9BXKq5WYmj54zmO+qCQSIE0suzHyob
	2IzB1QZ+9QS6ixzbJFmpazPdih8J2w7BQ2eubQCl2xrVOgwp5yHyU3+PXKHGM5M5a4BlDAKrzmgJv
	ObZThRDeY4oneJTLapMtCnefrhbKy3ziw5HLxClwhHt2oHh9NxUBDB7gcuqOdf9qSBMjOjJC1K87j
	yNrsaLIzrKr3m7L26Wwteec6V9sJl/8gkgGcVI7J4TvJJ3ty+ktShyb6zvNH3sqSNizmVwAZTwGWy
	tpcz9baw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFM9A-007EAj-Ou; Sat, 23 Jul 2022 20:54:48 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLzm-0078oG-GC
	for linux-mediatek@lists.infradead.org; Sat, 23 Jul 2022 20:45:11 +0000
Received: by mail-lj1-x235.google.com with SMTP id r14so9013300ljp.2
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Jul 2022 13:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oWRtJFxeA8rQDYY14YhCd5s+fzvSzxieLEOwpQYrDOY=;
        b=fio+cSlxqlU8b4zxSMPl69tT4+qBrjVt1IhI5WOq1pt5+fb4k/HPX+uZ+hNkwuogZD
         +7qjZZ5wUKGY7QrFzwrFinlnhDhpYBNXvqZXn1SvvwdzUX5842HbV7EqO+Ppe6WWOQoX
         q03i8Q+fpi2+aPn2FenX3sorhZ5PF6N+IShUdaadDSRcGLhQz6odsZxBKkXcowC2qn3C
         DmKnEJqmNOJ6wsNpq/e5IAm0FUm8k6rVRwUebF5ng4D9C68H7IHrZQ4v6N0iD1rup7YS
         LIYCRFAW3zp2DTzsLyIhtwR3Y7+bY9ihdCnRHfmBC9vofacAt3sXebVHrKmRZTNCFHF5
         gG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oWRtJFxeA8rQDYY14YhCd5s+fzvSzxieLEOwpQYrDOY=;
        b=Dhm2va9S/pK/ig8rVflsxEMRO+PtgvRSK5heq6yhgoyCWcfh1WE0FpAlWGh3Cd1ys0
         3GK9bjLeCeIE/4OKVvb2dWcAkaK3ggPplNiW7lVYZJwYSPpuM7od4yP8FLW/ZYGaXTDw
         9tATU1B0eublhjEzlKp4H7jzEiQijDB3vJei41C3CZRck3ARdnDITC6PbUW+ZoV9eFvS
         URowXd/86rghPCkB5g2/34UCpJhIzgBLMR8Dlm1ZH7Ix/+zBWTs5T5QuEs3q1/4FAqAl
         zTRQ1/yB/hCAFG5TmrnZMqAOHL5871H6Nu/gtcyWqmyMNNGxdMbFN8NGai3bRqzCPese
         IZQw==
X-Gm-Message-State: AJIora+2ChDRGcUVkzMa7CAQG0Rkpd1JyS9bAu8MirBN4yJ6kT6Gf2pN
	EAabh4U2LGw1PgDpyTXbnRmO9A==
X-Google-Smtp-Source: AGRyM1uipIB/g5ypN9oJ8cz6WSCgqhgQXxZWjhFogYY7VhE2R3ktdWk95KYkwjnbKTvzLRKm1Uw3QA==
X-Received: by 2002:a2e:a596:0:b0:25d:687f:d9ed with SMTP id m22-20020a2ea596000000b0025d687fd9edmr1861436ljp.424.1658609103841;
        Sat, 23 Jul 2022 13:45:03 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id u23-20020a05651c141700b0025a672e97a6sm1836173lje.80.2022.07.23.13.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 13:45:03 -0700 (PDT)
Message-ID: <8d656940-567f-d8ea-8cb1-4ca37dde3e0c@linaro.org>
Date: Sat, 23 Jul 2022 22:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 4/8] dt-bindings: clock: mediatek: Add clock driver
 bindings for MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org
Cc: mturquette@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, y.oudjana@protonmail.com, jason-jh.lin@mediatek.com,
 ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com,
 tinghan.shen@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com,
 sam.shih@mediatek.com, wenst@chromium.org, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, kernel@collabora.com
References: <20220722090609.52364-1-angelogioacchino.delregno@collabora.com>
 <20220722090609.52364-5-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220722090609.52364-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_134506_618932_5D0EDFA2 
X-CRM114-Status: UNSURE (   9.35  )
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

On 22/07/2022 11:06, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++++
>  .../clock/mediatek,mt6795-sys-clock.yaml      | 54 +++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml

You already got a review tag, didn't you? In v5?


Best regards,
Krzysztof

