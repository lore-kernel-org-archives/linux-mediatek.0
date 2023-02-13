Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0582C6379F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPMXG2S+eCSIcI0l1OB9aBFUckau18KTBjSiGBqLQVo=; b=dS86GIVnPHjrvN7NLtU3/H61fX
	SGXJ2+cn12tXuRILiTH70prZitb+ITAmov9O4c8gIQIpK2pUWRukrnoVtD2g1VIWQigkk3GSKcP7y
	PpPB7KUA/lkwj4+gAufYSPDU5xhHLDRq+kFE/9YhLr1K69o2Y0niAGLg6f8UQrALPxeKCLV3NIHff
	jIW1+vPXS2z5B/dSz/42sggOwDYleeBgiMSnS3IzeUbln9Xw5CviVCuZqiz2DvzU4teilLvHHCUHq
	s2MLOlAnjip9f2efs/Sbp6K+zzsKoyP0Q/flkfB4vPGqbplrgOb6PFMoFnmZU6JY9LPNLwUBJr75/
	0V8qDXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaHq-00F4fu-Vd; Mon, 13 Feb 2023 14:58:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaHc-00F4cK-30; Mon, 13 Feb 2023 14:58:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0071366020A2;
	Mon, 13 Feb 2023 14:58:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676300298;
	bh=PkIWF/Cyn6UlA44s0dkS/hV7U5qDNxMSgfRSqY/J2pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZqFi3akZlnEI2lSSS4H0R3KzwCjL7eS7a2Kpt8GZ19xp1ckAIoeSI91Hhr3Fadfl9
	 lKpZUivoFfiXrqfg2MqYTp+1u7+XQYfaq/JqH06CH8DuTn9fqjLOJMHddFPPnui+b4
	 LXKEDNXso7+jZAESiosJEXkf/eyuvwnVNtrGba7l2lTvQltUwuFbjCmBEOxmiYGD5r
	 KusCo+ocwTuuH775rK9n1gvyDByW4o8Tc3LfC9HnRP1gZS4rpuP2cY3HoA38sm4oqr
	 JmbAWcZg9orp2yPGobZ4ILzaHes7xxioZ0U68df8vijmHEyDs5wskSgSYpMawWhUb8
	 TspQv3uLvnfcw==
Message-ID: <407e8e4e-fdcc-26ab-0bb3-e03b59f0d25c@collabora.com>
Date: Mon, 13 Feb 2023 15:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 07/12] remoteproc: mediatek: Probe multi-core SCP
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
References: <20230213033758.16681-1-tinghan.shen@mediatek.com>
 <20230213033758.16681-8-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230213033758.16681-8-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_065820_353234_D3C6AF15 
X-CRM114-Status: GOOD (  17.49  )
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

Il 13/02/23 04:37, Tinghan Shen ha scritto:
> The difference of single-core SCP and multi-core SCP device tree is
> the presence of child device nodes described SCP cores. The SCP
> driver populates the platform device and checks the child nodes
> to identify whether it's a single-core SCP or a multi-core SCP.
> 
> The resource structure of the multi-core SCP is a list of remoteproc
> instances which is different to the single-core SCP. The corresponding
> resource releasing action is based on the type of SCP.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_common.h |   7 ++
>   drivers/remoteproc/mtk_scp.c    | 177 +++++++++++++++++++++++++++++---
>   2 files changed, 169 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 3778894c96f3..635b17676de8 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -112,6 +112,10 @@ struct mtk_scp_of_data {
>   	size_t ipi_buf_offset;
>   };
>   
> +struct mtk_scp_cluster {
> +	struct list_head cores;

You don't need this structure... it's just one element inside, so you can
simply add it to `struct mtk_scp` instead: for readability purposes, you
can call this list `cluster_cores`.

After which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



