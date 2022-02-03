Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B19C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNGS4JbfBKF2b4wXtzB1BNI5D0LdK3GHM6rjAnPH+xg=; b=IF0EjQKuGkWJDX
	I2kLRyCi8XEdlJ7cZCvS2xzlX1L/BYxsEmHdpaffuUVepQiIm5WUktboZl/RzlQXB12PS4FWIFK+p
	QvZHiJCuo3DCWs8PbQa5afxqd2gle2gvS+SNrJ3SRF7BXMgDoqvTmqQbPp7kc1652ZsFI6dWPfX8M
	lOQ4PsRzv5MZ4fqBe1bUR1wPjWLxAOygkY/WQwqsupipuMNN9njdrcb/EbNUKNnVkWHZAugJzJt4p
	zjXA3drf7AFCSrkd3rtA5/7Osl17qysfdVCyxiLjDAllJCP4J6vQxId5V1LKWYazRC2thtB4Vt7ee
	pX7qxVinwJaOHICyxYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYxS-000g4f-De; Thu, 03 Feb 2022 10:03:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlR-000aFe-UO; Thu, 03 Feb 2022 09:51:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 142EE1F45310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881852;
 bh=ZaSyARU2vZM/NZDFHPoOvB2PBVGfIhlAJTWJWOdtiTs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BUhLagX9u84O1uNCmmmWJ/EwOGKXwHVlczhgqRZwuva3eC0aIvH7qx1jn6VEL8ift
 0xXKdIDcPHomvrkNKcYnmW4xwwT3YqVvmnABi+1cXwn55CGvdTdH1Y+juDnmvA7rYH
 goPDq72F3dbErvXft7MHZYN3oRiNbKsZ/rZRo9wQNdSEPt+KGes03wGXm4/tGtAcTz
 NTYrEr/vyV7dmVS/RXFKkd0guI5wim+KzR8BCz5x4aMZK8MY1w+UXOCsuW4gELSA6Q
 NieA1Jsdq1rlrzZgXUpx4eDbjovGH3K7QMSRv6HPxmO4G4o89YNDtvdIoFCbLml+4T
 tU0uE73wvzPjg==
Message-ID: <0e9654d0-489b-90d8-bd1a-429aa9971533@collabora.com>
Date: Thu, 3 Feb 2022 10:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 06/31] clk: mediatek: cpumux: Implement unregister API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-7-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015054_199291_B4F86886 
X-CRM114-Status: UNSURE (   9.19  )
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

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> The cpumux clk type within the MediaTek clk driver library only has
> a register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the cpumux type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
