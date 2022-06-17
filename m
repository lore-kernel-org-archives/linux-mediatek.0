Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAB3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A49OZTNmycM9T7O4NhhDhLVhxX9lOTw3kIpDlpZkAyM=; b=UHWxcGJ7tZqGc8oiPojhgzALZy
	e2u5XvLxazScz1na5PT3+sYlLDqVSplun6fXL2WcD+B98eTAx9yaAs+Isq8BdLXtikhRlaT1MzJRH
	RX2/Hs2SceRCRuyVSCT1HZk9AbIEqSXkBBwlMNjCe6fxRkV7rvqW8oqewC/zUy2CPw58pSzJrWGPB
	bSRFTh7HMa3chuvPzWHCCNJRpxylFyel3TMhI7IfRp4uz39N6MlCT4yaoO/QEl8URC+AlrVytOE1G
	QIRQmWbKFJyvNK4XF0sMc3KrnqTIcW1D0f2+91ydMvch2lPPXGZJ9lKCIkc+cHtLootxoIOvq1Qmu
	YOtAc95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o292N-006v02-Il; Fri, 17 Jun 2022 10:17:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o292B-006uw2-5L; Fri, 17 Jun 2022 10:17:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id c21so5164950wrb.1;
        Fri, 17 Jun 2022 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A49OZTNmycM9T7O4NhhDhLVhxX9lOTw3kIpDlpZkAyM=;
        b=XBQ9rPfZKRdBPtoXtIDPtDm5ePwdBYLHauLnGGWBfyYK4V27rOD367bNmrog6F8/Ru
         WDSpLzNCNOBvZxOqs72PkT/USJnfg5WiogShSVWz+V0bkzEqsQMg3KyCcRLjryog2X8L
         CSyPKCbbaltsXxzajmdLnZfXkFVDblFiiPPxBWgPSgYmCaSOd89Pw9EuAeoWM4dEOcWr
         ++p1wVHebubT4bosHuJA4/uVBbQUDp7VnVkYiqqm8i/Gblj6DtglFdIhJjR6X2C34mFD
         xc6RLfoa+9zmP5k3mbQSdtH2llgaDFFTVNJE8FJ69VIo4jQHpuysE3Qwx8tpcgVHPKqy
         PH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A49OZTNmycM9T7O4NhhDhLVhxX9lOTw3kIpDlpZkAyM=;
        b=AnjJ9JP9Y4Pc0GjfCcetYrh9sOUyQCH5/HMfcvWAEvWDNnnYqe5tk+CULZO2l/uK2R
         uNGrybzGfrrU4RovNVZvB0qLB/n5/7tSZaBUmqSsq6tzYt//Fk3GesXkzudWo8gMs80Y
         AsN1T66sSccPED0GnMxL+9m/9f0eAc7dud5RwvDIH+Ru1HRBOpr+C6c5bqA0s79uKuI+
         8hYoAYwQulrgYQXI2RRhW/PjcHiELWpk51bJhuNFFDapd6mV+ZmfunoFXzCwqz14IGBN
         5CKQWeNN6PVlHu5TTkM1okOOoVus8CPUXxmBmhmXmiAIwexACDCkhLfr1zP8+5JI9A2P
         20Yg==
X-Gm-Message-State: AJIora8TPOWCg2a/ZTaeV9XUD+dWn8h9zW3ctSyp/+wbJFLs8nNYlcEE
	ZiI8BBE00pFUp7evKMPdVko=
X-Google-Smtp-Source: AGRyM1tDqQqatoQldPx3uviM4GbaYxoLOekVUtagRZDz0I8oeqZWsm2wZSSmkf0V7SDtj5NyzupOgw==
X-Received: by 2002:a05:6000:1a89:b0:219:b255:d874 with SMTP id f9-20020a0560001a8900b00219b255d874mr8668409wry.50.1655461016065;
        Fri, 17 Jun 2022 03:16:56 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id by8-20020a056000098800b00219c46089f6sm4197360wrb.64.2022.06.17.03.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:16:55 -0700 (PDT)
Message-ID: <71bf73f9-fa60-e4ba-a339-64d876514af2@gmail.com>
Date: Fri, 17 Jun 2022 12:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] cpufreq: Add MT8186 to cpufreq-dt-platdev blocklist
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 rafael@kernel.org
Cc: viresh.kumar@linaro.org, rex-bc.chen@mediatek.com,
 jia-wei.chang@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220617090652.56247-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220617090652.56247-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_031659_252088_88DE4C4D 
X-CRM114-Status: GOOD (  14.11  )
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



On 17/06/2022 11:06, AngeloGioacchino Del Regno wrote:
> This SoC shall use the mediatek-cpufreq driver, or the system will
> crash upon any clock scaling request: add it to the cpufreq-dt-platdev
> blocklist.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Fixes: 39b360102f3a ("cpufreq: mediatek: Add support for MT8186")

Fixes tag should be before any Rb, SoB etc tags.

With that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 96de1536e1cb..2c96de3f2d83 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -127,6 +127,7 @@ static const struct of_device_id blocklist[] __initconst = {
>   	{ .compatible = "mediatek,mt8173", },
>   	{ .compatible = "mediatek,mt8176", },
>   	{ .compatible = "mediatek,mt8183", },
> +	{ .compatible = "mediatek,mt8186", },
>   	{ .compatible = "mediatek,mt8365", },
>   	{ .compatible = "mediatek,mt8516", },
>   

