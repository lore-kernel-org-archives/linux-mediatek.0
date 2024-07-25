Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EE0C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jul 2024 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdaA0luoIKh+C/Z+TfOYMNVRIVT4Fe68cfJZP8FEYi8=; b=hvg4MFYZ/F/8kpaYiHv/w2mvXB
	nbEejGkgDQmVT/UeWQ7hEzE4s11FzUsmU/ZonZtOGpfZZ4kcnnjMo9s6QK8yitXYliIfXVpc+6Lzy
	TZTFliVZbJr22f+HcVoChnSfvprXrIhH5OhBqSSlOsr6F26VHd8T3RU2KVWM1eMzC6TV4dttWv8Qv
	EQkxdHtIFt9EtT9yEJOWJdpskrhGVayMkT4/2rWjxdnyTmfqbOYWteW60wvj0n0YRdVdT8UE/NDq6
	GB6RG7z0tvZyidJgCdZPnl+/c1ND787hCj0mnhcl2E7ftdErKwPiNUlh/KPgueHRMRuGYXae7RGhF
	58UQdu8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX1LM-00000001YJz-1mCc;
	Thu, 25 Jul 2024 16:29:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX1Kv-00000001YCs-3MMl;
	Thu, 25 Jul 2024 16:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32B55611C6;
	Thu, 25 Jul 2024 16:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2470FC116B1;
	Thu, 25 Jul 2024 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721924940;
	bh=rA8r5GE2DmreSp4mzMERlx21Ozsy7idcGW/81EsYAjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CyMfYCjVimpSdrI/6NFuvB4RwQK2i2ehRHRAwXgwmifhEwwaPtfPhy/RarehoVDih
	 m6tAo/0CyllD9poiPv69XdsODkaF1PDmZDmf/OnerivmewQKHipRxc6zKsk3Td9B5w
	 8ehAkthL7Q9qtEmDTqC9LbMPsjfvbgQP1QEa8O9yw70+ESjjLkkJH8Fvcu5CWQSi17
	 7bRAJ0GvSEFQWNFLyTFn4g18zKZH6A2Cvnca6l7Z74b7MfyuOZLQ54E0u9Xf3Slh3C
	 2Rj+NwGKR7pZxhKZIU1vYDxaKMPkz7FTP1hVdIuvfwpkgR1R88GVfsQQw/Y1UuUGs8
	 OlC1KbzaQB5mA==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
In-Reply-To: <20240226-audio-i350-v5-3-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-3-54827318b453@baylibre.com>
Subject: Re: (subset) [PATCH RESEND v5 03/16] dt-bindings: mfd: mediatek:
 Add codec property for MT6357 PMIC
Message-Id: <172192493586.1054722.4853871002402475676.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 17:28:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_092901_898774_27909E1B 
X-CRM114-Status: UNSURE (   9.74  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 14 Jun 2024 09:27:46 +0200, Alexandre Mergnat wrote:
> Add the audio codec sub-device. This sub-device is used to set the
> optional voltage values according to the hardware.
> The properties are:
>   - Setup of microphone bias voltage.
>   - Setup of the speaker pin pull-down.
> 
> Also, add the audio power supply property which is dedicated for
> the audio codec sub-device.
> 
> [...]

Applied, thanks!

[03/16] dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
        commit: 3821149eb101fe2d45a4697659e60930828400d8

--
Lee Jones [李琼斯]


