Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D133C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=So3sSBe3IYrQgZQH9sQzeJmbtwJ/Vh1vxq/1P5EX8nQ=; b=svv0pnpIct/3xH
	8i9McpObbdBy4Lp+6ShBqMjR3ESVdluVROBDlAgAuYSefC1LtV6yhnS9TAV8uWN+wqUTkHB4agq9P
	hrFdfFpGZ54w3eVJv+gSS8PVFdisBDBtpC8a6gXNocm0pL8bVMFbkp4dc2MQcXy6lSiYOleLHH3y9
	Ld1QGQQVOHE5V4CpbdtVxCp0UPcSW2TuRrrpfc0mYo/KLc07SZ89AQ4NiqtXbw66V9MO51A5/Wb9x
	oh+zCWdi2RMy3JP1G5teN7Q39IgAWDcLKrGcQP5PSMw7ng5BtPkq6Uw9ne/2Sk0bz9RgBC8ZxrB9w
	P4BB5evMXbYN45mU0U7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSnV-00Cb0U-Pv; Thu, 21 Apr 2022 09:08:21 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSmu-00Cagy-Cz; Thu, 21 Apr 2022 09:07:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9683C1F45277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532063;
 bh=2ucsMMaorqV0O1+xEJV7r3jJ9B9DYT+m4ZImy6igSuA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lXKhzVjhHXP1gsTFoXCOwFrsNnKZ20AHs3L4ZLo+v0SMnE7umQtepEXQzjEzWSdVd
 h5NtBdY2Q5FPpKolRpSk7BCTCeXtP8w98LS5/28dxDVnZihxF7Ev67P0qsPUB2z5+C
 3m8XgRnwT8ajRQtU2rK60O7+yRVIlqQ09VMvVn6DAefzabRWJD9UipFsuy+f/JNEvj
 ppm/X/XVjTM/2eQfxlgQhDDk4HxlIjoagekHryRJNmUUUt8pDHyfTss5l55cODJvUs
 0tduheJwDSDY/m7PBvS/My8ZBcBTMcZ3myqxENo1a0JL1PRnU07AZY36CdiRlC1t9G
 8QVqYh4s0jAwg==
Message-ID: <f682995b-368e-6553-5b17-0c32b40b5706@collabora.com>
Date: Thu, 21 Apr 2022 11:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 10/12] clk: mediatek: reset: Add reset support for
 simple probe
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
 <20220420130527.23200-11-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-11-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020744_596597_2ACE8583 
X-CRM114-Status: UNSURE (   5.86  )
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
> - Add a pointer of "mtk_clk_rst_desc" to "mtk_clk_desc".
> - Add register reset with device function in mtk_clk_simple_probe().
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
