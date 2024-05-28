Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C37C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWrFu4Osw6M/siTxII1uvgMfV5iX70ztvecpKlQBE3k=; b=ZEw96gksA/0T4DFerejBSn2Lue
	htqTXEYJ6UPytceszTGKHrRynLAvNE+QYFPJxyc//keQPPswTaN2CujDHR6W3oETnMTWKsS/dQlP2
	ojEfZKkMriD0iU4Hm4ZMhKbI9gslCe6EeRPZ3cD7Apnr6r9oO4BHbRs4rFnURt5SKfIyAb0Afy9wI
	BPDW3+eM/zUKsOIgiDK8I3IUQrZrt5Gb0vcP8c96yU2DpTh9Sw2QmPZcHdfHM7Gfnr8pk94eAM1mg
	UJCBsY5H9Uptm6j3e6Ih2PO0PEP+FHFZsoWNbytOyatSFbnlps5xCyl3VqMozOodynJO8sxBrOw1Z
	g5Q19Xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuGI-00000000Flg-0IyB;
	Tue, 28 May 2024 10:40:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuGE-00000000Fl4-11M6;
	Tue, 28 May 2024 10:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716892852;
	bh=1d292TV1UZbC0yrIP5lgIjFD5KX9pGs+tLaH9de1QPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZibhVsIM0j6+d8yRGB4i00nDw2ZXCwWnVLzOMnf3FgTDEPhfnkFaeQ9NnP8x0E7wJ
	 RGxh9+DG3YD1Lv2WgKopodGETHAhZFXJMLmMltZkwGbCMV1J9NI6o26c5kyaRNzuf3
	 ZZNJbpw0lI9lcoMIofYzRj94RWj1VvWAy0WdEfMo6Qnoqg0uXs69WO+Nng+bQpvFP+
	 Ly2rjb3IphffDl87hp4xMAERLbOuNRRFtD58AFwmweDE11OvozK12wKm1nXVv1WqU7
	 rV+5VW16jHIuPtsMxh7uLHr4lvBawupE4Qse+EgI4N6c1WZHjn5hM6ajjWjNmU7JH9
	 RugBuIt+iF4fA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2F9E83782113;
	Tue, 28 May 2024 10:40:52 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Pin-yen Lin <treapking@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us for pp3300_mipibrdg
Date: Tue, 28 May 2024 12:40:36 +0200
Message-ID: <171689282917.117648.357380073276142240.b4-ty@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240502154455.3427793-1-treapking@chromium.org>
References: <20240502154455.3427793-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_034054_458866_9E08FAFD 
X-CRM114-Status: GOOD (  11.66  )
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

On Thu, 02 May 2024 23:39:51 +0800, Pin-yen Lin wrote:
> Set off-on-delay-us to 500000 us for pp3300_mipibrdg to make sure it
> complies with the panel's unprepare delay (the time to power down
> completely) of the power sequence. Explicit configuration on the
> regulator node is required because mt8192-asurada uses the same power
> supply for the panel and the anx7625 DP bridge.
> 
> For example, the power sequence could be violated in this sequence:
> 1. Bridge on: panel goes off, but regulator doesn't turn off (refcount=1).
> 2. Bridge off: regulator turns off (refcount=0).
> 3. Bridge resume -> regulator turns on but the bridge driver doesn't
>    check the delay.
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us for pp3300_mipibrdg
      commit: 476d7adf84deb884e0f8f74417bf5249ab9a95b3

Cheers,
Angelo


