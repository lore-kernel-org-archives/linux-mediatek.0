Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9611CECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7Z9ztvl4UWDV0IKIZDPs+eYbABJDdTeukOta65lwiY=; b=IRylatRT1Fs6wZ69YG5aJf/CPk
	ofkz9fah5vOd32C9o+TwC3xI7oGFOXzKYoPhSFTQxzoa35/yFdyukOltigr0LHMOiBBL876RMzLk0
	3Gw1HTq6IIeaJ/eyGcNYnHdH6LnFdhNLPm/f7tXGyAFXkFPRiQqFqhUJtUFYM4Z1w4qcE1qe7PPzZ
	48v/Fb9rKoPeuPapp+gmNiyEIbPP4daMTjDdOEqrHWzb24TbussrhkcE1kH2TppbMZAdpveQzZoz6
	bj+5zMDvDwSkl9AVQuqIss6p0JTyAPh48eGPjfayq0c0i9lILG5E9WxubFJxzlANI3Igv2Mr+CMsv
	3UU9KKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeOf-00APTe-1h; Mon, 29 Aug 2022 13:01:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeOS-00AOlu-5r; Mon, 29 Aug 2022 13:01:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 636A6611F8;
	Mon, 29 Aug 2022 13:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC81C433D6;
	Mon, 29 Aug 2022 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661778090;
	bh=IUObhVFnf/go+94ySU+KIag1gPU/B7fwiAeLJv8bfJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L7PjN3FIQuaNrBaUppvluN925RztPoHIcY9oEOZZbgbQdZ7O46Zk2RuLgzJ/WilIw
	 lA777NCE/Vo1gNEmSo4chtrtHkaLvkCSu9SG+1024tt1XJfg18qz4fRLRUSBuRxURc
	 pFTtUB+MnP5nZ4ph7MoRZ9M0g8FoKdnFjwxmI+pG1xy7bL67tOLwpIArS+so7xpNgv
	 Tsn3Z7Tpi9rYShk76i8RyhGHYwOsFJhR/dqi/gfZYqsNZURYGZc/7DV2lFoq3+BkMC
	 I3HdwCrvK5V858lOwkToEs55jvxBMq5jXbaVfvAehgo7aXlN9Td0/jh/NMt4JNet6q
	 IwzATXw2zNfcg==
From: Mark Brown <broonie@kernel.org>
To: xiangsheng.hou@mediatek.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, benliang.zhao@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, bin.zhang@mediatek.com
In-Reply-To: <20220725120204.10834-1-xiangsheng.hou@mediatek.com>
References: <20220725120204.10834-1-xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH V5] dt-bindings: mediatek: Add axi clock in mt8173 dts example
Message-Id: <166177808821.741330.7788732938491967815.b4-ty@kernel.org>
Date: Mon, 29 Aug 2022 14:01:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_060132_512083_F0D57CB7 
X-CRM114-Status: GOOD (  13.99  )
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

On Mon, 25 Jul 2022 20:02:05 +0800, Xiangsheng Hou wrote:
> For mt8173, it is needed to add the axi clock for dma mode.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
>  ---
>  Changes from v4:
>  - none
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: mediatek: Add axi clock in mt8173 dts example
      commit: b9320f545e2c91caf2a15f67537ef538928ca6af

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

