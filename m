Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89035C10DCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MLxwx/UqO6GfOpfyDq19fLpm9P8cnwPkmBiR6IBQGA=; b=xCu9ywwJh8lhW1K+fjeky973yu
	3FxI6qEwLHtBhpMt0USeSxAzOs7LQB77/RvMTP6eIsjIMyhQ9NAPp6tLDvruHXZLrID9V23bQFIWO
	GcfdjNTODWcc/C1tU1tbLPrGowQtH0NErS0uzvRH7TgfvbCnPF52lzxDEgGo8F/mQLDvRQ4Xtdg4L
	VZDDx2p7cSRg04wIAuuMN2p0zNV5bFqEtC/v9GZWNG/FAg2yBb9c0nOr7dXzHkAimZO/wJQfant3J
	gxTdOsqQi+pALAH+07nr5FeqvwU1t6jZr6QU5J4VXGVOLOJBS7qaiNBrLO0RtChzeKF5dX71fgUPN
	ANjSfWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9xf-004mJT-1N;
	Mon, 04 Dec 2023 14:30:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9xb-004mIc-1X;
	Mon, 04 Dec 2023 14:30:12 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C1AC966017A0;
	Mon,  4 Dec 2023 14:30:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701700210;
	bh=7jQDv+XsVYeliRgZOmOs/y/FeB21IThRZTlKgn3mYkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cC+jH2DF63vx0pce1B9b19079v3nc+IP2wSnxHXG/H/PifBHyBV5rr0CdkyG1Gm4O
	 QycvYR0LVzRKFjGHQo4DKQ7Ik9khuvaPkc5bsVND72ETX57GWeAvk1CMnafh72hnJx
	 WQpzcruJiLX2bfxSpviwxDbz92fBQhDB+kZuAlozceXVHcwIDnC5uWCU3U9n+p9JoA
	 ZIaVoWBwZnMHXQq1CyeoZZMyB0fqbxbD9DE4hndgnS3Lf3nvH4chXjy9DP+GLRI+Os
	 gZWCHWYSSUgv1aeIF4c1keIHm0/4iY4YQEGct491v8K6txjfzy+EgLWAWftysFHdse
	 zJJhUEvuXPGWA==
Message-ID: <1d4432c3-c929-4521-991d-22c92fc74a53@collabora.com>
Date: Mon, 4 Dec 2023 15:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: fix address warning for
 ADSP mailboxes
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, matthias.bgg@gmail.com
References: <20231204135533.21327-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204135533.21327-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_063011_647334_590026C8 
X-CRM114-Status: UNSURE (   6.39  )
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

Il 04/12/23 14:55, Eugen Hristev ha scritto:
> Fix warnings reported by dtbs_check :
> 
> arch/arm64/boot/dts/mediatek/mt8186.dtsi:1163.35-1168.5: Warning (simple_bus_reg):
>   /soc/mailbox@10686000: simple-bus unit address format error, expected "10686100"
> arch/arm64/boot/dts/mediatek/mt8186.dtsi:1170.35-1175.5: Warning (simple_bus_reg):
>   /soc/mailbox@10687000: simple-bus unit address format error, expected "10687100"
> 
> by having the right bus address as node name.
> 
> Fixes: 379cf0e639ae ("arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



