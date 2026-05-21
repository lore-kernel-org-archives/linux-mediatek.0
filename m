Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDADDCD5BB0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2026 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xkp9iXSwBMxfkLoiFAco0YIr6FIaGNxMqOiskAens2w=; b=m6MysDdB0fW36RIQDE6Kplc2nv
	6ddArz8WIATytnD0Qse3/Gmu7HR9JBy0R3E1RpHZjD9gJmdKTfc5d23FJqonHx8K2kdiKCMc5rEkR
	DCTUp7IMO2BHPnlo+n9dUN1qDkzn3UlEKGDlBOyUWk58dGRYs5ZI1laqZj0wPhok8Z56pfFvrf5hR
	VLEzb9Ug7N2YuxZsLBeBmtCUhgDshJFQFN5n8bSgJXPE/CwK77kzhQRuUOa13RaVn1NOD4/4w37i1
	Gaoe7JNVeGXpXU+04Wkx3zykbGltyDNeeXlx0/6FZOnpZTTkkq/Zv0jf5/8z1nAVcsIhLMyNoM4iZ
	gdc9Xf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN13-0000000AV5i-03MW;
	Fri, 22 May 2026 10:22:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN11-0000000AV54-0kwF;
	Fri, 22 May 2026 10:22:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D6E7601FA;
	Fri, 22 May 2026 10:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AD91F000E9;
	Fri, 22 May 2026 10:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445322;
	bh=Xkp9iXSwBMxfkLoiFAco0YIr6FIaGNxMqOiskAens2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fkn3S8E20iag5WUtkXqt10BtP9VOR3jHd2nrGXWdCeT76Esode9SfVrRhSL9j/Oqs
	 y7cS4qsN2oKytuOsy1WGnkxexcFbBgQZ6e7CFV+JiQiysCST8P9KuoEgKnO3Lrt0Ng
	 d4eU05l+KGH8o72bA7sD3KlNV+U49gJjZrCodYPz4ai/HaCt61G301WunHnQzBJnMq
	 7NbDKL6qoSPxegl8CVv1un/4SntbH6VTTh1wueKyTfFN29akfB8Tz3wJZUP+FQ3HTR
	 HjKnYGSo6Qmf9+5JacpJuF8ktiQ+KEJi/XDk1vcR9DZyvdg0A9/KYrzWplZOaWg81R
	 N0OWVsriMO5FQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Nick Li <nick.li@foursemi.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, 
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, 
 Kevin Cernekee <cernekee@chromium.org>, 
 Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Marco Crivellari <marco.crivellari@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, 
 Aaron Kling <webgeek1234@gmail.com>, Teguh Sobirin <teguh@sobir.in>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Hsieh Hung-En <hungen3108@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Shimrra Shai <shimrrashai@gmail.com>, Zhang Yi <zhangyi@everest-semi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Sharique Mohammad <sharq0406@gmail.com>, 
 Chen Ni <nichen@iscas.ac.cn>, Neo Chang <YLCHANG2@nuvoton.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Kees Cook <kees@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
 Tim Bird <tim.bird@sony.com>, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>, 
 Peter Korsgaard <peter@korsgaard.com>, Linus Walleij <linusw@kernel.org>, 
 Wenyuan Li <2063309626@qq.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Xichao Zhao <zhao.xichao@vivo.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Peter Rosin <peda@lysator.liu.se>, Dan Carpenter <error27@gmail.com>
In-Reply-To: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1 0/2] ASoC: Rework initialization of i2c_device_ids
Message-Id: <177936315178.58022.6647400711614620844.b4-ty@b4>
Date: Thu, 21 May 2026 12:32:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q3EmgiS0xb2HZNxg/RftK2CygD26EtkORNTMm15D0f4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC4+xfmyychPuCUwk/jiLXspmo/BcLb856BbX
 308jyaWUsiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuPgAKCRAk1otyXVSH
 0AzCB/0ZVReZqZGERUELDL4MyBklwJcxn2eozuE4QgHL/zTKaedA/xJb7gGN9GSz8PaH8EvPZ3/
 G7ADNjyOLY1H1oAJLKTP0vfM1KuRNwUuB720DV/dtITwL49AmQ7lPgQbXUTSW84RRNo+ZZxdXUy
 DEmEAgmH+IHk0wi6M7ZeHVKyyevKUvEr1Mrg+MGzHAQSAFSGNLgOyvyDKIuod66cT+531JOSSnr
 bAGE0YgBWc8EqBIXsbSDJ7/Cyob/0FEKMKu2xkrq+qhNDMNJAC2fMv+8BgapN6/e+1uJAAaHjQC
 Jr68ZQFKhKJRw6zWX8KedYHp6/QESUgrzn4TCVaNVf0C5GwS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Wed, 13 May 2026 19:23:02 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> ASoC: Rework initialization of i2c_device_ids
> 
> Hello,
> 
> this series is a preparation for
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	index 23ff24080dfd..aebd3a5e90af 100644
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: Drop empty i2c remove callbacks
      https://git.kernel.org/broonie/sound/c/2e0389f3689c
[2/2] ASoC: Use named initializers for arrays of i2c_device_data
      https://git.kernel.org/broonie/sound/c/910714d4e79b

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


