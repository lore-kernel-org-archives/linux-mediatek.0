Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35151C54E4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjPVK9I+K4JCsdZ12sE12PMWSTT5PuaVGyet42NaGFs=; b=pdnr0/0T4J1aakPtWX4ehGzs5t
	y7n2zC+1JDPtJFC5eWJ0pZxgVmasZ0pO2QRkfRiJKkB11Zy6qNBSSguO0amDOjs1JSpyIyNkaM/Zr
	ULWE5zYMtDLDEJul9zvOwplLQUNU/hOsmfYUNSzLyprP4aMZHhy5hs83pQ/Gxa1/byLi1og7QKj2x
	frFKlENS/KHcb6EpcLMGTXGYdz0jlBCROKH15oO03ciDmOI7M0J5l3Eie2S8Oq5gGercX6sjLcK3x
	5QZB+SRy4eAmi31W+lh7ycM1WW1EEFzLPXVhwgbYIicb0rSYu2qVzk5BkvlhIF8B4vRoqGd5KUICA
	ocd+9XiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfkSz-0000000EY4j-2fU4;
	Thu, 29 Feb 2024 17:45:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfkSw-0000000EY4A-3ht3;
	Thu, 29 Feb 2024 17:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ECB0612ED;
	Thu, 29 Feb 2024 17:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8812CC433F1;
	Thu, 29 Feb 2024 17:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709228705;
	bh=r46YDK3Axw+cBVddXAlXM7gpz+1Uk3YSMg9uwZliBas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j2i8Xfzkwu24kv9T/itHx2J8zwt0IqaZDa5JJoKmmrrPJ1VSWZUP9nFIujBp7qi7A
	 Ucy1S6O+YGoWkH5sNSzLkEIWkPoDbT1gUsg9G7nvqy0b+i0gyHI4FN8/sMcNMiaibU
	 mHFEmGVSE6DHMCyUObCBJW8pr1q8qyDF4ta8ZSRINsjehq1ZpRrSnhtexezeVakKM1
	 gyIrxxfmxG3YzQW+HOrb9Ulqg2avUOW/Dox2h+N2T6XY/zTU+enoCL1AG39BLYpDH5
	 uVMDf8f2CWmOt/bpFOWOF20TNqRm3/0CI3mYcZpoTA0Qb6HTR4vWXAg+TVdSBoGLYo
	 Yxa83LMlOImsg==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 amergnat@baylibre.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Fabien Parent <fparent@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-13-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-13-4fa1cea1667f@baylibre.com>
Subject: Re: (subset) [PATCH 13/18] mfd: mt6397-core: register mt6357 sound
 codec
Message-Id: <170922870128.1628445.8442233644486002127.b4-ty@kernel.org>
Date: Thu, 29 Feb 2024 17:45:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_094506_990321_4358C278 
X-CRM114-Status: UNSURE (   6.52  )
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

On Mon, 26 Feb 2024 15:01:51 +0100, amergnat@baylibre.com wrote:
> Add MT6357 codec entry in the MFD driver.
> 
> 

Applied, thanks!

[13/18] mfd: mt6397-core: register mt6357 sound codec
        commit: 79d98102a31ab777b4a6632d799ab2bc63654cf8

--
Lee Jones [李琼斯]


