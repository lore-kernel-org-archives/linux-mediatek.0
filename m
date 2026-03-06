Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81665F0182F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=; b=BOxsIMXTFvPDRS3Ix69A8VNzSE
	5TYFAHSuR18m9WXxn9wMnM3FGq7EXCWZwHziQ4j4/KyJxGoKAv5UwEPTVRTDHUXByK4sgTBcQ6Tqr
	Fnggjz+UfPzBhS4xeJVFxVkaWyPS356Znn5192M6OwIFmba7PavqfkVfHpIbyyVZuMQwyAQdD9vle
	/q3WL8dYanx9H/YSTMghZiUNVMPyA/t4DuKBr1ZT6AEnymd+27Pcfq0g1uey71VJiOW+2swtpup+v
	Zz+PEbwh+IahSWlFW6nwhaOXFgHtHzsMkxJkn2TfzrV9K+5fTX0oYkqB8q1X6C4hs8ntHMLs3Miz4
	VaPVAxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUFc-00000003dnl-2oDU;
	Fri, 06 Mar 2026 12:25:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUFZ-00000003dmg-1RSc
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 12:25:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BaqoY3406273
	for <linux-mediatek@lists.infradead.org>; Fri, 6 Mar 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=; b=eLCnNkmLsPJYxYtg
	qdJjU55/C4Mu8i+8CIxARztWS2jZUyolOBZ+nrPYrQFKlh62Im5f1/+YO5gzJER8
	jQ9kXAJVS5N00YlYWuzMa9yjLabWlSw4OS6VUjSSbKaWSZ8O/HRSNI50q6waRQkj
	uBSo0noKVLjeGoe9rPUedr668o0PBV/t/FJ1it0dbYuWvPGqg6oS33rOUJZdJRg4
	FjtmB6HGIBk3WSqx+fo5KZSppwIbyp+2t7YJmUXRkNBp3sG6NkAJEwWym8EBiEsX
	VvswcYq8jUmZ/bpwPTh66Pzig/sCmPA72DVhfEeyTDE+Um/Nd+KBDdVFHK+/DFAl
	BzSMzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u8h2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 12:25:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4f27033cso56995925ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799945; x=1773404745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=;
        b=geRh0I0UEEJuCpy8lSbCYAzYK7j9Z0e0KbmoaE5FSC43E10PZ8dtuvyRs2VEvgpj11
         yxpOsfH134NNX24w2VFwuzV3k9oQiOwndnyPgwqofjMDxRGhsV0+raxHRoAfu7jlMRgD
         JoQwb5K/v+bYXKu+DTJDVcSY0/NT+Ewp1TkcdhBZhd6gItPaoJ7NAJjPidnVKHP9A+WB
         l0D/8jjjbFSdILqN8gltMo+vg11/5zb2bYA6Hq8TwaoDwQioT3bgMywdgAOUx7luLfV6
         R5wSkS6za0MGJG9gS08MCPZc9UXouwTcgx/5LWA52d0yti7Ca0rvkt3LSORr63aphtBe
         DimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799945; x=1773404745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=;
        b=D3EFVaECU81ICE8Wt3VDy02qMP77EII3VXY43oSl0Sy3ZpoIbrbmtGWpw8pRqcuB4a
         r76FKmMVFS5kuA+LArySBcAOdNsaSryJQHKcz3q01PdhpA1CCd7n5cGILLNMSBTBt5fO
         qLAGP9znliZvLuy4knR9KqLkCGo7D/OmAeLi0qfU/ajJwkqgbZvRR5uAW95qNMRYznpt
         qjE7OAa04Jl0aNnBeRGqSP8051fZMQskTZRL5b7Wwqz01nvTe2E9TLAwhwJuM06nEtzj
         X46iXtdcVVdmYeHbT6jUumIVflo+lgbUW5jRh2N2RRSM8/FXld2L7blGAPB7wFLKhqAS
         vbsg==
X-Forwarded-Encrypted: i=1; AJvYcCUJRLuHv+lnbwSIq8Qk06VgCw/SQWtZpTwK+cH+AKF1R0qZZzQn5Qw2oPFekHwmHNledIGPiBxOA2UBh3TdqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhx0HhtP2+fUoy1KyjBEMDfUOb52HQbsANqHveDhOsrHVZnEp8
	9AWNviB182MfGJU8mej/0g2AJujAvorCkx2jlt6jYgYYsiLP1HrV18PuJ2qRU3HSTjQ9Cs3POW0
	J7hcZZo62bri7ym79ge1zqvilAIMSaD4t0glk+Sa76uMDRzM3l5R2qhRT+0JOO5Sfx9bTi278oD
	U=
X-Gm-Gg: ATEYQzzjYw+85G8xJylqEv9knzEFW/2LEx+1F74u+UGDSuBPx9Q4Se2zMO+t0rP/y/b
	KQfHeTk7cJZh41pddgao/Pyho3jlTVHwuvOm5Ia8VNhHgW3rv6jRxMYiH7BHSekcYCthwsqlT3k
	IGfHD46+EqKYiJMGtpOkVMvE+v159fJF/vmI7USt0t5eVt7SfdWHRYJp8REO54nRNtJVbpaqgdQ
	aHuZAPBwmkMWJwc1KnQv/TyWSWf3ZyremreQPjvKdIGL7bpP5PtYSxnXB/HbhBGp2O0joF+toOT
	opD8EO4NkE4QpNBf9OXMqrBR4KIpTa0TodgVfR0u69Itlbi0+bWzwZAxKaUmg5giNBxruYSB0Hk
	78bkb7ylvdhSPFTg5wLBLnfxg0+JgU6XQOmlmMdGcZvvvaK3tQpBlz2Y1dE6/BxSGaGnafbrPlg
	rbb5xb7TTP/4E=
X-Received: by 2002:a17:903:f86:b0:2ae:3f3f:67b8 with SMTP id d9443c01a7336-2ae82382430mr20485385ad.15.1772799945436;
        Fri, 06 Mar 2026 04:25:45 -0800 (PST)
X-Received: by 2002:a17:903:f86:b0:2ae:3f3f:67b8 with SMTP id d9443c01a7336-2ae82382430mr20484965ad.15.1772799944923;
        Fri, 06 Mar 2026 04:25:44 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm18940945ad.58.2026.03.06.04.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:25:44 -0800 (PST)
Message-ID: <2ffc06fa-002a-4058-a78f-9ff60da9ed22@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:25:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Krzysztof Kozlowski <krzk@kernel.org>, avri.altman@wdc.com,
        bvanassche@acm.org, beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
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
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-2-can.guo@oss.qualcomm.com>
 <8bfda6d7-f802-4b44-858a-f52ac8c051ac@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <8bfda6d7-f802-4b44-858a-f52ac8c051ac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX96rIrNl0pIPO
 q5Qw9KjsPsR8AHwp97F21qzcA+qx0aFrgFZ2eEWnj5GsO/AnAtb1xTegimyKHBaoPo967is598U
 tIcG3vUpYYTiuBxovrWhTtjS7hKYqSv1kv6IqQGvoKE2NdTgsLHSVSgBuNg7B8mZ2BX7rPfoWYz
 VcAdXtLRDuTnQNnZuGnb55wuLmo51KWssOKJGbAtVckJV7pnjY61u5ToCFrKbe1iryohsSrPZy6
 vVOnXFBGEnCWUygDjQo3NOpSF6HurpKb4L6Z47HEUptZzQPCILD7yg2XjaK15JCX052FuvWTv2N
 tv/zdu487GRYnC1sHPaAJaI5DsuEKAXc9QH85rYPF/F2DsSqjBgSnhA9zBs0+xyZ1qhHzOaDOQA
 oaeYxEBBla8gq/DdxTNyzKZ8jBp7BuzyPcRIY/1uETQePlWHQ7IrK1C/kV6LNpHoqCl5VF0ut49
 lfGWxEAiC8HtfhVJTUw==
X-Proofpoint-ORIG-GUID: -s8y9XxxVHLBZjziQwVia_HBRxkold88
X-Proofpoint-GUID: -s8y9XxxVHLBZjziQwVia_HBRxkold88
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aac7ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bBPRlu2x3IQPgS2CUtEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_042549_553164_19F8862B 
X-CRM114-Status: GOOD (  10.91  )
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


On 3/5/2026 8:53 PM, Krzysztof Kozlowski wrote:
> On 04/03/2026 14:53, Can Guo wrote:
>>   {
>>   	int ret;
>>   
>> @@ -4747,6 +4745,22 @@ static int ufshcd_change_power_mode(struct ufs_hba *hba,
>>   	return ret;
>>   }
>>   
> Missing kerneldoc.
Will add in next version.

Thanks,
Can Guo.
>
>> +int ufshcd_change_power_mode(struct ufs_hba *hba,
>> +			     struct ufs_pa_layer_attr *pwr_mode)
>> +{
>> +	int ret;
>> +
>> +	ufshcd_vops_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
>> +
>> +	ret = ufshcd_dme_change_power_mode(hba, pwr_mode);
>> +
>> +	if (!ret)
>> +		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(ufshcd_change_power_mode);
>> +
>
> Best regards,
> Krzysztof


