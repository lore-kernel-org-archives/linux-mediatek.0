Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1CCEE14D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/g+hgXRtp/ui6wbc/vyVK4ZHuYy9aYfM4WFbm/bBi4=; b=ufElC597pS3F1lS1NCMlA8mAkC
	YF+LF5DKXa15E3TNdD4tGv96F8wNF516jBp1y19N0S1fpqA9X62ZZtNYPlEV8M/tiiAA584XUs8GA
	4fQQsT1JC5AZar1jH2I7mrL/HHCAhkgPEimDWe4l0vTC2eTQ3bwmElHHOgaF0BupsHXdgJOSP5Xuk
	bKFFERBSDkSxG2t4DUDakgUJ2O3QgDUeIsf0xg79aIi3AucYHR/sNLZQjTVKewzREm/pbbBWTDtgb
	3pwnUuq7Eyd9TQyIyiPEFHnzB8/KQTFzxjXd3VFGX959Y2779IXJoYBZEqIg1G/JTlqM/BJ21LYSO
	YySwFIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAxw-00BdlI-0C;
	Thu, 07 Sep 2023 09:06:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAxr-00Bdjr-1k;
	Thu, 07 Sep 2023 09:06:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8769466072ED;
	Thu,  7 Sep 2023 10:06:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694077574;
	bh=faV2RqAEvL8VWjpK/yOwEuSo/mN8TrmiSzgmPKx+9yM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fZSdzOn7RsosI0whfciCa1jkLbzobNQgzpFfqN64/WFaH0JVVvDSITRRVIEfU0cJL
	 9G92DE9ZL2ENrm3vbx1QvZd4i1CDQL2FuXWddcPUL3Tqh0pjzLSwMkHx2wp7B4QUdQ
	 q9PGdQgGkyyyX1Pl4543wCue7OOTDAwD5g72b0Ly6kMs0p+bnuU6+07ib7DHxNU5cx
	 u4ZwxmJ0hWyaDQ8C8BclNi0tFr2oq07xr85X+lIXCQX1ZEOKfYScVlTmGYcg2MRiu6
	 Wj0OIJV+sPLPeQ/pVqWigMMccyTCNRS+0EL92QjILR/PUc4OKJzNOD0NEDYdoLByDx
	 2NecuKDEnsvzw==
Message-ID: <73fd31ea-f869-db13-5069-f0f5267ba3d3@collabora.com>
Date: Thu, 7 Sep 2023 11:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] clk: mediatek: clk-mt2701: Add check for
 mtk_alloc_clk_data
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
 msp@baylibre.com, frank.li@vivo.com, robh@kernel.org,
 jamesjj.liao@mediatek.com, shunli.wang@mediatek.com, erin.lo@mediatek.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_020616_547427_7A206D98 
X-CRM114-Status: UNSURE (   8.16  )
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

Il 01/09/23 04:46, Jiasheng Jiang ha scritto:
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
> 
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



