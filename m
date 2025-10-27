Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D55CCF9EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWAM/1l3ob/3LqSmNYM1Kzzm3JAMnpjQt4pTVWbHtSU=; b=DolqXzF0RH2wBTCB532oOpNMsK
	P7FZnKmsiikagEa7MTAjeM3jxLsFRcHjlRCBmmPSnmaRxQJ9t/Xz9O70ky1A4Xmy2MpStk2bv2DqG
	1itr6wUqFBo1XeBFt/5pL6TgRF9TVcjJ/haAr0evd++OuTvcTXYkGXYRy7DTMQq01BsStK0A1V2V7
	RXkk2vQkDvxUWojVig7HaLcjyG5f5eNIM0WhgDXKjl6iDSanRWr2gKn1AAnlawxwl4Z6xgV9aZAvj
	l/YkqphceLdteyZrWomPUoMYQtPiXm5kcxG7umTnrOL9NpRvf9oW6TLztkqf9hxGVWeOEPbWhXxVK
	/dH9xBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLon-0000000Dp0H-00dr;
	Mon, 27 Oct 2025 11:55:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLok-0000000DozC-1j7Y
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 11:55:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8OGh6858653
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Oct 2025 11:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWAM/1l3ob/3LqSmNYM1Kzzm3JAMnpjQt4pTVWbHtSU=; b=cNRPH67Z1NyjlP86
	M3mT59D+2BjMtjmwTDK4eOBY5D48EYOjfmoKt45lQ91fdljCtvuHEmWbjcvu0jKN
	qvGFPVMEJobVnMbfmWfgwW/0VxH+7AuzzTvZb4skfqOMI9qISCFUwlnEbz43bGA0
	//bJ4mw9Z0bu2PkyBcRWpQQmMa/U+MjAxRu/a5C0mhUp5qezSrfGK7//NzvQHkTj
	Zwdaqj9sY23LIXHqbOk/gx7gjt+PSV8cGkioWYe/BsryN8ruQdJY3dkBCzvrLyQM
	CTfdvPZ/yDfz8eOrfR8Eni4x/ELomNWnlFqbmEV2fZH+9ng5aIdxy4ZsYiGJzqaD
	8Pp1Uw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb4gry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Oct 2025 11:55:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a153ba0009so8667869b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Oct 2025 04:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566115; x=1762170915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWAM/1l3ob/3LqSmNYM1Kzzm3JAMnpjQt4pTVWbHtSU=;
        b=PNZ+tf7Ibg/JOED7pkboazum6ZFlVGnbRxIq+5uPVEUn0oIOOEOpfb653Hr9lbJ7at
         eILd78j6kIEJ2MeyFXowZ5ID3qOBkWtBtVp6GwduzEUomJ58eD/H/3Ektu2t20lfSKxD
         YXqD0grL5hj98Sb+GKSHExq5z/sPDekxnCnc/62bfN9+cD2IMnMFgMtFprH0meSaehb0
         II8qNG4AIv6QnIvOlExKzFSzQSlZ8NysDId2W8o1XRQLry5pdfMwg+wTcJawOLGw0A3a
         piklf2cfVCZI3MupSjWWGBXZfK+4EGoDEh+T335VLE8dTi0/ZwTaJbhcwyu5gZUbk7T/
         LUWA==
X-Forwarded-Encrypted: i=1; AJvYcCUKty1L9PDDgwI9KghYPOULTiVWOh/GX3LWvPpoNNrKkdam+zSSsTIIe4PAAThM8nBzDucEo092Tv7xMx/C/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfpIQmEtO/arvKMSlWwqM+l2SLpS78NoQLhannTrkpj9u9rlWW
	UcxmlPu6UX5vWXckiQOa+soZABpVvpeUV2VeR/qKT7+cOyu6Rht6IxfFP54dT8Onf4aD5VUaiB1
	TOkdK5xG/WDS6R8T4rGmfgQn0ZYDLjUkcbZmImSnjsd3eSd69yPWBMOvNMiau0B0eXxw1yvWd20
	0=
X-Gm-Gg: ASbGnctc+XplelPOi4nPXUbQZ2DIPrTeBBTL9YXM2odLoDj9ztF4Rn8biW7hrDncDEy
	7KL2AsbcrDf8RiPyXi60GWoe9Z6Xj3MBcd5QhiDqIg8BefotnNswagpQoRTaXAfmG/HqKzjGByw
	FBv6fb6rC8obtwXoKoakMpksHZ7loP0pDRg25u/8aAmHmiP7XvGnPopDvdf7f939jOw36ln5GxC
	OqVHWPQd9uI+kNuF3OwsarQzrpFErfopwyQXRW9S+icdFH9uHdkJl9Q11guRnev0UNZKpQzxvD+
	Ka4gZRYclezHPimW6ORbJowE/BMQIXIoI9Xi330Q7CjqCaGpLIIPmqPhPaIGuWDnXNM51fNTvn9
	FOpEykLTTTS7XNeiB5wq7xtsWOuIXGS7dboqkxC7KX81Qg1WXg3vDAjUj/WA=
X-Received: by 2002:a05:6a00:1803:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7a28674d25emr12047811b3a.7.1761566115157;
        Mon, 27 Oct 2025 04:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGGkAcnkXHKQF/eHcUEuUAMP8k34i7aRfOMaE7hRoA4fzc286ygZftSP3+bEdiIYw6mSvSXQ==
X-Received: by 2002:a05:6a00:1803:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7a28674d25emr12047778b3a.7.1761566114705;
        Mon, 27 Oct 2025 04:55:14 -0700 (PDT)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4387cbf00sm1985642b3a.2.2025.10.27.04.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:55:14 -0700 (PDT)
Message-ID: <9d6d7641-d2c0-4629-944c-1bb88eddc486@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 19:55:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: change the snprintf() checking
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <aP8agyKj73bLZrTQ@stanley.mountain>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <aP8agyKj73bLZrTQ@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OzwJCd3wWO_sw1Sgfn0YTVvIL1P9Wwfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMSBTYWx0ZWRfXyC7QxN5SuMwO
 mVm16lMk+3+vZJ0iP3sOLGzYPZ/SoM0sOTrKwxTsqJc/L99mVShzdHiB04muDtV4bGYF7zAcy8M
 A730AfkHEp+5x/7ITmqFn6OJCN3HmI0n7llTkUVjoHxizNcgFAS08Uq/bD2Qb0qG2HDOPOAT6da
 AcbD/rbRRg+tcUYfT0+ZjqowoXVms2jp+BpRjJZQIX4unIhbtBNtsctmSl76sMBHNDOf8k01d8H
 CnnL2pFo2gWN3LXUjpojAM7gaUELUWjH+t1fgc5wIQjMeumR6/bPzpt79gmCsq0cZje5NXMbhQo
 N8rGJ9i9TAaMc6tC/hjUkjbS48DHsRdTzbbfQiKtHZUiCPM9fAZX7n0YAwwJtZ5w3qLZPng5M68
 1TUgzwwdloFwK/Epvm+wvZ+x/ts30Q==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68ff5da4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9rX-9eNafPfUpquPNkAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OzwJCd3wWO_sw1Sgfn0YTVvIL1P9Wwfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_045518_447842_36AD0F44 
X-CRM114-Status: GOOD (  24.72  )
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

On 10/27/2025 3:08 PM, Dan Carpenter wrote:
> The snprintf() calls here work but they have several minor style issues:
> 
> 1) It uses ARRAY_SIZE() which is the number of elements in an array.
>     Since were talking about char that works, but it's more common to
>     use sizeof() which is the number of bytes.
> 2) The printf format is "%1d".  The "1" ensures we always print at
>     least 1 character but since numbers all have at least 1 digit this
>     can be removed.
> 3) The kernel implementation of snprintf() cannot return negative error
>     codes.  Also these particular calls to snprintf() can't return zero
>     and the code to handle that zero return is sort of questionable.
> 4) In the current kernel the only "core_id" we print is "0" but if it
>     was more than 9 then the output would be truncated so GCC complains.
>     Add an "a >= sizeof(scp_fw_file)" check for output which is too long.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
> v2: The v1 introduced a W=1 warning because of the truncation issue.
>      It's a false positive because GCC assumes that "core_id" can be
>      every possible value of int but actually it can only be zero.  And
>      also generally, in the kernel, truncating is fine and it is fine
>      here too.
> 
>      But let's use that as an opportunity to do more cleanups.
> 
>   drivers/remoteproc/mtk_scp.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..db8fd045468d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,11 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>   		return ERR_PTR(-EINVAL);
>   
>   	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp_c%d", core_id);
>   	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp");
> +	if (ret >= sizeof(scp_fw_file))
> +		return ERR_PTR(-ENAMETOOLONG);
>   
>   	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>   	soc = &compatible[strlen("mediatek,")];


-- 
Thx and BRs,
Zhongqiu Han

