Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C21CF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 09:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WknRW8U33Qd/fq6fVG+V4iw1dPisRzYbd71HnbuBJ2U=; b=F9kL9Hdmwb1adwOopIrhtG8HYx
	40Q3aW27QoCLGXzxKMXsI4YvYzIX2Fdo2N5ZWP+1tHJrdOFgcWqKSNlG3M4OM5hXVo2nKRsdxCV3S
	EKHOf/foV5abpao7ljaZbUv7A5FFQQwYp0QVuonAlQ1pPqQT/hiAEAEPFEcl2Vmm2llbQe0XCGF3J
	DSEsm/sKuljBnsH40EbV6ekJSCnV09lfD2zGtBbIZOn2K54PbKq9/6ZN/c+mIL7fcK7GV+0tpN9k8
	YdQoA1IUcambgxF19UO4ts53rEt0qB20U861/WRnCUBQDEpFpbykZjAjiklCTvwWFAy5gxHH8BEnv
	eTi3ul+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCno-0000000GYDK-3jPW;
	Mon, 30 Sep 2024 09:34:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCfT-0000000GVlg-0LVE;
	Mon, 30 Sep 2024 09:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727688369;
	bh=idxgyuER2MHeqDbyn3N5PMcWgX/FiLELm2aeJU9EBOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N4eeI5bOKCU5YtmjZfhA0TICxGkvR2FWa6VsAl6iVd0B+CIQqlcFflHGuGD/PWltH
	 DSukScD7rTvlbprhvob8/95C3DiRpA6nB8Q/g38780TJzz0GYQt5uq36XQD2BY2Agr
	 nmlp/xE3A/H3hJTdYttt4Zq/RKfukynwP1hRJ9xia1vGAvoz4MjylQzMrHbhAZ36GF
	 b4GZJSpmvViGFtyGcRIDxnvUQLmsVsU2uXl10gdf6jZfSCChOsvEaUTtV6CINXxjne
	 Pg1giRMJCy/YiaOqluAPaPmhvdC/dqbTdmr7fUWNLqu3yQxRNFsYm6OFnv4JXkNt8E
	 Wvrjb+6Vv/T1A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA76817E1091;
	Mon, 30 Sep 2024 11:26:08 +0200 (CEST)
Message-ID: <9260a488-e386-4103-bdd0-04bdc2db8f0f@collabora.com>
Date: Mon, 30 Sep 2024 11:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt6359: fix dtbs_check error
 for audio-codec
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240930075451.14196-1-macpaul.lin@mediatek.com>
 <20240930075451.14196-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240930075451.14196-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_022611_377394_9524F9E6 
X-CRM114-Status: UNSURE (   8.80  )
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

Il 30/09/24 09:54, Macpaul Lin ha scritto:
> This change fixes these dtbs_check errors for audio-codec:
> 1. pmic: 'mt6359codec' does not match any of the regexes: 'pinctrl-[0-9]+'
>   - Replace device node name to generic 'audio-codec'
> 2. pmic: regulators: 'compatible' is a required property
>   - Add 'mediatek,mt6359-codec' to compatible.
> 
> Fixes: 3b7d143be4b7 ("arm64: dts: mt6359: add PMIC MT6359 related nodes")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



