Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12501C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Di37GnfEz38LzvzUC6tMkPQp8Hc4nyU9Fai9/pDMt2o=; b=s4bKai12NmAivr
	alzhBqbUgbwndhn7mdLmn6crBSpUB1iQkXTAI98aktCFmLzFEVgpQFWh0y2mLDn99s0m0H06P12qj
	pccBD93YpJns5ls8uBbMlDz7IuUDhgF7yum8EuyaGUGyfwFK1TVOp1plbS9df/iYsJVsx1Ymcu7W8
	u+MHCJKBzmQeWlDEICxKUOjCuZ36ATxoqjGhy3F54ryAHBwxqtGaHMX3IWu3CGG4p5Ja6p1mxN4Uu
	UznlwtLNu9fGBVOABK/3QIPfOl9x/BI6imb5aVipB5TB3zwmL08c1tlK2FUA/xz9KSAqLuIK7rPeT
	GlJj4pJZJDJPeVJV8QGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noo2v-007TRA-Iu; Wed, 11 May 2022 15:14:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nontV-007POr-Jg; Wed, 11 May 2022 15:04:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E7E401F43201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652281491;
 bh=mxWYOQgLw0CZGqfrBC0Eg5W6UfeqjHZIz/sEb1ggWik=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Nxg/uwf/s7WPIv/mqp+jozD5PuYhmwbINGe5FRHRMxcP+KnVQNuJ3QzDTmviaDqqD
 qZx70JQLfTCc50DGrfLbfKAYRvjxUYlbI/SEE8s/nozlS5wO0O5+XNbQ4bA5SSOaTD
 Q9GQImxwPwHWPGK1b06syFI0xnwdQXv/oL3a6L5AGGKAyPDdHMxjpuzsPUuFB1R5T7
 6ZkaZILgBzQ87402zUxydp0SeXVMLNhpLaD8WGzlyZjtyT7dLyyEjUrCP1lHaGKvUB
 NJsDUCEe30J1S2UxJYlmIOA3sras6Q/yAMH8KN2O1vIqtBmzd9vc8x047FqS9Y50q4
 8j4pmm5l5Ktbg==
Message-ID: <20f078a8-f050-127f-b720-b5fc8c893c9c@collabora.com>
Date: Wed, 11 May 2022 17:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5, 4/5] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com
References: <1652236596-21648-1-git-send-email-xinlei.lee@mediatek.com>
 <1652236596-21648-5-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1652236596-21648-5-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_080454_020874_55C0B3AF 
X-CRM114-Status: UNSURE (   8.54  )
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

Il 11/05/22 04:36, xinlei.lee@mediatek.com ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> To comply with the panel sequence, hold the mipi signal to LP00 before the dcs cmds transmission,
> and pull the mipi signal high from LP00 to LP11 until the start of the dcs cmds transmission.
> The normal panel timing is :
> (1) pp1800 DC pull up
> (2) avdd & avee AC pull high
> (3) lcm_reset pull high -> pull low -> pull high
> (4) Pull MIPI signal high (LP11) -> initial code -> send video data(HS mode)
> The power-off sequence is reversed.
> If dsi is not in cmd mode, then dsi will pull the mipi signal high in the mtk_output_dsi_enable function.
> The delay in lane_ready func is the reaction time of dsi_rx after pulling up the mipi signal.
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
