Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A398C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ1kQ6Dc/Aq1ANuf4SsTTOiufClKPa57UzLLGIHz6lA=; b=nrDX1MtY71Yiu7ZU/iEBFRj+o+
	6pj4JbWBzceDe6a4jozN73uPUeukh+63k40lpYGTPSK7QUy63/9w9crT/CQpGewBbFsdCpKY0+XAy
	4iDYAgr+ksj3TXsIbUmzQkmoaw392LmgtjzHDKCl+bbApRE8chb/zEEVPqDKQ0ert+SWLF4ytQq1y
	eeDT4P/Mey0DGCqXx4UawFA3gOcIQVyngoDPSeE/urTcBHtyEwFG1AY2SqNe6se5RTjoOLNsLytUe
	sBdHDx4wczkqvWrR3Zg9P7R5hlR9gNFFH2rIXbrf3CEtw4sjDyPZyu0qzuAG61uVIJ/EUu7g4OMO8
	4sdVrVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImmd-0093Kw-G2; Fri, 20 Jan 2023 08:29:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImmR-0093Gt-TM
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 08:29:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j17so3429623wms.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Jan 2023 00:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ1kQ6Dc/Aq1ANuf4SsTTOiufClKPa57UzLLGIHz6lA=;
        b=jgParfB21yrZPlsfTLXKtBj85ZlU3hEUYG35prDPSa/wKEWSILYui/Q3N+ntb9bx0O
         ET1RwUNCNFkHjT27224FkDTS/BAKl6L9ih9LE263YlBkVH8M3+mHSmuTJRBGQjV8yGCg
         d26UkidnKC0QT+633G1nO3V5hzfRenrn1rT0Dbn/ii2IGC2zJpKMd7IhuHNbINUeXrlQ
         2++OWg+2lmEUQ04u/MZBXp02tM2VAzigE/6gnzVofKEpp95WW65TNNnK76dvnbsgJgdC
         92VRjB/s+lDxvnOjZETVrDh97aV9sxWfl+dUeYDg9GEkEup6M/SZng4wU8U+zb7GzSZm
         kEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ1kQ6Dc/Aq1ANuf4SsTTOiufClKPa57UzLLGIHz6lA=;
        b=OSKD5d1Ry6AfYyvW8Lx2O3zW8Uj35enEw7fecBPRHFu5VKAJPN/QdA4YMQaGOfRq50
         Rq052Xx4hg1LoagKc9qaOprzCheUdRJ950LI5vPRUhM5c2IPpxt5E57atemU9R8YX01x
         sPpG2Ij8F725g66LTqHhFb9O85xlP1wL5nmjpQIA21bKuqMkLQycEYiB1x0Oe+UqijlF
         wFfBhtmE4WSOZm8lUGeEEG0BCFOSXisoTidlDClMulGZ5mFv7D2wxrF++3bPZ3JIHuKF
         qfzBter7KZtzmZjBcfAaN04wdGBb7wTqMkdKWdQLiJP6Yb7QNf/i7ttNgHuUiWnGapbT
         D1BA==
X-Gm-Message-State: AFqh2krMowFzvq4YpdDgr1f4WNpAe++e7Q+6UdqhREDTNL5yOEJmcGA1
	CwmrdAgsKWRJlSCLeHbK9E146g==
X-Google-Smtp-Source: AMrXdXvt2hZOZLqdPD4UWX5LsE6FgLHiW5K1inIkH+ssvdTcXfKQ/nK9NhNqjlexM0zd0IwTVVGTcQ==
X-Received: by 2002:a05:600c:a13:b0:3db:1de2:af31 with SMTP id z19-20020a05600c0a1300b003db1de2af31mr5499408wmp.37.1674203385532;
        Fri, 20 Jan 2023 00:29:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t13-20020a1c770d000000b003db1ca20170sm1485418wmi.37.2023.01.20.00.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:29:45 -0800 (PST)
Message-ID: <402ac5a2-334e-1843-0517-5ecf61f6a965@linaro.org>
Date: Fri, 20 Jan 2023 09:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 01/19] dt-bindings: clock: mediatek: Add new MT8188
 clock
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
 <20230119124848.26364-2-Garmin.Chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119124848.26364-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_002947_984016_58B270C7 
X-CRM114-Status: UNSURE (   8.82  )
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

On 19/01/2023 13:48, Garmin.Chang wrote:
> Add the new binding documentation for system clock
> and functional clock on MediaTek MT8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8188-clock.yaml |  71 ++
>  .../clock/mediatek,mt8188-sys-clock.yaml      |  55 ++
>  .../dt-bindings/clock/mediatek,mt8188-clk.h   | 733 ++++++++++++++++++
>  3 files changed, 859 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


