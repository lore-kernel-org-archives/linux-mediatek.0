Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97422606A32C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 04:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tTSjbiVW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwKLl0Jl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dEkABgsA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=; b=tTSjbiVW/FJgeN
	nueGOTdXWDE3thkXAJWFGBGjsckRYCAlMCLmftJsozwNFDFXqrw4NnoWBhMiwrMR9SDKNZ8zZ1hll
	Ddhl3MJ5h4Q7Y+CtZl9s+IbsHy5DmVbSAJ9b0XowBA7LgkVLwXo5kXXFmzHKc30cata3eMWj4EUYB
	EaV6xLMB6svqyoGnz2/oZnCmV712Zp8C7T1mHD9Vamu14iQmia1oMmqU9nXPtmHtw7Y/iFb9xFURV
	hb26ne9cfpwZRvVz3uMNDjz2TrZzgCaEEeRP2fub8P7h84eBiW7YX80vX7+Re5i7CNWWHHM0gysGP
	C35MQ5H/TkfoDoaKVRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTX5B-00000007gxL-3ZyR;
	Wed, 18 Nov 2026 04:15:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTX59-00000007gwa-3nuh
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 04:15:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UweW2602438
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 04:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=; b=QwKLl0Jld8xitQup
	l+HsJF2Dv2+jTBtru7ZsdYqqX1NdfW0xBgn87bKfSnM9ZJLMF/kN9FpBAGdPKCHB
	uYeHUEIDc3sHm9wMyOQ27YYb+qqvkOUnoPDSIS5N+H97Xig1YLWL2IqcHFLunPry
	/EqNW2Q5csx24b8hEyrL3RIskz/46RkabyYrs85YIg6jAJBNIOQJB6XtFQODoQqG
	EaF5JtRDv9ifdpGkQLKwKUyAN5nqvWmS4xZtL3LAXGS+JW7gzkTXBwVHvDNoOh3Y
	DgOJZasNpMNlXve0huTRL4PRoUj5aVNigf3l6MTztQVYUxvQghspkm6WIEr/wb0d
	BsBqPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv714sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 04:15:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so432543a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 20:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794975338; x=1795580138; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=;
        b=dEkABgsAzzrEFu6xT+GmYhu/KXI5F/LCT1RISftrJ/8NU/uY9E9UkrKJc7f7V5r2xV
         5O/SE+Gw3fqHGgzvxgAM4nuaixUeYLbUxgctvKFmrNv8EDfndGahYMxuSCEeEU7OzyEZ
         5cqe5HYYIXL9HIUWMLKatMNacmJ3sJBdMMQSnVDVbxmNuJX3tlYhDVeccKJqQQm96Rih
         i6xvHs0wesYfngrJO7IU1yn5K7HdIDQpSIR6VtVnJNoDXLOjN41zz6ZrUbSqNlqpMy3f
         bXQx2D2KVm+xYn2F2DMZ//LxkHipH0jA/5pbCNjqiEtJW5keyszSaqD+R03JZGWEvlFg
         SDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975338; x=1795580138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=;
        b=ajN4j8pMUM5Nddr9QYu0Dz+8L/FFV4yu7PXRvMtzOUsrKQVDc1zGDZq54fLBaYC6U4
         ekiD5D18Ok9RNEEHqrBqPIzLFcAemLYKpeHudAk2DARd/Vd4OclhTJrb3SUW0egZjwVb
         fyrJgY1sqa4X1pSo3Z9+2L2gvlMtNTtMZWtXbpFSRa4Kq8ednhLO7bkM0pdFktMYk0UH
         ulIq9YOZ5dGYds341wpI4Ki8Jsp5qsnThoOc09WuLGhW4cfQV9M0ThZtOR8fKoVxfAXN
         MATAvqSPqpYjUthJUofpXqpIl7snY2pcVglCx28lg1IR8i7/nO4B2t1kfHPoYblBgRNp
         zbJg==
X-Forwarded-Encrypted: i=1; AL+hErGbcxZ9gSVVZeE77KShtsbwJ0Tndee5WFRS6KU/G9+97/DT4KOSD/7qliy8FwS9Aaa16/1/3nmfDTpVgmHp1w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8+WV1gqtnitSwSoDXTEGDGemLjzifdKrahdfC2Fg7AU/3Fk6ly
	Gqk8l8Pah9JmFKirTtSESduovj9MHS2tX+n8YuIlIyChMDYwCA+IKwQGM1N5lUMsci8eeMUaf/w
	kjCDXX5hUSWuRzRk+vXypAQK1ivS0CtHbl8AiiFAUHo998yECmaEREnsEYvWJdpdwgqGxUVJInv
	g=
X-Gm-Gg: AZFdTZcpPClmEcJKLJ2ycaU48A5hB1lxA6B9NhcmuANb73fiwksbwN0YoUMFScqwhzX
	WqzMnmwrfIm4CdiiLC/Or2htYef1DNsrn2pBtzKPGUxNsY5LHQlPYSwNQQKNsx/TllL3NUtzT5G
	dtKcE1tQNws+jCECuULcwFrIvamrpnk3hj6htW1OFfPoxBwM/oTTVsr9I5iVwO4Ew1b1Sjzq3LO
	UO2tQ8t82lu8pnNToXLPoPZMVBPrgiX/aMxQKIFr5ZQuzp2SOuOoq4G7qoBbaGVYBkXjjvJeBLN
	ZeG/J7Sqc2oZivo/kGq0kZuDMC1YybBU7TJGaxtQqgBuftcKl8yU3No3E9EBT8Xob9/mkHGd86C
	SwBfxm53pzdTEGmjAhlWb4TxYUeTjp177pr5QpykAJopEK2A6SzrGJgOtiIEShkQ+Rc+0ctp2Rm
	CvLPSrFqi/XK4FPY7/G9Qjij4HOc5RfhITlHZSTxTjUg==
X-Received: by 2002:a17:90a:d2d0:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b3d04d00e7mr1481999a91.0.1794975338073;
        Tue, 17 Nov 2026 20:15:38 -0800 (PST)
X-Received: by 2002:a17:90a:d2d0:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b3d04d00e7mr1481969a91.0.1794975337581;
        Tue, 17 Nov 2026 20:15:37 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56f6657sm547501a91.4.2026.11.17.20.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 20:15:37 -0800 (PST)
Message-ID: <c310d7ef-28cc-4ad0-9414-8b5ead52f53c@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:15:32 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: mediatek-hw: Release resources when hardware
 enable fails
To: Haoxiang Li <haoxiang_li2024@163.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, hector.yuan@mediatek.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261118034205.2002363-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261118034205.2002363-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: etMQpE36mYRfOgSGkuBNiML_isAGcDD6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNiBTYWx0ZWRfX2xUTrwu7zQvj
 YToIP3x9xLPyizdch6lZnhqedL2kKsVKstbb3dp631Gx+uHqsxMIbNZmfXJArKEDg9LJqRkv0ci
 xmyvuF2ga2/NJZOCGGSISDaovXu47v9qvZz8uqrNIfc6i49XxvRPglmmB1suGuhcdb+WMynwIUj
 sHSwxGmjxgX1aiauvhlOOs7jtFsiZ0rQHmBYYaLt4di8AAfZJ0EklmUs3tHzSa5+Hzldjy31EQ9
 TSTWBiTlHQVEcJlC8cIOiLCR+SesmJBbrPcxxFYnEhMbEksmUeJWU4j4k/r5MHHfVIPRaiLsdpm
 G/SxPOsYnlZAia8lRfFI4pUKOhoeebJVirrFzQRy3jzXlfynAA7/vb0sEMm6fY8RjJo5IkYAu9o
 1uZX3vbJhPd8JbQP447+hIYWRoXak4epFhEJFlQHj0VQOBAOPzjGhvX7rN58aAoXAjGfacRMuLQ
 uj7pHupDJ+ubOHqVRng==
X-Proofpoint-ORIG-GUID: etMQpE36mYRfOgSGkuBNiML_isAGcDD6
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd266a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Byx-y9mGAAAA:8 a=ae5kI6K66oS_w7Z61gEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNiBTYWx0ZWRfX2ktzDjRz2+bK
 mwOdtvBFjB38Yubg+sK8nEBdTPcYDCbSYsaj5pK32MMfyYNhyNq+xY7AqbMqJzEpMmWDNaslOtL
 Jk/Xw3ZarfDeqGYtymLHfDFF/6YwmSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_201539_985112_B01F3E06 
X-CRM114-Status: GOOD (  22.04  )
X-Spam-Score: -2.8 (--)
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

On 11/18/2026 11:42 AM, Haoxiang Li wrote:
> If the CPUFreq hardware fails to become enabled, mtk_cpufreq_hw_cpu_init()
> directly returns -ENODEV without releasing allocated resources.
> 
> Reuse mtk_cpufreq_hw_cpu_exit() on this error path to clear the hardware
> enable request, unmap the registers and release the memory region.
> 
> Fixes: d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case")


The same commit also introduced a leak in mtk_cpu_resources_init():
when mtk_cpu_create_freq_table() fails, it returns without iounmap()
and release_mem_region(). Could you fix that path too, as a separate
patch in a v2 series with the same Fixes tag?


> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index 2c57371ad502..65f15fe935db 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -289,6 +289,18 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
>   	return ret;
>   }
>   
> +static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
> +{
> +	struct mtk_cpufreq_domain *data = policy->driver_data;
> +	struct resource *res = data->res;
> +	void __iomem *base = data->base;
> +
> +	/* HW should be in paused state now */
> +	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
> +	iounmap(base);
> +	release_mem_region(res->start, resource_size(res));
> +}
> +
>   static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   {
>   	struct platform_device *pdev = cpufreq_get_driver_data();
> @@ -321,6 +333,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   		if (!(sig & CPUFREQ_HW_STATUS)) {
>   			pr_info("cpufreq hardware of CPU%d is not enabled\n",
>   				policy->cpu);
> +			mtk_cpufreq_hw_cpu_exit(policy);
>   			return -ENODEV;
>   		}
>   
> @@ -330,18 +343,6 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   	return 0;
>   }
>   
> -static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
> -{
> -	struct mtk_cpufreq_domain *data = policy->driver_data;
> -	struct resource *res = data->res;
> -	void __iomem *base = data->base;
> -
> -	/* HW should be in paused state now */
> -	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
> -	iounmap(base);
> -	release_mem_region(res->start, resource_size(res));
> -}
> -
>   static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
>   {
>   	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);


-- 
Thx and BRs,
Zhongqiu Han

