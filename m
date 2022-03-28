Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC49C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dK69BAbkKq+Ir8wrrM4lDGZqviaIQNuEPGLReXEDco=; b=M8NRDiJRBwp5Bx
	F62yrcPPOk3/KFFZ8Pk9vR9Yo/mASTBolrhSR81705hGNnuVaCjZ23h9FmAUA/aApBMUZZYw3G2a2
	dNkGXoK33ECh/L+Xee5XXZmeI8lvmFkt2Hw13xok0yorpxD+DQQqlgcfSWWB4JfhT1e2Nbj5b2rKo
	qs96b9xqepdnBzJiPK3hEwU9gDa4niXIEm6iV8sqDX8qtcw9lZwG79pQtJwH/E+3izcGao3kdKefm
	uV1fsWwGR32cuFMiWhfeP+m/bKtKLCPOY4KBV1aEe2A40OQWetmfvZBlXF4U2FTc9y42orU7H5pcb
	4y1s7wr/+YfKUK7zJMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkcW-007o1Y-J2; Mon, 28 Mar 2022 08:21:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkcC-007ns0-Sf; Mon, 28 Mar 2022 08:20:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 099651F430ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648455639;
 bh=HQeSR6lP1YVK1RO4bOxyH8L1tAiJpL08/BP+E0788Es=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PchX6yCNagZcmv/cIZIJ4xoFUc5KY5QbCuiRR37jrEqmzRqggK6rBEy4U6IALH/Cg
 nQg75bZpIBDhgWjVhrP+dt09LT6d6Y+7F5X7tlYzN02PalZ9AFWx3lHqu4f6M5QbBT
 qClRr8DTC6Se8DsJ7eAj7SamzrDrebtzkYD+T6kHkqTosplCkMTRDkFjsKCpAdbmb8
 dinN0voPiVoekx70EL0nQMLnt8k70i3vxr1GMYoTN4yLlavuNKnyxZX8tmR8HtYVBW
 2pgMlThJOvOVn7YLTrd6X0SxA/B9wz51KXngl1+M4b8KPkM/UHAXRXPt/DMyptTYRQ
 MhQGu8sTxltIg==
Message-ID: <9aade139-2e69-a061-de69-ab60ccc666bf@collabora.com>
Date: Mon, 28 Mar 2022 10:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 12/22] drm/mediatek: dpi: move swap_shift to SoC config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-13-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327223927.20848-13-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_012041_093009_34C3F2CF 
X-CRM114-Status: UNSURE (   4.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
> Add flexibility by moving the swap shift value to SoC specific config
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
