Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D25EFB7EE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cif4Pgct/xDC/pti9irKW3PGugW/9kDs2kpCOx8RCI=; b=K0zuwL4bdw0H91inOwmG542g87
	MTyWPdgQ1sQjpv72/eiJzTbEIa94nDQWuO4p1z8QXyK176AANG6ZyVy5fl4kJxr2MzMzrKyRlBSQX
	aWdlUOeYkRJrouBMbUOr/ywolxblOEpzNixb5fMqVtAAJVgdD36fnYvsNrpUMbwFJQ5pNOUEhcTIQ
	2rLwTGQceOzMC31kWaCOaBpbMpTxj1U8I2L+EUm96xEL/qqIzSWZ78eXZdmUjYjuum3K4JRo54eNA
	sty/6+OkYUPRnUWI/Hm++wFMxXqnIWYLO09laA2rpcW2ltmi8cHNft8f8Djis9JP2xU0zHhtkhd5M
	MBl3S2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuonu-00000001lR9-1Xy2;
	Tue, 24 Feb 2026 09:34:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuonr-00000001lOk-1iTI;
	Tue, 24 Feb 2026 09:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771925639;
	bh=9ncs5mU4u1jLk/AIcyIcwPPF/FNGG6wfYNkqVGV9K5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YwrzvLGbc1gINNsXAPKfq5NHLPZS86gB0JaNk+kF02wQgIKLRGX98nDVeIo1xu3t5
	 CnakraZyBGv0GTUN14d5YdRDwbeRtrbjT/mHaCTtDtX74mVXhX9APCWJq87A6/cQsF
	 v9GgCuW7J1dZVxYut8d8LWU1BxoILorR9uFYiom1jNNXGS7Bx3j5MZXuMcfBNCrs/p
	 bRpPd8CaStfCiX9FPeOK+GvHKYAR4OHaf8fZrCcOFuX/fvZUIVg4IKGdDFEpSrPpy1
	 duWI1Tp7jfsRygdyykm6QmCkpknPm0/BxE2yvqbxUP3rmClJBkDAHOLnrRjpCPL4ES
	 7xt4SC/e48r/g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6164917E0948;
	Tue, 24 Feb 2026 10:33:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260224070306.2650182-1-wenst@chromium.org>
References: <20260224070306.2650182-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195-cherry: Disable xhci1
 completely
Message-Id: <177192563934.11826.13721655635235729947.b4-ty@collabora.com>
Date: Tue, 24 Feb 2026 10:33:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013403_649113_4A6D99F4 
X-CRM114-Status: UNSURE (   7.71  )
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

On Tue, 24 Feb 2026 15:03:05 +0800, Chen-Yu Tsai wrote:
> There is nothing connected to xhci1 in this design, nor in the actual
> end devices.
> 
> Disable xhci1. Keep the USB PHY enabled, as it is a shared PHY and used
> for pcie1.
> 
> 
> [...]

Applied to v7.0-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8195-cherry: Disable xhci1 completely
      commit: beb60276eb3a488d8154fc498ed11270bcfe979f

Cheers,
Angelo



