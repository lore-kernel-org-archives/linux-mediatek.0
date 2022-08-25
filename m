Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A618C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 12:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWeHA+vz26sf77PPFdl6bwT+D2wF3SMggB+gM4nmMVE=; b=DKV4+UgItnpON8dA3mSL8eyPCl
	FW2BhHFpVD9LnuAjHqZABs+nnDZb4JP1P0CjI0cuvT3wdI37AA14uLT4rj5GPdX+H+4BB5vjZ9XMX
	NtBIWWSAXpKeBkatgqp551d+jtNbaMMlaIdnVVsPrNYqYwm2CmICqhhyntrI0242769oWYJJ3R3mQ
	klnV2megDh11AMKG2G23RsDFwXgluQezjixnryw9AVxJSDhMVRV+c9fW9mvkaaUJPKkFvglN+amhG
	tzCezeaEUHJ7W3PMof2jBaFKR/qOK5auMTf8ThVOSU0lRRbrdko9L2W+ljl8k+mk/99nQm7Uz46xN
	S6yNl0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRC8A-00DqsS-Mn; Thu, 25 Aug 2022 12:38:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRC7y-00DqcF-VA; Thu, 25 Aug 2022 12:38:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8624D61892;
	Thu, 25 Aug 2022 12:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A73C433C1;
	Thu, 25 Aug 2022 12:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661431110;
	bh=LgDF5Ox+bjDfNVdxCe2AZEmz1pOP9XOBZQajiIKH80Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MgtYnyeRFhEsP1zYUeNrVMqrlICIhJG92NLRD989jirXfF/alwMsyXEstwEPS8VMy
	 QT1vLMosW8nNHRF8iaq+i7PqTJZyfVuDi0Qzuu8ZxH3CX0CK2oIQsaDemK5VxuNXP7
	 6o1lzQm/+BEz11aEtp1QaW3oEsVcjSEqPEdnh8LqDDyGQ7bPiLLVLSJ/1BpFx34jY3
	 deM2BdS5raEY6pfV8F0vGQa2lps5uA92HpGHJc0JoIl6dr3zCXoruMVPAYyFHkeimg
	 feXhbZ+gq291hSBa5A5GOlauzzKbd3zaQ+GdF6b9FMWn/YeOO5BiZb4UDVa2pFjazf
	 VvZUpVfAonogg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Chunxu Li <chunxu.li@mediatek.com>, nfraprado@collabora.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, project_global_chrome_upstream_group@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com
In-Reply-To: <20220824122319.23918-1-chunxu.li@mediatek.com>
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: dt-bindings: modify machine
Message-Id: <166143110713.95415.18123711454744125570.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 13:38:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_053831_061477_97970009 
X-CRM114-Status: GOOD (  14.71  )
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

