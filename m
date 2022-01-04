Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA49C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5XsclHnriu71ov6yGrpMww7xS26iW0Zr741MJIp5n4=; b=QUXYe1jLkEnF0YYhUkKVfh94hv
	U8h9tVmrlnfC5XHfJDKls0zD9lBVoEr3LLJ/Zso+xZluvAvssjMLs2yySx8frKUxcbSD7uD0qDbMu
	SwbyU+mUSdHd1Neh0MNF2kKkTtjliDuSw8txUnbEnzH85MEHBZjyt/+35KQI/yxhUqO5cuDr4gJUm
	VLp7mB7baWsNV8eIP110qO05GtFNlpCUs/L4XxeuC5oAHkZf4g2JmXcrgJuL39bdml4gcAGmSwIeE
	X4oBZ+Git5sQzTr8ug5PZH+5G4K6T15GZUGd5Y7+5iaDF4lIAYPo0C8fS1BaoMSQMX7uUqPHFGceg
	SUc+XhLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fcI-00Aq0u-RJ; Tue, 04 Jan 2022 08:56:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fPs-00AmlW-4g; Tue, 04 Jan 2022 08:43:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1857F1F42495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641285807;
 bh=xG0sghhv24/za4oOpx452HZr3+LccnGXwhDhlPka2U8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HDvT9Z4iB9znD1ig1CQNGVpDIUTu3g+gD8gAt8x+lBLIcWV14QkXUns8Cj0SOzdfj
 +uXR2Mc/lZS/mw+DapadZOO0wdOaPxsQSXuAPKG3p+TDn+osD+PAYccMidqwi5JWIV
 txUfAd7Bnn3+NN4bPJtnwLSG3/KZPyrZ71IVI1ZCRkusF/QPdsIhfUtVXAUA+mLbdt
 u1O2ZLPtgOeZbLOLy4+NjESlmAoEACkWZlhC0se6LnOm/Q67Mps5yiGX8li+r17x1z
 YkpYNfu29YIUFKqCVy/3U+/6CAN3Y84BEhqp0jS9swnm2y4oT+AmVpnogAf1t76ogR
 jC44KM6IPIenQ==
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Support mt8186 scp
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-remoteproc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220103075854.10438-1-allen-kh.cheng@mediatek.com>
 <20220103075854.10438-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <39f95db9-9d52-e64c-7444-ccd8d88cc522@collabora.com>
Date: Tue, 4 Jan 2022 09:43:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220103075854.10438-2-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_004336_398692_A6C4659C 
X-CRM114-Status: GOOD (  19.61  )
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

Il 03/01/22 08:58, allen-kh.cheng ha scritto:
> Add SCP support for mt8186
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Hello! Thanks for the patch!
However, there's something to improve...

> ---
>   drivers/remoteproc/mtk_scp.c | 39 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 36e48cf58ed6..38eab6b86fd7 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -365,6 +365,31 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
>   	return 0;
>   }
>   
> +static int mt8186_scp_before_load(struct mtk_scp *scp)
> +{
> +	int i;
> +
> +	/* Clear SCP to host interrupt */
> +	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
> +
> +	/* Reset clocks before loading FW */
> +	writel(0x0, scp->reg_base + MT8183_SCP_CLK_SW_SEL);
> +	writel(0x0, scp->reg_base + MT8183_SCP_CLK_DIV_SEL);
> +

.............

> +	/* Turn on the power of SCP's SRAM before using it. Enable 1 block per time*/
> +	for (i = 31; i >= 0; i--)
> +		writel(GENMASK(i, 0), scp->reg_base + MT8183_SCP_SRAM_PDN);
> +	writel(0, scp->reg_base + MT8183_SCP_SRAM_PDN);
> +

.............

This snippet corresponds exactly to the mt8192_power_on_sram() helper:
please avoid code duplication by simply calling that function instead.

Thanks,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
