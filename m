Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F32C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91cJXzKyri291E8/CmDN+Smt95yA4zgzKo1TC6fOgt0=; b=Omn5F7IHb09MMWPE1yf7IMQQFO
	J+pgU/95Ctuizm1FAAt/FHyt9pGuO/XH7TbeTe6IcvH6SGrS302pKzNwNieS2B0x+mCppCinwCWjH
	4+QRJrhSYu0crFGO7oCbypwX7Y+jA1R+ddVjaGf4JuXdsCOdojF/+VcqyEkFGM4EdwkN79OC4gunH
	1Bdj9KhH2Ibay9XipS0ZklFCrXsV0C91Kxv6PsESOhALD2VKZAfUEAF1vtrSILhAzi7U0zOkgucT9
	CCpuJnofSxunC/Xv8fstYEqQVwHlrJGhZWbIC42N/hcdFb4l3B53UErSNr4YV0R2WohVxkqs3E1Au
	YsVnsBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plurm-00Fawu-0W;
	Mon, 10 Apr 2023 16:59:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plurg-00Fav7-2T;
	Mon, 10 Apr 2023 16:59:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C951561298;
	Mon, 10 Apr 2023 16:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00A4C433D2;
	Mon, 10 Apr 2023 16:59:32 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yong Wu <yong.wu@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add MT8365 SMI driver support
Date: Mon, 10 Apr 2023 18:59:26 +0200
Message-Id: <168114590173.12295.2225877177937084104.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
References: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_095936_868605_1D0F27D6 
X-CRM114-Status: GOOD (  13.40  )
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


On Fri, 07 Apr 2023 11:13:50 +0200, Alexandre Mergnat wrote:
> This serie add MT8365 SMI common driver support, to be bisectable and
> avoid issue with the DTS change. This driver change and the related
> change in the DTS should be applied in the right order (driver first).
> 
> Here the related DTS change: [1]
> 
> Also add the SMI common and LARB bindings for MT8365 support,
> I kept the Matthias Brugger reviewed-by from the previous series [3] [4].
> 
> [...]

Applied, thanks! It's late, so it might miss current cycle.

With corrected order of patches (I don't know why you decided to reorder
bindings with driver. Bindings should be before its usage).


[1/3] memory: mtk-smi: mt8365: Add SMI Support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3ec0e1ea4770e40575bfb2bb4e9ebbbaa3c80d3f
[2/3] dt-bindings: memory-controllers: mediatek,smi-common: add mt8365
      https://git.kernel.org/krzk/linux-mem-ctrl/c/67025255ee8b1ec496b01f74e8c298d211bc7a82
[3/3] dt-bindings: memory-controllers: mediatek,smi-larb: add mt8365
      https://git.kernel.org/krzk/linux-mem-ctrl/c/4ad9a801a3597ccfd406c911638aca2c61e57bdf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

