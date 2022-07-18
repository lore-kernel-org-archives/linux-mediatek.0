Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C09C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rY1KayZ1M5An2+WxLKDfgx0TbA4QaSFe19dpTQFa4Y=; b=KWbC/4y9ocA3EWWy++763TJWP6
	3oDjjVP7kuZMAPyK7fKQ+47CaMGsz7GaJSW3vnlwAupgD6mjbTtQ0/bZLc1KM5dSDJP10jR1CXsR6
	uqIs0KmaJhV83H4BSkmm9JaPxe58Exw3Ls/pMOiKMZ6sECrhBwfqTz410dUW5S+7R2Od172NNe1UW
	q/GLdd84Igq7LTWWt7XItF9yykpooL4kjoRb1W8/rPTdOXosDyh8WF3DUsbc+DJZ5X2kkbKgE7NUP
	h4/xesdymtPdQa+Ru4vyzTF6Opq9ZyeDgLmjRsAys0eQYeDCrTnBrsunlp2jSeNDc3uTRB8RWwIk8
	H3tRKj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRY7-00EYpD-BF; Mon, 18 Jul 2022 14:16:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRXe-00EYQB-Lf; Mon, 18 Jul 2022 14:16:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4B19FB81018;
	Mon, 18 Jul 2022 14:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D609C341CB;
	Mon, 18 Jul 2022 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658153768;
	bh=AY2yPHdIUQw+cDf3vWADEhbIuHq7MP631FZmux7hbBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DtrH+5y/m+j0b1b7xN+Y61SGG/Ma8aga9iUtYCL+Mva9TsyaetogQmkGLVkKF6NcX
	 nn27yo74LswIZM+gpJm6pWnTfxoqtY2XMUayoyi+3spHiRoMLIzOrgscKngom9EvAb
	 C14tPwI6Mv8vMyjjmQOVWLhUBV3Sky7HU23A8EKMonOVocqDHvLZQarDVj1N1Iys/A
	 Zbf0lPnu18yY/KlyUxJZpkrMKflwPO5PDbPTorzKAo+CxiXUvYnbkKpZ6KvKyCNGhO
	 ZD0Fqpq/B6ChG2L3MBi5us21bO7cB/oV3gc5zdJvP57P65b3CHxj52jtXQnBszph27
	 O1OfIQWvUZZGQ==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, allen-kh.cheng@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wenst@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220715115443.4154-1-allen-kh.cheng@mediatek.com>
References: <20220715115443.4154-1-allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Update bindings for nor flash
Message-Id: <165815376583.235243.5538314790515297993.b4-ty@kernel.org>
Date: Mon, 18 Jul 2022 15:16:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_071610_925362_BD3E30FA 
X-CRM114-Status: GOOD (  14.81  )
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

On Fri, 15 Jul 2022 19:54:43 +0800, Allen-KH Cheng wrote:
> The spi-mtk-nor controller of mt8173, mt8186 and mt8192 have their
> DT data. They don't use mt8173 as fallback.
> 
> Using the fallback of mt8186 to enables the controllers to support
> mt8188.
> 
> Not all of spi-mtk-nor controller need interrupt property, so we
> don't mark interrupt as required.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: dt-bindings: mediatek,spi-mtk-nor: Update bindings for nor flash
      commit: 82cef0af296d3de95c8c7005f640449d45bcef62

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

