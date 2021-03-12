Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACC5C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 20:41:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0217964F4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 20:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0217964F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HdXfkSJVCf7AfbFWUTimMk3sDfAVeLYcqlOSbcDTCYA=; b=DIo5GXtuycqW7pmyJTPqhdt6h
	U72240xiHWGm4OPE4IwVrslgtbqoeTJRZMUSOx+qH+85tvTLxViQeRWlRZOjUKp+uw5iPqvjEchhB
	/TdMACokSGjHMEiWrKW+DRg1LgjuiV7jkAkMM2ga8EnA7ViASbwK67o/ENb1Spnybmu0a7BfzUZ+j
	JfrZ6uLU5JXEL0jBHJtwVNOXWaXldz6G7vqarl1XkVPc1hKfcerQG0aAeGBI0ZhRD4OkSOe0SYsKT
	kJx9q4Bz7hwgvoFU5nkqtkFXI7JoYqRwgxED4qfhDEe5N/iIAi0rvAi9yoEH3PiRYG/kc982fx26p
	sTgey8hjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKobC-00CMTF-CB; Fri, 12 Mar 2021 20:41:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKoLR-00CLE2-1k; Fri, 12 Mar 2021 20:26:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3700A64F85;
 Fri, 12 Mar 2021 20:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615580708;
 bh=PiAVnNdcv0wxF9iybfaUy8tQqGnHkVEy3c5oroa2KHM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o8FQyHkyzFenyo0UuWd6wh2j7bC0C04wtwqWUTHR4M6gmRaPuUJJ0NeDg8Fmlanw2
 KSYKf7p7QQ4SNM1I7HJv4xWx58gznLpo74xx6feJk9xU386bqRU9lIITw7CfVHOWsy
 atv/kXx9b2boDhplUT1gjRlcMjIBYFfbiOWt+ShunEcrGBnurneffMQ3cdnYcWIxZn
 1WWJbtunZwpJtk/Uk3tWK5yniysUib3d3ky5edhHFPQ4EIF8POI75wlUpIWCnXrbwY
 UfEyccrXQXTbzulEbsv30wi5hrAQFolBhUA1qMPIN5Uq/3ENnWwqwydP2M8FBG0fhn
 +WgQaR5gA8vKQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 tzungbi@google.com, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, matthias.bgg@gmail.com
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com
In-Reply-To: <1615516005-781-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1615516005-781-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: fix tdm out data is valid on
 rising edge
Message-Id: <161558062956.11113.8460883520488854945.b4-ty@kernel.org>
Date: Fri, 12 Mar 2021 20:23:49 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_202609_024332_592AB7D4 
X-CRM114-Status: UNSURE (   9.32  )
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

On Fri, 12 Mar 2021 10:26:45 +0800, Jiaxin Yu wrote:
> This patch correct tdm out bck inverse register to AUDIO_TOP_CON3[3].

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: fix tdm out data is valid on rising edge
      commit: 8d06b9633a66f41fed520f6eebd163189518ba79

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
