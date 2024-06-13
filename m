Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8562DC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pITzUpQnI1oWRdUcdEWfEjNeBMh/UYfiMCrp+TJ1/7M=; b=sGtHm5UTJ+BX0A/6wf1oyM6XHB
	7wXOnPH8XeF1J5fa4oauEpBKfscV/tTi+I5jxfhM5s2XBC+kUKHUXgM7ng7kF6bGrGZLuyX8qdbk4
	UiJh+QVw7d1A7bNgKfqjvAIc0k5/kHmLy9D47LV+Q4aJLtep3y39Y+jzshnCKp+c6qwnC0oguGbvK
	G9qGEPshPWECkst3BfpXTa8Fs5rIMefr4qe7pC9z0JN3wzBlFLAyXFQvGyRqwD9G33GwLpWW2pP8N
	uIL3Qms7w/A2UcvUm3zbijdwhO281lv0YJHmUmi1XmXjLwtCNFd/QHbKkjhKQf+4AcC+gzKY1/3ns
	nBK0zbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfUZ-0000000FcSZ-2bNH;
	Thu, 13 Jun 2024 08:07:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfUV-0000000FcQE-3OKl;
	Thu, 13 Jun 2024 08:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718266045;
	bh=Xc9hAyyCn4DkrOcITDwEYrgqPgKOnmKW53OP3Af64R4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U3TIGdS3aTXaE5mdWZxJ2vjJCsYGfA8WI7L9VP7KwnZjfaxDstz+sBPHScxluLXHj
	 j1oC7g6o8sNNO2ffV+OyPzkXwy9YpYVIHHVsfGNIXhfjssb++P19NpFi0o+p+rKBsJ
	 qsN3k2jOnKqOviAwccP9JgN74Zek20cO7uy7hdQKJ6QZ12pDBb+q+yQI6llMR4sZaU
	 BOCYU04EGoxcewshXGmNTm+sCZ70k5A6FYwGoGeU+HU31I4qkch8KLLGN5Maaslwpz
	 fPmFDdGVXs74Fjb2Es6PnRyTPeXyEaTprx2msbc4ouUnNiYZYGnl5tpEvkhPUCy7cb
	 yIE7gathAmQMg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E589378107C;
	Thu, 13 Jun 2024 08:07:24 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Julien Panis <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
References: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
Subject: Re: (subset) [PATCH v7 0/6] Mediatek thermal sensor driver support
 for MT8186 and MT8188
Message-Id: <171826604410.51825.14935271158174620262.b4-ty@collabora.com>
Date: Thu, 13 Jun 2024 10:07:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_010728_174099_F1E63755 
X-CRM114-Status: GOOD (  10.22  )
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

On Mon, 03 Jun 2024 12:50:47 +0200, Julien Panis wrote:
> This is a bunch of patches to support the MT8186 and MT8188 thermal
> sensor configurations.
> 
> Since the patches of v3 were applied except those related to the SoC
> device trees, this series includes mainly patches for 'mt8186.dtsi'
> and 'mt8188.dtsi'. Due to some thermal zone renaming in these 2 device
> trees, the related definitions were also renamed in the dt-bindings and
> in the driver.
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[3/6] arm64: dts: mediatek: mt8186: add lvts definitions
      commit: 0c598e50e6c823c1057ddad17c546e368a415d6a
[4/6] arm64: dts: mediatek: mt8186: add default thermal zones
      commit: d7c1bde38bf37a59551cfd52cfdb5bd974b17431
[5/6] arm64: dts: mediatek: mt8188: add lvts definitions
      commit: 7e3e18f2ed40ea9018590b4533fa148954a725bc
[6/6] arm64: dts: mediatek: mt8188: add default thermal zones
      commit: 2f950510411a33d98eea28c22d7880eeb48adb61

Cheers,
Angelo



