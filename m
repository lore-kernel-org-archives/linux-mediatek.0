Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA399C10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 09:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XIm3l1xwbX2zt99nKzw8Aeonu491LzVXfpgjoinZHE=; b=eAU3fQ4QGIX5iOx3bh44h2rt00
	ziMpIw30+i1MWyaUyJM7iS6Q5i+hNlKFt8usbyy3WCr9s0KGQVJnJ/gLVzB9qhgLFWClZlxODAKEA
	YHiPLFIwnRATN9go1wvY2ifBtZ17lg/3y/P/Xqv/vGU1hrnZ+3Apf/FuvY+9qZK1Y2XJSD/2oY9Mp
	5wGVTlHrPfe7l4LL/VN9VafmLdSNiGO89mZZ1yYNvW8DHIqJ2xrFDa3APj6m5q33I4I5P5WnOlX/6
	7ocUFeTJKfzLB9YIQvC0b7pEXbOIIycer7HMT66PtnNNhDkRmBwcsumO9U/uP0BYbHTMwqQuUnzi2
	1L/nQoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4zqB-00000000we8-1Z0r;
	Thu, 09 May 2024 09:13:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4zq7-00000000wcV-2ojg;
	Thu, 09 May 2024 09:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715245999;
	bh=NKeC3HSPrcO8YGQah7jVicYXn1UrXm0HIq2+GZU4qb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aRvGTQiF85dxBDSN9fPkXOnIxpElVdaX7KpVKTj40xDidst6eL2eqnswdPhgJUiFi
	 PNHR0gTmZBcx31tDijXxnLOSw7ShYMkm9O3lueWNdiBa42INll3QIiVMVa+pbslzcj
	 lp3jANfu7BxQkq9jikVQu/8ihHTpPRRmK7Knk5vdP+dwkgS+OdCYp4QMbvK4F37N1M
	 YCuQXPG8fYfibrlQv8v+Xd436g7BncoUBCmFLit4wT+dp+AyFxs+rxkagPyXKblmn8
	 /aRagpfQ1G41xvOQF7+IRZMhna8WD2FqCG0y1kozJb/mMKjCwgHcVAAI6J41g7HV6J
	 Cd51XjsIAPtKA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2B0C33780894;
	Thu,  9 May 2024 09:13:19 +0000 (UTC)
Message-ID: <f0548f88-fe81-4c07-9583-ef1a1c5ae519@collabora.com>
Date: Thu, 9 May 2024 11:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8192: fix register configuration for
 tdm
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_021323_899955_3B2384AB 
X-CRM114-Status: UNSURE (   7.48  )
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

Il 09/05/24 09:31, Hsin-Te Yuan ha scritto:
> For DSP_A, data is a BCK cycle behind LRCK trigger edge. For DSP_B, this
> delay doesn't exist. Fix the delay configuration to match the standard.
> 
> Fixes: 52fcd65414abfc ("ASoC: mediatek: mt8192: support tdm in platform driver")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


