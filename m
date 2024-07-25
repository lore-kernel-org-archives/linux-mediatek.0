Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC60C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jul 2024 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmDStrVcMg1PJoFyIiqGeUOMxT7YpT3H+JFfCjMerBo=; b=LMaLvqR5V73N0f9PLDbqv0kniK
	EkBxNjyfDIUSol2mcEC+P+klbgh8qXTY8xgJku/k8r4tD9/e8rFGfPwBNM355Km41Gu3ze1w+Z88Q
	kVb2vh7q99Mfh8A9QOf+C+MYGe/VeweFxcS4CTXI6QwdnxsjrFwI4siT6dBqz12gcsPKwCddClZYg
	zoH/YTGkbmVK68QYskCoYj6v+IlXGz5FiQC4gMycYTDE39AlfDN2t9LBzkBBLQpWhhveZHJB984Ru
	v2ff0iOKr1/PYDu2p7Upq3877pdF+oQKZrS0bqiZvB5Lr0p7kr+bp1h+EzAZPekwFa1GGyiqOha3g
	22N8jIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX1Li-00000001YQH-0c6f;
	Thu, 25 Jul 2024 16:29:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX1L3-00000001YEQ-3y3z;
	Thu, 25 Jul 2024 16:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F1B84CE13CE;
	Thu, 25 Jul 2024 16:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E65C4AF07;
	Thu, 25 Jul 2024 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721924946;
	bh=6M9VEwQ0bCBbEukoo/UWmk3UpgsSaKDRg0kAVMformg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T8eboKwt63bDwOUKiZpVQxR38fh1QOLlVI2F7pPUT9mbxxqyWa4EvKAxGnXp3/CbV
	 n/Scg7QCtvteXcE5w/IHr87pLi4oVXk/ngNMgo0Rn4fYa8bj81/xOVUcM0IT+DRUIM
	 0nNQ/NJZ628zHQdrwnbQ8mbRYdMwG+EirQiVeVKitq/yRyPjpXoYPeDQhJ89JxLpUD
	 Kl6l+btIgr5OZZ6WKKpslw1c9LKaB/IC+xrnw5IQM8cgW1zGqsf56I+FEqfVhhRls5
	 QhGGBlKzaxr2E2O/wRrA45cbF6fCq+rT2KQhAjP80z/YOMguStbJz3vP7RbvfbBEsQ
	 g9db7e7JW4xew==
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
In-Reply-To: <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
Subject: Re: (subset) [PATCH v7 03/16] dt-bindings: mfd: mediatek: Add
 codec property for MT6357 PMIC
Message-Id: <172192494107.1054722.15668367028139729556.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 17:29:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_092910_196741_0208D165 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, 22 Jul 2024 08:53:32 +0200, Alexandre Mergnat wrote:
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


