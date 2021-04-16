Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF5AC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 18:35:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E49A610FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 18:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E49A610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AK3Pzrl2caaxNh+Fxlq5Na1Pa/YeG2egyw1O0c9CG0A=; b=iiwUb8cGj2Cb9XvS7Jj0SJRBh
	XeH8CaNPD+jjSUiTnZHEjvrhj4oq+jgARQSRgy1bgUW2uLkgE1+ngw4+DbuR8augW24Sdep2qFlao
	G7W6lLOORO+cRRkX3UF46BHSc5dW0asb8zJd7mQgLmWAaBKMPpOhItBbMd8g39Fh8qVsTj2eHSJ4Z
	X+ssAQPFwRiz9bA8ePLn4kYqcjTx2vNazr6sNdJiXKveJfdelw0AbEwJdv5A+Sn1Pg/F6LTh7nHji
	KlSJSZ0CduM+im9HUweCx8Hybb1eZSZoxhWaLhv8XfGCC/04Od+4WSoopcFHz1bYujR5pHz3ojsd7
	2BXARYXaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTJF-0035sz-9G; Fri, 16 Apr 2021 18:35:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTIy-0035pu-AW; Fri, 16 Apr 2021 18:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=3V6iJNODCI3eqbGRUHPTHakhUfmRrtrR7l/RlYWe5LM=; b=Li0YdVaVKz9RHGUyzGEETZeZUl
 W60moNKV8im9Ds2jNgedM0tOA/0wyIwGmucKXp+Ty25ZDBJ139Y2ilwKC1t5SeccGx7SCokgCRjYW
 R9HRUUPG1xp2vuJrqS5tkkD6cGLzdfmZZWwiNFDtP+GGPlW1AhfmN/jRbL4I5x/HONZuLRTWngH9e
 2lPzjhfY0cOUQDbI+F+TbxV79bi5UwIFkg95jdcYinFQ/qUPYb1M9mAocazHykEvSkXQmcNMGCb1J
 h61Syn+SnfowxDCDHSXSerLwFafjBk/yA2Vk6QvNhRuKRJJX2jBpderThS2zHpKwv7W96XfYFpiCK
 tyxGjK7w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTIv-009d6j-Lf; Fri, 16 Apr 2021 18:34:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85992610FC;
 Fri, 16 Apr 2021 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618598097;
 bh=s1jF8f/YwSM7iQj2NFyAZcn8VnPfgVcOIVtxUHM8KIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NmNYQkhPNsJLqMKdkysMraciLH99iKAS+KfOwvNlZj/70c2EfYKqKfvWWrcZC2uMk
 EbfP9OGMvx6orCC33Fetmg3clIj73bW9mL8dpOBb/7vFZ+SFBjcorY7Y8NVgCHlxn3
 5VOfKsBdlkiEvwWYyGrdZZ00Wm/OxODoicGjlcsUO6e/9npXPJPMcsceNXOIXJYok+
 9eeU/q2bDjHcrvhFfEujzsne9S8hldpGift56ALSOsoOreK9/IqJ/vntADd32JPDfS
 XgeKVuYvydQHkU3J5M7iFbNwsus6sDAri0ASM/Ob65ltkCr1G/DfhnNeWkmTdpHwMP
 R6/fqQzJRbMMg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Argus Lin <argus.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] Revert "ASoC: mt6359: add ASoC mt6359 ASoC accdet jack
 document"
Date: Fri, 16 Apr 2021 19:34:30 +0100
Message-Id: <161859792866.33058.12744070673579269607.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416180118.3662904-1-robh@kernel.org>
References: <20210416180118.3662904-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_113457_752511_047D35F7 
X-CRM114-Status: GOOD (  10.93  )
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

On Fri, 16 Apr 2021 13:01:18 -0500, Rob Herring wrote:
> This reverts commit e61c589587c772c5f672b22683c3e0b38be20702.
> 
> The binding document has lots of schema errors and there's been no
> effort to fix them, so let's remove it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: mt6359: add ASoC mt6359 ASoC accdet jack document"
      commit: d63f2a88d5cfaad025f26e1107f3807d579654c5

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
