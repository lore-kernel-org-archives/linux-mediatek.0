Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24386C00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2Z11Vt6A4oCWyO3SzwY+rwKKTyQi5ithKo7FWFu650=; b=4PE7Vd6SBFtMwAIWOJmsO3Nlc7
	lT+QMae2sgPZAQ/PcmQwpw9Ygy9XwJFhJw6aJi/34HKD0KQofU1WIXKoHFLZi/rO9MihZ5Ui93oFl
	WSVZWk3zLjm2pWzYUyQw3ckAH/pGM0gqi7X3sWZ2BmePmlpCknV5x5dp08ptjVvBQKNXduQzKYOsO
	smGtp40zsDbC/xla6eErfEBhbjfZlaXCY0gYIHwbonp3PYI8lkSUMGAclYkvkZsCejov11URTbKzN
	hAleEZGkJNAR9pprll6Gxsk2AgEjEehT0mHgoyJQFFWMyEyUSDORCf3E+0B12uOifRxHZbC/peDNS
	YGvX6NUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUDU-0076N8-0a;
	Thu, 03 Aug 2023 09:01:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUDQ-0076Jy-0R;
	Thu, 03 Aug 2023 09:01:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 623B36607196;
	Thu,  3 Aug 2023 10:01:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691053310;
	bh=mFbVLS4BQ5yM0rCdKvzXd40KW58VQZxdeWGxz8gwKuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WfBv8hznVFnvTQZfLg1sLKKfhUDJhf4I89wQtJikB0/hJWM0RdmcXWrCBcVv+kEWG
	 nQRsrJuUA38WR+NyHanO0qTrsGEIqErFQ8EaI5Iywcd1uYyQ0oLyJTE0bd2r3Mx1gY
	 mfgTzhJ3sGi6+mtGUFGqVVYH/tAfL2CWoZjFwLcBA2a06Hryex5oIvs14BH04naE4p
	 495FxFRW6TQFGkYuXNMKd0OrEA4mCjPS1AhTT6LazDt8PNem05LMptsg9lmIrWzXRx
	 d3iL3R5+hWg3iqvN9aUfYk8OUd1dwuwTHo/+E8qLS+Fi7y4J3YNeO5Rp9yDubE1+OJ
	 HqGxjBdeew5Pg==
Message-ID: <41ef7216-3884-9e72-f45c-a31838ce83f3@collabora.com>
Date: Thu, 3 Aug 2023 11:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 8/9] regulator: mt6358: Add supply names for MT6366
 regulators
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
 <20230803074249.3065586-9-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230803074249.3065586-9-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_020152_349001_2E34C274 
X-CRM114-Status: GOOD (  10.71  )
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
> The DT bindings for MT6366 regulator defines the supply names for the
> PMIC.
> 
> Add support for them by adding .supply_name field settings for each
> regulator. The buck regulators each have their own supply whose name
> can be derived from the regulator name. The LDOs have shared supplies.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



