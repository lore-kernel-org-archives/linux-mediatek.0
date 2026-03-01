Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABE5FD006C
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Mar 2026 14:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=; b=Gj1STAxr8XeY6gAvtEQqJn0DMJ
	2P0cA7mQ9HH8xslJ2Q/9ol6jNmAHGwF53WXzqcVbObF6FF/plFmkEbf2H7DpxjjZB/T2rrYMxQdHj
	U7H1dNqRjQ0GoTVYEonSCB8EmpMNO/szU3bdz+WJYj9FEDc+gBG2kx2OXHv3xAIhBFqJzmpucUxqF
	wgKPRA0wi3NY2Ry1BbzJLMyqqGNXIYWaMpOTzjJT1rzU6RS7RdYo8oHF2aJwOoOdGQNBnzqzHYPBO
	E4E93d9XMScz9i+JhAuUKwvmRWM0G8QzGHk8r1CIN6T34CW18Rzn3VbBnecGnuGb4K0O/MaO5oxFr
	FxOd8BFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhkk-0000000BZqb-2PAM;
	Sun, 01 Mar 2026 14:26:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhkh-0000000BZpi-3rJr
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Mar 2026 14:26:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH01fN3052055
	for <linux-mediatek@lists.infradead.org>; Sun, 1 Mar 2026 14:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=; b=PRT2g4dKb8MUvpUT
	6EeF4Yc+YA+y2s29jjszN5/MbgmHBMMEJ/InzQOW+QAacc9SDBScBPJk+DGdwkBZ
	PjCfggr8Dvrxl/LmbHk57xnPko3poAgrmQ9eG01odwv3xBbAsDgWi0bcbgw0NTvG
	Xn8yWNKhdoG88Vu2VMAbkzFb25QyZBn6tXICwtqUCQn0zxd1oOcsMJpTqORXFIAH
	O7uT+kyxTc1B0yfz2eCunEXApBujjLiTnYhc5GOzmb8pTiNPaCaYSV/g8/wxUcOp
	lNvGS5lg/qFVeErnYC/eRNAf5uA+JDNu4pR9ZnQE7tc+zELpcfFzJUsPh67Tcok/
	LNd52Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrtue4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 14:26:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2887710a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772375194; x=1772979994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=;
        b=bP0zOnbZ2uaU/oQvbCE04QBu7SY1bL/miqIWxQylRNBhSLYF78dpowK97rExoKatd4
         mPD5RJcwDBHZy+KEkbQ/0v0MkAWEiCGFTOa2k3GtsWvEG2u/iYcHu5+7eSZakcDzKA+A
         JzGC5SF5V5EjRULEdZxIlhOPuoZA40bNJ1mSwNWfWHfdEnm3ZGwd9L5Ya5j6JcfaGzUE
         dFG754mf+A8uKm/RAe9u/1CfYfeHRZtDY//r2/GPWvY186qkK4t1SoCcPzisi74JB2ko
         BxN9srpgFMBjPbBMp47dsb4dtmrRTuLLDMfxrxfjXCN3SMg8Umxkf3rkpXHDba7q73L9
         frHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772375194; x=1772979994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=;
        b=oEUqC3Tfwhh2Ow8hpdHY+XW4ENnl4g2jUr2V3fgyczovzTNVU8ZyhM0IQSHb+e/gQq
         QbcaywX/nec/OjNBnej3xmRRsQHpzwkJoW0b6LUDPLG+trio5eoRhgYTqgCaYu4esRFr
         l7iPqpbVRva7hX27in2y8B6vO+k2HZRCUgfoH54zxMXWCUNUuv0E1Fe77TaUfi6QIgJA
         oynkk2hofxNG5mlvDIcBue+O8QkA8p2KQhrrh9HBds3QoQuwSatpeLUQnG7tkV4extob
         Lfe3i5AkJ76LY+S09+ooj4Rqu4SjMAOIdVKViG9wmHMMH9UoUsIQGXzuZRn25N8AUjsZ
         csHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAn0UUbn7dnL6MIopCSo9AX08dByyWUKYf9oh4Sp54TbEukwjeKrNkqWXdEk203o6u2GqZOS+JEF7tSXTPoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtXgvpOTA7szzS4jRCtTaUGkWQYYPw34SzcjbLE9X/ssfcr6pC
	8d6EeEQEQsaKfuhLEtxAIcCnnp59Vt+uPGqXRh/LQ1ov3j95QxH4hOoM2PMtgZZ4ta5zyemmUjR
	YHITOoxWOyLIIQYtas0HlakV2yFMWaKoAa141B6bTEURSs85RKDsgzv9X1fg1DO70CBhQWn/ONN
	0=
X-Gm-Gg: ATEYQzwozGpYlLfAxTpEh34xCsWl8UtWSLPOAtwNd6z6K5mbLyI+mHpXOoe+Xol/N7S
	UgBlYKpxvQ+2gvwr74GRSXVTmWhDmfkFmAde78huPF9/M7YZxks5ROq9lwvj4Q4lFLdfDGStUgb
	98EjyVd6pMg6mblTaUf9ziQdeMQBLxVaudnRwL1TnycQcDgWFZsum3tG4g/qFbHrqwWoxXjynrF
	6f6S9ZX8/R+T94xfJfTTqHdIWtORmbmHRpO0/kQDdy+7vCvVnSByo7sm+89/7b71YP/JhBW3AoU
	ldV37W4ymbKmNvIFrkV221YuRVjF6GmzrNxhcenOoxAnzYLQXW+bDwJ+caCfUfVqtdf03z1TcyS
	b5gwoFzMrB1ifABwebDa5YlzBbTbYrMZFu836klEtZEhlBaM=
X-Received: by 2002:a05:6a21:730c:b0:364:be7:6fe9 with SMTP id adf61e73a8af0-395c3a75434mr8553276637.32.1772375193655;
        Sun, 01 Mar 2026 06:26:33 -0800 (PST)
X-Received: by 2002:a05:6a21:730c:b0:364:be7:6fe9 with SMTP id adf61e73a8af0-395c3a75434mr8553232637.32.1772375193170;
        Sun, 01 Mar 2026 06:26:33 -0800 (PST)
Received: from [192.168.0.102] ([183.193.18.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm8925971a12.3.2026.03.01.06.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 06:26:32 -0800 (PST)
Message-ID: <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
Date: Sun, 1 Mar 2026 22:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
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
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
References: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
 <20260227160809.2620598-2-can.guo@oss.qualcomm.com>
 <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMSBTYWx0ZWRfXwTArw8X+b8h0
 21McGZyGRiRdcGDDdwHANmMyRp2ZCbQiIHOiFv8/urfwyfOPZ9a8FnkoAZg7czh7q08LpSfCp6B
 8JyOq/GQ9UQz1TylkUnYAjLNcQTiciMciR+083gyIGMXNoa7/WHqF8GRjGmV/QHpBobjMLbMeF5
 NqbKfOOniT93OjbVuHYzLqE5stSM+3iDBLYjMAG3N8OKkhTi3JkOdMlvuQ0PzvPNzu0g2s/ahU+
 o3DTzp8l0X+rgvaoWkC5lbhSp0uJaf9CE9MBwXQS6vYKCgogKcmg1gKxf5xpqPmiZPd55DdgFc7
 xASxZKDvXKduW03CHdfxO9zHADCpvpMQL0HHg5JKKCtBfQvbuk1+EFYR/09vKSDPPAkGh5FgoL6
 j3i+5GmWWc5gY6MRolyHpDZBmu38bZd3qeKxKwValpC/swrhk2JR5JhvtAJcIrwhS4ZZm9FyIII
 kOtbeD1PvrAUnWjXdzQ==
X-Proofpoint-GUID: etqvW_x50X9-wWAZSuNeSBvnR04FTjqt
X-Proofpoint-ORIG-GUID: etqvW_x50X9-wWAZSuNeSBvnR04FTjqt
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a44c9a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=4/OApUm1v7sVY8kc7hZvWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Z9vnt9DBQu4Rfwh2U9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_062635_972081_CA86E073 
X-CRM114-Status: GOOD (  21.75  )
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

On 2/28/2026 3:31 AM, Bart Van Assche wrote:
> On 2/27/26 8:07 AM, Can Guo wrote:
>> Before power mode change to a target power mode, TX Equalzation Training
>
> "Equalzation" -> "Equalization"
Done.
>
>> (EQTR) needs be done for that target power mode. In addition, before TX
>> EQTR we need to change the power mode to HS-G1. These cannot happen
>> before the vops pwr_change_notify(PRE_CHANGE) because we don't know the
>> negotiated target power mode yet. It is neither approprite if all these
>> happen post the vops pwr_change_notify(PRE_CHANGE) as we are going to
>> change the power mode to HS-G1 for TX EQTR.
>
> approprite -> appropriate
Done.
>
> Additionally, if "neither" occurs in a sentence, "nor" should occur in
> the same sentence. I don't see "nor" in the above sentence?
Will improve the commit message in next version.
>
>> Introduce a new ufshcd vops negotiate_pwr_mode(), so that TX EQTR can be
>> done after vops negotiate_pwr_mode() and before vops 
>> pwr_change_notify().
>
> This patch does much more than only introducing a new vendor operation.
> Please make sure the patch description is complete.
Done.
>
>> -    return -ENOTSUPP;
>> +    return -EOPNOTSUPP;
>
> Why has ENOTSUPP been changed into EOPNOTSUPP?
I got a warning from checkpatch.pl when I add the new vops, so I changed 
the same for
ufshcd_vops_pwr_change_notify() too.

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#59: FILE: drivers/ufs/core/ufshcd-priv.h:178:
+       return -ENOTSUPP;
>
>> -static int ufshcd_change_power_mode(struct ufs_hba *hba,
>> -                 struct ufs_pa_layer_attr *pwr_mode)
>> +static int __ufshcd_change_power_mode(struct ufs_hba *hba,
>> +                      struct ufs_pa_layer_attr *pwr_mode)
>>   {
>>       int ret;
>
> The double underscore prefix is typically used in the Linux kernel to
> indicate that the caller holds a lock. That is not the case here. Please
> choose another name for this function, e.g.
> ufshcd_dme_change_power_mode().
Done.
>
> Thanks,
>
> Bart.


