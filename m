Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4944C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 09:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQOzdihgU5256grNfvP2FFXW3EEIVu2S1xbQBXbNUUU=; b=yQT898KkZumJ4cknKHxqbXqBjL
	vSoinZ/JWF6gGthIJM/FhJZRlH7594ChC+8Q3e/0dQhO90naFAcVEvpZEiLXHvpTZtguCLc1d+zEa
	Ao8ujootkqqCvGvGPO8d3naAY/Y3nEkxOwSYFpihbUUtA07eqQS7csm7P5O4TF38BDCUT/XeAZFE7
	h996+teo7pThI2q9xPFSlOz+mQyvjve3hojZgenUp65D77a9i8US2iDd7Skdq7GxaQ6/uvGN/5zCB
	R6p/eraDxaqbD/PxrmDoGHoN9todqAZRhC/SbteDPRuvcE06HD0rw7L2Ka62r2DpsA8QkklbPWIih
	g00dLP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj3B-0000000EURY-20kE;
	Tue, 30 Jul 2024 09:21:45 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj2j-0000000EULx-1d4r;
	Tue, 30 Jul 2024 09:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722331276;
	bh=o4tOgYmx9IHZXKqcTaeAPkWXB0TNxC4dHpxp0ch94Cw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nOH/Hr3mnG3TX5BHt8NrsOxsq/xpuhlHzT+VqI9QWKzQxUFEt69g8ySrP4uN3IC8G
	 GWVYoeQJ+6tpoheISRYFNumC5ATlh5y4hfe+fLCT/z7QOpwVAnKCLkgcW7Svu2pzKg
	 yf2EzmX4at+3xtiloyIkgW0bBSGsvp30UhMzJDM5mF8NQLWbbUqDiUWPTwgGdvrwPv
	 gz31q/VPWGuHQQK95beOkaVNV1J/9R6+K8xLgFUlcFwRlaDI2kyMMnam3OQZkMXAmu
	 qm/Klwh6tGsKGV3ijKU4yffJPtg/NplWBcQEBzwrgQNzBqmHx3o34g3snxqObOmPpV
	 W5xFNx0zVoakQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 790D93780521;
	Tue, 30 Jul 2024 09:21:15 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240531-tomato-rsel-gpio34-35-fix-v1-1-64ab2545f182@collabora.com>
References: <20240531-tomato-rsel-gpio34-35-fix-v1-1-64ab2545f182@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: cherry: Specify pull resistance
 for RSEL GPIOs
Message-Id: <172233127541.66997.11462154822766150179.b4-ty@collabora.com>
Date: Tue, 30 Jul 2024 11:21:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_022117_575389_8C7AA31E 
X-CRM114-Status: UNSURE (   8.99  )
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

On Fri, 31 May 2024 17:51:09 -0400, Nícolas F. R. A. Prado wrote:
> GPIOs 34 and 35 on MT8195 are of type MTK_PULL_PU_PD_RSEL_TYPE, meaning
> not only can they be configured as pull-up or pull-down, but the pull
> resistance can also be configured.
> 
> The current bias setting however doesn't specify a resistance value,
> resulting on the following errors:
> 
> [...]

Applied to v6.11-next/dts64, thanks!

[1/1] arm64: dts: mediatek: cherry: Specify pull resistance for RSEL GPIOs
      commit: d92fd0cc01b31d59a0e95f44e3f08921fd74fb87

Cheers,
Angelo



