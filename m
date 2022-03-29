Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A28FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kbr7CUlg2QlOAFILn79HrPMLCHdj1lZKNPf2m49LF4=; b=xRZmmW1uFw+0Gg
	rFXkW24FNWQ7FG5z7VCDcUTV60eWSo9NkUCfsP8xe4SnrvvthFJT1kqXI1ttKyPJshFnj56PWv11L
	Uup41IMjY6O5IN4IjCTEEWWbb4sovB6YF9s2x7J4levxIdglcohyhqR/7egOS5guILOaMWb90gv+y
	9ZNlpzGX93cWv+tdjoUvfJqynQk+j0QjIRDdVY4+1s7o1bD4DwPCOUI6TMZ+x+d/4Y1FTpRrfT/56
	1CL3pSsrK9ul0W7IsqI4LaeIg6hKMqfBi8+xVfIWDArnL/eUxfn5wZPeXAO00YJciwdVgk8QMq30x
	6rgLWpt/IQtEPyyFiMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZBGZ-00CFiz-87; Tue, 29 Mar 2022 12:48:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZBGM-00CFg2-MO; Tue, 29 Mar 2022 12:47:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BCB281F43E07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648558073;
 bh=tJzMYOhX+6l/q9zZjN+QPrd8ljoj0rb7a1tgDfRrPbE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O8GNe3VfKg3pYdZ1I8sCYquUFd3JTXG47fVyk4/DELPOhaEyYXPaqqCMaQRum5ABL
 nLTj/0NFPa6rsIOqyIbVU0WBvKCO/ed/kSqGLCT5Dw33SMxA+BReycYTJqX4wEY7t/
 EZwqjhi2wfNLtxbPYZCew6QiDqDOIsfO/5vhk9ZQ6lGYiTKZ4pVNKuj9Y2ciqIJhuz
 t4FXcLiZ1QQmo9J0TC/B9hsLFIszOpTvq9ezpMZNaHUnoqeMiZCYw5EXZrF/IcchM9
 NCVD/dDFRANMa3ojLk4nDut1LDYowr0eIuTU+zLw3hNpbqvQCUChfDSTbU+7cWteW1
 7gmzR+I7KPV6w==
Message-ID: <97f2b11d-15c7-d28e-f7b5-e65f2f333580@collabora.com>
Date: Tue, 29 Mar 2022 14:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v12 1/3] dt-bindings: mmc: mtk-sd: fix yamllint error
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220329114540.17140-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_054754_893806_624C5E6B 
X-CRM114-Status: GOOD (  10.75  )
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

Il 29/03/22 13:45, Tinghan Shen ha scritto:
> Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>    54:81     error    line too long (95 > 80 characters)  (line-length)
> 

I can't reproduce this error that you're getting... this commit is not
necessary, as the .yamllint file in the kernel allows a maximum line-length
of 110 characters.

rules:
   line-length:
     # 80 chars should be enough, but don't fail if a line is longer
     max: 110

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/.yamllint?h=next-20220329

Please drop this commit.

> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
