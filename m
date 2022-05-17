Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E636C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NI1ZefZYhswcuaVWJe76T+088rucZYI6kmotIqmTutM=; b=G4ysIylDy+NYM/
	jorWuqOmGHqmbaCDx7r6ic7Ec+lA4g5alhrqiYnrNoSqnPk8xO8TCM9gGawfKc6kz9WDkDdo0Kv5r
	Xt8A0c65hbQXW1GwcZJyEBTPgchgDP7FiBmbxQOzMzCunpe8SJ6zTNbzdLsBK/j6j1kMwUYnGar/x
	VhRLQmpxW2Rwb10t4TpfQhPfbwZfbQVLF+XLlStd675sIuhYQuIzspqzH10SwN1hcEVEaXqU3qfDR
	K0wIFNpswypYerZX8OV8kvqwHMI1Aj90g2BMk5UJ2/nfscKtzdqyyCAe/mit+otMEWwuo4Gs1JN8X
	GJLxH7kF0WAZMWa5CiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqzbm-00Emzd-Gt; Tue, 17 May 2022 15:59:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqzba-00EmwF-LP; Tue, 17 May 2022 15:59:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C211960EC7;
 Tue, 17 May 2022 15:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF9AC385B8;
 Tue, 17 May 2022 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652803165;
 bh=qB+Y2b64SyCD76/3XYAEBdye3lfRy7RB0EKRB7eIy44=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ic77VlduGWC/bBx4kKkKWri6PpIr+WNQkfPakgMeHzOYKy/3leM0YedDNBvNKlxCD
 otWAQX0IiJfU+Wv52iV+tqz/8Scfzy+wn90H09iQ6aHMq/5xfRkAQdjTWu/3FQ60OA
 NE1TeWbfVRjKp6Clclo+taeyj9mzoHZ/mYJ+ygbLq/hPhiddlJftI8a6/tK2uJhSMH
 ICMD1PCKO4WuSEPs+2muB6YeZlDylFHoqHFPQKpeghUGK+KCmqcbAr8f3LFkwyRRnV
 kOk0b550GvXmG3KUmVgwz0ngaIjb6xnj8l1DGqMUt4bBIKBRlqQPKGFCRVROvSEtEy
 //2+hgNIPKTFg==
From: Mark Brown <broonie@kernel.org>
To: cujomalainey@chromium.org, tinghan.shen@mediatek.com,
 john.stultz@linaro.org, javierm@redhat.com, cristian.marussi@arm.com,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 geert+renesas@glider.be, yc.hung@mediatek.com, tzimmermann@suse.de,
 lgirdwood@gmail.com, perex@perex.cz, kai.vehmanen@linux.intel.com,
 tzungbi@google.com, bp@suse.de, ranjani.sridharan@linux.intel.com,
 bjorn.andersson@linaro.org, gregkh@linuxfoundation.org, tiwai@suse.com,
 Arnd Bergmann <arnd@arndb.de>, simont@opensource.cirrus.com,
 daniel.baluta@nxp.com, xueshuai@linux.alibaba.com, msuchanek@suse.de,
 yangyingliang@huawei.com, sudeep.holla@arm.com, allen-kh.cheng@mediatek.com,
 matthias.bgg@gmail.com, daniel.vetter@ffwll.ch,
 angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20220512082215.3018-1-tinghan.shen@mediatek.com>
References: <20220512082215.3018-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v9 0/3] firmware: mtk: add adsp ipc protocol for SOF
Message-Id: <165280315828.1635268.5394864574806411839.b4-ty@kernel.org>
Date: Tue, 17 May 2022 16:59:18 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_085926_774598_A26C0656 
X-CRM114-Status: GOOD (  14.06  )
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

On Thu, 12 May 2022 16:22:12 +0800, Tinghan Shen wrote:
> This patch provides mediatek adsp ipc support for SOF.
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> This patch was tested and confirmed to work with SOF fw on
> MT8195 cherry board and MT8186 krabby board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] firmware: mediatek: Add adsp ipc protocol interface
      commit: 9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c
[2/3] ASoC: SOF: mediatek: Add ipc support for mt8195
      commit: aea9350108ed1627f8610c93de44578162b3ee91
[3/3] ASoC: SOF: mediatek: Add mt8186 ipc support
      commit: e0100bfd383c7d994d2e957e85ca56a5fe5a3f43

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
