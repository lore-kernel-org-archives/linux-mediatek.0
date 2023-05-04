Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C74EC77B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 00:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlDQwb1848SGdOzTiNLqtOw9+TMgK9xjhblj/EQDZTA=; b=ba1gqJClY9ioD32RcGCsrDRRId
	4UZYGgTlu7XY/yNh2VtPH2scyKAAUTNQ6FhWqUlWoiZ9F/ceBAWB6ScOtADHIs9jPuhOFD57MXqfQ
	vSZir5kBQF0MzkqdBjB71jWGyhsxbzJZJNZ86GlCm2Lrsn0Ixv7nb93mU9Em+bp2A+he8Q+ZcB2i7
	GPZwUK5IJ37BiUEdjh8vI6oBRBgB+URGPYjnpQauNURMTxpRYh2OfVzoumav1rpc+dKXTI65dMfih
	wuWMDoIC5Zs3PpA5gc3vwEpduwjAYyjqPNLOwQ7t9FTsp2IDNwwOEgv74bTfBCtYVNEBOIfHzk9yX
	PqohCnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puNA1-006Cv1-3B;
	Thu, 04 May 2023 00:49:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9x-006Crq-3C;
	Thu, 04 May 2023 00:49:27 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D22F66032D5;
	Thu,  4 May 2023 01:49:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683161364;
	bh=4swttQsDPznqEELhw91uW6KmscZSLj6XothN9d4f7l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hoSMsAe4WsgkM9g6C/53VENqhWK/84a5GdxZgwPj7xOC2jAkXzZtIKfpJ+dzUYQme
	 kX+7U8hgIS73wmtr1JxAguxGhOAbgicvLGnH2raFBckLBgwL3Vcdxni753iIE6VEwd
	 0d/umnA0gPY745qPTNJp9Dv+4q3J1X+RKaBFb6Gkwy4TTCAUMFjLmODUXiRUKtNMqq
	 Cva3F7JEBvM9k2DSPjbuPU297ga+ju3rAypBoy0I5Br6aEkjGvjzu6MqKqCws+Swe1
	 fMt6ls4vGlqM6C4je5sxHpRa/EAY8xz7uHB4m4zWY7ETOQ4e34sRlfLWdN2tHLNCUX
	 dixUE7h6CYpQQ==
Date: Wed, 3 May 2023 20:49:19 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	wenst@chromium.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v2 2/5] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller definition for mt8192
Message-ID: <f3626333-3a8a-4557-9743-c6e65874bf6a@notapiano>
References: <20230425133052.199767-1-bchihi@baylibre.com>
 <20230425133052.199767-3-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425133052.199767-3-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_174926_161708_976724F4 
X-CRM114-Status: UNSURE (   6.85  )
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

On Tue, Apr 25, 2023 at 03:30:49PM +0200, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controller definition for MT8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

