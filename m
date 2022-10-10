Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A473C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dMq4kSugx33T113u4k+hE980or0rYLz2Fj9q4TIqmU=; b=o3jfRgrO5W0XZh+gUUvB9zQwBh
	+T56hMdKwihEZPJERmdSxZcnJihDcvEpOu4RlBxLvIE63+Iuy9CTn/YKo/z1ZfrCMGlbXy9XGOgV2
	QyhiI25xNOOeNnUJ4QMV5WF8LXQdejwzwLhZXwrNoDdi531k/wblOHbC9GVlSx9yCOOVtuat9RqdJ
	GWyjREyMsP/LkkkWKBuSM8kBaolyitKFcualVD/ldsU0cM/5L2mYk5ScRM1DD8CFNdkAoOD0VRA3X
	7fDW6cn2dHoUjqs4WrtZ6susLV59xPrBlmLCtqhft90s1XIBBUWTEtjIxf+UJ+YRNKgV1qOtjPbxG
	2K7cLX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnq0-00HVCH-Ju; Mon, 10 Oct 2022 08:08:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnpw-00HV8X-TS
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 08:08:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0ACA36601F8A;
	Mon, 10 Oct 2022 09:08:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665389307;
	bh=P6nhCoRjweIKc4fu9zRhMCufhOtLLw8r/9rd+wJojYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=daoejMEgofkQYSO/lxL0gxokoM7H2sso72dGfR8HiRb7tpF0TLpU2q+N8cyKrrV/v
	 /0Vc+bZ8qFzyTT6QE3WKDE51ji7rkyoKjpnx6A7JIVI1Y20URTBZz0do7y2BCqosFT
	 AKxm4/JiitZ16I/ui8Jq+FQ2t4x7xVjOluojkQJZ8+am3MMGRVpKCfhpmtpruXpsa2
	 NS2XIB2tMwo4aA3/Y3WvQyydBrEPX8L64AJH/VzCXqABiC1Utz77V8LjZvDSdd/H/v
	 Eh5Og+HH7rRz2oUD3qiA7Er/6YeV44feve/kFLIogyKT77g7yQ9jE4TLCVh/4JQGdb
	 wEGlPULXfPu0w==
Message-ID: <eccdb9ec-90d1-c24b-41e0-5230cf29b84a@collabora.com>
Date: Mon, 10 Oct 2022 10:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] clk: mediatek: clk-mt8195-topckgen: Fix error return code
 in clk_mt8195_topck_probe()
To: Yang Yingliang <yangyingliang@huawei.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: wenst@chromium.org, mturquette@baylibre.com, sboyd@kernel.org
References: <20221009025056.35311-1-yangyingliang@huawei.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221009025056.35311-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_010833_186245_4A859A1B 
X-CRM114-Status: UNSURE (   6.86  )
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

Il 09/10/22 04:50, Yang Yingliang ha scritto:
> If devm_clk_hw_register_mux() fails in clk_mt8195_topck_probe(), it should return
> error code.
> 
> Fixes: deeb2af77cf6 ("clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as generic mux")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



