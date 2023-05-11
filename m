Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1CBC7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5QAZdjVLVbI0V0MOBRrdkRCmTAX1lGamqSGOVwZZl0=; b=2MfpT7H6ko7SAVyRarBeT+BFl4
	q+o7qtGtYO6OytO9cS1f4fr1MXs4Qb22kPycpTmUPwywVYmiynMnpx4W8sKlkehvztFOppTXQ2O36
	q+1m8/1B67EhUDW+7Xrtn1qq0Q/tEMsii1FZtokz9RGA7Vq32Mle+9uufOc904HcQJIIlO3zzr5Dh
	XRMEtC43trVtGVDH2iggiMo6AeGEqwfjT2CLYbJNRVB4BkBN0v1ImgTyqFLhJAlrCzR7RAwj5oj6J
	AhTDw1TpMrLTPwGsKKcjCAuKHTVlz264wxLAsn5QGkzSmZuQ/+XhQrZFG+iD+Vs5wd2SnOzsASuwA
	DV6/Cong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6Tl-008u1o-0Z;
	Thu, 11 May 2023 13:37:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6Ti-008tzw-2f
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 13:37:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f417ea5252so42901365e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683812222; x=1686404222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5QAZdjVLVbI0V0MOBRrdkRCmTAX1lGamqSGOVwZZl0=;
        b=zubWSEySVwG6S1WwoZLBWgivEDgrrzpKil0UxQQUDmONjZVJJ66SUzH6iqu/UZ92C4
         +hlbxJ96105mAyduA6JTwgws44lxdd852RvVr315fRGKjNohoW5SLTP6/EM9bHVPlOiI
         kIJ919cEGf4RC2+gtmTHhwpmGx287fjpu4Sc7zfrIgZiJvlww7cFIJLI9MSpa+coIu0o
         xfg5fh/NpUI7GoP8cc7fcV2vVvvICrLjFnzs/djvhtdYJIjepx8zBZZCiJgioqiGTr5Y
         z9QVyTRHxW4+K1XSv+jXLo4a5bxfOCbneTdQzgQ5KAe+W18VKNr/4HiJLVjcVLy0IGmT
         yhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683812222; x=1686404222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5QAZdjVLVbI0V0MOBRrdkRCmTAX1lGamqSGOVwZZl0=;
        b=IojZBuxte89vc7ZKQ1Uf+ksYLoTCy0u+J7PC4ZynLNQt99P87kZdKbD4jY2v1YjOTf
         asfZGsDB3/oDpCh7iWfSXH72wZlSpStsD88czsxtiX81JguG4YhOc8+OlRoTzYcgCVLj
         zj4Ew9b28/LoCKiIMtsDZJTIASXlqRXIzLP9CInk/6rBm15r26e85YM8Zw0sX+I+m1bh
         a7GZ3lZxx6HU1Y9VISEWVublT+b0OCd8cpRzrHlyNw3duSEL4rjikyVCqzYHXLWPdfkN
         6XXqQbq9b0G8+O2kUiucvBpgp9N4Y5gx1F2W+fpjoT+JGxfSt6HgigFUiF3qOCpuUk4s
         o3oA==
X-Gm-Message-State: AC+VfDyjAyISFvOkE4sa+HWHgiHU7y2P3mm1i+Y4orTq3XMkoN5829Wa
	03KR7vyjy6ui1k6t/qXJt3LmXA==
X-Google-Smtp-Source: ACHHUZ6durEogDyWOruj0uja6YyUtEd+bw8P/5czqWQsSh8N78YTOQerfYFo4L6J5TKmEd7dsLzRXw==
X-Received: by 2002:a05:600c:383:b0:3f1:93c2:4df6 with SMTP id w3-20020a05600c038300b003f193c24df6mr14526564wmd.12.1683812222586;
        Thu, 11 May 2023 06:37:02 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003f4b6bcbd8bsm4469844wmi.31.2023.05.11.06.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 06:37:02 -0700 (PDT)
Message-ID: <6abfd685-e2cc-ef0e-188a-4fb6c243ab81@baylibre.com>
Date: Thu, 11 May 2023 15:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230511133226.913600-1-msp@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230511133226.913600-1-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_063706_862291_3A291937 
X-CRM114-Status: UNSURE (   7.70  )
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

On 11/05/2023 15:32, Markus Schneider-Pargmann wrote:
> The given operations are inverted for the wrong registers which makes
> multiple of the mt8365 hardware units unusable. In my setup at least usb
> did not work.
> 
> Fixed by swapping the operations with the inverted ones.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


