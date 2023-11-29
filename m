Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27132C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzXYTw8ti62srIOmrkOPy4TF44Ec46DPvAFxZNydL/M=; b=l9HzB5C12FF8VE
	djHHvu/rAJjlx50VgGo6jr7y4KM85GfSUMfdPD7g9ERgylhAO4Ogtfzsq5HbnlWcXba2C+UygUlji
	nXy9VdoOfstwL3gJhtrVh9h0qUoiYiyJYrRsijlUeJOfjP7ZeAe4r1SB22B+93Dt78b6cZli0zE4c
	BHxyng4k6LvIDMhtfp/uW91mk5tbJULJi53+m8NSkuNmQoTsefdAiiAJEqAo5etDE5iXcxgBO27HF
	ihVpSp1zTUIgkRMd1ixF+rl17q6/zbOjYmpSgYaJC9w+k9TQwJ9WaD7DsP9c99R0blmqDifaxhEpm
	G1XNW5BVWwRmUPMm5Vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Kcv-008Sly-0s;
	Wed, 29 Nov 2023 13:29:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KcD-008SVv-2y;
	Wed, 29 Nov 2023 13:28:35 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A6DBB66072FC;
	Wed, 29 Nov 2023 13:28:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701264512;
	bh=zpfPELY7wglGVGim2aiQUgNevSQhwaMs8bxwBu3nImA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2GCaSf0HHb/WcEFbaGeF+PowDdvtzLDIjiEJXD602hcWNS9wavx0yKtppPCwz75A
	 sUKvF73EcfszuB34bUPOkeE+GhPYMhw5YolQpquersEUkYbMSMUfLGskKE+4uYGVxH
	 D6gkXwYLwuqtC/jTAyfkjhJ+vtk7ubF+JZ++06Vu6lGR5VvoLrE3AmtjLMvC4eAOkT
	 En9SaoStVVbNP1m6YHFsMwD5p6kpzDW/YiN+hQFHMVJswZ9T0CBfkO2SiWflvKFP8W
	 MVnSo6Zz3lnD02EqXOOq/V8bQR9t1wk3ATCh/eaSG4m6xfLrlepvNQqx6R86+w8tUU
	 33TfhEGhez0Ww==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 1/5] arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization
Date: Wed, 29 Nov 2023 14:27:38 +0100
Message-ID: <170126437823.153055.14524036820842918746.b4-ty@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025170832.78727-2-linux@fw-web.de>
References: <20231025170832.78727-1-linux@fw-web.de> <20231025170832.78727-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_052834_084952_2714DD8D 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, Eric Woudstra <ericwouds@gmail.com>, matthias.bgg@gmail.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 25 Oct 2023 19:08:28 +0200, Frank Wunderlich wrote:
> Eric reports errors on emmc with hs400 mode when booting linux on bpi-r3
> without uboot [1]. Booting with uboot does not show this because clocks
> seem to be initialized by uboot.
> 
> Fix this by adding assigned-clocks and assigned-clock-parents like it's
> done in uboot [2].
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization
      (no commit info)

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

