Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5342DCEACEF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 12:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giKe3hsqYQs+P5a1qPwMOEHn/DCpeC8WJXyZSlfEoAI=; b=4DIz6uoKM8N9f+QD2NZsOIoyEd
	GJaSblbHta+dDCMdNlvps2R7OzS0XPfpNJuRapC4n+uGaTDOiM6r3w814+KexTZBiley+xA3TPezm
	91+/N+zXuB+z6PeDCavnSGooRzvawvKQBmh7sPaHRh08ZbMkNi+PbmlSMPONNpvhToalgaJGoTyzO
	4v9wr6Ir43oboO/oxto1Bx7fmyNtEyOetMBk+xR4EDG7+s+PgumrdgnHvKuH3Cu3ijkGoX+W9Lh+y
	ZZ8lxeFjO7X/y6dXz2yo+jh4t080wNE8RbBCQ5hlAoDx5ttenSVGX+7W0F933svMK3gRudzwHiptZ
	qinGfX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyVO-0000000G5ZE-0DPl;
	Mon, 17 Nov 2025 12:38:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyVL-0000000G5Xk-0rkW;
	Mon, 17 Nov 2025 12:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763383123;
	bh=n+whlhVXGNmROQDHpFtUuk6MoZNagUCrrAscIOv6pMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lQ05Haa58fPVLNVCR1XlSb8ov0bHY6rJxrvBg/wn4n+wcriVuIiExdEWtT2WUG1jl
	 dg4bug40KDpd6wp0hoFqE7d33SgxVd9GaFIxlcfIeAWmAZ5GWgmhLCVCP15NRDdtdR
	 Hl1FVirpj8eGOk5TfWm9kvRjK1ihWmEb7c7K+TsMVI0+tKXDHTI6+Zry+cjxiOUAQQ
	 4dguhNic9duRUhLoUtWVDWeD1uFYFn3ZpQgJSI0kiqvgBm8fhCF75SvDrxhuJNqLQn
	 TGzvhhNrF/TLH9VkLQbUZjVZ7o5i0HnRA1DgpIHVtLy3GcjJTuxSKbzqxvYfTokLq2
	 obgvmBaWKvUGQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D78FA17E1249;
	Mon, 17 Nov 2025 13:38:42 +0100 (CET)
Message-ID: <f63c1702-e847-4c45-bf9a-a4985baff1b7@collabora.com>
Date: Mon, 17 Nov 2025 13:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] soc: mediatek: mtk-dvfsrc: Get and Enable DVFSRC
 clock
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-9-b956d4631468@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251114-mt8196-dvfsrc-v1-9-b956d4631468@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043847_399883_44958B92 
X-CRM114-Status: UNSURE (   7.62  )
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

Il 14/11/25 17:54, Nicolas Frattaroli ha scritto:
> The DVFSRC has a clock on all platforms.
> 
> Get and enable it in the probe function, so that Linux's common clock
> framework knows we're a user of it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


