Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7B4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AF1e64KhxXMRQVgrccgtG+08pM+DCYMb1gBB4ebj5iY=; b=PgrFJfAr/H0SDdfipF7Mr9a0xW
	SkgqHQlpTahwc8079dJf6N0Tu2AKbX5msEK5Rf92namj4qHH1LTecgc1YMbIqYxWaMd6TfPmFoxVV
	jaJZlDRTDNgMwi58B353lLdEiIduD1/un36tijukFJHGQAtyngb3CEl6aHOeAitbd3AFqxGCrRwIz
	xhISahaXQUyVYwrJhowU6FUvdBICxhi2iLhGQ5GDAIQ/OenKK9oI3ZvqlZEnMGv8awyFUATmqVB9M
	UMFxEbgCeyS5jaXCoSGW3TTMV1K5SjMVDv0mukjNxDzhhtlTOQUkXD7/EV4ME2fEmIpgVNcZRdiVX
	zSsBUg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqspB-0033yz-6M; Fri, 04 Nov 2022 09:17:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsp0-0033x5-MK; Fri, 04 Nov 2022 09:17:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E6B3F6602970;
	Fri,  4 Nov 2022 09:17:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667553425;
	bh=eB0KGbIiuhaa7Ejg+arm+EfX+jhy5PN6L0x3ItdjVX8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ik4RwhotjdGG94mOAf1bd9wepjsXZAdCqLaKbH0gUHcM1TgMlGjDE1LWaKNHlG5n2
	 Y9hpU2uAu5rMyCmqfnFlZSZbA9fc3ZdKtfDi/3S1ryvkyB726Ls/rlp9pVUGvygtAJ
	 B7GMkoPpOUAeMX3vXfefUh7s/K+clCNICX6B+i1FBrsMw7jEFiWOdGUucuBVI/5YYI
	 q4uQ/GZuclpYAEpiUgZlPpuetMvgcFqeoQGlhq2ntQyA5Y5GwTnLfSzozGCkuDHULP
	 5CVHed79j/GvDUq81c5j24LYQekL71Z7a0iwmPE/VBPqRjEdgdMHODzhq9qKFHnDuR
	 dNt/sox/a1/rA==
Message-ID: <e739b1e0-7c07-0604-25bd-dfc711599608@collabora.com>
Date: Fri, 4 Nov 2022 10:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RESEND PATCH v3] soc: mediatek: Introduce
 mediatek-regulator-coupler driver
Content-Language: en-US
To: matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 alyssa.rosenzweig@collabora.com, nfraprado@collabora.com,
 dmitry.osipenko@collabora.com
References: <20221006115816.66853-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006115816.66853-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_021706_891637_93C3554F 
X-CRM114-Status: GOOD (  10.77  )
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

Il 06/10/22 13:58, AngeloGioacchino Del Regno ha scritto:
> This driver currently deals with GPU-SRAM regulator coupling, ensuring
> that the SRAM voltage is always between a specific range of distance to
> the GPU voltage, depending on the SoC, necessary in order to achieve
> system stability across the full range of supported GPU frequencies.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
> 
> This driver was successfully tested for more than 3 months.
> GPU DVFS works correctly with no stability issues.
> 

Hey Matthias,

gentle ping for this one...

Cheers,
Angelo



