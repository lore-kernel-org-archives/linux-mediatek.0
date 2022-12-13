Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD54C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIgtn9+tYmG+LdMaGT9ESy1fMVXnY0BFBIgNuQtGXxo=; b=GM7f5s6CHusNKTQTbrWR3UB7ew
	IGWCJ2flTFFhQvI1iyE8+ogu+tc7jAdlJMyyTc2bG9mhLkTB46Cuz4Al1fLjEdigLCUcmgegP7zHH
	V69I3h+H4Z+XC1s/evnSb9y7FND8sekis0n25f2DvxkjANGN2Kunrm6lTUW9e5r6IWi23fM8e8UO5
	pFxCPAEfPoE0iop8tTSVuvY0SEmtEaVJdnTEGi58JlqptXIEAZonxu5tttwU9/uNY6HjgY8eFeuUM
	Q5JxklLu8s0GPhga60TQMrvHwDknAD1/AnAfC4i21dRUFkDE4R353xov73c7dKEGTMPNSyrZYEepn
	2GFLlJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52o6-00FpnX-O5; Tue, 13 Dec 2022 10:46:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52mx-00FoEC-RJ; Tue, 13 Dec 2022 10:45:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E58FC6602C34;
	Tue, 13 Dec 2022 10:45:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670928327;
	bh=kPUu8IwRTuGJDrDeOx64y30lNL72eXvhm3FsQSMrbh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hd3HEzVn/gunEkf1MMI8W6WxOOQ1Cqh/bHSwa160E8osDabsDYUpWpia11qmeL+Yv
	 gRxJ2dvu8zEd3NQIQKrcV3DBOlPhcPFtgizxRQbic65Y4nqMgA6idqCYa0Cv/eSyXf
	 riopASQ+JvpHbFOT9aY21+9MtS41Kqynf5AJ5AtTaVCEy6Px7JAFpzc0VFwCVdNTMi
	 3KblawJwxQ01eMP3lPno0R+8wDJOhRxqfziiOCnNXjIYcCu3WRfuYYXiOrRqhYz5JG
	 9TJrwhWwschAZJ+nuxW6FA6iTwLRE9W6UW/aJSYm0XohwQ1MuXv+Xlr1jDqyZ1/PbW
	 VF1UWV4XEi3yg==
Message-ID: <4c26f044-de7d-26dd-65c0-7db484e4df49@collabora.com>
Date: Tue, 13 Dec 2022 11:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 03/12] ASoC: mediatek: mt8188: support audsys clock
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_024532_080607_1237B265 
X-CRM114-Status: UNSURE (   5.86  )
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

Il 08/12/22 04:31, Trevor Wu ha scritto:
> Add mt8188 audio cg clock control. Audio clock gates are registered to CCF
> for reference count and clock parent management.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



