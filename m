Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AFFC00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtvuicwjeDoXQdD24XchBwJ2eU5KPYvfwDxTOl3SVHg=; b=Hd8inbkZT4jxwjF4HpP1oy7Rgy
	jKpCz4ANNEnoN4uhy+fCy6Ht3DCElY8vL0F/vOknA9ZLDEfS2O0ZW7vMoFuiBxTpcmwPWkE7cERNp
	oT0c0xnIcoj3H3SIy9TB8yAMdISIZcaGqDedc/NCHveV7VCHAarI1y1lBK/U7EM0iWWTfwaACWo2/
	ydZvMZgg4koj7K4y9mlTCvtLnkUTnwO+JiBh3XmkJxO7jx8j3B1du6n/RPmuiBoySAa41jh4Nzz1m
	iCaizuoeDTiKGQn0fH38NaGTBMbHXXfeatMZdTuJKjXG10z1cYirC7ZP1XK2UVvt/WlQlqdSoRpHx
	1Dr856Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUDK-0076GC-1P;
	Thu, 03 Aug 2023 09:01:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUDF-0076CO-0K;
	Thu, 03 Aug 2023 09:01:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B8566607197;
	Thu,  3 Aug 2023 10:01:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691053299;
	bh=/beArnWlCuMXu/k9SA9MRUypw7KINtPz1kEXHPoWXrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hZ2CbI4c62e5ug7vRpYzmey/E7TRPHXlb7y6k6uu4bX8/Ec0yjAuXD3Ri/CAMEt8G
	 m+631p88RgzG/wfnOG+d7UDlTGWQ+ny4DldMFEFpwPCj2RSL4H9SK5hfThSZNtuBcI
	 dJLG2ftVh46++C7d1OUpjg4IxEsqM7U8HzXpAzoWxQm1xHFQ49UPdL+nlSfRCNWv2P
	 3Z8SajfQy44eTjgeXXttMgy2X/NU+b7Ka81cMjIrLvNnZd3bLsayPvbjWB9FXMfFgB
	 XooDfJKQQy/ZNql7yLORHai2z45elWrAves3HuMPMpJsiq/49IOVJw2Okmwc47BUBf
	 aXEwvI2KCpYHA==
Message-ID: <d9aea8e1-133c-c536-2605-36a6bce33368@collabora.com>
Date: Thu, 3 Aug 2023 11:01:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/9] regulator: mt6358: Make MT6366 vcn18 LDO configurable
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
 <20230803074249.3065586-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230803074249.3065586-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_020141_270177_9C10E206 
X-CRM114-Status: GOOD (  11.11  )
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
> The VCN18 regulator on the MT6366 (only) actually has a wide
> configurable range of voltages, even though its name suggests a fixed
> output voltage.
> 
> Convert it from a fixed LDO to a configurable LDO. Its range of settings
> is the same as the VM18 regulator, which is missing and will be added in
> a subsequent patch.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


