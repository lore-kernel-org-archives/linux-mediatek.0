Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089E6C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=; b=ebJZB7Xlc/JLVtecoa1fSVv8GH
	GLZnAIja/QypB/X0DwXq7CKxbzoScpMr4uzJ9+zHGeE2JxpE+SqtiixvelM6yjyPuM8x6rA4WCqKi
	qHL8vCzBqkWgaEAiTnafak7oi85pHE6RnOmzs2dvZWAi03QPgMRs1LL+fRdaVIwXtQA46crfUEgVE
	PHQZ13qfwosIZHRRTHAx1JLniPwiXOCOxN0hDOJAcasDUFo7StuywzV4FLtHaktCHSoBOW6ld0Iyi
	z9RPKYsZNDYFkCBOM5aHZLMjbP5WpQZW1ws5yjA5VrhVU5Q4z8JwSZSqi9YPAuL8rXv4i1HwOCWzA
	A3h3fLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVp1-00BR4O-0p;
	Tue, 21 Mar 2023 06:50:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVoz-00BR3R-30
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 Mar 2023 06:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=; b=kJy0fd8exRpw8IeO+sOwVQdtOb
	HILf/xNadj9M3p3KdlnUs/QEfTBU30GmoDbn1vC9Uh4tyuE3zlg+mEb4vHyI7xeDa3wfntfPsiMSO
	ngM8r4KjKzmDm3e3ygpW0Wa8/Q5dEv9mBn0pTdBrG5+lnPJzzNJR5FdsAvR7x0ZDCIh07FdtsAEsM
	PRDWVSVGfqarJVHatP/dvT6yYDiJMzZWZtoqPLiZV5RIT395LQf2dEh7rDvrENKVu93Zm1ff71jKg
	j261RIjPOouKyTog/KPFvRJbWGon3VKdb9rj+tsjEVYRONwdz4jkHSCRWYQmnce7GB9Q7jlkpOfOf
	W+PjM46g==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVov-004BsP-1V
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Mar 2023 06:50:11 +0000
Received: by mail-ed1-x52d.google.com with SMTP id ek18so55734896edb.6
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Mar 2023 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=;
        b=yfBGAkzYkRznU9Ng945BSIqo31Bk5T0PtagdkfIHR2Q1BeqH5OnMJ4fsG1zFEiehiS
         KZ3/pYphUZP+d7j+TETF5ibJ22qi8JxUtbeR5/rMsVWBLbLtVafpphEGHOgtkfufvthr
         kfFqq23RxghjFGHcvf7wzurvqXl77TX0lreCe4zdMXibkctRdAIFIHy2nFlymDviILbG
         cJHWfu2Mf2f0H4Zek7CU3vs712CDHZtYrkN+Dnj8r9iTZ3wsTUFj2dPI9y02J/EmUF03
         XuUbrwNwkbxeyyaBiz152Yt33fiVzez/AHc3FxXutFCupBB3a+cT+4yKOMj9xOon+xKG
         WmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=;
        b=AWg5NfSmQWUiZgHEc0Ectk6N/6BlfyPkx/hRTWwcEMs1AkBY17awWnyUuTQluDeF9Y
         AfiXS6AxXMvB0rceoylEytSrfG7rD5bBUtfWmRyoa/srwAxmmZpOShWhVclM9QmRt/V8
         RfQzZzK3/ZBg9jWGAuTZioIH1U3x7XsdolOCbAV2NbfBIuHbi4e/TbEYfCC0DDc5awIJ
         QQHXxi5i7icuIx/ksIcywsGdcXyq5MkT3n5s5JIlPiyqQm7nFk+Mag3dOEynwvCJc2BD
         MyWn3AzziKtdu/xdddKpJKfoDZ2MPtnULBNi3G395Pv+RyBqiGcmm2SOmyNevqikvg1V
         lfTg==
X-Gm-Message-State: AO0yUKWadTnsDHiy6FvshapVr7r8QrwBNDJ4zBRC9yExDSe2E+kwmTi7
	aL3OyXbVad5PgIGAaYQa9FVA7Q==
X-Google-Smtp-Source: AK7set8eB3GSlawOodRmMBJ+h20F9+s+seoY5Xp11h5THWtKB+BDrw+xLcE75DD32t4gpHpf4nRxYg==
X-Received: by 2002:a17:906:6449:b0:8b2:abcd:624 with SMTP id l9-20020a170906644900b008b2abcd0624mr1888422ejn.0.1679381404434;
        Mon, 20 Mar 2023 23:50:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906715000b00930894eb708sm5361112ejj.223.2023.03.20.23.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:50:03 -0700 (PDT)
Message-ID: <c9365b87-3cd5-9df6-7f2c-e4e848165062@linaro.org>
Date: Tue, 21 Mar 2023 07:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] media: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Joe Tessler <jrt@google.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Heiko Stuebner
 <heiko@sntech.de>, Benoit Parrot <bparrot@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230320233944.2920964-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233944.2920964-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_065009_865805_4BE22CEE 
X-CRM114-Status: UNSURE (   8.83  )
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

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


