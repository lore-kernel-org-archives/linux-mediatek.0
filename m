Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69FA107BCFD
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Mar 2026 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=; b=AnyCS4s/EnSN2Fr4Zf7JFO7TR4
	RPn6Qoi0iQeWZIHScuG3a59FdxP7dSn6C+5Pxf2Jd5t+oO6P6uxRDoxpr70RwxU9VHkddV2t/fW4k
	1yPSG1cD/3+3yMXtqQ19DMPadP/nS4xIvQqBf+O1wYABkbZBPsTxaoFxT7R1U7ylj3ib0Q3hnTTY4
	oaWIKJ2OnLq2ojVskEodoAwiciWvlDLo01fP5uAMRT57rm8P9+qcf1WYnMFpPdu/Z6b0kLqUy5fqP
	8bn9bnJhKTeM3F4ibnBz4oubNj62SO5/OuAvMB1luEwrTDhDjW/AjFdJy+thtLSJ44sjREtF2mo+B
	T+dyI05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JJb-00000001a6a-38WO;
	Sat, 14 Mar 2026 07:21:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1JJY-00000001a5v-3l11
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Mar 2026 07:21:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E5Qbbo2995861
	for <linux-mediatek@lists.infradead.org>; Sat, 14 Mar 2026 07:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=; b=pjQdafnHGkZ+aKVc
	NdCKU6UoGRmo30NPqRauAzKQypsIDLgBGDrHWssiH8b1R80YvABqEinbEMBBWawZ
	jgAgkvb08v1XTTFuxikbLKktTL4frjF9Oi1T8J6VMi45tWN1Qlwv/4ZMLhhnI4sW
	hiUm5XfFAFqcnQX644xm8YJUkEZlGHsTL1EnhCdv/VJcpzhMJBHwXELJaGFXRgmS
	NM1X/wRj7GV35pfkp7Z7h6Zm0UxN9pJIzWil79wK9sPh+2XUM3JqG1/bf5Q0bcmP
	Bpn70+1aSiCG2JlNTR2u44goUcEBhsqvekqI2iwkW8bB9BGACdBvZLSkPvPVDzB9
	99DW8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5gaxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 14 Mar 2026 07:21:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae405e95f5so34315865ad.2
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Mar 2026 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773472894; x=1774077694; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=;
        b=Zcr+h6s1F7q7PuGup/7BxUcQZOlXaPFJdaGBt0YpqzasTReJuR7rdI3mgtZ+tC5D7b
         naPDD7cbu+EeEgnLdq0vC5oMKl7ZmnISShFwAcygjCDze8+euZvNM2ULEKDBrOSp8GpI
         5FHBDgMtOq3skCQih3XcrdZkhDDEkqNQfO9W45UIu1Ckqd6f0BBwA18pStBfJzdX3nIX
         L1WV//3C5Hl64pFdri4FvSScxyeYy8JjnGL4RcGPlRWNoPj1r2c9P/S0/29JzAte5Cjj
         rQhdrNO+Cx8Yq7kyvTx7Ki5TmHL67guDgdLP5xxKK1rsNZnnIG3UKVYLtWqFVIctmh7B
         meFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773472894; x=1774077694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU2LBcgAvCPPWBcn4VVnnvgq9slBddM7xfCczZ90R/I=;
        b=SuJ9RpZ/o68baMJEIjgAL+64v44wB66WbVGle+MgJfKaCfGxNp6ZDg7zFX6zxtcWPr
         aUcxHnafX3jHVmv+1ACGzEV9Q0XSIaNmCIAxOwINeapb2UORtghtPy+MMR0vS+9bGmh/
         90CmTkL+qsIywzoeDxOvdqvstllVqxrk92jbUCvlJWOVPpfXWIuGDs7i9r+S6Ilq3RhU
         5AyVv/OG4AvHpggPg7MI9SnuEsb7kKK/fQxXA0fBcJHUm1dxN8IleTqlb7/WzolfelXB
         cWAlyFAlbtDp90qEIbSIQ4N5K2SBlde8iaK+PC+I/JLIRUE3YM6sSPwbjnde/Dlx3ylO
         l+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGFoyXcmh3oPjfUGu0ezS1AUd07PSwCs8ljDDP4ynW2Zx8ZM07PtVw4FB5RKHbS/mH3T3GA1QvjHF2G2ussQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/MGDUgzGeC3JcyJmy4Ycvi6Q3WcrXbFvGgpvASNH+jjadzP9V
	iIuAsw6FVzT70PLxlX266lQ2c3A+vgBu49kOUmcFJInDYeV/FsNeEWVs3UlEA+HDWGEyWTOvBIq
	KBe1jcegv+QOPxwHGGvOIGclK46A2a2/h6dNKIhLMzumU/II5siyUKhc4yMUu/MYxxAJlWidLZ9
	8=
X-Gm-Gg: ATEYQzwvLhsmaaDcXvma61r5yeOP67C7tFciyrvvw7hpIyCS1zHL3CIoDZEwB+mL2kF
	yMeVQ2FWTbXUO776feB3jfbHssW8LLt44dS6zuS14FNStjNE4IYZZA/JG7OWnLcwD+kQzTsgfNF
	6iWiHMbrnQppQGrkIH7FvpP3WUhdwOZANhv66okxBubexpXjKxT3Im95KqotR1T5hi+gsKbD0xq
	eHyZJtOvYv67XMdCIYUcjnv1XLddpKGtfLd6uuPSWh1Ra87skfQW3O8yGO4O8h0goHA9VfeXI6Z
	tmoy7IDbd4Qq+uaxJuosKxKRRnb+DzlgrNvXo8j97nWt5UvSPtyc0gJvTnqxTqFgAxjhIu4jLqM
	0ItV20zDwOUpk7Ob5N614Fu44PX6IYSRCJTH+Hw1DFQ2c4gaiiSaGxbrZcuR3Q/qe+bGLu/3QGv
	Sifg2m3xLzNg==
X-Received: by 2002:a17:903:2b03:b0:2ae:557e:1f75 with SMTP id d9443c01a7336-2aecab07540mr57768075ad.29.1773472894173;
        Sat, 14 Mar 2026 00:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2ae:557e:1f75 with SMTP id d9443c01a7336-2aecab07540mr57767635ad.29.1773472893643;
        Sat, 14 Mar 2026 00:21:33 -0700 (PDT)
Received: from [10.133.33.24] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8453cdsm41005825ad.84.2026.03.14.00.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 00:21:33 -0700 (PDT)
Message-ID: <7b40df1f-1c53-47e9-99bb-13d6d030eeaf@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 15:21:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
 <20260308151409.3779137-2-can.guo@oss.qualcomm.com>
 <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <fff6bc07-169b-48aa-a6c2-0d243bad0d82@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fHFzH5tyt5rMTUauXlf2g5yq_2IEVUBa
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b50c7e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=CqDDh8lFt03Jwv5G6gcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fHFzH5tyt5rMTUauXlf2g5yq_2IEVUBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA1NSBTYWx0ZWRfXwn5Wkd1LhRSi
 pP/xG/y32W6ZV5HN22wovSQXsMf0S/yJ4RVbQsUm7a1HCr5vsMJgQPmuWl7d3xuT7ShjPTBoHWH
 o46TTw/MV3I8Rik9fejb1d2YEiFQzhR1FPte4RY7ycCgYe201SEnaPwf384ML9MMvlzG/tfz5VW
 I0q/jPXS9WP9XcVIw/zEPsZKZyspzApd2ZGbgV62sdLohPUrgYToe5Et1g2vq9lsqI0Rhw2f0Ep
 8/jTaGhWVCuzxwOVz+yVocFYt0j93zKnwpLnVUuqScwknvuM6IIbRIFOyHt2L9GcTJI7wDEGcxc
 jfpf+UYz5OyH4XlrXRw3ugcoNR8J8oraAqeFTTrJeqTnHBVZUwChu1upNNvqVrsvnHwVRT67l7O
 4saWk5Lt5Gjq9WqAsGEpd9WX0dgB4X8+YY97S8296gB4Upp/Qp1dbBMnWlXHiyOh4nGEoBXXneL
 CmWAjCZS7vuij3LIyvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_002137_002094_486B377B 
X-CRM114-Status: GOOD (  20.28  )
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

Hi Bart,

On 3/14/2026 6:09 AM, Bart Van Assche wrote:
> On 3/8/26 8:13 AM, Can Guo wrote:
>> +static int exynos_ufs_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                     const struct ufs_pa_layer_attr *dev_max_params,
>> +                     struct ufs_pa_layer_attr *dev_req_params)
>> +{
>> +    struct ufs_host_params host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        pr_err("%s: incoming dev_req_params is NULL\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ufshcd_init_host_params(&host_params);
>> +
>> +    /* This driver only support symmetric gear setting e.g. 
>> hs_tx_gear == hs_rx_gear */
>> +    host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
>> +    host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
>> +
>> +    ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        pr_err("%s: failed to determine capabilities\n", __func__);
>> +
>> +    return ret;
>> +}
>
> The dev_req_params test is not necessary since the UFS core never 
> passes a NULL pointer as third argument, isn't it? I propose to remove 
> the
> dev_req_params test.
I considered the same when I made the change but I didn't do so because 
I wanted to keep
the original codes as same as possible in vendor specific implementations...

I will remove the check in next version and see if their maintainers are 
OK with that or not.
>
>> +static int ufs_hisi_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                       const struct ufs_pa_layer_attr *dev_max_params,
>> +                       struct ufs_pa_layer_attr *dev_req_params)
>> +{
>> +    struct ufs_host_params host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        dev_err(hba->dev, "%s: incoming dev_req_params is NULL\n", 
>> __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ufs_hisi_set_dev_cap(&host_params);
>> +    ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        dev_err(hba->dev, "%s: failed to determine capabilities\n", 
>> __func__);
>> +
>> +    return ret;
>> +}
>
> Same comment here - please remove the dev_req_params test.
Will do.
>
>> +static int ufs_qcom_negotiate_pwr_mode(struct ufs_hba *hba,
>> +                       const struct ufs_pa_layer_attr *dev_max_params,
>> +                       struct ufs_pa_layer_attr *dev_req_params)
>>   {
>>       struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>       struct ufs_host_params *host_params = &host->host_params;
>> +    int ret;
>> +
>> +    if (!dev_req_params) {
>> +        pr_err("%s: incoming dev_req_params is NULL\n", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, 
>> dev_req_params);
>> +    if (ret)
>> +        dev_err(hba->dev, "%s: failed to determine capabilities\n", 
>> __func__);
>> +
>> +    return ret;
>> +}
>
> Also here, please remove the dev_req_params test.
Sure.
>
> Additionally, I see that identical "if (ret) dev_err(...)" code occurs
> in the three callbacks shown above. Shouldn't that code be moved into
> the only caller of these functions in the UFS core?
Point taken.

Thanks,
Can Guo.
>
> Thanks,
>
> Bart.


