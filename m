Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59B6C27C76
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Jan 2023 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2uRWqFF0r7q2TBMIaKQWmaMLNnBJspMVsHJ2UF06HY=; b=paNE2RECpnNNX8Yq73oTq8+5OI
	NOn2fOj3jYYOagAF5RIGIQAkblwT+fMtI5z5sXCXzoRhBWHz5Q859s3WCLOWENcT7O9kY8N0p/70c
	Nzvaizx7l8AbTa9tBQOGuoSOHAlwR94T1pMxd0667agFOBoUyXCfFVzdOCbrBIqVCi9ehMYPgSFJC
	IDxHpSFRCemzsbamtHFR5sBqwLyDu99CVMCIzW7MVrc0xgycOLkDwClRsPD67z01rgl0cd2+OkLmc
	bo7ZbZyuGrIvk97wmdM8jRjJ4N7wyuFnsdOKFZ3ZSaZCUt6Z30Ors2E6viJt08yERkBK6gRBvdwEa
	mUtJTOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJair-00FMp0-HI; Sun, 22 Jan 2023 13:49:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJaie-00FMnc-7N
	for linux-mediatek@lists.infradead.org; Sun, 22 Jan 2023 13:49:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so6760889wmc.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Jan 2023 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2uRWqFF0r7q2TBMIaKQWmaMLNnBJspMVsHJ2UF06HY=;
        b=A5nrwbz9H/JghFPYjDYxiF530ecHYrVdNXPJISoleEMn961zrzTqWzfeKn88HBVwWD
         swdMlnsnKpW2FAXUsX5SNegxl7ZB/FmB2eHGT7tgaJf/JY/P39W9oSZBZf724q/QCbLU
         2WKi54/8Y1ECJG1KLNuuO5bdukWTWooVfA15Dfn/+yIYSH4mtXLJCoDJsh/wamgTMudA
         vQMlhY9lLBhZmlpZQjGZy6NGyK1JjeY6GjZn3/g2NQgnsUqOgX36aQwG1WPEDYF9rbKR
         v1UYab0dwAKBjHXkdgS3ww4wtTcR8ukC6149Teh8dQJve1NVZgvjqFgFNK2vC9cKvud7
         7Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2uRWqFF0r7q2TBMIaKQWmaMLNnBJspMVsHJ2UF06HY=;
        b=MTcT0aixiDKOXb6hyzPw6tDiNuO3evkOnwzcq0p/XxEgixbYcQ9lemtQKsRE3Pmk7G
         AVDfFRko4iSF6zN78cq8EhV30Q1zA1KF6v1vfachM7PRvyAFeC2m7xyne0r60ewUP2UT
         rfskGRiS6Snt2gHy+1anHMj01D0dmaIWud3jZ0f/70tPsUSs7pAO4Xq/w7KH90wbBPRn
         66ntL+My0+vaWWEkTtasGkZC0u5Y8MMkYdQN1ycluYP5WSZudN9OMOK/xBmWPtzdvpnA
         nUQESsgDA7UVtrwvSyUiYrHR2T5LqYVqXqLSx3UNGbUuzm72gdLsorqyYtF+uwpNqm06
         8Hxw==
X-Gm-Message-State: AFqh2krl8fleQgg1hTxjcRKAviTyVNMJzjeicH9E/Uq/UE7tl2a6e2O+
	eKAtXPD1CvfqfjdP3pySZbHNew==
X-Google-Smtp-Source: AMrXdXsO8kqG9ZRaMxEGmJ0/tMT938JibYEZWNhJ1g920foowoq6eZiI5F8tqalMzBJU2Pz6wZ9L3Q==
X-Received: by 2002:a05:600c:1712:b0:3d9:a145:91a with SMTP id c18-20020a05600c171200b003d9a145091amr20679919wmn.28.1674395349413;
        Sun, 22 Jan 2023 05:49:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c26d500b003d9b87296a9sm7547873wmv.25.2023.01.22.05.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:49:08 -0800 (PST)
Message-ID: <bb386e57-0826-93aa-d97c-72d277991141@linaro.org>
Date: Sun, 22 Jan 2023 14:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add apmixedsys/topckgen
 compatibles for MT7981
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674233728.git.daniel@makrotopia.org>
 <ae9acd210c1566b4bd72b09df4430bcad4a36c9b.1674233728.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ae9acd210c1566b4bd72b09df4430bcad4a36c9b.1674233728.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_054912_317742_09112B00 
X-CRM114-Status: UNSURE (   8.00  )
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

On 20/01/2023 18:23, Daniel Golle wrote:
> Add compatible string for MT7981 to existing binding documenation

typo: documentation

(or better just drop the word - it is redundant)

> at mediatek,apmixedsys.yaml and mediatek,topckgen.yaml.
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


