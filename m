Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ECBC04A94
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6yr0q9oyGv4RGCxWf2YO4+fE/BVPJaJWmA6BDuS4ZY=; b=JLGwkFN3+1FtKXQNnen8/kIZDw
	sMBQSl1elfVsXhMS9YWjcX8tcHuXAO2kzATGeUMYbie52g5cF5xE63S4GgwHRulQyGCn5YBQNJLcO
	NDxm2IaYm0KrFIDusj5auKr9szX3JMbBHrsRgbXcMjvh0AIAMN42FNd2FGEhUYG4buKh6LGPcANYr
	P4nbcZQmMF2t01/Yy4iXTmF52ja9P+RGomEYQMWjz2Y5AAguPjk+qtdNDPhivTIFZxBy2px2jBBGA
	sfo27YihizxSGLrF9GtYQMgIR8LHJd+pMp1x7RfGc4mY7pjSMgCkOKV6ywdLZZU3WDxb21nG2vFph
	c9o2GwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUDL-0076H6-1Q;
	Thu, 03 Aug 2023 09:01:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUDH-0076Db-1x;
	Thu, 03 Aug 2023 09:01:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C11B06607194;
	Thu,  3 Aug 2023 10:01:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691053302;
	bh=pUYaXlFfqBifFESqrUSVqRw1SQKJ2SasbP6x7jXtTuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UK/YdjPNmyz6kbCFI8t39AFSGPoatAU+uHhlv/Jn0Dmvj9oMlIByLqx8LElX4wMO8
	 qsmxDAn7vHOQNy/dY9IUDsyHS78ZHPvwWkoSVMDeV8QVkABro02GOfW8wKI5AiML2l
	 4RaA7ktQ81G8/vpJpaPWPPyP9b41PEFtXGnv4pvvtVg5ojsqalkKhTshQs3QUenTvn
	 QQKPze/ZYiF3RhBQxDVXlE3J2clgb3wqlT9YnDHynIiJ4rjxvZJJCg6zii32n7UrMx
	 AAHhY5tOpAQDLUUKBlBeCACRIuUFz4SSpyAdG3hKfKZoSRDguvlcbEMzASdyb6rSsL
	 RUvnHH/PNjqSw==
Message-ID: <543dfd23-af1f-9f14-fdfe-f3187b780c8a@collabora.com>
Date: Thu, 3 Aug 2023 11:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/9] regulator: mt6358: Add missing regulators for MT6366
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230803074249.3065586-1-wenst@chromium.org>
 <20230803074249.3065586-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230803074249.3065586-8-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_020143_931024_10E497C9 
X-CRM114-Status: GOOD (  14.01  )
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

Il 03/08/23 09:42, Chen-Yu Tsai ha scritto:
> When support for the MT6366 PMIC regulators was added, it was assumed
> that it had the same functionality as MT6358. In reality there are
> differences. A few regulators have different ranges, or were renamed
> and repurposed, or removed altogether.
> 
> Add the 3 regulators that were missing from the original submission.
> These are added for completeness. VSRAM_CORE is not used in existing
> projects. VM18 and VMDDR feed DRAM related consumers, and are not used
> in-kernel.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

VM18/VMDDR: not used in kernel, but even though writing a new vsel is something
to completely avoid (on said devices), we can still read the voltage, which may
be good for particular debugging usecases, so...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



