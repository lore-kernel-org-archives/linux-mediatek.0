Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96926CEF15B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 11:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSqYi71o3tAxQgdeNX9B/aNiEcu0mr/lDNbfm7ETYks=; b=CvpyOdZACtjf+fwhj1TG8PS1R0
	slazfJPMM6rbeW+9O+WUXYG3pZF7fwOXqtuTGuxTRRgUzzHELGXrSzD0u4yR0oJhY8hZWOThhZfF9
	8eOO/D2ZZJvknubpKPNmO4dnE/o5yDGUBDYkjL1mYBMftlqgii61N8u6pyZ7+BunZByiWFPslhRNY
	IE7P0M41edex/RvMOHCOSUKdh6SLRqD200gVlUWMi9/jNeXhrmfGxRszkQoyL+El1CozYFXWFDuM7
	+VJTWfoD+fBeCVsvxjd5DGlSLHciAYgBSUZtkZK7rogIEHcQMJXvf7FhNGKcVtcTEcR44TlCik8Na
	poOIqU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy8rE-00000005irC-1AtQ;
	Tue, 08 Oct 2024 11:58:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy8lM-00000005hs9-32BI;
	Tue, 08 Oct 2024 11:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728388342;
	bh=yoZPUcstHvfFyrc/Sujr2G0j7hScF0BV7LuYHeSOp6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oPopWbj/MEK+6doEOmxxm5ZH2UaKXZQ7ffhrBoy/ujN1GBoyCmxpLmwKQesvSuanT
	 vMLQYyOM05bREuDMBJdpq58OaWtHXHdUt87rtTjA5lOpda+qm/g+8WhLFtzcBHpkvg
	 ECxwU4GB0mWAQv0VGcoRdAJaXgjwL4ZQVyg4h30DPeQwrJbvRHsPtk4BCkoX8xjouC
	 OLECTWKKuNOrEaIkvqAuiD3dPLnR/nAon1mqAbuK9oSLnfTWiuOvpXy6xZABE4qvsg
	 /Lm1OOOfe1ehIdgjVKmitwD+prMe/O4yo5+UovYFCUmkmbjsPdKDZpOkFos4a/8W9y
	 yMd2CkiQhybgw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4126417E13A2;
	Tue,  8 Oct 2024 13:52:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fei Shao <fshao@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241004081218.55962-1-fshao@chromium.org>
References: <20241004081218.55962-1-fshao@chromium.org>
Subject: Re: [PATCH v3 0/9] Add platform supports to MediaTek MT8188 SoC
 (part 2)
Message-Id: <172838834220.62767.15083532214738517740.b4-ty@collabora.com>
Date: Tue, 08 Oct 2024 13:52:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_045224_976256_FC7C930F 
X-CRM114-Status: GOOD (  10.27  )
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

On Fri, 04 Oct 2024 16:11:52 +0800, Fei Shao wrote:
> This series is based on top of my previous "Add platform supports to
> MediaTek MT8188 SoC" v3 series[*].
> 
> There's nothing to change or address in that series at the point of
> writing, so I decided not to resend it and start this new "part 2"
> series instead.
> (if I need to update both series next time I might consider merging them
> into one)
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/9] arm64: dts: mediatek: mt8188: Assign GCE aliases
      https://git.kernel.org/mediatek/c/3192a83f
[2/9] arm64: dts: mediatek: mt8188: Add PCIe nodes
      https://git.kernel.org/mediatek/c/ad5c0159
[3/9] arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
      https://git.kernel.org/mediatek/c/08a838d6
[4/9] arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
      https://git.kernel.org/mediatek/c/b04407fb
[5/9] arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
      https://git.kernel.org/mediatek/c/9e85e3cc
[6/9] arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
      https://git.kernel.org/mediatek/c/26170e14
[7/9] arm64: dts: mediatek: mt8188: Add display nodes for vdosys1
      https://git.kernel.org/mediatek/c/0a3bd16e
[8/9] arm64: dts: mediatek: mt8188: Add DP-INTF nodes
      https://git.kernel.org/mediatek/c/5a206e43
[9/9] arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
      https://git.kernel.org/mediatek/c/8f8d13c8

Cheers,
Angelo



