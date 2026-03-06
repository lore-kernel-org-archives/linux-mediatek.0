Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54DAF0182F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th1itqMbs74IRL2O00rpVuDnvWp8kNZ4S6kCMjIQqT0=; b=RNrIXt3i5Ushl+Ky1/3dPDw3Gf
	DoBfIjqeQwivPaRgiAU7fw2DFFcTzmOFqxeekXCGMTvJbfoTudZ+OUZVABXxqkhqXUZxi8+Ud9hl9
	LIDpfSHgx+5yla1kzcPNfWTSH8DJwjD6rNbU/tiCVgeTR5fbjlFNnJWjq0fcrR6alStkDsxlJUbE3
	N4dHhmELzpwkqsUH7xE2sLMQ1+I/O0JaqdZrXGTmQIv9tZPcylUigFykoBBVxQej5m4CO4ussRDvZ
	6fEhUDaq1Wo2fZ6ODp7BFQYyCtz+RRr//+DXhxb2hnbqVs562CYKwJIG5YWjmSo7Hsy5JkutaNE6/
	UCqsbS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUUd-00000003fGE-19oH;
	Fri, 06 Mar 2026 12:41:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUUa-00000003fFU-2H7F
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 12:41:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BalLu3406129
	for <linux-mediatek@lists.infradead.org>; Fri, 6 Mar 2026 12:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	th1itqMbs74IRL2O00rpVuDnvWp8kNZ4S6kCMjIQqT0=; b=g0mRvaQH2xLIkVxe
	O9x4vc6XXRUqObKh92tHzLbIrRL2E7QmZrfqFRVVCF6aCKy5AIRWaVa9y1qwFI7z
	GA5SQrKqhbVR+6jNNhdz9XD8+bCNye8mZOtHi56gxhf5211y6EX5AUQM5ysKhdKG
	bdHfyKIkeHQxi4PJ53kzbKSgGp3XXJivm19ShidNUgzBWysgISHh6exBlCvMdnL+
	bMyNjB3EjgtOkw0GB1okKC00l7yF9E83K0bDRhn4uDLq2KGuewZ2UIcV2K4Ka86w
	lVW2wsJFCzMEYcshQZp5P6bE8VHqrdIpwgckSrY7KTDFVt9D6R83db9lfR5UDN4Y
	xsfJ8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u8jpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 12:41:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598733bec0so28056876a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772800878; x=1773405678; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th1itqMbs74IRL2O00rpVuDnvWp8kNZ4S6kCMjIQqT0=;
        b=hjFhXIq8e8hi2oTb0fE9HgK6qhlJjK/dIXTDdYmpqqsnqI7KpkcD/QNPRHhsisVT92
         ZPILdjkdHTlsnupLGLWeVHG3621spq36BUUhsZ8h2X+dzljMSc0RlQOw1mazLNVw0Psw
         1nJAhC/0ZpHKqe9nwV5TB9CdyBjt+LXJYEHkfcAMHIiVLcf+fx0Wlx6TAYM5LlH8opj7
         d2ubgYOTamrELD+GZ2PzltRRpq93cX46opXywgidmaZ/WLgjEto4lTvSgGJakVrvjh8D
         WrooN6eZGNqYffGus3V3dhXy3dnNayjOVIeLGvHrpkN4jliFdpYY5tOxhMc/GLbhdC4C
         6wuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800878; x=1773405678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th1itqMbs74IRL2O00rpVuDnvWp8kNZ4S6kCMjIQqT0=;
        b=iWlz+FgEwCIJrABbxW0d2u1gtdxr9NXejWF9Yb87NN9FteVN1UgHYVfn0j/hrozBJn
         49UrwnnJe2GEKhDmlMDeW/HCpzDPvDqf/m55tH9qxEW/QwJ3JANQsDaQVsVkhN9DsAQv
         ukZQUCfeJ90i1g0N+2zvqPOBkltcbgbtqX5osJcZjk1qbybTKBR+VEhN2wsq41zj0dNz
         1WZj9EFh26jfP3s16H1zbvdHYlW9K73oFEZG6ZICuFu6oFmTslw3sZOJ2kZ1SdT44Odv
         PD3bBkmVVN6ep99Y7zN5y+JLPa2IS4SDecBqjDLe9dQ1r+Rd6CMbQ4/jXn+UY+9hv0lV
         uRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP6Ls+O9AXowDhZ5dl759dsbm78hlPnwGHzwMKVv4/3DDv/q3ukdxUg4HONaNg5Vwh/7ZTXzE3vXq/5lWcOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRvvxje9EnDUJdsY9IxtvN56HIELlnzcqrqHf16ea11yYVS/EC
	arBmgqdqVdj7tV18obmZCxO3g5WFkNzJVgDhodLZTz23jN4YlmBnSGJ9+yhAzpTkGPzVOMg7T2T
	P52/peuYZsZlHw4U0RqDxkdoM8cvycVJYVyv+SaiYmQAgo654LrNGwnhTzf+qukwCU3a3LEdWX8
	g=
X-Gm-Gg: ATEYQzxHW/XcAb93US8PWRrPwf3dHUySJr0dCeMLNrStTdhrqaveVaWQJWQz4dHU6mU
	9OFQJ9epreuzH76K34c7yUy3A25Oasrm10oUTCKmU9Ruo+STG9peEj3PbYdUL3qRk5lR/pQaHL6
	8ksmIxt0CkO2ilc1cO6K7JrD5V68BUevoQqHHEgpkzvkLyzGprN47Nr2s7FuKC7ENpIDM/EMRwt
	vZvyfmng2qt7COIjqJcbM5/6sjliU0XS2oglm/vcS60QyZ+1C/waEikglMYA+NgE1wk2OhXm0TW
	LSeotMO3xg1ueAHl8DfKgmAu2kptH+Kwy2clVulZfHvE3On1QJKVc5sySeRSsG6cnTEoUlLxrvH
	To8XnAPB8cih4mzA40rjMv8YB+CtKXtydPDO4N6+camqC+TsG4nQdCGu6SWUmLkSmuTSh5Tnn1s
	pealB3quzj3l0=
X-Received: by 2002:a05:6a21:498:b0:366:14ac:e1df with SMTP id adf61e73a8af0-398590e0f3dmr2322256637.69.1772800878399;
        Fri, 06 Mar 2026 04:41:18 -0800 (PST)
X-Received: by 2002:a05:6a21:498:b0:366:14ac:e1df with SMTP id adf61e73a8af0-398590e0f3dmr2322211637.69.1772800877795;
        Fri, 06 Mar 2026 04:41:17 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0f15f5sm1673727a12.15.2026.03.06.04.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:41:17 -0800 (PST)
Message-ID: <1609ae14-888f-46b5-9e8c-1aaa50b803c2@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:41:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bean Huo <beanhuo@iokpp.de>, avri.altman@wdc.com, bvanassche@acm.org,
        beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
 <15d49cfb52990dea46596c2eb0cbdc7db9c44ab1.camel@iokpp.de>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <15d49cfb52990dea46596c2eb0cbdc7db9c44ab1.camel@iokpp.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEyMSBTYWx0ZWRfX1qkeqCd1VIBZ
 QzeXksc7hRQlRSfIb8AoK91o4ctQgHv8adRj1ah33RzJWTC/4KexOA7u9vzx9ZXn4aq+1fDuUdF
 ui+7SHHb6tJiOzi9WcSviG44uiHNVNCHPH4OhC2fOys8qYqXplKO3WhfxKr8X+gtUrWC8wKHqy/
 4iNki5ds7HncIsuJjCBxvxJ1rXxbeO+oxcAeht24LNsFcfnAxP0EHwC6l4MYYxTpO5Wq7KAtaqv
 D44QxrDAE6DJBssAy7MLJXxe+EiZ0O/0x2RIGyS3Pr6SaYLUynG5gNK9hZERKpM+jNu5lesfidH
 2PWPFjt80fFNQzFEAceGwMz/3VHjIlYJMltLd8N9Q0tQmUS6WZd+7tHQzTc1x4GVozhyBvt0zWj
 lCZcwOadJqd5EQKAqqBZanTz0/aHi63RkFAfy99UFo8zCvblVH9PBJsZ824ZOlgjq/zRu2TLw/6
 enc/cKVAetWI3pkW3hA==
X-Proofpoint-ORIG-GUID: iLQQBmo0atCGb17kWefLgF3KVg765sby
X-Proofpoint-GUID: iLQQBmo0atCGb17kWefLgF3KVg765sby
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aacb6f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=o_XSaaT3ieLpCecdYGcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_044120_695014_1EC64D68 
X-CRM114-Status: GOOD (  16.63  )
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

Hi Bean,

On 3/6/2026 5:03 AM, Bean Huo wrote:
> On Wed, 2026-03-04 at 05:53 -0800, Can Guo wrote:
>> @@ -4747,6 +4745,22 @@ static int ufshcd_change_power_mode(struct ufs_hba
>> *hba,
>>          return ret;
>>   }
>>   
>> +int ufshcd_change_power_mode(struct ufs_hba *hba,
>> +                            struct ufs_pa_layer_attr *pwr_mode)
>> +{
>> +       int ret;
>> +
>> +       ufshcd_vops_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
>
> ufshcd_change_power_mode() calls pwr_change_notify(PRE_CHANGE) but ignores its
> return, this can continue with invalid vendor prep? I saw there is checkup
> before, do you think adding check result?
pwr_change_notify(PRE_CHANGE) was used by most vendor-specific 
implementations
to negotiate Power Mode negotiation, if pwr_change_notify(PRE_CHANGE) is not
implemented (returns -ENOTSUPP) or Power Mode negotiation returns error, 
the error
check was there in order to call the memcpy() to copy the desired Power 
Mode as the
final power mode, that is, an error return from 
pwr_change_notify(PRE_CHANGE) won't
lead to skipping the ufshcd_change_power_mode().

So, to introduce the new vops negotiate_pwr_mode() and keep the logic 
same as before,
in this patch, the error check and its error handling are kept and 
coming after the call to
ufshcd_vops_negotiate_pwr_mode():

int ufshcd_config_pwr_mode(struct ufs_hba *hba,
                 struct ufs_pa_layer_attr *desired_pwr_mode)
{
         struct ufs_pa_layer_attr final_params = { 0 };
         int ret;

         ret = ufshcd_vops_negotiate_pwr_mode(hba, desired_pwr_mode,
                                              &final_params);
         if (ret)
                 memcpy(&final_params, desired_pwr_mode, 
sizeof(final_params));

         return ufshcd_change_power_mode(hba, &final_params);
}

I hope your question is answered.

Thanks,
Can Guo.
>
>> +
>> +       ret = ufshcd_dme_change_power_mode(hba, pwr_mode);
>> +
>> +       if (!ret)
>> +               ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(ufshcd_change_power_mode);
>
> Kind regards,
> Bean


