Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E92C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mllNEBcttNOdBbeF1WPl3NMdH8CLOCUQoZQZmh0MLQU=; b=SlEsbWrDcz03m4
	42MJxnCzQhI8Fl0NFmP8mBrBSdaNQTbWF4ITuB9yrZs7cq6XuEwDe5l3qyvX5crb3yuiTB/eAZrNZ
	mo2MKRbedmL6DR2K1dgIEa/ZY6x2zTXYCvQzn5VP+aXa47CvSAAag9u1LlKo2C7zycSUf0rG7mxtx
	6folm0csJzzDEhxy5Mn1aTA2i7XbfMLq6uuLfa3lfAJ5Shlnj1FksYNTQVENIT+d4ciqODEbz3kXX
	FJ6z8M2n6/Zy3JUVaEwm8QH1feGj3mZZxlb2kBJ/1vi097jMe7y/Y3l7SO8yJYPmUxItXVYWMyI9y
	suj2BJN73b4Jal09fqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSrd-00CdUG-Tm; Thu, 21 Apr 2022 09:12:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSnK-00CauW-Vh; Thu, 21 Apr 2022 09:08:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F338D1F45275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532089;
 bh=sBf44Cesk54kZ/DtmuF8wUK6DJExLvoWBxhHa0QYby4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rmepv4LWshLzGNdMslSSq3jLZP7KVxaV1jNda+cStLeVpqk8DIlaG9Bu6jkgM9Gna
 dtil2YN1R8+ISwp3XG1rj+vKs460GuXyPBBOeEMJH58bFKbjVL0bMB9OWX2VQCLVXR
 3eQBljnjBwSb1BrOmMmbu4feRnNT9cGWkmsYdN/qksBw9KQARDNDKYSv2WdNH1jP4U
 Fkyg1EZitsdQx5fXOQe4vOtloAc6UjUVBn6AA9Qozai2uLjA9fARPBVHB2j68WjboH
 r1YkLmYI09szVeGlItTtpN33xLDrv90BRI6WWwSjoWw7Fmh5MvpZPoiCRT+Mv+iZpw
 NwK2vharQJdXg==
Message-ID: <d5b05fa3-a1c4-d2da-482b-a9235d9cc382@collabora.com>
Date: Thu, 21 Apr 2022 11:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 01/12] clk: mediatek: reset: Fix written reset bit
 offset
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020811_220482_F33CE5C8 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> Original assert/deassert bit is BIT(0), but it's more resonable to modify
> them to BIT(id % 32) which is based on id.
> 
> This patch will not influence any previous driver because the reset is
> only used for thermal. The id (MT8183_INFRACFG_AO_THERM_SW_RST) is 0.
> 
> Fixes: 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
