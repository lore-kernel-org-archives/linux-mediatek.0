Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8FEC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Glsl1WXiS7zdeZm+ZRJRuSUJMuzXukJU3cpN3j3kgU=; b=OCzZqlh5zQurh8
	1mq9fRSm1w3ZrYwDv7e0AQzaIejdiDcm5mxgclf3To6fPchbfIvGQgXs3LW6cjYMfEX/63oJVZK/t
	1Uc1+90gAK6gFkpljQqK1DRUKjb9tmtBwXiCgQcOIJycmyNM39PfjRZsjyYPul4igw3QFAGeRiWPc
	6Dx2l7qFXXifN8QCYtuPvE/7PUl5aHrVOnz0z91WJYM+H522DpP1LkLUfLWIlWlY5Cv8IVNgod3sI
	eh4eJRfhqtTHS9wtpIWT0wkLzIGfuq9HXyH/HEezzFmNlmlsfer7qfuY3UIs5fjToYb/xvoqpvJPs
	DgGA5uxUrRVFNGk4XpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSr3-00Cd6m-TD; Thu, 21 Apr 2022 09:12:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSnG-00Carm-9U; Thu, 21 Apr 2022 09:08:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 80F5D1F45276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532085;
 bh=YZVTLxKtIQxkm9Bp8TdQ6gxbzWomCWXRNzsdT8Q+x30=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UI/ILTNaBWxgSMTa97JCIgzZB/HClrk0wDLVsqsfKJNMGSW/rJXknwZswnzZSxtx+
 dzb5K1mqU2HwPSgXioOOKfsXChbk1Hg18kYyn0OIX0U9hrnWca4lJPQLxWr2hzp50Q
 6+j/6gIgGxZKJWe46YEISOVOoLrlieHXpS4whcxiMv2kzpWs2ObyTElqEZC0QQD+fq
 tJhhHmwgIR9ZOopMA/aMybCPoGjwFAigKuIfycAMxrwSsU+j6DFmQOvfs88KJGypBq
 kpvy34atxSbHbtL3ES5wUPvGiAINF25ynJka6YK5i/ljjTatpEMyhARAO+zAHeAf0R
 dwXiBEu5Vm8RA==
Message-ID: <da6fed21-f661-773d-307f-0c7085e3eb9b@collabora.com>
Date: Thu, 21 Apr 2022 11:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 02/12] clk: mediatek: reset: Use simple reset operations
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
 <20220420130527.23200-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020806_490877_4A3E7260 
X-CRM114-Status: UNSURE (   9.77  )
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
> There are two version for clock reset register control of MediaTek SoCs.
> The reset operations before MT8183 can use simple reset to cover.
> Therefore, we replace mtk_reset_ops with reset_simple_ops.
> In addition, we also rename mtk_register_reset_controller to
> mtk_register_reset_controller_simple.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Hello Rex,
have you tested this? It won't work.

reset-simple is not using regmap, and it requires you to pass a struct
reset_simple_data through drvdata.

Besides, I like that we are using regmap, while reset_simple simply uses
readl/writel... so if you want to use that driver, which is good to reduce
duplication, you should also implement support for regmap in the form of
reset_simple_regmap_ops.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
