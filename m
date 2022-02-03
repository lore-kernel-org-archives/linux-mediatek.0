Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF59C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZwheDv7226bciHAV2Q1IvzDpU2klg6t7xPS1M9M8vc=; b=VRPqHrFzS0CPjj
	R7Kqi284xc1nQltQ1KHrwHcWwhC8Q/AOQfEpnZ1gMndAotcHPnpmMTquAME95Yk44alDTgK/RrhoA
	VItTr+UxfSLsYWebT6QxRpg+EX9FhNb5qvAhNSkhbTV0sNtHhR2XAn2xNeLYK3KOi9Se6ZtwJN4B4
	xruQW8LUaSXJ+H6i9wYA3sxqwEdCSV/u/fSKWSfXD9uRG4zhGyWMxChkN6zJm4PS7eWhcceR7g3pZ
	h8DaYkb8U/yyBLWxQoWuatjyOp/RU2yzdXDBACoOnMVAQ5KEf3TxivrfpZIGl73Ot3kO0BInudCQQ
	WH7B0SJqdV0v0e21UqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYiw-000Yc2-SA; Thu, 03 Feb 2022 09:48:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYiF-000YF6-Ci; Thu, 03 Feb 2022 09:47:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ABC8A1F45306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881654;
 bh=0eDqvPEflRo8g7k3cDJMFx8JuULFPhHFEmjsSyhm084=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BBHdCm7Q+XivOugEvd2+n8ApYZ1sJ/TyA2i6A2UqlsWvDeM7JDXpniybzWgddoEYF
 kLb9pQpAaXK5iM/cP6f5yjzlzqScmYk3ymayuWKHAWrnsMGO9KvfAZGrqtZ9rO/AzN
 bGyZXmcRH17SUM6d6dldRoLUhfh9ui08ygXvIwH46EOcngfMlMGZDuW6lWFcyyHzDG
 Do5407jRemG3N0ReXbigjyVLKy8JXXBzQ3Dp+vQkvO5KeKuZD1IqgholWW9FgkWyC5
 NezgXw9gtpinb559RAIjFWvfrqF5LnCXwu+UYT0iUEvQgKyWHCYiDuzaxlBmbkNfaZ
 NicALLfEKO1GQ==
Message-ID: <91d99498-be0c-41ea-8465-03cf5eecdf62@collabora.com>
Date: Thu, 3 Feb 2022 10:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 27/31] clk: mediatek: Unregister clks in
 mtk_clk_simple_probe() error path
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-28-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-28-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014735_607730_ECBCEE1E 
X-CRM114-Status: UNSURE (   9.12  )
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
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of mtk_clk_simple_probe() to do proper cleanup.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
