Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB5CC6FA95
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 07:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwfoTSI2+bODt184zqvk6o5KksPyLZOSxRrSre7m3nU=; b=xhYf1aGk813FdGcPCoJ1yBULM/
	CsgTPViqSOhJg3+nMOzKIHU8moK5nTZfbbhwldJlslKp0cbMXNfdUtvWeSw0Z5XA7zGL3ivRZnsia
	gI6dkHb0t8LaRy7fwZwLVF0Zavo4o1tZlKFThOkxG5YVCbsQDFQM9COace2GWmNda1fnsy+47Ankd
	ET/ucdW9fSMf7FwWCsWOgCcZzYvVKToLU9fgW8zzstylN966v/tRjJM+Z6O2R/HLrOlyR11oS6SPV
	nwnk03pBxgmQy9v+miGhTcvLaQei7KQ1AQbLv1LGGvsBRSP86OdzTpdEBGcjpvY5AreD1CaDujHHP
	xpvda5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGOC-00DjvR-KB; Thu, 22 Sep 2022 07:12:52 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGOA-00Dju7-2F
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 07:12:51 +0000
Received: by mail-lf1-x130.google.com with SMTP id x27so13270108lfu.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rwfoTSI2+bODt184zqvk6o5KksPyLZOSxRrSre7m3nU=;
        b=MhBkMtNFvRKB+E48vrLoICpKm9sgw+cleIPWAZdLL/Zi1TbaAIdQ95hT//NfG41w3e
         CI4FfhpaK1pwUNjEUDFFqLN2WW4uCqaJy2iaA0/BhawC0nYmq58tsVXzRIn2D14awddP
         mHTBZAtcEBQJF6I9/XNAchneT562u5ZnnDjlX/uJ16P4/th4pGWksVDx6vpENafmdGhg
         ieVTp393OQtS6QAxqdIfc8g2WjzUdqt/5lMb5W56Nyxsh4LMRw1sKV5eN3a1PRZoNwmb
         H5f2yYPHjs0GnoIDHP4T8bY/lcFFUJ4rYUnDPPvGbWNK3chXy+JlrWlultv+vJjBPnDi
         qYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rwfoTSI2+bODt184zqvk6o5KksPyLZOSxRrSre7m3nU=;
        b=LoNOAmqF8Q1qtpM8zZ/0MSclIdOizvNx6HTLH1w+UoMmPDTzIRLeSsjCRy25KqlOQ3
         o55jDODjwBbu4qwltUSdWZ6Z3b6/Y/8Y/lUZ0YqW2XKpeS918dLzR825ah4Oa6X+0g1q
         4AS3ueuSc00YfuFc1chWVlprWXKCjNQ0/cZpAxIHiS/KOUafBZd5izpXRYbKrZ1Sge0O
         UxF8n89kOR5DhDsJLXc8Jv7sBjMkABF/k55j0i+qlpzd6RWswQsCqFxDpX/sQ10K5cda
         v3gAdZKJ3QnOqtcpZIE8on48Ij2qHsStYtkLNd5JZVTHp16h0+m2S9EqHsahBbmt+952
         iqbQ==
X-Gm-Message-State: ACrzQf1sZgYpkJ3b7ZsPH6bQAzrEyvPcwMtN6c03lrBSooAg4tm6UjLv
	rj/pL++F9b3dICgxAamenpT+ig==
X-Google-Smtp-Source: AMsMyM7tSmDdOf9yUwEBPNVo4LJveoksYmGyeRKCvdI8La3tpcO4vDQdzuT8eLiZWZvV10EZkCS7KA==
X-Received: by 2002:a05:6512:260d:b0:492:df5a:e4f9 with SMTP id bt13-20020a056512260d00b00492df5ae4f9mr667074lfb.90.1663830768385;
        Thu, 22 Sep 2022 00:12:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z12-20020a056512370c00b0048a8c907fe9sm794191lfr.167.2022.09.22.00.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:12:47 -0700 (PDT)
Message-ID: <e583c9d1-b936-3c19-ab6c-8fab4704ca45@linaro.org>
Date: Thu, 22 Sep 2022 09:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 03/17] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-3-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-3-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_001250_133985_B21A39D4 
X-CRM114-Status: UNSURE (   8.69  )
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

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add a compatible for the HDMI PHY on MT8195
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

The same... maybe it works, maybe not, I don't know. Any reason not
using standard tools and producing standard patches?

Best regards,
Krzysztof


