Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E72AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fGQYTpXLo8gZWeUmZlEIdCfOdLm18uPR26W4cDgw7U=; b=RhtxNWsJNbhReR
	hM45d56+oykJLGwFuf0vAcs6iOz9aOx7dqvj/nmb9EVnenAnxHR5RFrvTj/KzuzDNlPw2c1C/CG28
	ahTwNre5GteKM5oZV54JI/1gupttW3f3kqXFiFtiuhR3ZBLqAFknEs6l54Ag4e66DVMPQMhigu5qQ
	u9+8xFcBT348X8crOH9loAZZ+8HCdhozr0XuK6nM6oMQHZsM0ph4YEF6HcyvCvPuT9VGRY+lxLf1F
	OY2gdWAVGGyED/Ne+9lhG7zxComUzvgtLEHLUhAKjv9g1KBsYz14MN8FCfaPxluD5hidYsuPWPUI7
	FARoMGPgUVF6optwa30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niD0f-0046OY-5Y; Sat, 23 Apr 2022 10:29:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niD0c-0046Lm-JG
 for linux-mediatek@lists.infradead.org; Sat, 23 Apr 2022 10:28:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id t11so20716105eju.13
 for <linux-mediatek@lists.infradead.org>; Sat, 23 Apr 2022 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2m9kAORld4iDB2KAPLh1iCsQe8VM2IonNBmHniXB+aI=;
 b=abL3ZQ0jUA/UmIqEWJnORrPPfRhiBNtkKHGmN2VHZBZ4eLUI57QXL2YeGyD/UWdmw4
 /PvZ6PoNwnmTYaJhZq7ClQMH2dHTn/quieJqvwegOB2EjRvWzvU8Sa4LJ629A3GG8pcE
 vnwTF8Qc4+JhGtJ1LhWoHlORilVZ5qrChcfnsAlm/ddCPaRJ7tr8PATd6D8MqrnyE9P/
 nYB0KB3NpBJXZWsCop8opcKElkfJxWNFgi2bvFFptKKE5qlpMhtor6zB6I1WiVUfgah7
 451fMAWKE/vZvmly83beGV8CKvg5zZznrCim5huFff5u/7y8JeqMtuEgHz3DgynT0doo
 XdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2m9kAORld4iDB2KAPLh1iCsQe8VM2IonNBmHniXB+aI=;
 b=AJbuCCoYfkr6+OYi3A8+TTNskPrzXLjlePDYFLClypc7yOu4vg7fy6sDfNj/1MeD7x
 s9xNyaag9DeO5qlWd3XJeKFOHoMQ24V4I2g2mrFMGaNCYm4S31zliznYn0MVFluNUtx6
 s/N7L11KeP7DpGm+vwULWP7P5OOf/3sYAU88CO4ozDQ8wdgsfB0AbG7NeWzpOyBGShSs
 7ti5Emc7aVF0m63v7JT1REpKWUSoz/blNYrDsnQVyOe2oCx/TUY7VwwHk9tMm8ICxOiE
 OV7tM30agcYgYZitDeh/W8d6ld6CgSQLkzn0asWgSuqXG1o8mg+xwJURdj9q+02A5mE1
 ISZA==
X-Gm-Message-State: AOAM532pXoFCEWzOemTX0sT68lw7s6NzG3UMUsp1b32n3RVBM1qyFenB
 ZQv+fV1Wwpd7Jej51QUofawGrQ==
X-Google-Smtp-Source: ABdhPJzNLgOfjlkn71D3XLc+z6mdb8U6FtuDFVeolu/miVVPX/dSL5gctTkJCIyZlGTqP6JpYcLBqg==
X-Received: by 2002:a17:907:ea8:b0:6f3:72ef:2397 with SMTP id
 ho40-20020a1709070ea800b006f372ef2397mr2184159ejc.201.1650709737125; 
 Sat, 23 Apr 2022 03:28:57 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 v10-20020a170906380a00b006a68610908asm1558632ejc.24.2022.04.23.03.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 03:28:56 -0700 (PDT)
Message-ID: <00448326-7bee-8cf4-5751-d967bc424aea@linaro.org>
Date: Sat, 23 Apr 2022 12:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 13/17] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8195-sys-clock
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-14-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422060152.13534-14-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_032858_660476_82EE2696 
X-CRM114-Status: UNSURE (   7.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/04/2022 08:01, Rex-BC Chen wrote:
> We will use the infra_ao reset which is defined in mt8195-sys-clock.
> The maximum value of reset-cells is 2. Therefore, we add this patch to
> define it.

Same comments as your other reset patch.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
