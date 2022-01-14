Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYI+gLU5U3wxIV1U7t2YcQR4owGp+NNhoH5wWr9N2o8=; b=rKcUZvBGC3CmNewsVbQUKS7xja
	qewHKcrNUsdVfBrBGThGchxGMl97Hc1XMHFf9/+2ta4ZvMCDWdgwn3d6E2xEzRR+68NksWYbdtAOq
	pVLMIijcpVQArQJb+q3xgVcS8Jx67Ttg6W3yYg5czYcQYwRLrDrHS5VCK+vH2jLPUr0W7gd/K2zw1
	ucy7wRVw3LYYcLERMxW5huuAHDwtw7Ldve81poc4ofbB+sd3W2R3LOYY6TE1v+XQ8ATBBhiKJFnJw
	+74SJBoHSVRbZT0WFAE/BNlShHn07wYqvLOud/KcyF9WtYh7h48LzClGAh3Yrz0exUyVbe/kBaIqH
	aGNZ/lmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JnY-008i0p-9t; Fri, 14 Jan 2022 10:27:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JnM-008hyU-Ah; Fri, 14 Jan 2022 10:26:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5BCAA1F467BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642156012;
 bh=ZdfY1zj9C2TGhgJieZuhRhmOO2BT0XTecNLWjVgIDhk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iEA9mhmBCN2ODbd4i1vVhLACQxD0kyMi83DOusKoPco3mx4shRD1K7WyeAj50Nvwn
 PPzsPuUNVjLTWfYFaHhoIfInTtk4m7Lh90LWtX3qRf31SGnPG9JX+3peh5XilBqdyb
 Go32UMtdMbDUZat6uX5usOCeoGk949V13aQvLNNWdOSA17dpfenwICr9TzC2gBK9kv
 6SOaTrQ2k1fYgHeMsH5d2JHLGzxoXkBqJn8GV8SQyVCu2j5tmwAio2NFQeGYCWAeAK
 0JmJsPi4amO06tJETv+TvpDn9B29jPBGcxelg/dhjvFMp22ROkp0WbS2/YfNAUJf9L
 GEp+YLlMc1yzg==
Subject: Re: [PATCH] media: mtk-mdp: Remove redundant 'flush_workqueue()' calls
To: Xu Wang <vulab@iscas.ac.cn>, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220114082214.41817-1-vulab@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d838768d-6f85-4977-d014-d5f85ae7126f@collabora.com>
Date: Fri, 14 Jan 2022 11:26:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220114082214.41817-1-vulab@iscas.ac.cn>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_022656_556375_77E21A01 
X-CRM114-Status: UNSURE (   9.03  )
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

Il 14/01/22 09:22, Xu Wang ha scritto:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
