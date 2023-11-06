Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A764C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6wyhnHdEjvAU23KbV6i1d1TfuIJcn2kJFuF5dzoqlg=; b=kZ7NPuOCqXCreSwL+ldQk/LmV8
	x1vwf2kF6PpbUMR5IvOPHPf1Vfo6o/yvEeryDg6UJYltMqa8P47a+1i0Qh0creSVot5ZXkXBU9+1q
	yncC81NSBBjzweASKK/i+XaeTZ9f2hy4WYQzN6wkQe+GxhzuXKSZ1Na3XafOFEdiy9fBaAION8K02
	3i0YFMMT36LL9weqptnZKkqhqJasVY75rEv76v132Vhod8Qj1YbAij7Ec1bfytFVKBgz1y0ziSIDW
	K3TpMSe4rydB8fUJDc3Nbq7b/hO+ogWjZTMJR9XjTOUM1ZbfAPWdVlUvKPk4kXIlLH5V1QHPPPTs9
	b87KCEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyN-00Gf6b-0O;
	Mon, 06 Nov 2023 12:44:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyG-00GezV-0G;
	Mon, 06 Nov 2023 12:44:50 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 63FFC6607485;
	Mon,  6 Nov 2023 12:44:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274686;
	bh=CIeUGd0LZVqfdrlkMssjKRBQG+Er2jnDyZoNhGWFsQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fj0L6ja8qiQ+Ve9hoRuM9pzeo0nAsfc8hCEPPFYGIPWEOQqTBLR7Agxho2zFgXC9+
	 Cl8NaRbHJd7vml7OiBB5c1zqbS95MQwdwRTa4u8ZRvddmV5eEgHLOFbNe4g2qd+spM
	 eDaknaIEodX6D9H1u0JeJekmzRaKLI8rkWmd1VQzbteae+57IBXPEC76cCd+mIuTXA
	 3Pu9btZtRKnNpuXWtcMLlG9dAS9Y+zoTe7itb2VX84An7DUu/t8mMn40EvTpcdIPW7
	 0rg9aHmruSQ8VNfFz3CozZEN4HM0B66nhGsf/EHYMFMGcTCkod+vn9/izzkq2FgH/P
	 miKdiJNJd3DcA==
Message-ID: <c77c9d62-e7b2-4f54-ba1f-7d27e773da57@collabora.com>
Date: Mon, 6 Nov 2023 13:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/12] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-10-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-10-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044448_252753_C7C9DB90 
X-CRM114-Status: UNSURE (   5.39  )
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

Il 30/10/23 11:06, Moudy Ho ha scritto:
> Add MT8195 MDP3 basic configuration in file "mdp_cfg_data.c"
> and corresponding driver data.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


