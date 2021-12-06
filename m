Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 18:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ry/zR+dEr8eNYPyLfRLGCrB3+Qe/GOMtrzTYJ3Dshc4=; b=ASYxRrNloDE62p
	65tNd1T7+3NNbF2WfXGOiEbuoAYRdf/ptXif7a+6wIyrIf2ipoR6IK6VJ4Ip7pSXSVnhi/eTxQu9e
	du/VRiO8Z/RNSr8AL9pXhMrWwOr3qXJcN0ddlGOYlznWWt9CtxZoyjvxsN7FS2x8xAbg6oy9naJQ+
	ll2VNnAAEoc0cir2arn8zEq1UBnd+FG2puDTQOfyX/gZX+MiPkdWFpezkgJYgIClzrBmCsQsztiqW
	eiFha8ALHSGc7KCjh5eVGkz/AT1gtEyzS/vaPyx0oKQiSgHMH8pxFFSuS6tyv12aSjC6T5UVV8aML
	Ab5KJU0WTxe+BNFmFylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muIIJ-005Ahk-BP; Mon, 06 Dec 2021 18:00:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muIHz-005Abr-7T; Mon, 06 Dec 2021 18:00:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7F565CE16E1;
 Mon,  6 Dec 2021 18:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2940AC341C6;
 Mon,  6 Dec 2021 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813631;
 bh=rm4lpoorN4GW0idvvHmReqqBpZmjcTOc1YuUVO0Ac2g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jjRc2MYZzQIjUrOw+DzK8UGJnqGKL0Ip5yQ3sGBlCfirVCbHtuH2LDwOooZQOO/u8
 GwYLoxXv33XLoRjiDt7tGJuoFH7JLJOjFT+q7SAbN5EN79RK6lIlN6SmI2jY5MGi/f
 Qz5WKSO+j3PTvt7rYLfEqGD2cBVau4VGy3IxObW7ZKs5naIGxpXb6NGHSrmsKr35zA
 phvlGHIzdQl9LGUXf/sAUQsGpwdzkjpJn8o5IwXJ8CdD0R1WiYK0z2ZHkD9tClBVZn
 Ob2piYABpjZbSjuUNNaByxEtaXgO4cazAIEAfShSH7rjPpkbIgstdMVLKr1JHcPGx/
 Y8BhLRBOd3IMg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, matthias.bgg@gmail.com, tiwai@suse.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, yc.hung@mediatek.com
In-Reply-To: <20211130053905.28470-1-trevor.wu@mediatek.com>
References: <20211130053905.28470-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: support memory-region assignment
Message-Id: <163881362873.2769299.4647182629013116105.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:28 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_100035_492806_DF3A9B6E 
X-CRM114-Status: GOOD (  14.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 30 Nov 2021 13:39:03 +0800, Trevor Wu wrote:
> This series of patches adds support for memory-region assignment, so the
> access region of DMA engine could be restricted.
> Patches are based on broonie tree "for-next" branch.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8195: support reserved memory assignment
>   dt-bindings: mediatek: mt8195: add memory-region property
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8195: support reserved memory assignment
      commit: 4d408ea0282c374a304ce402866cb7b8a56c6b05
[2/2] dt-bindings: mediatek: mt8195: add memory-region property
      commit: 2da636247bb6f4fc3a9842ade04757790753fd2c

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
