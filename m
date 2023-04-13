Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C37C77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8N6ip/SnShUiZJF5PnJFMV/vQc20uO53++6OpcN1/8=; b=aYDnlxPQrSl3fiwTzEs8iMLVwa
	RucBZtYubTSCK1sSD8EpuyczBvVERVKF5dgUl5UenWOO9UdAmGbmXlt77ZbllFCTyeuugaZMXYDbu
	zRNM+lS4bL0nl0D/FkRXlGzYE4L2c0D0F5fAJ2VNktXFr4KFdlpoCKXP/lxDUi7eU+xiCq+NEEquf
	V9dw6ZEmPvp2Dg20CahbvDHsc/yVUJpsW18jyfLhQB8p57Ka6bJn7zMNFR2p/OaTtcnyOveYUK5M6
	v9B5s2guRZcKdA7tfHEmyS+LtpMm9OV9VLSWRg1vh8wPSgOxUaHJ3PCG6qzoNtyQZTOz/3Lyra5T+
	ASZ4j8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwiH-006DWo-2c;
	Thu, 13 Apr 2023 13:10:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwiE-006DVC-2B
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 13:10:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id j15so462077wrb.11
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681391403; x=1683983403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8N6ip/SnShUiZJF5PnJFMV/vQc20uO53++6OpcN1/8=;
        b=s3Eg9uan1DoxtbtbslKSXceYX4kqsbBi6+HU8vN1w/s+SHXOkICbkfHgmNnUBM3x08
         cGc1Nj/U513CWQssQPITRAM9YHkJeVBpozvGufSLd2rCKfSIxf4rV/z2aQAtKHwOEBsl
         l5Gw87E3zQwI+Nx19CgfHhkQtWczWb5Osga+tB+1QMFv7HSoZyLlpJoL4ImJ+V3PNMvw
         oHqtbZNaryITAan5febfkD6jWXY8wqMIA8J0SU/O0M1XfxHNrCdEHOetRQgo+5BWXtdg
         IDDx52+EVF9Es0z9RAMgRglZFYAKp4ov3Xh8QTwWgN7C+C/IM2m/gtrtQe3/YB/p3qIi
         oJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391403; x=1683983403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8N6ip/SnShUiZJF5PnJFMV/vQc20uO53++6OpcN1/8=;
        b=fKdg39y6HpSchM2c7HTCYTA8izFU0BlngbKcGGoSLfUJZoLX2bJFbPl8v3REL4Kb5e
         6b8/hvSY61bEUCa6ptN99KjxaK1Sc2Ym1f5lyRhZklkjOOvuaW2dT7tj5vJYihKhV2kK
         RHAL5mLU5cw3x0lzD2pu1m7AfnkA6jY4NYtHfj5FTh3SqnTkJVQuEhabp5FmKSxIP5pf
         +nAlZmwdJYnwb8Fz8kiLMJ2D7llXfyMgPhml62tbBxypBibyt/eCyBFF3x1xvQSchw1w
         4XPE1U8wkeFvEptLa6TLuD3gC6N3kv5ldvqL8aJTxRaJvIO1EBxQRKD7R6dRb4l8kZhw
         EnEA==
X-Gm-Message-State: AAQBX9fv//dhIuZGxon1DvzIrqTdoDdXzaoxDP/qkb+mq4XrptwnWfMw
	W1BmtjvMMDU/OBkGEcaronfqgA==
X-Google-Smtp-Source: AKy350ZQklHcW60c73SK81jWykcSOsZehAfT/yEjr6s3qv8cMOMqgIwNjHwWoYnv5tz2i2ZKRDA8Ew==
X-Received: by 2002:adf:fa49:0:b0:2e4:34b:92ad with SMTP id y9-20020adffa49000000b002e4034b92admr1568946wrr.64.1681391403556;
        Thu, 13 Apr 2023 06:10:03 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y12-20020a5d470c000000b002c70ce264bfsm1266955wrq.76.2023.04.13.06.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:10:03 -0700 (PDT)
Message-ID: <808c0fe9-2b39-1b98-31ea-a6ac46ed4cd2@baylibre.com>
Date: Thu, 13 Apr 2023 15:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ARM:unwind:fix unwind abort for uleb128 case
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Haibo Li <haibo.li@mediatek.com>
Cc: Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 xiaoming.yu@mediatek.com, Russell King <rmk+kernel@armlinux.org.uk>,
 Alex Sverdlin <alexander.sverdlin@nokia.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ardb@kernel.org, catalin.marinas@arm.com, a.anurag@samsung.com
References: <20230413073429.40050-1-haibo.li@mediatek.com>
 <CACRpkdb9sn25KdagSVmY5-XX+LypQdMEj=oBpnwOhYvS2Ny1xA@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CACRpkdb9sn25KdagSVmY5-XX+LypQdMEj=oBpnwOhYvS2Ny1xA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_061006_718063_54FDD4E6 
X-CRM114-Status: GOOD (  11.00  )
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

On 13/04/2023 09:39, Linus Walleij wrote:
> On Thu, Apr 13, 2023 at 9:34 AM Haibo Li<haibo.li@mediatek.com>  wrote:
> 
>> When unwind instruction is 0xb2,the subsequent instructions
>> are uleb128 bytes.
>> For now,it uses only the first uleb128 byte in code.
>>
>> For vsp increments of 0x204~0x400,use one uleb128 byte like below:
>> 0xc06a00e4 <unwind_test_work>: 0x80b27fac
>>    Compact model index: 0
>>    0xb2 0x7f vsp = vsp + 1024
>>    0xac      pop {r4, r5, r6, r7, r8, r14}
>>
>> For vsp increments larger than 0x400,use two uleb128 bytes like below:
>> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>>    Compact model index: 1
>>    0xb2 0x81 0x01 vsp = vsp + 1032
>>    0xac      pop {r4, r5, r6, r7, r8, r14}
>> The unwind works well since the decoded uleb128 byte is also 0x81.
>>
>> For vsp increments larger than 0x600,use two uleb128 bytes like below:
>> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>>    Compact model index: 1
>>    0xb2 0x81 0x02 vsp = vsp + 1544
>>    0xac      pop {r4, r5, r6, r7, r8, r14}
>> In this case,the decoded uleb128 result is 0x101(vsp=0x204+(0x101<<2)).
>> While the uleb128 used in code is 0x81(vsp=0x204+(0x81<<2)).
>> The unwind aborts at this frame since it gets incorrect vsp.
>>
>> To fix this,add uleb128 decode to cover all the above case.
>>
>> Signed-off-by: Haibo Li<haibo.li@mediatek.com>
> Thanks Haibo,
> Reviewed-by: Linus Walleij<linus.walleij@linaro.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>


Regards,
Alexandre


