Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8F5CCD1BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=; b=Z9VwQPv6Bj6m+nSPL3REM1XJqz
	YEn+6vo3xFN8T+52l6pBR0zLlwYRe+R58/lehwszM4BCBmHDpDIus5DoRtLOcxXPVEmUMZAOu6GYf
	34vz0vB5RSFHKLtP6FVnL3rJXKwYurD2GEQ+04Fv+rwfp3Kr444P/YKHK7VZrenTGVdFAnXhvVq9G
	hQQqTZZnoLISGTduvoUakXAsn7uikcx8iVEvyTgsLqvlR2CUZAplNULNKQQkat0/fr3sjP4Oiy0/K
	rN2MaEDkBzQH9OJheaS9yK/bgiDaY2WIZh+WJvKUMxfQxj7ULt5EOb5tTiBx8YaUrMDAwuEvKIhHC
	/s/s6UkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsHk-00000005pXS-1WZx;
	Thu, 23 Oct 2025 10:11:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsHh-00000005pWV-1k4V
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 10:11:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6uVBh023961
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 10:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=; b=PdmkTEjhYy74Piku
	o/rzY2pZzaSnTfurWYJ+nMcD+Z2vSvrjfeWbD4+vNPJSsQoWkHb1imjoSeyPfnl5
	f06t8xeTjJthYrgXjJW5Y2oMwqKVvH1dlT+3z0/llH9F+5ObN55oCURUAni5hd4w
	fDl7g98uzQAGvqMzhFcFSIm2LFrqhFGI5kdKNFKOr1n4nufjciODTzfkQ37ioaUc
	dWMAc6/JSX53oeo+AzNXxb5VmZiAFFDOg2snxx3hVVUpxykogKesbpHcfCM4YSDF
	F5dmXoqOArVJMPvrvgTR6Saf1pmRHf05Vpzkis+de7/jvmuz59NZaj0F6iL6/kkZ
	phdTnA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w87yn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 10:11:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6a33319cb6so474085a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214262; x=1761819062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=;
        b=X4ySlhJncnbHYV+en9CA0up00Q0EQQZ6/paxZc1q567FAEBLflzAGUmyV80mRTFSdZ
         qKPDlomLK7Yxzm5LyuRkxU8MORJ6NN+w21pd9wM9T14FWt2W8gWWKkPCKaUqdfJASJp/
         JBRS7qaDKeU1UGAIi6bPtu3mZh5kD4UqleKQXu5APaCCcqYkesLRdohsno/Kq9t8opuS
         QY6VrW6vlHaeU/YWrufd0FmcjNuMgY1+tudPyDfaOQiLxUPwtnVfh9OeNRxf4SijtAwo
         h70F9gZreBeicWxI3/fVP3mb15Z4rnDaODJ8KQf0FLJwHA/ZMCzTO7z9fpPjQWIjH+qP
         HoWA==
X-Forwarded-Encrypted: i=1; AJvYcCUTRupHoQPJpECdVbwvzLingAfAxzmB3Ah0zs7SFayn7XOSBC+zbD3ZnhnC4Nx2Xp0MU1rMVOrQBClh3rrRXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaIBxWZh8Wos18SIqXA4CTqwixE/ziTm8STmAob3qJchR+r5mA
	MFTufNTOV6NnS2rEv5rqbsoqBvyxSr3aTtVPebKu2eRL52j/nIAaN7OiqboR0tYju8jZf17MOfd
	T/bUWhPQHbaOPgrO44AweyhvURM8scuSutTKhFzyjwNSp2Dzf1jfdfantkK4lyssSQGNtl8bhfd
	Ue8hcgiTgyBg==
X-Gm-Gg: ASbGncvBjkcWzGJoTRQ7nZbIRCRCup3UUg39OYoiaxwJYKA7BIdtq6ILPcUSoKNeOtS
	tu4Ea6KNsAgbFH7dyOndbmWYbiW6UAw48HcOETzsM4Uc0gxYhmT9xFIOPpt2hUFplJJvmRlRcqx
	9SIjLHvXEc1m6tS1Y8oEfudzp2yzdw2+fohMHDrR+cqiPjtqKR224z9TVSfSkbhPkCAB5LBPyb1
	TiBqNIsWiWoyJWibUUETPd1EOpprU6e7CArw9BPZX8XNe1bE1cZ4hlrR3zgS8faa9ZmuUdqLPSv
	nVrORvUSzQPmJcCJg6Jz+U67WbTS/f8XE+lp5ToyByhwRocTTNNaMg8Ehorr7jk2GhA+cxz1Kl7
	YlU+xO2OXsXn/6AyGg1orPH5c6uYhAVIb8QZTxNjtEoJo3Td5zjbyJDpn3IuFfkKKLw==
X-Received: by 2002:a05:6a20:9186:b0:334:7aae:c43b with SMTP id adf61e73a8af0-33c600ad4c9mr2446151637.20.1761214262562;
        Thu, 23 Oct 2025 03:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFy40H0MW5NZRQSkKA5Qh1AhBvaXks0B6kqhFazrM8IjeVicGOuL4gdISqwRAuDa2V1gGJ8w==
X-Received: by 2002:a05:6a20:9186:b0:334:7aae:c43b with SMTP id adf61e73a8af0-33c600ad4c9mr2446115637.20.1761214262075;
        Thu, 23 Oct 2025 03:11:02 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb9c8asm1654060a12.9.2025.10.23.03.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 03:11:01 -0700 (PDT)
Message-ID: <f8c315b9-acf8-4085-ab10-0d6e60ef7c39@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 18:10:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mtk_scp: remove unnecessary checking
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <aPi6eBlFLH43A4C0@stanley.mountain>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <aPi6eBlFLH43A4C0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX7rkF5G5+EPIP
 tfGXDZr9/P2J8hQ9XcwEgQ03YH/NpvGDVOIrgiWcsQZ8SDB4ofO30b9iujzUE33ASs9IzCRojkj
 GEg7N32wGTxmnZN/l0e9FibWjd5uy2ldBuMSoC4dyG2Esih4F9oF7J8kWriPgO3Bn1+ywmIM/Rv
 cviFoCrjl9Xjzi5yyTIdLWMp624BUbGiOg+Xub3jweSOj4kwZZ3rCC8gTnngtQe0mW11rp7T4vZ
 k7FpbBogfv38qTuf8s9qn/b2Jqrkv9OYTr1StqyRuKp18RTK2jGnse5emPLYOIOWqJMsWJIL+tz
 wRvqVGy7kELnz45HEldG2UDY1z7yKIRSr0IGzPCZW6q0t61DcFe3/Y6BajlQUuD3VLb5Xxd8Ad6
 Q6uKMSpipGAZN0WMs3eAGzxjiHksFw==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f9ff38 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=IDcGV2vxZRipFm0qDp8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LRjmWo4vX-7oyfG8V5g52co1A0UP3jzw
X-Proofpoint-ORIG-GUID: LRjmWo4vX-7oyfG8V5g52co1A0UP3jzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_031105_580178_C2D5DE53 
X-CRM114-Status: GOOD (  16.61  )
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

On 10/22/2025 7:05 PM, Dan Carpenter wrote:
> The kernel implementation of snprintf() cannot return negative error
> codes.  Also these particular calls to snprintf() can't return zero
> and the code to handle a zero return is sort of questionable.  Just
> delete this impossible code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/remoteproc/mtk_scp.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..9b624948a572 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,9 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>   		return ERR_PTR(-EINVAL);
>   
>   	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);

Hello Dan Carpenter,

The patch looks fine to me functionally. However, one concern beyond the
current scope: if core_id >= 10 in future extensions, the
snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id) may
cause truncation.

scp_add_multi_core
       |
       v
scp_rproc_init
       |
       v
scp_get_default_fw_path
     char scp_fw_file[7];


To guard against this, maybe should we consider adding:

if (ret >= ARRAY_SIZE(scp_fw_file))
     return ERR_PTR(-ENAMETOOLONG);

or just expand the scp_fw_file[7] array?

Thank you~


>   	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
>   
>   	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>   	soc = &compatible[strlen("mediatek,")];


-- 
Thx and BRs,
Zhongqiu Han

