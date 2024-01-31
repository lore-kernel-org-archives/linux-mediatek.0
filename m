Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A8EC48285
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDTge4p0OLSp6ZFn4+SpLUlRCz1vLK0bK80iOljSiHQ=; b=g8nqCoDVJDWDGO97kURUvkunuo
	LZ7j6SvPQPBShhdsE5T7XY6GePFgFBQUVyYS5Znf0wO4+VR61MCOEv10Y302AVZY/lVtMLegM0b0W
	l4QNtr9balAd4oteVERc4mHh2lzWV13APziIX6IftA58s49P/D+NmXO8gt+/1yjSIaOcHhDEzVgdE
	x9AKRjSd+C1RxNFgtwO/B+CScMcZMXVd74wcLWDofrZ/rqMQWwKOuVLAvWbc8dIc4ub9hee0b0Snq
	giyjHyVBrgd7tnOvPhXWU3vWnFUVg1DRiEKTPTrBomzGZyMS0pyxC3G/n4+BweuSwLbVFSV4KcrfX
	IRyLQpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV875-00000002rkY-2WLM;
	Wed, 31 Jan 2024 10:46:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV67U-00000002AH1-40tB;
	Wed, 31 Jan 2024 08:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8EAC8CE1E29;
	Wed, 31 Jan 2024 08:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7930C433F1;
	Wed, 31 Jan 2024 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706690333;
	bh=x0tRelhk7NT8O3HekjXxZew7WO8DsjClDug4eSypwg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IqI3eTcSS3u8krmwIFMQifrLSop0nr3gnpfsa7xh9ibKgcbslk7GFvWvQuF9k7O1s
	 MmzuH1IZ7sVwVcVS9UG/HAoL7w4UGou5jqhO2idvOK5BrjzK78kM/LKoodzn2NUhGw
	 8EoNWhHbhbzhfPr1/nax0whRRJYlnk4PccUkHYk6IryIlmV/L7qth9r6qCiSlQ0z+T
	 JXx/uABnox/9BeRC7RFxFRspvQD7eDFyuPUfK3Nxhc+sVJcbNC8tzMnj3KPZING1Xl
	 sSx4whYGpALtb8FlfLHK9MuWaszoIxMSTKbuMOR19Z4OPczjzxUXvX7IAFxQ21mwko
	 sXaJcpXRcylJw==
Message-ID: <a331e135-857a-49d2-8644-e8dd0255f372@kernel.org>
Date: Wed, 31 Jan 2024 09:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add MTU3 nodes and
 correctly describe USB
Content-Language: en-US
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, kernel@collabora.com
References: <20240115084336.938426-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
In-Reply-To: <20240115084336.938426-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_003857_212428_868C0258 
X-CRM114-Status: UNSURE (   7.15  )
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

On Mon, 15 Jan 2024 09:43:36 +0100, AngeloGioacchino Del Regno wrote:
 > The MT8195 SoC has four USB controllers: only one is a direct path to
 > a XHCI controller, while the other three (0, 2 and 3) are behind the
 > MTU3 DRD controller instead!
 >
 > Add the missing MTU3 nodes, default disabled, for controllers 0, 2 and
 > 3 and move the related XHCI nodes to be children of their MTU3 DRD to
 > correctly describe the SoC.
 >
 > [...]

Applied, thanks!

[1/1] arm64: dts: mediatek: mt8195: Add MTU3 nodes and correctly describe USB
       commit: d464e09e60f024aea0de7adb680a8e8582ab8df8


