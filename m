Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F74ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8wF098WxkIOFEKTti8ujD3dJsTyTOaJoWpuIS3XUk4=; b=ggqY5ZphNS++K9cq7S5Urg3NIC
	MfEEUDw2RzrjEmVDfkIPwC7jMUmmxDyBMc9OuxVxFIfoxr5LM7kvD0tq3IQs5vVy4J6BzJmiajrXz
	X7AGCrGDdMhqyQKkwpOOqcKqRfG90/PUGeyDYgXymPLp0W3xx7oIywrucLzf0xNG4doaKW9nKp6pF
	eNSzdZaJPwfeKYs1g66yJlSlkPE5MOteq1eF77RUm6eYPR4TWKIXwobWPH+Yb9XaR5xWFMR94M4At
	P/g5zTzMPE2wU9IpdgwUkAxuXJp+FZxnt/aSzz76VZuIE3t0xY6Z3pEeOtdV5m4TW/+MXPHB27UwL
	ga7KqhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opVEw-00C9Mb-1a; Mon, 31 Oct 2022 13:54:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opVEc-00C9Ft-8I; Mon, 31 Oct 2022 13:53:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BBDB5B816D9;
	Mon, 31 Oct 2022 13:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDAAC433D6;
	Mon, 31 Oct 2022 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667224427;
	bh=pTy7t7Q8QOwX1bSA4Jd5z2ewZ2NvD0qcR1QWYdy44rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AECja8WxEAHVraIRg2PtlfXZEnzCsq0KVf/wn77pDT1Afy9ppuHT1z9uGvIljxogY
	 C73SyMCwEW6Gl/L3Hk4jnxvi9MO/RohHWhUQM1Walr0v3pzqaPiQ4gCnyS9M1qaOMO
	 sFY3ouaKCFc2OcHQlbfxFwcEWStGCg0k88IhobOqX6Ql3aiUPL4vkrFY95ypFu4yEI
	 RjuVfVrbPSdzMg6Svb1iVdi1P2DC1zEwyEsfBX47ZYXjYVVrqA6LrGfMFcjJyVLjM4
	 CN96eUnPeEinFXSjhC3zcNBNG63JBJVh9Acdj4leaX5pgGM/2ryAvH2GUAkbSwJGcE
	 0Ro5UfrXJDr7Q==
Date: Mon, 31 Oct 2022 13:53:40 +0000
From: Lee Jones <lee@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: mfd: mt6397: add binding for MT6357
Message-ID: <Y1/TZEMBF3OI+XSa@google.com>
References: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
 <20221005-mt6357-support-v3-1-7e0bd7c315b2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221005-mt6357-support-v3-1-7e0bd7c315b2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_065350_451677_AC9A417B 
X-CRM114-Status: GOOD (  11.88  )
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

On Thu, 20 Oct 2022, Alexandre Mergnat wrote:

> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]

