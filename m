Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141B8C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVJEpXUX/eFrQfSD+3MWEA3mqtI1PytTFJNyTYmDcCU=; b=vEUcDCVpUM4tHq0SjF17rnLwba
	PCawpU5LkLRBZWmr7U1pbfBuw6GlD0T+xUdD4QrtvM0S0wnMSffnD3fxJc1P3pxqseLc3rgvAtXjU
	TrzcFy9F5vBOU9Cam8bncJs/RkrrdazucfExz2Op+hzcDOLCVBMWIojTjXjJSl2mXC1s/AMbmXryg
	QQfO6VufWOQjzPEgWvimZMl8nh+9V4s1vMhRsNClVuI9kEEahqAUdPWgXWLqDkjuQSk8aRGS8BzeT
	mG8BQtHBe3+dsTfnAXA6yD9PHfEHI2aK6EWmzwVRjc5gs68uRcKv3Q3aeEOaxSOW0HGg70jaUb69M
	/BSYQj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdog-004p94-NO; Mon, 13 Mar 2023 08:46:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdoU-004p3U-6e; Mon, 13 Mar 2023 08:45:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C086660217A;
	Mon, 13 Mar 2023 08:45:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678697149;
	bh=lTDRBLheRzJD0JjEVCsdrfB9802O7wR6meIpoKLcxaY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=idwJ7r14FC6XKQrv7+SO/qq7b4jjZMgLw1KTQQjynzhBjEDqPNjYjkLUlCbGYblP+
	 39KqZuji2yyWeosH2Q0VbqegtpGNgW1Z6RSzj/6xpAH1ewHzS+tFAglJ4zcJNoIJ9Z
	 plEf5DYsL+2ObJjOw3a2ncy75Xdxj7zK6kDDSh5aZC1lIoObV0TGu6g7YubHSg8XCH
	 AM5tJaSUqYiGgjeWzvnEl3Ba5kZHBw7NXS3+bHZiOQXpQCRLY2Q1e/qiFWGLFhLrLI
	 ZTGM3f8uRSMT1WQ60T1BVAp8wHEjjLds0+dZFQFq3zNTDHQt6uwfw0jnA6+pk4U2zw
	 BdE7966QFhu1Q==
Message-ID: <7999691d-e3a5-03b1-25fe-a59f8b59fb4d@collabora.com>
Date: Mon, 13 Mar 2023 09:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/9] regulator: mt6397-regulator: Mark OF related data as
 maybe unused
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
 <20230310214553.275450-4-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230310214553.275450-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_014550_397914_D342EDA0 
X-CRM114-Status: UNSURE (   7.94  )
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

Il 10/03/23 22:45, Krzysztof Kozlowski ha scritto:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
> 
>    drivers/regulator/mt6397-regulator.c:400:34: error: ‘mt6397_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



