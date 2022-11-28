Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0424EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFy5v3fTqheLnktVVVInz87ea/YcJ+T/6r+VIZZqUcM=; b=yMHMEt9icAyjWwrl4jhQnGxuWh
	NpnSYMoGf9ERFLCHQlfqUPrEIzvg8+W11O89y/VdsxLUu6WWWMxA78N0TBLYBaInciLFAOczqeQaS
	/Q/bQuAj7gjiyam29k2tcEdvXdohCu66lT7As/Ndxmfv3fev25AlmDPzGwCA4OFZahTiW2N1FLef2
	Y1l/6VfvITuFWS8uPyUdfJz3n98dbLhj8uZ0mdy1zW+gazqttVOM1vF3z5n8lMLDhJORkqNO68ND7
	j6Y4oBtN8i23FGn/3n17lj5t/ACfpFPLeV1ED+i7pOZ1kXkbtyZ641o3PBOI9iqpNTiEMfXoMYjQC
	McX3sXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgqv-002lBr-Vn; Mon, 28 Nov 2022 16:19:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgql-002l7C-Mg; Mon, 28 Nov 2022 16:19:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 042DC611EC;
	Mon, 28 Nov 2022 16:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F3AC433D6;
	Mon, 28 Nov 2022 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669652358;
	bh=i0y/liEwV8DEyD+39Xmd9FgUWdMvwnQEigBzYVpa2kY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XvLTx3qDg/MyqlXFMWlq2auUM1z2S6pKc3Qh/ueg84vGINx+dNHNuUbFz5UTaUEez
	 zJV70ubR7QPbHEh/r3J7DZK4kJAmO80Apb3gqZKEJNb6tSd7Z55NM9VBvFA8ctQDYE
	 7bNASHtYwCU/VnheYuLMqRCOu84KAjr3wok632uiAtviH/ImJ2892ja/wGgUpeO3PQ
	 v9iDm+zyG+72E88Hfq053vOraEi5rBR4sB8XxwiwMrUklyUuq4zCA7XvYN2pOp+9Ou
	 G5jJntS6Cq2pVOYPqnGFwzcVZYFWRMPJcmmVOKGAjZJmDmBzGcz4G6J3lcG3ppU2gL
	 YW9jYA4svMkrQ==
From: Mark Brown <broonie@kernel.org>
To: Ikjoon Jang <ikjn@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Bayi Cheng <bayi.cheng@mediatek.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221115124655.10124-1-bayi.cheng@mediatek.com>
References: <20221115124655.10124-1-bayi.cheng@mediatek.com>
Subject: Re: [PATCH v1] spi: spi-mtk-nor: Unify write buffer on/off
Message-Id: <166965235645.555844.12992456289264361457.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 16:19:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081919_796430_2640C010 
X-CRM114-Status: GOOD (  12.67  )
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

On Tue, 15 Nov 2022 20:46:55 +0800, Bayi Cheng wrote:
> From: bayi cheng <bayi.cheng@mediatek.com>
> 
> The logical structures of mtk_nor_write_buffer_enable and
> mtk_nor_write_buffer_disable are very similar, So it is necessary to
> combine them into one.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mtk-nor: Unify write buffer on/off
      commit: 63d9a4d88499569210c445a862209515207c2732

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

