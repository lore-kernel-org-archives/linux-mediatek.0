Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE65DC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gDey1QcyUJtE0gdjIn+yYcI9Q8I3srect9H/M5C0+M=; b=mqvI3nPxFIOgpjrxbs0Fe5VMMi
	G0xTPQPwcdT2ekxHzJcC7VjeqDox8LIE3yUhC09B/biMCy72fNmRfPbUA5l/byqLRVGePOVB1/5us
	hi6H4gjNtTeJlE6LbmErCRXOy+ILsIZlu0uTmTz62SY1smtUs+GDioj295Kedg1dhqB6hJ/xDC8rA
	nwygYp3sSWnuvcH8j8bAJuXhD1euPXgVfEWrp4MU0T4hSxAWAgIUi13HDaPT1L0Y/7Cfnno5D9nKg
	5SAUZ2tswxWsJkATfLSv4ATVsxGFNYc47HIeCu7qmRByu6wha0utN29ZG7D7rkFTLzxoDxLnB2LYn
	R7r6p8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0l0K-0084p0-T4; Thu, 01 Dec 2022 14:57:36 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0l0J-0084nn-2s
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 14:57:36 +0000
Received: by mail-lf1-x135.google.com with SMTP id j4so2937971lfk.0
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6gDey1QcyUJtE0gdjIn+yYcI9Q8I3srect9H/M5C0+M=;
        b=xkF4CdSRbPtytSRO8iCSQTLhpsr/M1LQ9iHRANnnu71nvlD0FIRoYiaPiP6h0oImsW
         3Zrd4M4WjopjOo6dPN0JkeCc1SIxZqOA/67QiTd3jkZGLwr9FjUCBKjtlANhFnT0hmlY
         zjO/M/t4PHoiMDqDP3e4ZtC6Uh6EQ7Ji7/3wOmfuS5reAYnVh4OU4rsVVSJWVeGfX1Be
         PaWcLnhPgcySuWcJqidr0xM+wavkHhER6LYi15egsu2rfYYZfgaeBrXa2YKc5I9Ei2f5
         ziC08FSuEHCq1nxZnZiY9RsXfGNXt991k2uRDs/bSwjabNpyBuSaWTq+ev8Mrn24Fazw
         FgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gDey1QcyUJtE0gdjIn+yYcI9Q8I3srect9H/M5C0+M=;
        b=ZlHAMJ+uMihJ2xmuy6G7Hp9o2es3arCUqAJBg4RNrEpUHk9Xrq1p39DRF4ToodWPgI
         imOjoY68cujIzSlnMTfuSNq+DB8YmNlqIsELQgBGKvaVnyEwLF/+3MmWTxkbEGECcQPa
         OQy3I0xjq3DJ8m3B4MjHsD6TH+RDn0PdHBkHKKWu/TMHqs1Ovm/19EPFQWJ1e6/Z8NXQ
         YeXYpbW22ZF4T/ORHX/yJhU2iZBPChmAekboI6elDZgzAuISmO/4Dcm2YEDhqxLidMKu
         n2cMEzpe+u57Rc93K+GwR7BUX3WS5a4Gu/ulKHpjJwBXMHGATogIYihoChWoTpwjK1kb
         RjpA==
X-Gm-Message-State: ANoB5pmDrmKCDYseOhfRHUvToqRRQ6Void/9qo20ua5fpB38oeZw0a9F
	bKcwoeai1MRfFvmilNIiMxDpQw==
X-Google-Smtp-Source: AA0mqf79xWBWw5nVZ8PmmAX+p2VT6QA4I6tMDRpFZ8gxkPdes8JPwZNUZYPGSj/c335E68jPA24ZpA==
X-Received: by 2002:a05:6512:b17:b0:4b4:b90a:69a1 with SMTP id w23-20020a0565120b1700b004b4b90a69a1mr22139089lfu.76.1669906653202;
        Thu, 01 Dec 2022 06:57:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q15-20020a2e914f000000b0027706d22878sm406024ljg.94.2022.12.01.06.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 06:57:32 -0800 (PST)
Message-ID: <3f824d80-fb5a-c8af-67c6-7a9be6ca7e66@linaro.org>
Date: Thu, 1 Dec 2022 15:57:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: mediatek: Rename child
 node names for decoder
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
References: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
 <20221128143832.25584-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128143832.25584-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_065735_187454_E3C2F222 
X-CRM114-Status: UNSURE (   9.91  )
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

On 28/11/2022 15:38, Allen-KH Cheng wrote:
> In order to make the names of the child nodes more generic, we rename
> "vcodec-lat" and "vcodec-core" to "video-codec" for decoder in
> patternProperties and example.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 60 ++-----------------
>  1 file changed, 4 insertions(+), 56 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


