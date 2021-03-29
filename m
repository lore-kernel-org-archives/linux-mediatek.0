Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05391C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 00:38:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B6261935
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 00:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B6261935
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UiZx28oF8+adSH4slU1jX865xiZwW5a4HfVUcYQnfkc=; b=SpWQ6sh9IIX0CxhkInrz6SiRT
	HGgEXpseykRNcE9IBXBlwHkaWyTW5sPzBT0wHzYnimtBWB1x6YJf21WXzb8ZDhUjEbCROVn6Gp5K7
	gr91G/D0jtrrtRa6o+d2h8fTOf0eLslZXepTsnD9YjG+MIsVp9IlHV421mKuoMWxuULRse56It7K4
	eNBhNUfdOhY32E49JRtl8ABaLkfVj/ZNgjWtWq7lvVGoO/TQRCbAWeX+ZncS7x/ztT/6AhmuEU9rD
	jHtYJdJgAoxNRjnjDvkWIvfoYW3qgVbSOYt/bnCBB09oY9DCUGrbWZ1z8Ku4tMDL1nbFaQJn+PPrZ
	szLFAyE1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR2P6-002DJ0-Jf; Tue, 30 Mar 2021 00:38:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQy1u-001Lqt-MO; Mon, 29 Mar 2021 19:58:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D93B61554;
 Mon, 29 Mar 2021 19:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617047908;
 bh=33BYQBr/4s8xc5+GccSIv0XFr7Cs0xd2pSG0T9cY22E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K5fZj4fa3wTwxBVGVv7q1JKBJm1UWhEvTvaF+2bYcnBgMDkShzw2MgG8NsOTrRLuP
 vQPGU4D+FLGTn9YK4trNp/AD91mkKtF9M8zS4Wc00OkShzwkYi0KjMKAhiz0ePEobD
 IAzie5hN9XALsPgN+KSuBGzNxsZpxwd/8KZ2/pWdf+NnRWqdRCDA5AZ8HcloD8nm7j
 ljEB4eKJINcXF7b/jF0VLQbCpGbEH6icy/BBzwtnUt0LL7yolsVx9UUrIps7KUpURM
 UwDlhs5hpPeSZBXp6e47zMhrZtL/o9XEhpw9FeiMIEc5tHGj8LrJR1ajAmOpL5+4WG
 N4BhJo1/+Bptw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Argus Lin <argus.lin@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 Chipeng Chang <chipeng.chang@mediatek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-mediatek@lists.infradead.org, Tzung-Bi Shih <tzungbi@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Shuming Fan <shumingf@realtek.com>,
 "Shane.Chien" <shane.chien@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Lars-Peter Clausen <lars@metafoo.de>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, alsa-devel@alsa-project.org,
 Dan Murphy <dmurphy@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH V2 0/2] Add mediatek MT6359 ASoC accdet jack driver
Date: Mon, 29 Mar 2021 20:58:08 +0100
Message-Id: <161704724764.10039.3415916166435567719.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
References: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_205850_032058_45AD2657 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, 10 Mar 2021 21:33:04 +0800, Argus Lin wrote:
> All of 3-pole and 4-pole jack are supported.
> 
> change since v2:
>   - fixs missing blank at Kconfig.
>   - fixs comment format and spelling mistake.
>   - changes private structure mt6359_accdet to mt6359-accdet.h and uses this
>     data as function parameter.
>   - removes compatible string declaration.
>   - uses regmap_read_poll_timeout as polling timer.
>   - simplify jack detection and key detection report function.
>   - adds mt6359_accdet_enable_jack_detect for sound card jack initialization.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: mediatek: mt6359: add ASoC mt6359 ASoC accdet jack document
      commit: e61c589587c772c5f672b22683c3e0b38be20702
[2/2] ASoC: mediatek: mt6359: add MT6359 accdet jack driver
      commit: eef07b9e0925e16457ab9444b56a7f93b541aee3

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
