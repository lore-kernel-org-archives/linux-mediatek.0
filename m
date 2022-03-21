Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dr2pgMy4q/1g+j1ktSOgCpUrC5/t1RSz9lPegGakDq4=; b=nxZq0VZ21Ky/Z9
	zdK3322Mzr0uHw2qRf/gk17qxzLJKqjCyc3DFRR3yraxQSDozqZkifAagFSl1QegxbUmNXz52ENvQ
	Isn2hKIY65Z6Ozn3aAuWKenL/6ufO5Zqk9bDgRp9aZV+LN8gWLsn3U4rTi2nyYf9dHv1Ad+GsakrQ
	pOCrCVqq8w4tfdIi7UPxJrdak3p8YIJYK/OIyBMb40PswGxg7iOF+U1t+zLyqupl2AiMy/tbVIyiP
	Y+z7f2GC4j+vtu8CRmnIvZV7cKOX+TU8294etrbeP41JwqXa9x8KZxySn334+afPyqAErMxJwvjkW
	rtuJ0ZsgfefT5iUxFoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGmM-007aAX-Q9; Mon, 21 Mar 2022 12:04:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGlp-007Ztk-Gd; Mon, 21 Mar 2022 12:04:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CE1361F42BDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647864252;
 bh=WbFzhlbNau/l00k2LRhQPa7MQnCfmYTQC+k5zFwh3WQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GQZUMmB49+tfChFQRdydbY3ytMIMzjIoWX0HvG3oCV6BHoE/cSf+lM3lr8lqK+YMN
 OutUpC0/NJby/DhsLru2H70dNKBVXx1npTprjCDhQ0ieItuGZapyefnPi7PdFG9nhI
 98dPI6cvm9cnY+39MpNPUFd9sL2cR54Tw+SkJt5GLXbPdPs9qVdt3F6cPZ+R5eqt4+
 q5h3Dah6JGc7kv+tPQUtYhK8xSRe6tr3WK9txWVDK3bC8HwxHlHtC0PVYc4qRg87py
 vNKQM1y2klYMBSsVJvb+HSWF5FTb2mnm6iED2Wembc1FJAJZOG/E8oE9z5w53/l3cE
 ACOitAZDpyjdQ==
Message-ID: <d4635ac8-5510-844b-caa9-19c1786a5605@collabora.com>
Date: Mon, 21 Mar 2022 13:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 20/22] arm64: dts: mt8192: Add dsi node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-21-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-21-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050421_711559_E07E820E 
X-CRM114-Status: UNSURE (   8.96  )
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

Il 18/03/22 15:45, Allen-KH Cheng ha scritto:
> Add dsi ndoe for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
