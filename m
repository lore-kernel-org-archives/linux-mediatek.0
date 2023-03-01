Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93818C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 11:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lREMbbn7JcEPKACdoCJ/CSrNHHhpPjB/kUXJfEv2xs4=; b=e4q1Br+DfXtSoJfBR0nybgFWJS
	npSGBDpimvNQuFLgrKZFAA/hgJZ6lBTTrtBhDxm8eINKeCgadQlDg/3DqIM37E7f2M+0Zv3g4Eo2i
	YGBiyQtLtBEJkqI+QAghvIIdmvkgnIwGnzFKJze9oy0rdys7e0U/KjhE556vvY/xi6njA8IESH5l7
	O6v72NRbQ+CtJjOYlu9oW46yqhyfqebVbXkTNNUadR7dXP80lRbO5Jr0ZhVFDzCVMuY2HLmR9NZiI
	eGe/ee3lIVh4CFlt4Y6aNrUEMmkRV2vS+mQEi/2zDtuSqWWgtDQs2wMJEUKnMO61zn4M3EDBERlQh
	dg1Ggfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKMe-00FsTJ-Bq; Wed, 01 Mar 2023 11:11:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKMP-00FsOE-Vc; Wed, 01 Mar 2023 11:11:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C29E66020E6;
	Wed,  1 Mar 2023 11:10:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677669057;
	bh=4v4GBWA4PA/XVvMsfs2bisSUcSFmfwSDKbb1tUfLCw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CFi+J3Ny2k8aOsMdFamx53fnd+38XmZ4i38wb42qoBWltE515E1u/HmWWoSUR5/LR
	 AV0XI9VZuhLKrZoOo+pPZeX/9gBZQwC5QeM0OcOzh3npjBHYvrWWe5Ii+WDayYVvNg
	 lb4zZT0GlB6YjVEFlZ8W5H8ywnh7cpl6CCadK3ZrDfq+XkMgn+tevzwEpWOg2Ifrnv
	 osABDshFWDg7bo5vasvt0ighqc+hwcFFePegOwRPPymnPGrapuyNKB7KMZGsIHgH+o
	 fDLPlZuSsvCIKlQoaidqOs/CSQequ8dxSf3mfE6C1QbaTmLrj0so4dLPTx4PVlZmuF
	 2OVzKZx3P0LDQ==
Message-ID: <ab6d0e1a-996b-b17b-7573-9141640bf759@collabora.com>
Date: Wed, 1 Mar 2023 12:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: mt8195: add missing initialization
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230301110200.26177-1-trevor.wu@mediatek.com>
 <20230301110200.26177-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230301110200.26177-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_031102_178877_83309FA7 
X-CRM114-Status: GOOD (  11.94  )
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

Il 01/03/23 12:02, Trevor Wu ha scritto:
> In etdm dai driver, dai_etdm_parse_of() function is used to parse dts
> properties to get parameters. There are two for-loops which are
> sepearately for all etdm and etdm input only cases. In etdm in only
> loop, dai_id is not initialized, so it keeps the value intiliazed in
> another loop.
> 
> In the patch, add the missing initialization to fix the unexpected
> parsing problem.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


