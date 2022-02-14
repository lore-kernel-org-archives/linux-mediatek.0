Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63178C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUA/1iiOtVrUPZEfdELsPS4y/XsdmDeyll8mBM1YCh0=; b=HEw8ipQsxBeRce
	AkGzfpYco77PLYemSdJ+S4RD/TVCQP3ZGQSD4Fk7Rtslxtvwho0/bgTaPT9UFdjQz6x/QiWllh8Q1
	H8M0chNJSbeASuPKayyrM7mZCMa1lRa9bIvqjIcWvMgHRQqr13OXz4qHwYIirwUvQVVHqDOco7S/J
	wrchznYUnDNpxPOBBVgAfcKdr7fnXeI+ShJ28RXh+YQijIckPzLY6WmM4s7tLVez2Kww8KrxdIZxD
	SlO/NZ91eqcAq3kjeaRK+pxJv8Pm1e6TwZruJmHwq/zCZoi3ntPpJmokOEBemlDh1xkqQovSJ7nna
	DbK7O+VO0QDqwLkueBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJaL9-00F5rG-IB; Mon, 14 Feb 2022 12:20:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJZV5-00EoBN-Qh; Mon, 14 Feb 2022 11:26:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0278C1F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644837993;
 bh=t/N665+WR5R/ceAfV5H1Q99rJzuoHYq//Yss6JdQBYw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U+Hv/s7dC/VlWPmUuJ6aTeD8OzAff/2f2nhgBbLNqCclgaaxF0wYJTNwYb9BUOrST
 39XzbaDCutqyM6AimY+ADpVo8KI1scrwB1DWPqoOJLEd02JwXuLMeOtQTd0hPqJ1FR
 5wIp1TzMBFdJsIbiPwFDOeSc2oPLJ7sYatJkX7/OOmD1y+O9VX+mP22rs4hEcK37p8
 pDiy5LO8tagy68r8x9gIci65rdFqf6byt59VEPZwR03CygyKe85lwJ7eI6k3tnngnr
 ip1WilSJaxsSqZe0E6TVtx7EMj5/CUHn600JfoYYYr4CEgmWldO0ONC5aEjdJS5odG
 gIb2a20EpHA8g==
Message-ID: <8725a111-0ee2-8935-86b5-01c61774a628@collabora.com>
Date: Mon, 14 Feb 2022 12:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Content-Language: en-US
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_032636_051746_11411210 
X-CRM114-Status: GOOD (  10.58  )
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

Il 18/01/22 14:33, AngeloGioacchino Del Regno ha scritto:
> Since depending on the SoC or specific bus functionality some clocks
> may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> but, by migrating to clk-bulk, we are able to remove the custom functions
> mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> APIs usage, hence (lightly) decreasing kernel footprint.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 127 +++++++++++++-------------------
>   1 file changed, 51 insertions(+), 76 deletions(-)
> 

Hello,
this is a friendly ping to request review on this patch as to avoid forgetting it.

Adding context, I have tested this patch on multiple (older/newer) MediaTek
platforms.

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
