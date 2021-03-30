Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E7AC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:50:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B036161990
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B036161990
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fXIK/Wv+vWVeAIs88g0rjLWzvBPZxpgdibaMQc8xKSA=; b=lYCncidT4RXP8HTGN6+ZrTEu4
	eDS1rYDsXOhzdb1S0zuy3iEuMUUhg4SrmbUTpHgyoKJ9siAc59KSHrVm/YHfStsF+77btvepPyiQH
	qypIgaqhylPQyQXGL/TnoSqTRxu/05DPXUhQZk0kOAqpYGNdADqh/W8jHiaxvUWpzixAmi7JF7Uk4
	eSGNZ24FFzS0LEf2Mqttuo8eAYQYaeuGMqq2ewp3JWKoPBM0J+AjzCDQA7h7i9jUvSfvaaknyEKSR
	0AwIKZldL0CFwO1+EOegH4iY8SFQgyyqPSelUJZQecIcOTXVLDRSm0VZ2OeuI47/umDiMdbiyxIq5
	SJ+EctFJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBxM-003Swb-Qg; Tue, 30 Mar 2021 10:50:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBvR-003SVS-DY; Tue, 30 Mar 2021 10:48:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso8162921wmi.0; 
 Tue, 30 Mar 2021 03:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q//pqem2+12d7QEjvjgaohlrsZ0f7RzdSyBP0d8mQF8=;
 b=XAAkVB7wU7qFKtSJlIbXEuV0fqSLgWmM7CgKkpyrJZrHMLETXXA0GIEtbJDfHnrIxa
 DnrA9/t+AGUEYEiHhrppYvAvUcj6TjuE8CVO0pcajCmO+v324od1o1qi2gphEOkIiHzZ
 kLEhzQRZh6e2vl8RSEjU0MXkRCltLjmubLh2ad1zSg64+wFfCYXOX3oy7FotQT6jKG9f
 Tkzk6idkrKaYy/z1NzZSKhwqossCXQ3/BsHyA/tCexS6cAus2ZG8rJvg3/H+mqcO5v/E
 zXcTeyYRpaytvboHZ09XiFGDw+afgcrmMZYlYgkcuWsm5HJm4H4PJh1xa4hLBZhHqXSk
 rDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q//pqem2+12d7QEjvjgaohlrsZ0f7RzdSyBP0d8mQF8=;
 b=rDk5IJ4t8rdWyY0SUfrfhq5++I1sdG7XeT5F5qaCBim7UUriE+n21N5kzTwZ4irpuc
 QG9zpv103ZoEy1a58hq9JshqgSVYOA26Fi98uj/R7aULyiylT3NCviu1WDL8Vkh23lUG
 pfu4x8QKloQpMxrFT6bTuJVpaVJAcyFlIXKpenRZ6RGS7n23DPkhhF5WGFw9iEzNSWJn
 4pMEWrPjqmr1w0K5OLn3oNJq11XKJArAg0MnwKI7H/nGWAO2yZKrDmC2tHpsvZoPSbK+
 Nzamj5n85Ya83tNKLMnGTJun2KcTNkxJCkkq4eSRL5JDMbfyFVp55aLyJSt6+9TyfD7p
 4uLg==
X-Gm-Message-State: AOAM532JCNMe1xIRujdPGid0gwZSY3apmICEtPmCyuS0WPvPdCMdQ0gC
 Gyzwyx9ZWfaqhlcLpocjWaA=
X-Google-Smtp-Source: ABdhPJwvPii3xPnYowk2vyInsF26PMhunrL16Vuj5UvYFQF18+YD+34YeHDpiFXR6Zds8mztAtBjQg==
X-Received: by 2002:a7b:cf11:: with SMTP id l17mr3360588wmg.128.1617101323947; 
 Tue, 30 Mar 2021 03:48:43 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id p14sm2901836wmc.30.2021.03.30.03.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:48:43 -0700 (PDT)
Subject: Re: [PATCH v10 1/4] dt-bindings: mediatek: Add smi dts binding for
 Mediatek MT6765 SoC
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Wendell Lin <Wendell.Lin@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Mars Cheng <mars.cheng@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Yong.Wu@mediatek.com, Joerg Roedel <jroedel@suse.de>,
 Shawn Guo <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>,
 Ryder Lee <Ryder.Lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, CC Hwang <cc.hwang@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>
References: <1615291538-9799-1-git-send-email-macpaul.lin@mediatek.com>
 <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
 <1615358218-6540-2-git-send-email-macpaul.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5caf003d-e7c5-1f2f-d499-726788d5e490@gmail.com>
Date: Tue, 30 Mar 2021 12:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1615358218-6540-2-git-send-email-macpaul.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_114846_287607_B4865B2E 
X-CRM114-Status: GOOD (  16.83  )
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



On 10/03/2021 07:36, Macpaul Lin wrote:
> From: Mars Cheng <mars.cheng@mediatek.com>
> 
> This patch adds MT6765 smi binding document
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Patch looks good, but where is the driver part for it?

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index a08a32340987..4a4f4377576f 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -31,6 +31,7 @@ properties:
>        - enum:
>            - mediatek,mt2701-smi-common
>            - mediatek,mt2712-smi-common
> +          - mediatek,mt6765-smi-common
>            - mediatek,mt6779-smi-common
>            - mediatek,mt8167-smi-common
>            - mediatek,mt8173-smi-common
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
