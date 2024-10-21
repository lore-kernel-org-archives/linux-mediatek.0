Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D393CD15D93
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7FxDzIWScZ9bU3W29Z+/V0TKPmtnN8/EJhiIx4y+6M=; b=h44OqfbZ8YJEMDimP6g0LxHo9o
	fcNjrHan8tuM8cv3pWorD5dZvLp8nHnej++iHux8edoRr+yixJ7vcJakho6+2CBvJ8IO+bT9J5SHG
	YvLKZXICBZeHF0DWNHRO6bWnCJIlKO6T6vn3nxyZquspTKa01kVnUJjoWnBJEypTtZsGdBKKbsZRy
	pGlnEdIsWTPU049skDKZRhRWnKyPm53UYMg6DDZmASvT3fsz9aigSlaDEwDKWgx02fc7aI8Qwv+Hb
	CutHFvT+ObYwgWjXI1llmjSvqn9EP3TWeMCjKxIQXIY10UruZh+EOfl3wlJNN09nJPCLPX4llhRRg
	E5I7kFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2si3-00000007TJ1-3d5a;
	Mon, 21 Oct 2024 13:44:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sPl-00000007PdB-3jcS;
	Mon, 21 Oct 2024 13:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729517140;
	bh=uYWC/DG5xTZcjFW/SXNzk+0WkPCWF8jfgMFknvCWaL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UbKTYOdejnTHi/frnF0rQvi0lsfZVRhD/G2+Xt04xboSHKvtlP1cL2d6LgF5uRt9V
	 3MDeCJqbt8cjehzRpvNTxuS/tuwutHx0W0wQH5+SbDHUsSzn2MRd9F9Z6INBFbMxKh
	 8ePXfFXDgq/aQIbCOiQRxl90Us+pClWLRVx/1R3VS5yKstpdmqc18jsHQric7uQgPZ
	 tRbH9yY2y1M43G6kAe75kbCNxWYmBV95rAP/yMKfpCYJ/IUAK1UxHTtsSlO51U2EWp
	 e+xGPTfm0AAX/CTE2P2p+OZkms5lLrctjUSj8RclEKC9Hf6Oz8Gp3oWc5tWy2hD00C
	 v83s+ZuqUvP0A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B59F17E3618;
	Mon, 21 Oct 2024 15:25:39 +0200 (CEST)
Message-ID: <9aa9a99a-4518-40a6-9556-7de1d0669327@collabora.com>
Date: Mon, 21 Oct 2024 15:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: mfd: mediatek: mt6397: Add bindings for
 MT6328
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018081050.23592-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_062542_135246_F5E5E7A2 
X-CRM114-Status: UNSURE (   6.75  )
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

Il 18/10/24 10:10, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add compatible strings for the MT6328 PMIC.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


