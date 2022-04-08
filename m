Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAADC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pavo8KRLnxkACOkuVLuwptlTiQ1v+W7MVAh96y3r3ew=; b=wn4OCMSGzgN/5C
	SEYL4O9eJOHZjCKGRJrZrQm0Po1B21Am6CuO/Z7iDASgNFS3vaGMlh+URtku3EeEirgTn8VOxI/ko
	NczZ4HbY+kwXHhpf5ltmNZLkoPYaWB0R8oTvTuhOLtKcmU+XK+VIE77gTl+5ZZnEVIA0S4/owm3hh
	ORqVrJVPTwEF5qKOuYVv8+rBPuqNGlA7WbowU8zoGaKYaqbEXvG4yB+NpeLSX47hmTXGOKudVCe7e
	hF3Ctz4/9TcKAb/AwpRzgh2DCpJNu0ABFDzgQ//ZPyEu/riyAv5AmVGddnii4JS59Cgv1MYd2M1zN
	bI+wm5ugJMhcg6viGCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncpu8-00040b-NI; Fri, 08 Apr 2022 14:48:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncptK-0003Zd-Q8; Fri, 08 Apr 2022 14:47:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A6D161E87;
 Fri,  8 Apr 2022 14:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37655C385A8;
 Fri,  8 Apr 2022 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649429233;
 bh=6UAy6vwa9qNgF6GIFreKzgcGTOebGNa25UsFFF9iOHw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GNsF6pDXrgnU84AB89bG6z8gC2Cqfueje8sDfg6VZIHVELT3aZpBrW83/h+TzNRU1
 +HOib9Djh1UWy1FXxcf5vlKMCBr0Y984nAVX2Zid9VcnGjvf9jXakgXlFBjP/HbUPC
 6rbsYHQj+Qg1I9ZpcSMPbhB4o7+GFfUqAQxFwof0Yn++oNdsESMKYhEPsCpEiIRaOs
 Nf4VcYQBlrYkKneakat1KYW2nRSLACsX5fR6i7Ll6PcQlQAcJEQg4XHcDvUntKAp4Y
 TmIJd349vXbssjDOJfkK6OVy05oRsf9kfkafxCi9CDcY/aaj7Dv30U4B/PSjlVSP7G
 rsGHas/pYKhKA==
From: Mark Brown <broonie@kernel.org>
To: tzungbi@google.com, robh+dt@kernel.org, jiaxin.yu@mediatek.com,
 nfraprado@collabora.com
Cc: trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, aaronyu@google.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linmq006@gmail.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com
In-Reply-To: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
Subject: Re: [v10 0/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-Id: <164942922994.1424253.17635473999849755848.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 15:47:09 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_074714_943126_9A2A68C4 
X-CRM114-Status: GOOD (  14.38  )
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

On Fri, 8 Apr 2022 14:05:48 +0800, Jiaxin Yu wrote:
> The series reuses mt8192-mt6359-rt1015-rt5682.c for supporting machine
> driver with rt1015p speaker amplifier and rt5682s headset codec.
> 
> Changes from v9:
>   - Modify the commit messages to make them more clear.
> 
> Changes from v8:
>   - fix typos.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible and new properties
      commit: 1efe7eca170d344c5101c69ac51df6982de764e4
[2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of speaker
      commit: e1e408e60e856b99782b26308a9dc3937b1ba8bf
[3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of headset
      commit: f8910fb4985a00c0a1e6932dc5bda6181c549b76
[4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
      commit: 7a80167b08f52e7b5eaa18a9d515efdcff9085fc

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
