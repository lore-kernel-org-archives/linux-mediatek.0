Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F194ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 06:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgUTiKhBujn05TxXhChEqalF/68tJs4eQO8QBl9KDLA=; b=OX/HaiwwBnXEiqTZufQnY3KJrV
	CWmaS23GQTcp+059H4l5QheBjfbYdHkwAbhAUid4gWBLMlWvuEJAPeKnFQGZx0RdtxlxR8bba6bgC
	AWSNigIr7AhKks94JT2lm1F1poxN9Id9oBE5aSc41gLMRTDnZyHrZ5gE0BuH8nMKCmaHvnBqHHJZ1
	V3Y/x0B5ac6SWxGRmJ0lhMp6uwuX7PBDWS/4Tashp3o84FHm661a1xfHuHJ8GVKNyB6gxR07duCl/
	1fxYiDbni0Tb43+ffBWQH8lrH1+O3we1UHsmJo/jFd885pIkOEUJENBzT0rew6pBET5z/w6hCSPTF
	lGOWjRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaAbu-008r0I-Rp; Mon, 19 Sep 2022 06:50:30 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaAbh-008qsB-24
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 06:50:18 +0000
Received: by mail-lj1-x232.google.com with SMTP id l12so32732732ljg.9
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AgUTiKhBujn05TxXhChEqalF/68tJs4eQO8QBl9KDLA=;
        b=u/00MNl+D+cPo1LMA53PEjTlV1YyUFDISGSKO7fmcY8jJtG4osxrevg1ir2oZrMlAY
         KGoplI+L/szE5gXN1gy6tWxgb8djvpTAMpmzrd85685XR5XmIEHg4wzs8n1hyba1cAQk
         I/x2ASViQlamzdlRcYMvL1kVNN2fiTRnVIwyf36fPouyWZxzGeAwbiX6xvyKcUqMTiyr
         RgCU7a8Q/7D4dzss6xuN1oQgVs1t96f98DmNZyqKy9boypscFwNBnl21DO23cIHuGuCt
         mJKe7X0zl5pd2YP1NseYOlHYs0mFIa1OSPjuL8I7Xd00n2kdRHhVVDg6/Ec8n3zf+Oq1
         9Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AgUTiKhBujn05TxXhChEqalF/68tJs4eQO8QBl9KDLA=;
        b=G3YQxm0NtRxdC2Xqa7XoQlq3xd2fZCQDa0qRCvqSxlfrkB7IRitSYrlyc9PjThZZxE
         CCMu2owhwMw+D8oQXlbNwUt8CHbSHtFP5z8/+DTJEnJ/ASHnvwBeX29lSetNBQVogcLy
         3ebYqsGW1WSSSumnqBhM89Pr5hDCj6tUh1kNTO1LbwEPOAmhoXdq3Kao5J8o2tqgvh65
         W9e1BvS7sXWaMCp3vYvNVU+DadADA98WjjXShLDvtFJHX2wFk/yFch9tWQeoqC7obGtz
         ADEmuV3PI6FoRE5sIXWK7939JJ3utDWYiYNUh11EZidMpzyk5Zx2EM+5etPhPXe/3r2s
         JYBw==
X-Gm-Message-State: ACrzQf3DIGrWjEqqKqbwaTvfoy8k6iywnpW8LtILfTaIOVFThu46w5EJ
	5yXjbtyvZ2A61qfftILznRk5VQ==
X-Google-Smtp-Source: AMsMyM5BXYEND5jV85kw4nwQ041fTS/U3XG4Jie4d8jTejwhbLVGJErLR5uyBRT4JJIIgVqcoO6YPw==
X-Received: by 2002:a2e:9d88:0:b0:26a:95c1:218f with SMTP id c8-20020a2e9d88000000b0026a95c1218fmr4722063ljj.223.1663570214700;
        Sun, 18 Sep 2022 23:50:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m7-20020a056512114700b0048960b581e3sm5049900lfg.8.2022.09.18.23.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 23:50:14 -0700 (PDT)
Message-ID: <d0630c9e-22c6-48a8-35ed-024949782cbd@linaro.org>
Date: Mon, 19 Sep 2022 08:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 net-next 00/10] dt-bindings and mt7621 devicetree
 changes
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220918134118.554813-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_235017_241359_ED93AAF1 
X-CRM114-Status: GOOD (  10.52  )
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

On 18/09/2022 15:41, Arınç ÜNAL wrote:
> Hello there!
> 
> This patch series removes old MediaTek bindings, improves mediatek,mt7530
> and mt7621 memory controller bindings and improves mt7621 DTs.
> 
> v3:
> - Explain the mt7621 memory controller binding change in more details.
> - Remove explaining the remaining DTC warnings from the patch log as there
> are new schemas submitted for them.

Please always describe dependencies. Otherwise I am free to take memory
controllers patch and I expect it will not hurt bisectability.

Best regards,
Krzysztof

