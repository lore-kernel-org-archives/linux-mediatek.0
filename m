Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2EAC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:16:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF07F61622
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF07F61622
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gvdFoLewVBLemGRv3HvvBLIcbqOyEWpkbHn0Ffc2toE=; b=DoSGe+kjFlStm7i6bl78FDcpb
	A0WkKtDA3urHiAvlOf4iTPshKwvvI9Xab6WbgECGoR907WfiJKUuc0vWIAM08hqBq77nLq85aiJMq
	S+TKZIgJItW0+2qjDoKkpdOmKE28rB0HYeMOU1z//Az/zQglnUeqp1sFvLjfsyoQ2nP5x/4irm5uH
	UdHYH2dHNqOcPB33hBC8CrkHNrsXATO1gMVrkvwcwW9KZ7R40E9ldSVwDavNWao07TbPvQj/BAVtn
	iwGky9i9TbvEV6XNcJYo8pPS2iXReXIRzQ95KFKGCaE1muEiPZiEY5aRp8vCuQ4nWoykv9G7nAQtI
	/uZTB9W+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRJe-00HKhB-L7; Tue, 11 May 2021 12:16:47 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgNkU-00GbLN-L9; Tue, 11 May 2021 08:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=b6HFGr1LeOi453N3Y/9x16Jp48nG4q/1mBoRUadXF08=; b=NJm8/ZZLCAq6708XryrmUQLkmX
 g985MvdAYFlNiJj5rHTQE2gjkKMAnD05yxrv9yJVgMLWmXdFEtUQsk5SWRQ8dgfkwBMUWZBIDMZfG
 ox8yYJbr52PeY0WOJU2oEzbQ8+qoxXoqvtyFUhV7OZIDUP17W2AYHYvzv33r7CtICWG0wpnTrmJAj
 v8yv3cwKK74jmwOOQ4K1F3jInkN/sqvPkykB1zMDKQ1wamF1umOXAKQIb0qaZP7G3ZVHsb2F+KVpp
 YLMglfNPZT+mHRaHnokqTKzTP5GVIUrv0kqTxPbAlul9IPcRoKMePtQbG4A2iiR8plPbyvoM+ndOm
 9i3MMKnQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgNkS-009OX4-1t; Tue, 11 May 2021 08:28:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD34661946;
 Tue, 11 May 2021 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721691;
 bh=Gk+CeoyFxhnPqAe46i/l9FnGdGx8TtOSVBjRZoBk/4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ixOvwSZ3oJ/owYJUpffCkc6eJNTdy5I9Pd+rYepv+0icFNmQjK9560v0fvwRMORKy
 PTbvixRF7boG0HmynEMhKGAYYdhoG5A9DiBVCPcH4xzus+VVcrVfh+LvOMkbDVZEPW
 QeXMnnC2a4FNmSEPuGFazxG3qgsuOeIoJiVyZ8woIto7OXxhpAOKM+aYmGpB0LVmKO
 46FeKz7PekHvZ06L8HH2jGpTpurztxLSewBPsJn+ZxiFyFg7W4dlBGsHRe2oeC2vBT
 l9pWXxon1Az7FNEPrgaLGCjN9T4HFaD+Vk3gWy3zmDx5l1fuxY7fv6nEE+2VBY1npm
 cxDY2+5yqm1Vg==
From: Mark Brown <broonie@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 alsa-devel <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: mediatek: mt8192: Delete a redundant condition
 branch
Date: Tue, 11 May 2021 09:25:59 +0100
Message-Id: <162072058170.33157.6826486921095760961.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510083640.3368-1-thunder.leizhen@huawei.com>
References: <20210510083640.3368-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_012812_132823_003ACB04 
X-CRM114-Status: GOOD (  12.43  )
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_012812_132823_003ACB04 
X-CRM114-Status: UNSURE (   8.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 10 May 2021 16:36:40 +0800, Zhen Lei wrote:
> The statement of the "if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)"
> branch is the same as the "else" branch. Delete it to simplify code.
> 
> No functional change.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: Delete a redundant condition branch
      commit: 85c966dc97d1c46a3079ec4c26714c9f8ec66823

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
