Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DA2C67871
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4UO1CBXr/l3XaoS+k6056CtdVtEBaAknG4IqnYF1V4=; b=b3W//Tcyk3INJjs6NQD0qf18YH
	J51vJ6DFM+67QuwHwXZB+f+VnUo2G7t/zB677lRkfViFCWjHpEeCTVEsQVVP57AD/oeqvcRm4p+JV
	TixQYaN1bp6E6eIjxjXZYcAey5XQXzymLmStnvI+7w3TzrHV4yQS7uyCPGFLJcFmGN3tU67tarOkE
	NaXvL35MQ5imeIEfUE9lyGxkab1ttx0lpTdSQw1diCpM8JlzQFe9xycmwpQd9iGxCBRBVXh6cgBIr
	jLZmo+u5F8gxwr28HNlTO0Kqx83n8CDzWefpEotY27xyCXIPcr1uUaczoevBkCJzBb4TYE08Xhfc4
	N6SyeGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onxj9-00CFhI-Bn; Thu, 27 Oct 2022 07:54:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onxiy-00CFel-Nq; Thu, 27 Oct 2022 07:54:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B55A66028B1;
	Thu, 27 Oct 2022 08:54:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666857284;
	bh=4AZv7w+df7t6LyazsEk8UMNZGm+qs6IZs8p8gcdUhEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rvjbc8//r3Uy8VL1XCP1GVXyedyen79kMryE4U+CnopVdJzEBRay0HBT1twx+i/FS
	 UNf0mAqVvu8tn4xRZKmmPkeGSg9LX3wiT5pS2FYjXsMjPUeqbG8TJ7YO0o97igWkhu
	 hegcdL9mL3BYwK/rJRFmnfYSbGtnibxnUeiObheM/JGjL4p31kNPYCKZkgxfooy9/l
	 gjA2gtvgvp7b+TZylAi1QphUi9XIrxPfWNi9+7Ll2SzrErAQ3h5Ox9kNRYrAPiHc6Y
	 KhZz6Yz2lFtNI8A1EfI3p9pvsZA1YE7t0+1P+UE0aFCBZ8KJNLezC9p1qWv2xi8rUU
	 mz04j7QQPjfug==
Message-ID: <e889728c-13e9-37f8-4d1a-e31332a39498@collabora.com>
Date: Thu, 27 Oct 2022 09:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RESEND v3 1/3] dt-bindings: watchdog: Add compatible for
 MediaTek MT8188
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Runyang Chen <Runyang.Chen@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, nfraprado@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
References: <20221026063327.20037-1-Runyang.Chen@mediatek.com>
 <20221026063327.20037-2-Runyang.Chen@mediatek.com>
 <20221026152645.GA2946818@roeck-us.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221026152645.GA2946818@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_005448_953139_9D9E6140 
X-CRM114-Status: GOOD (  12.53  )
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

Il 26/10/22 17:26, Guenter Roeck ha scritto:
> On Wed, Oct 26, 2022 at 02:33:25PM +0800, Runyang Chen wrote:
>> From: Runyang Chen <runyang.chen@mediatek.com>
>>
>> Add dt-binding documentation of watchdog for MediaTek MT8188 Soc
>>
>> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> This conflicts with the ongoing yaml conversion of this file
> which is still not accepted.
> 
> https://patchwork.kernel.org/project/linux-watchdog/patch/20221005113517.70628-4-angelogioacchino.delregno@collabora.com/
> 
> Nevertheless, I'll apply this series to my watchdog-next branch
> and assume that it will be included in the next version of the
> yaml conversion patch.
> 
> For my and Wim's reference:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks,
> Guenter
> 
Adding Allen to the Cc's to make him aware of that, as he took over the
mtk-wdt yaml conversion.

