Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8754CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZciqSprKBliifa5LL+1QO+TRaSa33doYUeQB5Wehpwc=; b=tK22ru9R60nhGY
	ed4UEYiCZfFLoT8pH5LxCjx1/9Mwq0KjlCvVkZ3Eiq4DNDLAE6SFs6CQpWJnQk5i1DsUZpYE0UgaR
	joEZEgDWHqt7W9k/V3COOtG84tREgznjVkKDt1CTCX4xuOXxEMHwkx4Q+Es8EAV8XIU5o2lxNC6a6
	XFQg/xnhjqrtZXjD8bT9dK1I9YFXGFRPePbe3GbUNJz9/BI7h6LEOD8Voxlf3Py47tngQbyYJHgcj
	GpgElBzHpWE24y3ccmApGhBO2MkrzlV6xZ2gJ52yperFf1zoO+8gdPqUysUjCbj3kjlTFcmk438wn
	jI1EL7WEc/MDVCLstNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njHai-00Ddom-D2; Tue, 26 Apr 2022 09:34:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njHaF-00DdeK-QH; Tue, 26 Apr 2022 09:34:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F17291F42EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650965650;
 bh=rb6ZxyZT0dyUbID79DdULqa8/WRjiOlgTOrn8dU0NJg=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=A0G98VygsLasScLoSR3LYJ/RpGMk1rJduo9ZbtTHiA8z6ACqNh2+IuiM74QRylEhY
 X9Jme/cyDF8oAUZF+VvXvrw2E14SL8ldIonkiW9GnNud1is3t2MnePuFWqZp7BcvVJ
 ZTGnatfyE4hNboFXSsxOeaBadkyhATJtx1McVKChj1oOPsjWuQNtP/LLeccxbWQe8M
 JWcxIEch7KGTZvX3CrlqlifWeyiEd1ldxq4AJZlGe6vGywN9c94FiYePl9Nq+IdtBn
 HkVtDhLB+5dSkWK1c7Ca4hcEUjXS7dQWFLvkWouXvnQV2rl9Kq7Sh6fSByd0EETRec
 X6jquPXMEaiyg==
Message-ID: <d235bfc8-8f43-aa87-b79a-ce15d81877d3@collabora.com>
Date: Tue, 26 Apr 2022 11:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V3 06/17] clk: mediatek: reset: Revise structure to
 control reset register
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-7-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220422060152.13534-7-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_023412_037748_485EBD51 
X-CRM114-Status: UNSURE (   8.29  )
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

Il 22/04/22 08:01, Rex-BC Chen ha scritto:
> To declare the reset data easier instead of using many input variables
> to mtk_register_reset_controller().
> 
> - Add mtk_clk_rst_desc to input the reset register data.
> - Rename "mtk_reset" to "mtk_clk_rst_data". We use it to store reset
>    register data and store reset controller device. It's more easy to
>    manager the data for each reset controller.
> - Extract container_of in update functions to to_mtk_clk_rst_data().
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
