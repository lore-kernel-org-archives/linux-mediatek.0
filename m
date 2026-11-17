Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28A1606A323
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gYCwSIfu;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OJ0Ri1hX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+g4s4CsRp753caRGQ8nP+zdpf6kG+Xd0GDytahTsGS0=; b=gYCwSIfuiFaTY/
	j1Yb0jv+2Nq/v8RptarVIASSQwDJoZ0Ps245SjZieKMm1xrgCfJAfaGnNPKvB26s1k07i7z7SCrXG
	FZkJ2Acz4TmV+xoNhzGb80RjJyL5XzM7ZuLniXW3SGUS1QDrnym1ouGGaGBDGYVMrPeM3mBGA85Cq
	iucNJZ5OBulfmjQSGLWJigP7pzTe0l9XiSkkXQ8uJMB3fenfYPBARP/AwBzkqBLpPteYmy9Yn8gvq
	v9ZjORiRAD5FBqZF7fJJf4rNzXIXm2snhPntbhL539dGpnA7GJMLZLU5PdvaK1pAmcrC1xFGJHfnd
	7CQndgmsjajXVqdF27Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHo5-00000005Vxg-3cOq;
	Tue, 17 Nov 2026 11:57:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHnQ-00000005Vrf-0Rxn;
	Tue, 17 Nov 2026 11:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794916577;
	bh=xprsVSXiD6Uje2Wx13zsXfkOKpUEfW7TFnIEvYtbNDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OJ0Ri1hXzPmJy6FioVbhAf4bn01yT+Zlb2CZDVE2h4V9AHiSs9/HupFYguSY94qZA
	 E8AURRN8V9yBDcNjjQ4JDbtjEludhlQ8xV3Erz7XAS85bGtmXjZAOQYV0/qx8pZzwG
	 ZWWNroxc2nLR8p/Y4yGT6QMtKrgs0+8LZniFLbefHKvp61oD9X0/cPjodHGDlbWHHC
	 fXwuMa4GH40edpM0169EIqt7vtrcmeaLp2bmqK+PMEhiE3WatW6cP4csBF//ikLzkU
	 3WWwFzlMckmmdK6tGw31ZTkMbQpGC/nO3MPphBhgmzxoAAFTtLdU1Hti5ubM29Wpo9
	 1qkQt4+tAV4/w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA3AD17E05D6;
	Tue, 17 Nov 2026 12:56:16 +0100 (CET)
Message-ID: <b0fa129a-e9ad-4a7b-a2aa-2202bfa23232@collabora.com>
Date: Tue, 17 Nov 2026 12:56:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 3/4] nvmem: mtk-efuse: add CPU speedbin
 post-processing
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
 <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_035623_720677_EDC5916C 
X-CRM114-Status: GOOD (  22.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 12:33, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> MediaTek SoCs are often released under the same marketing name, but with
> different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
> mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
> 
> Since the speedbin is stored as a number in the efuse, add support for
> converting it to the bitmask for opp-supported-hw usage in the DT.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 980c29d01337..d2e5c69c580e 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
>   	return 0;
>   }
>   
> +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int index,
> +				     unsigned int offset, void *data, size_t bytes)

You can *literally* reuse mtk_efuse_gpu_speedbin_pp....


> +{
> +	u8 *val = data;
> +
> +	if (val[0] >= 8)
> +		return -EINVAL;
> +
> +	val[0] = BIT(val[0]);
> +	return 0;
> +}
> +
>   static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>   					 struct nvmem_cell_info *cell)
>   {
> @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>   	if (cell->nbits <= 3 &&
>   	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
>   		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
> +
> +	/*
> +	 * On mobile SoCs, the CPU speedbin is a number. Convert it to

Other SoCs have got the same efuse style as mobile SoCs: anyway, all MediaTek
SoCs (apart from networking ones) are (in a way or another) variants of the
mobile ones.

	if (cell->nbits <= 3 &&
	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0 ||
	    strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))) == 0)
		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;

Cheers,
Angelo

> +	 * a bitmask for supported-hw usage.
> +	 */
> +	if (strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))) == 0)
> +		cell->read_post_process = mtk_efuse_cpu_speedbin_pp;
>   }
>   
>   static int mtk_efuse_probe(struct platform_device *pdev)
> 




