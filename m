Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923FFD16261
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CscPck2GrhYI6HT+C7ZLDBkQrnO/GxuwGjlPO2Q7CMA=; b=eaz7F4qgFK02qfKwgH8FZXFXZ+
	7BIu7sIXZEfbNQHaxlFtdlhUACZuESGW2USUtcQ1Px9tQUCuErRxDLe043M9DUrOqABAempxnWae0
	mEbceGSODMTfnjMVuHty9nDpqKvj+CMImLftLTX+C7KILcKoFvKPi3qjBjYOsDqZz2D0oxVGkgL8C
	SH6TRKHVG851kt8m/BMjK3iB2K1AAOCrGAMlIcXy+cvRd/yHqMLrLxIMUSG91fhHrMN6GSFcfUAbG
	kN2tqzJ3hrm4+ak/sRqUwiY0ES0zYPT7NKgga7RnulMEnrem79KKsp6u5mT8P7jEguvYxh8FiUxkg
	zTcAX3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0L1K-00000005EnV-3xXu;
	Mon, 14 Oct 2024 13:21:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0J6z-00000004tis-2vXk;
	Mon, 14 Oct 2024 11:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728904780;
	bh=/fb6TY0+Ozh7vKmaHycGQhRR0AayQLHOM1cQjCfprq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EdjcBH3hIss5MqTd0Ls6YLDmV2CPEqo8bKyUO6p2VHeVEE8yKhs6pwtcBald0uv26
	 lxUhEGrsSSoV60b9V7tle9itNOmkdfffY+X8IMXPtHyfSjodqRtVHcAJ9olHc9wmns
	 qBfxsBBaxykZdyS2b+Bkh1t2wZlUGVm2X1Fw1mHKPMezfVVwXoElnzu+9Lk57VDP3y
	 UAR/9Dyf+ejk+xAl/eEfonw9dYkJKhH8Cicq0gbHphPIEc1jCAGoxOV313VRdx3TAX
	 9Px2qN30N38WqtZkP00a5wmyJlS9ZX/DRj5hprFCmsRyG+uZsMEivrHQnd4cTterbN
	 8KGXyOxqBXZoA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0B4817E1366;
	Mon, 14 Oct 2024 13:19:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fei Shao <fshao@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
Subject: Re: [PATCH v4 0/9] Add platform supports to MediaTek MT8188 SoC
 (part 2)
Message-Id: <172890477965.134864.8253638961403618415.b4-ty@collabora.com>
Date: Mon, 14 Oct 2024 13:19:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041941_923835_ABEBF69E 
X-CRM114-Status: UNSURE (   9.77  )
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

On Mon, 14 Oct 2024 19:09:22 +0800, Fei Shao wrote:
> I'm re-sending this v4 series to hotfix a bug in the patch that adds
> vdosys1 display nodes, as suggested in this [link].
> 
> Note that the previous [v3] series is in v6.12-next/dts64, so please
> drop that series and reapply this v4 instead.
> 
> Sorry for causing any inconvenience.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/9] arm64: dts: mediatek: mt8188: Assign GCE aliases
      commit: 45f57a28629ab6f37ca7c2920daf0eac90608e45
[2/9] arm64: dts: mediatek: mt8188: Add PCIe nodes
      commit: 355508880d41cfa5b0643515f27b6da490a1345e
[3/9] arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
      commit: 3147d168a516e4f6f7aebb25d2206f40d3168c85
[4/9] arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
      commit: 3ebe1aefa27e87b688f5bdd06713e01de3f19c12
[5/9] arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
      commit: 4d3a0bbca1b6d7d5c873f9b1ebe81be2f5301905
[6/9] arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
      commit: 7d3008158e9ccc45bec8f85b2393e279de1b2c93
[7/9] arm64: dts: mediatek: mt8188: Add display nodes for vdosys1
      commit: 6a6ebbeea64256d2b69ce660dc2a510714be537d
[8/9] arm64: dts: mediatek: mt8188: Add DP-INTF nodes
      commit: 42bf3bbd6237a816ef3d5d66c9734618838e81d3
[9/9] arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
      commit: 05c2e1902c73d6bbd93d77611b4495c587664029

Cheers,
Angelo



