Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F474C021B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ym8J5YeB/cx8XpyueGVGaKEAT64ttbdOlL9OEe3dmkE=; b=fhpsWi1aKWR/YT5aGmIE+6PDdF
	8txbmXB5NsGoiFlIH7AjYoqcEUYDZX0BKuwqd32wAGv6ZMGgRxCEnb7fHEdhWpDDcv4KaiHMiJAa7
	Du0BOtwxuRfQ0hevRIeTQ+w1Aht7HJvrw32r2j3zq3SYzXDOhLI4t+N4kghgySIqJ8vNXeZgaHQLp
	lk4huIi9HoNkyWxTxqn+MlsyK6bYjirIx/6tA7aL5syu/i4iIGezpVlEChT/ApxBnLatoCR28VEAE
	rHV4bm6Q4XV4PV4pUbe8Q62NXfOKIyvaAcVGP/HcV/wkYkjC8AtBp/XcWi0kcLx5cYEJ71MJpB9Ld
	i46dxqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyL-00000000Hol-0EYb;
	Tue, 25 Feb 2025 16:39:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvbM-0000000HTP8-1Wfi;
	Tue, 25 Feb 2025 14:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740492478;
	bh=OV9F9KqPwKQyiJmD+vFaweQLR+YT46dDjh77TsIN4zI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hMt8TiqyYmncuyjgIQjcxwYxCWnpKDcC+iLbY8xREGK5ksBPnGIm9BBUtn2GPh/h6
	 0dmf4eY6wieIZR6Hx/0SzGeH7azbu8lD7hL+usIe8VMCY5LiJ809XHyBTENCNLI7Uh
	 Gv7md7aiNzD7uehvg3K0stqu+uxr7IUTnmVDsPY+0AljivHEh7RyeB970XmngeYHbl
	 aMRT3w3hT4uIQMQIiZgqAzbApIybx71eU8gBOvCHf+/cqVZUzqq091+64BsYEL6tVl
	 2Esi2q/LastZwWcoqcL2gxAegAHK+y4W/OhSXPUP/4jkKQzKduse5/nTcs4HoTfKaE
	 sqSbJasRTvWWg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16CF617E087E;
	Tue, 25 Feb 2025 15:07:58 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, pablo.sun@mediatek.com
In-Reply-To: <20250213112008.56394-1-angelogioacchino.delregno@collabora.com>
References: <20250213112008.56394-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/3] MediaTek MT8195/MT8395 Display Controller Graph
Message-Id: <174049247800.77227.18410008304398234380.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 15:07:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_060800_553651_87A0917A 
X-CRM114-Status: UNSURE (   8.07  )
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

On Thu, 13 Feb 2025 12:20:05 +0100, AngeloGioacchino Del Regno wrote:
> This series adds a full OF Graph for the Display Controller in the
> MT8195 dtsi, and configures the MT8195 Cherry devices to use it.
> 
> This was mainly done to allow different display controller paths
> for the Radxa NIO 12L board (compared to Chromebooks), and this
> series contains a preconfiguration for the DSI0 pipeline.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8195: Add base display controller graph
      commit: f49708b18c7d5f3720499141eed326697afec3a9
[2/3] arm64: mediatek: mt8195-cherry: Add graph for eDP and DP displays
      commit: 44d18b4497b335b0e9044dbebd2a2371363a0d77
[3/3] arm64: dts: mediatek: mt8395-nio-12l: Preconfigure DSI0 pipeline
      commit: eb5a199a44f866d5de707f11d579b6517c060185

Cheers,
Angelo



