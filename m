Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427FEC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWeHA+vz26sf77PPFdl6bwT+D2wF3SMggB+gM4nmMVE=; b=MThFXsFahukJJSEvz/k+xwnVOB
	JQfJbhdIXlRwsUkwDMYVXhsbkWKysNo0aupX5iO43mYttWyeGBAg5M4P1sTAY49aTDBpdAi4lq9hx
	SdxEGMgfkI1rJZuJoTeBY7JBdVJwXJFILIaacKzc2ZHTsKkECogf4x7YvxHlOEevHnHiVh3jAyUGV
	Eu90Cr0yq/HTDhntvJIAFflJNRIEUlmf4I4JRCI3YccbkkbxiRXV78ZPcw1i6PuEhsvmL6aqVziD3
	DenhMaeXfvFj9qWYxauDcagOqbxhUal5VPCVOV5sV4NzLP/6UUSvLuRjMvlDzFUzp02wDTNkw2yvZ
	MejrN9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQtBS-00EOJ0-6a; Wed, 24 Aug 2022 16:24:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQtB6-00EO4x-K9; Wed, 24 Aug 2022 16:24:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3B2C6B825C1;
	Wed, 24 Aug 2022 16:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F32C433B5;
	Wed, 24 Aug 2022 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661358265;
	bh=LgDF5Ox+bjDfNVdxCe2AZEmz1pOP9XOBZQajiIKH80Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aBUQ4qDHduZc4vcujUzSoPALU4+PnF25liHSk1hoRpSAu1fml/xeiNq2hI0a93jxg
	 RZ2FBRYHoqtFm4suW9AiRWqLfWw6mI+qayWHO9kxFChRTWE7oRgzTq+p5qUwUchpCi
	 C46zTJKfBaZLo4XoVKStoGslG/DrUH3gCpFlMIkPBUtkyNyJi9IF0ZVRNSmZd4KvIX
	 DMi4aEqL6Xj3fKsWv0BTdQVz9YlPGzstmI6ylCnm3ckV4XMsNePQYB0tYvbifQUi7/
	 kVNmt2f7r5APrb+hUFy6dAis4mMcC8XyPn8zwzPRucJcf/2RlGL5IN1jju1PBp02DC
	 DChkiA7I+sTLw==
From: Mark Brown <broonie@kernel.org>
To: nfraprado@collabora.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, Chunxu Li <chunxu.li@mediatek.com>
Cc: project_global_chrome_upstream_group@mediatek.com, jiaxin.yu@mediatek.com, lgirdwood@gmail.com,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
In-Reply-To: <20220824122319.23918-1-chunxu.li@mediatek.com>
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: dt-bindings: modify machine
Message-Id: <166135826315.480875.12895204417307260753.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 17:24:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_092428_843381_89E4FF10 
X-CRM114-Status: GOOD (  14.10  )
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

On Wed, 24 Aug 2022 20:23:17 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Changes since V1:
>   - remove unnecessary quotes
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be retrieved,
>  from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be specified
>  from DTS
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

