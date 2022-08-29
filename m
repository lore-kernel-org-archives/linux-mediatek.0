Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B26ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 10:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsIMUdqu63+mXFzPehW1XQnzZHbSeesqJ6F6LvscbZY=; b=Z54usCmUbHI5wFuj78V/21j14C
	ox/ZUm23gNQPRam0QZRLg8TZI8Cqr7y1uZjLgrz0rusau3Aj89ttGSfKdm/fXTTZYL0UGzbBE9xVP
	+Usn3QQ8pMNRY1Mk0Nv60KW9xwTwQJb1kk6ZYBsVWQsqlEw7OKYvpaJNvolvMiYtSP0i6Fa0y+KwU
	EksNOwjK0ed8oBx7K4kllcKv7VNIjz83iKWHGgqkSgBrueEEcR6T7oYTwQs6qMpni5juERVWcdp0i
	h7x/kBZ6dsDa5kGHblbtowTgP/F5Y/ojUmWGXpLD1laWceqpiIhcrUpqZGEIZbL6RmGPZvQ61BPql
	2HE7Hy3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSc9h-007Rlv-8H; Mon, 29 Aug 2022 10:38:09 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSc9T-007Raf-1c; Mon, 29 Aug 2022 10:37:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B9C4E6601EED;
	Mon, 29 Aug 2022 11:37:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661769472;
	bh=XUq2kdBS4OyttnvnvgNCtPhMLla0r0PwgobFNtpuStU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X9fjiT3eZ8u5h40tuCDPa7YcPwRvCRI5eydtEfE71RWaFwh3k+S7oN18rNo3Sd8Cv
	 SxGz1sWeHALT7fh61Cw23/dZuUDSCMZudkhIm23SEoT7zxcRkGyLwsCH6WJr80QdaU
	 jmFlLHgJ6bkJTufumd1QEMOp6aOhgY/SoVeQO2yyv8JiJTHecAojLVUcz1z0y4/82q
	 0PJDAucwt8KiUOJEZF4JBiqWha0J+OI/8CfqwmR0ioM2AIp67RAaGtLaLNej+gVPKR
	 fwP02a+jJ5Mdp/mJnJ/AY68GyHyhOBzqwqSrWravlKPUGm1wWSYnL2fjxPA0yXobyk
	 f+HkH3FwMoT1g==
Message-ID: <f473ecee-fd71-8783-dffc-7d7cf06a3b77@collabora.com>
Date: Mon, 29 Aug 2022 12:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: pwm: Add compatible for Mediatek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1661744916-15441-1-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1661744916-15441-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_033755_970890_972B66E6 
X-CRM114-Status: UNSURE (   7.97  )
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

Il 29/08/22 05:48, xinlei.lee@mediatek.com ha scritto:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Base on the branch of Linux-next/master.
> Split from series [1].
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com/
> 
> Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


