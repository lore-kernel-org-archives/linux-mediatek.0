Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F58C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHWEQt4dRRNUXkkOa4q5gKlGf5abjzrDagnd3wllWbY=; b=1MxLLQXzqIAeseo49k3tXGICM9
	peaf+2uzaIvFVePI7EUuRWavV9Rj1JGMwNX6HO+be649UOqtaIXUKMUlS0xandZGBCWIbhbyrhpB2
	d7rGBkG34R8K6T+P5CsxW6tvSoOzAzvUHn/X1j607T+qu/h5Ma2zpATRGZOWHmG/JFppLwUZ+2eXT
	FqRbbbzY5WjV3Ix4vORHGrmaz7TFJAkpZm3IR3HRWaVYE2OGOBn3tXQUspySXJ1Ww6S7tyaiWZ/85
	AYQT67FFcJtKdQK10uKWaFHm9H1C+rR+zOodE3sK6xl2oJKJ10WKHPrgFNtfavxyy24JXGeRqXWU+
	nE2PzK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6Go-001XYJ-6R; Thu, 09 Feb 2023 12:43:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6Ge-001XV8-9h; Thu, 09 Feb 2023 12:43:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 74CB866020BA;
	Thu,  9 Feb 2023 12:43:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675946591;
	bh=HwlWGSVTMDejL7PaZmKifPyYh1ewmmbzRWCaUaV371s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sot1tO8WBzRmvFLFkYF6l1V/Ugw3er4S0AHbdVcp4VvVdn4zw67laXl63h1bbH7jq
	 RKXJtk2M/QD8iF1LrDvmW1PRnnVUW8C3BJqSMJfq0MuGdFzejBUc0bm77wYeBM1Vn0
	 PJKuAsmGUT0056XrvznfRL8ZEWvXctwm2o3y9vqKTut4qOI2KMWBIm/cYLcu3RjFFy
	 jrLcHk/pn5mbTm6dFiSHXIeigof1iAU4Sx2PSjlM1ibJdPGUyo4/wSGWfeMTpVQhkO
	 y3mdgzz/1B36ipfYcjCKi4AinXs+jqaE+HLRNknh5+J0rC7c6nqiFHxSEWxTcLQIeV
	 zaIYLQO850IDg==
Message-ID: <201c6871-4c42-efb6-3f97-04e63ebc2187@collabora.com>
Date: Thu, 9 Feb 2023 13:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 06/12] remoteproc: mediatek: Extract remoteproc
 initialization flow
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230209074021.13936-1-tinghan.shen@mediatek.com>
 <20230209074021.13936-7-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209074021.13936-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_044312_493805_3CB525D9 
X-CRM114-Status: GOOD (  16.98  )
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

Il 09/02/23 08:40, Tinghan Shen ha scritto:
> This is the preparation for probing multi-core SCP. The remoteproc
> initialization flow is similar on cores and is reuesd to avoid
> redundant code.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_common.h |  7 +++++
>   drivers/remoteproc/mtk_scp.c    | 55 +++++++++++++++++++++------------
>   2 files changed, 42 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 3778894c96f3..20c1a90be77d 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -112,6 +112,13 @@ struct mtk_scp_of_data {
>   	size_t ipi_buf_offset;
>   };
>   
> +struct mtk_scp_of_regs {

That's not a common structure, but rather a commodity for internal flow: the right
place for this one is in mtk_scp.c

Regards,
Angelo

> +	void __iomem *reg_base;
> +	void __iomem *l1tcm_base;
> +	size_t l1tcm_size;
> +	phys_addr_t l1tcm_phys;
> +};
> +
>   struct mtk_scp {
>   	struct device *dev;
>   	struct rproc *rproc;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index b92274067522..feebcadd56cd 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -854,7 +854,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)


