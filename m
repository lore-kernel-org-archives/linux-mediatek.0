Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D1CCF11E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpkN21TpqZv37kCFcuKaLI38ctxzDB7X8j2yVfhP+ng=; b=sQ7hVia0djxmp2F2txDCzXIDPW
	V4DPiEJ4Ho2qSs3sk/+yyzNKUNM9APClWm2fCwAvC8XRZvY1Ff5P7JFTKqbForAlBjYpP1xG1eKo2
	TK5kUCVvEdlW2l7gBa16WVtbjrd+5FETpdnkyLXubKP/lorjgnl0G/xxm4HbBvI3n1zJHiBf+U+Lx
	M+TE0S17fvGkf2GxfxXqipVtzPDgQGU2xbRFzXGYnKcs52MiHMILUFn50khXOy0w4DOZo87bV8PGQ
	T7V3hQOMlH6/sGrenAaSjn8KRZJIgN3c+8x5YWJQhvKlcBH2K+G2Tgm9DVh0HKdejLA6ucYL6HKTQ
	xIavDJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysTO-0000000CkPc-44ia;
	Thu, 10 Oct 2024 12:40:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sys7k-0000000Cgig-1t2y;
	Thu, 10 Oct 2024 12:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728562710;
	bh=7mVO+Q2NM9BxO0G+EAB/pC5UV/aXW0JAPRm6LLt+jx4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qTsGLx+opuXFKj12eQzsHTxyIP/LLgguivGFKkljRYfcyxWwI5bPbNOBwoxYeRSD4
	 2u6yHV/MV3hYCVkwNMZKKptu8m4G4GECdGHK6OxandnKl78maabQmsR4fTzalhvf1d
	 2lwsp1aAGS9A9J9FTzg9Gtf/kuosiFgKLpG0YNaxRrWBTini2UIVWbJqEVTsKMG+5/
	 y2l2DAFRzCp4nTXgO+ZBRtyYck3PYNhkUnIZDCnoyLovURRtDuQEiMRk8QFuGgAoIT
	 CPE7SKv7AiJr6Cy7q2VRHQzXI+Poj01ot7B+5GtqOodR6c2TbWcElv4xnfwiUmf3g9
	 u1KXVaTauprzw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E92117E35D9;
	Thu, 10 Oct 2024 14:18:30 +0200 (CEST)
Message-ID: <c18f8d23-ac54-4660-adce-0e8f7ab53fba@collabora.com>
Date: Thu, 10 Oct 2024 14:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mmc: mtk-sd: Add two settings in platdata
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241009120203.14913-1-andy-ld.lu@mediatek.com>
 <20241009120203.14913-3-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009120203.14913-3-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_051832_690275_E13A782D 
X-CRM114-Status: GOOD (  10.69  )
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

Il 09/10/24 14:01, Andy-ld Lu ha scritto:
> There are modified register settings for STOP_DLY_SEL and POP_EN_CNT,
> with two new fields added to the compatibility structure to reflect
> the modifications.
> 
> For legacy SoCs, also add the original value of 'stop_dly_sel' to the
> platdata, for unified code setting.
> 

mmc: mtk-sd: Add stop_dly_sel and pop_en_cnt to platform data

that's a better title; then, in the commit description, you should describe
why stop_dly_sel/pop_en_cnt is overridden (so, why some SoCs need a different
value for those registers).

Also, this commit should come *before* adding support for MT8196: you first
add the two settings in platdata explaining that this is also done in
preparation for adding support for the SD/MMC controller found in MT8196,
then you add the acutal MT8196 support.

For this commit, anyway, the code itself looks good.

Cheers,
Angelo



