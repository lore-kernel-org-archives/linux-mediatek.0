Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9386FC6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBR38XXItcVbdneAtF8ttEBe5QTItP7XzsF9KlyVKVo=; b=HEsrMATpzukioqPm2Er6D+JpCa
	lLAp+1PXMnD/t7nWTGOZgrK4IkWTLJHR7dWVHupPdC+VGVXh4GXjVRvWq5iHFsKyhqRDMXDjG7DmF
	ddcTG1Wj+/vzfSv0uZmoRd3LnhVB4H/qpxLDI83CildhzWW2nQpt/5dg6Cqd60Rnl7FisNvn5tGaO
	+WSJ9nr+Q/XQeSVzvMx6YDBjQej5XN4h2vkBvFxZVPQ0CE7Qiiv9hsihlCppraCjgOyu+tSelyQZn
	KLPOv3sQQN+SGvbONaopot+S45A7EtoCfmcgOKRK6HTTEEY5wH5WG3GW7Ekrf8Jk6ZK8pRv/my0mH
	ts8AxrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8db-00AA7C-Rk; Tue, 27 Sep 2022 11:20:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dH-00A9vT-FW; Tue, 27 Sep 2022 11:20:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D89CDB81AFE;
	Tue, 27 Sep 2022 11:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C515C433B5;
	Tue, 27 Sep 2022 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664277608;
	bh=QQYYaQMEZGvzeczjp2ttfiOGEJrYpgRJvX3jpp4RbLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SBJYAlf2n0xdNapfKdhNlJBt1VWw2tH1tLqXsShwzjI5JlYE0Rhyp3z88PvnavvDd
	 L4KRYyQA5Bp84f11TxHA0Q5D07STruQIg2NeFwMNTVPfMw39V+JsYptr85cSTerGZ9
	 fxZ1BzmhuASWEqOLhZKvXQiVtX2ba80ZwdpWCC4kWB3pAGuDndPXJMajV1CndD7+gG
	 v44NUCVsnHv9qriyDOk1FculvZCdVeRsrwmvdT388aEL1K8mv3EKXiNJ9Mjdr9j9zb
	 zDjjQEJ0H5S6AFK0VZ3KyqP+rIN7n1WHJfMNnvhZctSakIijOCDmZzQelKYf2DHfn9
	 lmpXP2t7h0/Uw==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, Chunxu Li <chunxu.li@mediatek.com>, angelogioacchino.delregno@collabora.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, daniel.baluta@nxp.com
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, project_global_chrome_upstream_group@mediatek.com, alsa-devel@alsa-project.org,
 yc.hung@mediatek.com, sound-open-firmware@alsa-project.org
In-Reply-To: <20220924033559.26599-1-chunxu.li@mediatek.com>
References: <20220924033559.26599-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: mediatek: mt8195: Add dsp_ops callback
Message-Id: <166427760496.294040.5707200014534943454.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 12:20:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_042011_726063_11557044 
X-CRM114-Status: GOOD (  12.81  )
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

On Sat, 24 Sep 2022 11:35:57 +0800, Chunxu Li wrote:
> ASoC: SOF: mediatek: mt8195: Add pcm_{hw_params,pointer} callback
> 
> Chunxu Li (2):
>   ASoC: SOF: mediatek: mt8195: Add pcm_hw_params callback
>   ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback
> 
> sound/soc/sof/mediatek/mt8195/mt8195.c | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: mediatek: mt8195: Add pcm_hw_params callback
      commit: 978a7144ae8497b40d833a3c0110b18810499f95
[2/2] ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback
      commit: f7c91bf65388547f61888b7a67169966fc698ce1

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

