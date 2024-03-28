Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5740EC54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yty+7IW9qqNwqwNJtGSHLkt6EXl35mjOJg4EN6IRHIU=; b=x926WSlyL+7fDMQ5lcl5qQyC1c
	bXFmPy5OD5iG7Owg9jpJdSJm0R9xAX/sTrVjKUzZbF3BtlHUTkPyRqP0NjGC5DZfQg3ybEOCseH8e
	2X9iEQGYQkKL02DMPhaaD58tEWh6vteSo6ufVIQ3vmRxuosqVcw9Q4vR/0HNuqF4+o8K4rgwG8/FY
	i+37udJ6/Jot2f882d0JAvquc60NsK4oOCrKf0gm1g3ngYxCsuJJ+tH2IEVSRM5VXE1mlENlMQPNU
	MEK8W6wCXHV34TVyfipD+UlPyG6h5/Md4tVY5ZLLUWS1IvEvKQdowKWbk2h/v+aMlyaqekO4TLAa+
	XabgwGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplWl-0000000DBYa-3bEt;
	Thu, 28 Mar 2024 08:54:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplWj-0000000DBX0-0tcC
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 08:54:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34261edaf7eso438932f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Mar 2024 01:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711616062; x=1712220862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yty+7IW9qqNwqwNJtGSHLkt6EXl35mjOJg4EN6IRHIU=;
        b=Pxohq1KR9NvH/Lhil6liQYjDmveQPbxRxhGA/pZl5eedVhbsSm0EH69qjAOudS3Ugu
         QVfijrEvv7sNuJNgD3sJYgXZGYGVqqKkY6nj+R35AJEbLQKuTLnDa/H27WsDagY+ZVdz
         BzdOhRimTHjIa/DYHBo12NAkhAt0whbo0EjhD7hTpMxCWOUAA8jza4Pi4dxXqo4IXupz
         mGBkbJNqS+KYxdTuLWU5gBrgPRgt3bMEkCwo6GOZ+pvGdaTezTRckvcVd0XzyhEaR33o
         pQYPSO5zjOjnKGgm7y4I3ZZ93Soji0qSZ+gqkVIyJlsDN6OyLqRHcBKbibFKPFOXjEwq
         hqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711616062; x=1712220862;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yty+7IW9qqNwqwNJtGSHLkt6EXl35mjOJg4EN6IRHIU=;
        b=HGxjlXzvs/ZxlhAsTuBd7mg3pqJ+5yDKjXoUUGwd/ei+dVXHrPjFs52isNgOcgys/y
         e7F82O7qEbsQsbq1XIoNTAVGaTU/b2oAxpeXXr6epAbbog+hsefzHJ/GzvON++Ly1ELE
         b7Vpwc5Gy2sOXAP6DbU05EOK7N/hcj5J4TzNiPhgnVSFXhsLmC9g+AJOoA3VlzbBvK3O
         dzID8TNpn/E39qaAp6QB0k9gGMcMIOTnRGGoZ7+J2glAhf21mzmN5D9tmZxnE5IU6ugI
         bmv2ODxWKxGm4/XKKRRl1CW3MEuDf34o8Y79po9Ij+jH6XUN1pFOkmaAzhUnHQ96lPz/
         4cfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Nk26rwdimlFJFEmItcpbj2nUeFqYShVx5nFWc9anJb7vGXWUY5vL9zXzwvYfMx4WTAl0ypIsA3vCiZtTaBGfSK+MWLI3K7VlT6MwQL0DT4H5
X-Gm-Message-State: AOJu0YzYu3zLHjLoCNmQCY4UV3+m+5NHD3zXbgl+Xhz+xN/Y9mqE5H8p
	qrODrD5hBUCA/KLgdJ4mqubru/8YCp9giXdoyXBIhTvkla5xHTJR9zqHqrxUfVY=
X-Google-Smtp-Source: AGHT+IGhNmd4eosIUt8hQTsfXrAFZtWrwXc4JyihDC4LrVrFfCvzlvTm8CR/aKVaG8qZSxA9zhE01A==
X-Received: by 2002:a5d:6651:0:b0:341:bdf0:f86e with SMTP id f17-20020a5d6651000000b00341bdf0f86emr1497687wrw.67.1711616062183;
        Thu, 28 Mar 2024 01:54:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6306:1c7a:72c2:892a? ([2a01:e0a:982:cbb0:6306:1c7a:72c2:892a])
        by smtp.gmail.com with ESMTPSA id g1-20020adfa481000000b00341e7e52802sm1169999wrb.92.2024.03.28.01.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 01:54:21 -0700 (PDT)
Message-ID: <56f4f0eb-7c6b-459a-bf90-1493e14fc106@linaro.org>
Date: Thu, 28 Mar 2024 09:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND v6 4/5] spmi: pmic-arb: Make core resources
 acquiring a version operation
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
 <20240326-spmi-multi-master-support-v6-4-1c87d8306c5b@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240326-spmi-multi-master-support-v6-4-1c87d8306c5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_015425_313198_3A966DCB 
X-CRM114-Status: GOOD (  25.18  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/03/2024 17:28, Abel Vesa wrote:
> Rather than setting up the core, obsrv and chnls in probe by using
> version specific conditionals, add a dedicated "get_core_resources"
> version specific op and move the acquiring in there.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/spmi/spmi-pmic-arb.c | 113 +++++++++++++++++++++++++++----------------
>   1 file changed, 70 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 38fed8a585fe..188252bfb95f 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
>    */
>   struct pmic_arb_ver_ops {
>   	const char *ver_str;
> +	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
>   	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
>   	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
>   	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
> @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
>   	return 0;
>   }
>   
> +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> +					  void __iomem *core)
> +{
> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> +
> +	pmic_arb->wr_base = core;
> +	pmic_arb->rd_base = core;
> +
> +	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> +
> +	return 0;
> +}
> +
>   static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
>   {
>   	u32 *mapping_table;
> @@ -1063,6 +1077,33 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
>   	return apid;
>   }
>   
> +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> +{
> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> +
> +	pmic_arb->rd_base = devm_platform_ioremap_resource_byname(pdev, "obsrvr");
> +	if (IS_ERR(pmic_arb->rd_base))
> +		return PTR_ERR(pmic_arb->rd_base);
> +
> +	pmic_arb->wr_base = devm_platform_ioremap_resource_byname(pdev, "chnls");
> +	if (IS_ERR(pmic_arb->wr_base))
> +		return PTR_ERR(pmic_arb->wr_base);
> +
> +	return 0;
> +}
> +
> +static int pmic_arb_get_core_resources_v2(struct platform_device *pdev,
> +					  void __iomem *core)
> +{
> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> +
> +	pmic_arb->core = core;
> +
> +	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> +
> +	return pmic_arb_get_obsrvr_chnls_v2(pdev);
> +}
> +
>   static int pmic_arb_ppid_to_apid_v2(struct spmi_pmic_arb *pmic_arb, u16 ppid)
>   {
>   	u16 apid_valid;
> @@ -1246,6 +1287,18 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
>   	return offset;
>   }
>   
> +static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
> +					  void __iomem *core)
> +{
> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> +
> +	pmic_arb->core = core;
> +
> +	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V7;
> +
> +	return pmic_arb_get_obsrvr_chnls_v2(pdev);
> +}
> +
>   /*
>    * Only v7 supports 2 buses. Each bus will get a different apid count, read
>    * from different registers.
> @@ -1469,6 +1522,7 @@ pmic_arb_apid_owner_v7(struct spmi_pmic_arb *pmic_arb, u16 n)
>   
>   static const struct pmic_arb_ver_ops pmic_arb_v1 = {
>   	.ver_str		= "v1",
> +	.get_core_resources	= pmic_arb_get_core_resources_v1,
>   	.init_apid		= pmic_arb_init_apid_v1,
>   	.ppid_to_apid		= pmic_arb_ppid_to_apid_v1,
>   	.non_data_cmd		= pmic_arb_non_data_cmd_v1,
> @@ -1484,6 +1538,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v1 = {
>   
>   static const struct pmic_arb_ver_ops pmic_arb_v2 = {
>   	.ver_str		= "v2",
> +	.get_core_resources	= pmic_arb_get_core_resources_v2,
>   	.init_apid		= pmic_arb_init_apid_v1,
>   	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
>   	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
> @@ -1499,6 +1554,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v2 = {
>   
>   static const struct pmic_arb_ver_ops pmic_arb_v3 = {
>   	.ver_str		= "v3",
> +	.get_core_resources	= pmic_arb_get_core_resources_v2,
>   	.init_apid		= pmic_arb_init_apid_v1,
>   	.ppid_to_apid		= pmic_arb_ppid_to_apid_v2,
>   	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
> @@ -1514,6 +1570,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v3 = {
>   
>   static const struct pmic_arb_ver_ops pmic_arb_v5 = {
>   	.ver_str		= "v5",
> +	.get_core_resources	= pmic_arb_get_core_resources_v2,
>   	.init_apid		= pmic_arb_init_apid_v5,
>   	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
>   	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
> @@ -1529,6 +1586,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
>   
>   static const struct pmic_arb_ver_ops pmic_arb_v7 = {
>   	.ver_str		= "v7",
> +	.get_core_resources	= pmic_arb_get_core_resources_v7,
>   	.init_apid		= pmic_arb_init_apid_v7,
>   	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
>   	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
> @@ -1565,16 +1623,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>   	pmic_arb = spmi_controller_get_drvdata(ctrl);
>   	pmic_arb->spmic = ctrl;
>   
> -	/*
> -	 * Please don't replace this with devm_platform_ioremap_resource() or
> -	 * devm_ioremap_resource().  These both result in a call to
> -	 * devm_request_mem_region() which prevents multiple mappings of this
> -	 * register address range.  SoCs with PMIC arbiter v7 may define two
> -	 * arbiter devices, for the two physical SPMI interfaces, which  share
> -	 * some register address ranges (i.e. "core", "obsrvr", and "chnls").
> -	 * Ensure that both devices probe successfully by calling devm_ioremap()
> -	 * which does not result in a devm_request_mem_region() call.
> -	 */

Can you explain in the commit message why you remove this comment ?

>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
>   	core = devm_ioremap(&ctrl->dev, res->start, resource_size(res));
>   	if (IS_ERR(core))
> @@ -1584,44 +1632,23 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>   
>   	hw_ver = readl_relaxed(core + PMIC_ARB_VERSION);
>   
> -	if (hw_ver < PMIC_ARB_VERSION_V2_MIN) {
> +	if (hw_ver < PMIC_ARB_VERSION_V2_MIN)
>   		pmic_arb->ver_ops = &pmic_arb_v1;
> -		pmic_arb->wr_base = core;
> -		pmic_arb->rd_base = core;
> -	} else {
> -		pmic_arb->core = core;
> -
> -		if (hw_ver < PMIC_ARB_VERSION_V3_MIN)
> -			pmic_arb->ver_ops = &pmic_arb_v2;
> -		else if (hw_ver < PMIC_ARB_VERSION_V5_MIN)
> -			pmic_arb->ver_ops = &pmic_arb_v3;
> -		else if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
> -			pmic_arb->ver_ops = &pmic_arb_v5;
> -		else
> -			pmic_arb->ver_ops = &pmic_arb_v7;
> -
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   "obsrvr");
> -		pmic_arb->rd_base = devm_ioremap(&ctrl->dev, res->start,
> -						 resource_size(res));
> -		if (IS_ERR(pmic_arb->rd_base))
> -			return PTR_ERR(pmic_arb->rd_base);
> -
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   "chnls");
> -		pmic_arb->wr_base = devm_ioremap(&ctrl->dev, res->start,
> -						 resource_size(res));
> -		if (IS_ERR(pmic_arb->wr_base))
> -			return PTR_ERR(pmic_arb->wr_base);
> -	}
> +	else if (hw_ver < PMIC_ARB_VERSION_V3_MIN)
> +		pmic_arb->ver_ops = &pmic_arb_v2;
> +	else if (hw_ver < PMIC_ARB_VERSION_V5_MIN)
> +		pmic_arb->ver_ops = &pmic_arb_v3;
> +	else if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
> +		pmic_arb->ver_ops = &pmic_arb_v5;
> +	else
> +		pmic_arb->ver_ops = &pmic_arb_v7;
>   
>   	dev_info(&ctrl->dev, "PMIC arbiter version %s (0x%x)\n",
>   		 pmic_arb->ver_ops->ver_str, hw_ver);
>   
> -	if (hw_ver < PMIC_ARB_VERSION_V7_MIN)
> -		pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> -	else
> -		pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V7;
> +	err = pmic_arb->ver_ops->get_core_resources(pdev, core);
> +	if (err)
> +		return err;
>   
>   	err = pmic_arb->ver_ops->init_apid(pmic_arb, 0);
>   	if (err)
> 

With that added:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

