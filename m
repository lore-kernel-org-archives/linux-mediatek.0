Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D793FD0076
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBZuljD/+5TcXwhWoGNRFrGUV3OJ0gks35QtMWEwRDI=; b=BBtecdYRycqarWU6D+7pAch9Ty
	qkpynvxAhmZfOa+k5GXPUtOyR8fk/3ijXU2uLAxaxjwEHKoaq8ZkWfjUugL1U/Yqmv+UjC42V7j/Y
	kVyRwUuS0RK98XBmEU0Ow5rMu7e+zG4UtSkx33vQ+0h7o0cEwtz2J4KbDMFtWRr88KHzdiIzPE9TP
	SkNbv/BdHg9lgG8IZZFg5EqHBvWkL04VhKC9w/PylVmc+WUasZ6LNANndGK4+GNYWlGCKaP3RjGjs
	uV6wrJoRJvInRYAmtoMSAU1LLZHRw28sP7z+ySq6Iig1cQ9Y4C7GNomMkk1r0E3Et8+p/EjeUicxU
	BX2GPHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwqx1-0000000C0HK-3BiI;
	Mon, 02 Mar 2026 00:15:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwqwz-0000000C0GR-1gY4
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 00:15:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621NDHwQ2475353
	for <linux-mediatek@lists.infradead.org>; Mon, 2 Mar 2026 00:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBZuljD/+5TcXwhWoGNRFrGUV3OJ0gks35QtMWEwRDI=; b=CLibOj358az11iNu
	my+7sfE+tfLmzugD6ZsrX+Fz/sytJJuWg3AM8HkNW6shh6zg0EdFjQnDOSt5W8eE
	NYe227IFbhhsRnUD1jUTl0pwBWJtCFXAIo2n+dgUe7+hT1CqToItVHx5JjqfIfSU
	/ltgdt3b1Aunpxqxvkvbp7mjVv/fCNOMQ2Oi/8pe3+QVyC5pmYV/0cNOwxWt+LWu
	k0bMSUvD32CSNVgkf9ruC+5l2YQUyBv5fXXPW3sEwu+SClFmj/w2ZcOX86NDaYqp
	IJA1yxik+c5bEvTsUfLZ5DRWsu7lQ3Ww2MrVy9iiuknpCi9dmfp/nn2J6IhcD1ur
	ya9GdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq3gsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 02 Mar 2026 00:15:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3badc00dso13883835ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 16:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772410552; x=1773015352; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBZuljD/+5TcXwhWoGNRFrGUV3OJ0gks35QtMWEwRDI=;
        b=DVV1rDk1DQ3CCR8NiogkjzVnHyvGJYOq/M+VQA9RAkbdAZVSoKNtFV6WNwXfVnmm+q
         BKOf24jzBz2IYHKHQzuLFLxR0rr80GPDJ8xifWzx6h8VNB8BCORVcdNcmqjvCPxw0efF
         kNkNXPQXBdt0Hf9TvSOjqHBz+dq4LD+z11vPQYakreYuJTYQuGPj5ZxhByq3rxHKaZ+j
         NAKRQOH5uCE0vht2yYYT+F16TOgesA3sDJnReaSOpxfShyVuC+ECH4dJklb6gXZAS5YZ
         RGvZEOrJZPZYqPIyLSpjIKUir1w9l1rsu6ZkontY8WJ+JopogwxJ8RHorff9xEGIMdWb
         9cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772410552; x=1773015352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBZuljD/+5TcXwhWoGNRFrGUV3OJ0gks35QtMWEwRDI=;
        b=AmqUs+0xh1iwTJPXHEX76ARP8Ntqa4bMtAMChyvkTMWeQxzfn7xaNg1Zmwzp9/jJKQ
         mptGvIA9xAkkAtx+HXkOmNL2p+D+4CNAZ3dCxK9VgYI424Or1SkgaS2E6QIdlgkHUTjN
         M/gAfqSR0F3RvQ9KVN0C73SM4N6l80Bud5ige8UpzdMruUxO95klmf5Hn9CI24MPaW+m
         nAFEDLVvxW904dzBGnW+9t9YjF9DCaTntHBe23GeOf/wBiSdIk99MnHn/Oec5BcfoGlL
         i0GFUP9JjL79cnj+7mtOUTK81WiNW/XhXSAOMAp6JWYJku90OnWEnlN9CbvpYzoCflh3
         neOg==
X-Forwarded-Encrypted: i=1; AJvYcCVMtChQsKui9avwKrygKCqxc1X9qjqgmdx2eZM5uxyQZG+v16fzMstWmoIcaERjHkcWnHyjMvPmi6r3mqYQZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5JG59hDOWNZg5fEvPImW2y1dkmxrFn0zNdL0VAabLT5rp9pf
	KXQegM6sImbDUvb6e3suzuwGw/BrR/bIrEMqyldGnbKtbMr3xw88J3PPaGlQCB+vV5MS8iylbS5
	V0FoAExS3dBqqKxZuKoCLs9EP5QdXLpugwYCDM5cCmtKiNhlxgQKGhuMPTr9uresIa7o5nm0mq0
	GfSKww3Bs=
X-Gm-Gg: ATEYQzyfg5dx9Tpv+FKL2MkZjqh078Swnc4ynuO6P4t4ehcHE2rw9FuhUh8Fbgv8QiD
	YdzMBF5RK8yjG2DLuiEMy6bWMC235dpn/rE31xJV2S0UaSC89Gpw+8SivQM1LfMNnudsyfNlvb7
	k0YsJOqHKf2ka1sjQNMC+5L0yjoICA40gxo/iKiQ1HzOATG1BkdykzsgM9dQ7CFaYvfuw+EtA/2
	qxhMTM6Kj6QXJQtlNYumlUIaq1xOX96uy4lh9VzFFhq8XaoIZQxAPQBdm+7kizJEf9pAgA02fRN
	wNyCMjdZf+ajjJC2NZby9umEyuoxKIIvR/BuzroBtpfw8F+XGB7MOI/CKkNNMuULmGxXM3E1sZX
	4cgIBmzRjTgOK4lhzpLtQi89QKEnGli7Tznq5GL4MGMuFPUA=
X-Received: by 2002:a17:903:3804:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2ae3b3629c3mr58200825ad.16.1772410552085;
        Sun, 01 Mar 2026 16:15:52 -0800 (PST)
X-Received: by 2002:a17:903:3804:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2ae3b3629c3mr58200545ad.16.1772410551609;
        Sun, 01 Mar 2026 16:15:51 -0800 (PST)
Received: from [192.168.0.102] ([183.193.18.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6c4dd0sm120565185ad.70.2026.03.01.16.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 16:15:50 -0800 (PST)
Message-ID: <e2fe080b-c935-4090-88ce-f8b8c15b6efa@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 08:15:42 +0800
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
 <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
 <3abcef32-f872-4aa5-a7e1-c99286f426aa@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <3abcef32-f872-4aa5-a7e1-c99286f426aa@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cYLuRM03m9sE3tsavjZ9zjsvWk0qiUw0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAwMCBTYWx0ZWRfX4Qj5mxpRlA5f
 Z6PFY3WsBS45QliAjMOjvj3j+2PBeRIl7HH09PKEgxerNN0FuDHFhVHVKoMyva+BN1f/4iWMOnj
 f8P72fVl2xnBLgSeoKYulverAIQIVfPqwrTA/wk3poChqQonE10X6HCzYL1DRwzLeAxz9pr6UbK
 4csBzEsgiF6W0bsnsveDRn0dOGO06CKchE9sxUoOZ7KqHt+6mWsyoCsewxJJs4vo6GSry+AFgfe
 3ep5CG3muLt6mZAQVY4PCNtt+60FcKkOv0ammd+DyNMKKMaxlrAxOhBGW+GqO8tQqL2zazWc0NF
 8u1LbILa1T0k4pq7KNkduVf96Srv6cfu345LyfLT67YkQ0H/MuaPZnbQDClVgljzxc5MrXRjQni
 YvX7VFshfvIrvxiw9QCVWYPWt9C5wbh7wwei+9BF5s5Sy1pgtNiqzckZ7LokdBvVPdejSV+l0Gs
 uZRrp3P+HIPcQlJeISQ==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a4d6b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=4/OApUm1v7sVY8kc7hZvWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3hymWB_5rKpTfOV4Hd4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cYLuRM03m9sE3tsavjZ9zjsvWk0qiUw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_161553_736999_19CADDCF 
X-CRM114-Status: GOOD (  17.54  )
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

On 3/2/2026 1:51 AM, Bart Van Assche wrote:
> On 3/1/26 6:26 AM, Can Guo wrote:
>> On 2/28/2026 3:31 AM, Bart Van Assche wrote:
>>> On 2/27/26 8:07 AM, Can Guo wrote:
>>>> -    return -ENOTSUPP;
>>>> +    return -EOPNOTSUPP;
>>>
>>> Why has ENOTSUPP been changed into EOPNOTSUPP?
>> I got a warning from checkpatch.pl when I add the new vops, so I 
>> changed the same for
>> ufshcd_vops_pwr_change_notify() too.
>>
>> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> Hi Can,
>
> SUSv4 = Single UNIX Specification, Version 4. This is a standard that
> defines how system calls should behave. Hence, ENOTSUPP must not be
> returned as an error value by e.g. sysfs callbacks. As far as I know the
> ufshcd_vops_pwr_change_notify() return value is never returned to user
> space and hence returning ENOTSUPP from inside this function is fine.
>
> If you want to keep this change in ufshcd_vops_pwr_change_notify()
> please make it a separate patch.
Thanks for the info. I will use ENOTSUPP in next version.

Best Regards,
Can Guo.
>
> Thanks,
>
> Bart.


