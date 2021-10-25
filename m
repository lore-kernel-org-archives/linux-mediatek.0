Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E979C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 14:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7DD60E0B
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 14:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE7DD60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sOReNdVXnnZVlsv7kYnc3oQBmzsDDYk01EHYuEYJ/I=; b=xCu109v44tacBki47uSE/6Q4Zt
	Ez8DUZHGcBLX7LoY+EJAiyG3S+hLsgHEMlQf6nBfYbJJ55+RT/Xptyk+w9SEiK/HQzi7XbCYZ1rdp
	PBfZF9OYwq4TmM8P4ShnevQQufVwgfU3KlciE5tD7lEraN/Za045l/Ms1Ljj9xI3498cWONxQSu4A
	cpDWakPsVAZrdr4cHLgITe07RYIys8UNVssxnl7Upiet/wEKPF6gKH8ffHGoAPLezerMauzUxJ0SE
	6RCHn5/YQ6OtuUMoykEdq4zE625JJWmMM+vJpL2un0OlK3vTUxngIfun7YmW+N62rd6BcxvIDLT3H
	S/hrnBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf12M-00Gi3Q-8r; Mon, 25 Oct 2021 14:33:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf129-00GhzY-Dl; Mon, 25 Oct 2021 14:33:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5DB1C1F42EAA
Subject: Re: [PATCH v3 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
To: YC Hung <yc.hung@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, daniel.baluta@nxp.com, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com
References: <20211025105635.30625-1-yc.hung@mediatek.com>
 <20211025105635.30625-2-yc.hung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b11f6124-9c94-3c09-7f15-ce952b5f27bf@collabora.com>
Date: Mon, 25 Oct 2021 16:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025105635.30625-2-yc.hung@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_073305_646381_4191731D 
X-CRM114-Status: GOOD (  10.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 25/10/21 12:56, YC Hung ha scritto:
> Add adsp clock on/off support on mt8195 platform.
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/sof/mediatek/adsp_helper.h       |   2 +-
>   sound/soc/sof/mediatek/mt8195/Makefile     |   2 +-
>   sound/soc/sof/mediatek/mt8195/mt8195-clk.c | 163 +++++++++++++++++++++
>   sound/soc/sof/mediatek/mt8195/mt8195-clk.h |  28 ++++
>   sound/soc/sof/mediatek/mt8195/mt8195.c     |  22 ++-
>   5 files changed, 213 insertions(+), 4 deletions(-)
>   create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.c
>   create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.h
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
