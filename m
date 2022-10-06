Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B8DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/xhH9n8hfKoqARX0ilPcOv6dbZxCFQCmuwHgc7TCJM=; b=lDoy3HnQ1GyEbZVziowqLBuYdN
	olrJYvG49i2TGv1Uj7mIUERPTqQSqXc+JYb2dcuHuNVUxjNet0WMHTt3n9RfEm5NO6gD3/OmFK9TF
	q684sqcnzDuKu/BbvBmkF1jTTS4jZB37Ez+LvpxjRfV8RX6rJd9YDTh4hrxZFdjRYDrQmm80YCUSY
	9IKhqHbF6PJ8HG3puaCchnu3lVbgPC0fUFB2BT7O8cpBF+Q0vGKsIvc9dGEN4CJCqWN4Q607tPEWG
	s3nuqE/hX0eNaT1YrcqwmkBeRHMjEBBaHbGrI84781F3nvoVmmjV1aUlyMv5ahduAxS9bVXCGbCCr
	alEpkFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMzJ-0011T3-98; Thu, 06 Oct 2022 09:16:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMz2-0011KE-GF; Thu, 06 Oct 2022 09:16:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73BC66600363;
	Thu,  6 Oct 2022 10:15:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665047759;
	bh=+MGTzjoGVCjDageQ1cssG07Qv4rrwouf3eCHLH75hvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TbwhJrBY04zdzyFGgVOzYKkabxlLxEsZfx6gMWe8Ds8bOFFnh3RmDehMvz0gwH8Xk
	 ctfkzYApi3EBwHUiJyjt9oZxp/38E2mscBiteMQy0CtLCC10Nhpoy8tCnJ/D5cbCvr
	 88Jd/p72/pNTL8P+mUUPO6qbKI05Jp7/KhvbOhD2ajRjJaBb3xfzvI4yAjGUlvc3Vl
	 3vrex7mIC5G8VBBfs6glbIJ53XYvVfA/C7Kdu1HlubjEnC8NWz4zxJtoBOCrbQZFrB
	 VCNx4z8WyriAjEpLY9/mW42ztK0mC2JcAUQUk6sY3xVGM+ohsyyCGiUBoqp1CNE8Zr
	 8gZ4KrGaaNIKw==
Message-ID: <619b51a5-bfe8-fe60-f593-a363190068c1@collabora.com>
Date: Thu, 6 Oct 2022 11:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 03/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Make gpio-ranges optional
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-4-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005174343.24240-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_021600_713943_97E8547B 
X-CRM114-Status: GOOD (  10.63  )
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

Il 05/10/22 19:43, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The pin controller can function without specifying gpio-ranges. Remove
> it from required properties. Remove it for that reason and to prepare
> for adding other pin controllers which currently don't have the
> gpio-ranges property defined where they are used in DTS. This should
> allow dtbs_check to pass on those device trees.
> 

Make sure statements in your commit descriptions: "should" means that
you're not sure of what you've done.

I know that you've tested this stuff before sending and you definitely
know what you're doing here so you have all the rights to write imperative
statements in your commit descriptions.

Regards,
Angelo



