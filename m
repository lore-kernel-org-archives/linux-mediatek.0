Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09884C00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4g4lmwxe7oMJSXLnXZKYse+3MTd80MNCdcoTmhK6ijc=; b=IK3T8qVTX9W/nu4Iamc1mSZ1vc
	9Xsw9FLgZrwaByOVThl9zab92+IaC5GZY2Sp+WIlhKc852Lri1SyW3WQdCA3LLXFcQcMmXCjjAoYW
	i1cbb20Mpfaz78SYawtmwK+lwClyQqNZp+XRUeBqXgCHv4Bmh3VdzMFBugMs2MSomtuaPHj5E1ezw
	ir/GK06jgO+9jlu3hhazhJ/ws/dV6+YpzDRFV3NzkITel55zE5tVxFrL0kIEiqGBqsH6JeO+i0HXv
	MNM2cvzFx5eaEOkD3nt8ATg4rU6R/w+hJX+jBAEa8vDeyz0KXm+19nqNvPpt1k9H9uT7Ca0ZII1hK
	piUwn8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQtBG-00EOBf-K8; Wed, 24 Aug 2022 16:24:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQtB2-00EO2i-Sk; Wed, 24 Aug 2022 16:24:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8AEBB61A14;
	Wed, 24 Aug 2022 16:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D854C433C1;
	Wed, 24 Aug 2022 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661358263;
	bh=Y4eBdkGZIGqWLszQ5IONiL0dwf3AHaygY1nAw/brFPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RU2ONLK9WOfTtDPX11OYiLJ72DJnnMM4Y0r91FKLDOBr+sTrgSkpwknaS2Cxdnc4D
	 ro0B6Gvrvb91B5wBX49rJhAL2yRg+X/tblzBnIv9JRunK421naPc7yvEy16n8u4MGV
	 EKvm6J9BfGWiayrPQlUofDwLCKJVY4hRVK9tTanC9+YuDxoSMNGyE2qbmTQ2scVi2d
	 hepqZ0JdD/ItPatE9Svg3Xu4kpNPtm8yj/QeovDdlViNNJYS0jAFpOKM8UxsSV+k+n
	 0+rV9XJJZtumbZOS3h5fOKe7xOSjYWdCgktKRM5cfHXkYzAJwVfCjQnYDgQWSsMF2l
	 PgfkIHbh5Ea0A==
From: Mark Brown <broonie@kernel.org>
To: nfraprado@collabora.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, Chunxu Li <chunxu.li@mediatek.com>
Cc: project_global_chrome_upstream_group@mediatek.com, jiaxin.yu@mediatek.com, lgirdwood@gmail.com,
 devicetree@vger.kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20220820075343.13993-1-chunxu.li@mediatek.com>
References: <20220820075343.13993-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH 0/2] dt-bindings: sound: Add SOF field for mt8186
Message-Id: <166135826016.480875.10489482967868732209.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 17:24:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_092425_008421_3106F462 
X-CRM114-Status: GOOD (  13.03  )
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

On Sat, 20 Aug 2022 15:53:41 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> These patches add SOF field for mt8186 machine driver
> 
> chunxu.li (2):
>   ASoC: mediatek: dt-bindings: modify machine bindings for SOF
>   ASoC: mediatek: dt-bindings: modify machine bindings for SOF
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: dt-bindings: modify machine bindings for SOF
      commit: 1173107d7c129ff87224814fd38fce5db023aaa0
[2/2] ASoC: mediatek: dt-bindings: modify machine bindings for SOF
      commit: 1173107d7c129ff87224814fd38fce5db023aaa0

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

