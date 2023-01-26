Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B996C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzelvqUMcPmrSnyWpk0cvll2unRhH1hGqTkNb+uf3RI=; b=OTZJgL0pfcUSTtTdGIZkZKQsrG
	YmDAtf6zfejCINyPIybX8DY/aPKWVMRtPFmOaPHWVpe2gxKJ2pPCCbZpqCEgk7y6QVcNWLhlwoemn
	0OAZXAq+3Sxu/CQt0/Jc5dfSguaShpvGyMAMSGIZTgVP0vDmLOP6zwEnkZNnX4AWhs6KrFEU+a4ks
	JEoCVhxAgvnOs62MJ0LnSJBtsgEQFR6oo01x4EiyMy9fzFQBLqcKgeeB1XKMhwwliuHYVFWFpX6Ef
	kcTGzYTs4WQ2ABVGv+QvJOT+clPgICFv3bcrVbnfBA1ieDvPXPQby4rpCKQLXR3UxfzByyX3gXp7c
	rtAR2kWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKyAH-00ACgd-Np; Thu, 26 Jan 2023 09:03:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy3o-00A9Wv-Et; Thu, 26 Jan 2023 08:56:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 614616602D35;
	Thu, 26 Jan 2023 08:56:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674723403;
	bh=vWrEwXXnA+bh7FpREBlnFxIhMjPpoC7sXkVgldlRvJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fpn8QBJJEnlOmo8CO36EN5fEhgUr0xjwTAV6/zl68U637DRFXGhToQlfWY1HNgn2D
	 S/Q8wUbFtJTEyQXm8qv6TBarcaefVZ0bBTIPC+WaroQHk0H7ZVO7pwjcXOegVej8b8
	 Mu3uX5rzSmZCoez7nefFujuQ2/dz90e44VpRu2skFtUl1XgKlfh6jFBX24QGOZ89HD
	 SgbLCYdSsqGUSfi0buO5ol8KnLB98XwKMICMHVAdcRId6mw8NqqQnxyHunVCAecM5S
	 i+DB2y5Mu8+sx6QqwYyCJVs4NWjZB2bRDaULCW42tbC1z6vzYziKRd+Hjico+HJIdF
	 neKt7uxJBM3Zg==
Message-ID: <cc98e05b-714f-ba62-bc1e-b4f550d7f401@collabora.com>
Date: Thu, 26 Jan 2023 09:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 3/3] clk: mediatek: add MT7981 clock support
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>
References: <cover.1674703830.git.daniel@makrotopia.org>
 <8136eb5b2049177bc2f6d3e0f2aefecc342d626f.1674703830.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8136eb5b2049177bc2f6d3e0f2aefecc342d626f.1674703830.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_005644_754089_8885131D 
X-CRM114-Status: UNSURE (   8.79  )
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

Il 26/01/23 04:34, Daniel Golle ha scritto:
> Add MT7981 clock support, include topckgen, apmixedsys, infracfg and
> ethernet subsystem clocks.
> 
> The drivers are based on clk-mt7981.c which can be found in MediaTek's
> SDK sources. To be fit for upstream inclusion the driver has been split
> into clock domains and the infracfg part has been significantly
> de-bloated by removing all the 1:1 factors (aliases).
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



