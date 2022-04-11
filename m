Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C2BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7Gft4FB8aRe/LOLsA2uMfpvmmFbEZ4yEzRqE0yH4MU=; b=fEv7VbLTKnKDif
	P+npSh7MFsEN4j+2Zrbwli7GcxWV4GDAUjPsK0v3ti4wY3VR/UNwAV7+EQ69eiq9SEe1UMy+lquGu
	NHbD4uP6MJ9fRvcCAEgP/5Z/qmW9v4cX8eIGkfM954NzrYMOWwsy5CCXcVINXkA2csw5tjyqlQICm
	leEDJKHzPHo7TXI9hRaiQXwPvl5ZhhxRNUyuG79apw44EKzjE2FyHSI8SO1YBuSOLeBWUwl7DKeSS
	VCXm23shoaOKJtM4/g+zJ43mu/Vwpld3Fj+GkHcbbpY1PmZ7C89hJMwZgb328nkErcSniBf4ZCkam
	o/oGUgrChSBH35PzIMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndq3w-007moi-Gx; Mon, 11 Apr 2022 09:10:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndq1I-007lU6-73; Mon, 11 Apr 2022 09:07:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E7FD11F4345E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649668054;
 bh=+Ie0DN6gHz0U0bleo45pyJxPZcXhCSbDfFBMIFKa1rQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N3NYyP4ztRH6tRcghLb6udo+lUXEmChUVRL6hoVaSpqGIjP2fe7QNKy8QcenXfgCc
 PpEX1a55kYNMQ1FW7838x9hZyqcpU1YuRa8m9tcOMDlrlXKX+PposdErthgLagmzUh
 QRYDWhutcSxxMwIcUtJKv59qWlR42j4Y9GRvxkVJwJYYUVINTCBb/dmFkpxQvmxlml
 KRtGp8Ri4H46AMqp/NSKuSfMP90FUhFE9FputYepCkwKKcNfqG4FV1asNo+qUcFTQ2
 yL6FMHKVEmCi7FW+2KrpRcKUU0hXn3tN28Hae1ywhfWWuxUyKcQR9ENBtV8raLUUVH
 0pFYaxkTo20sg==
Message-ID: <54c2b102-1506-cdda-51b6-39823d17134c@collabora.com>
Date: Mon, 11 Apr 2022 11:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4, 1/4] drm/mediatek: Adjust the timing of mipi signal
 from LP00 to LP11
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jitao.shi@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1649644308-8455-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020736_437755_FB45F711 
X-CRM114-Status: UNSURE (   7.33  )
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

Il 11/04/22 04:31, xinlei.lee@mediatek.com ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> Old sequence:
> 1. Pull the MIPI signal high
> 2. Delay & Dsi_reset
> 3. Set the dsi timing register
> 4. dsi clk & lanes leave ulp mode and enter hs mode
> 
> The sequence after patching is:
> 1. Set the dsi timing register
> 2. Pull the MIPI signal high
> 3. Delay & Dsi_reset
> 4. dsi clk & lanes leave ulp mode and enter hs mode
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
