Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB182C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln6eiiycZYX833cd53Rc1U0LR1NK9stZnCRXclCCM1I=; b=Sv4nN+VZefB5OEwVqZgBH87lMl
	wHmCMkHT9xKjoQIbE0dcYfP10f19Tm0n6V30DvbhPC4CVOgZiyNWHJ3kFLOoPCo4RuhDxrA0K6JzE
	1NqzUuTUBo4Vn96B2PntefdE6vZpx6N39UqJZcWo2cceWS543JyeZWYd+r0uwf1vZlk1cbWt0To5a
	oYsXkJnjiUFeIf3RKJAaqpBPL0mcChGbow3OVxfWSohQBM8TfH2LQcJbSYFSJInS3N1dyonK8X1LZ
	56pOIlp1pF4PSbxmB2mN0gAOrZ3nXjaFAfsRT80YYZLLoMtLonRJa4K5twyhVGChK61nGPNq5oIfZ
	8SUHB28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3Oj-00BEPQ-Jj; Thu, 26 Jan 2023 14:38:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3OW-00BEMX-MC; Thu, 26 Jan 2023 14:38:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5ABB6B81D17;
	Thu, 26 Jan 2023 14:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819EEC433D2;
	Thu, 26 Jan 2023 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674743906;
	bh=J6kTUDHhp3UX3SKN+nHetWZA+yyFDNmaZMGXaU/Kwxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYTqRKSW62JnHa+QPvCzuJ7D2W5Sd7w+SS+Gc0kWhW6sBEwV0WEY2ZuHBR5v2yJqW
	 gOTg417S8mg4dOOPMkiJ26ELSOjpVxezlY05fYHilegIrMTy6n/ONSO4VdXuJnQFvO
	 0SVTvHTgCwbRdcR4w7ZNDUiO1wsuOz9YZRme9IUOTMQds93NFLeJSiCYsDN6yw/DBi
	 uxPg6UxNhAGKostehxnl/tu8sS8gzTLppGnOWRvt4QQVO+51Aj4ddhEkv7JfT6SAG5
	 wngRELtMSbB/qu8QwRM3+FhYlIuT7B3E6jv0iwh5yF5ytRm8YliUnKog2E4Tkrr5il
	 Pyu2Yp1gItPMg==
Date: Thu, 26 Jan 2023 14:38:18 +0000
From: Lee Jones <lee@kernel.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
	maz@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com, angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com, zhiyong.tao@mediatek.com
Subject: Re: [PATCH v9 3/9] dt-bindings: mfd: syscon: Add mt8365-syscfg
Message-ID: <Y9KQWp1942TDjV1P@google.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
 <20230125143503.1015424-4-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230125143503.1015424-4-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_063828_883354_329D40D7 
X-CRM114-Status: UNSURE (   9.39  )
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

On Wed, 25 Jan 2023, Bernhard Rosenkränzer wrote:

> Document Mediatek mt8365-syscfg
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]

