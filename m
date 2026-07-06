Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50126C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 04:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=2Vy3+u4ck7K6/IfsgnHDZM3Je6
	DLl4NIkKnv1FFgaH63PUMMQQhW2TLu7iPRqdB2jZU98OKQC8FkFX6pPv76NzL/flx4A/RhOjZ+HxG
	BB58xCYpgoXl7YyFe+cxntNIpbcNSNVceL7G9n+dXNC3UGZKlJ/aV2gexXtCNbwCyBkaZZHqkHk0a
	MJKK8O0USojp5lhU6yogCCUKtfAbhsqkz1umFb7Wf+bqn4ELA3OL4sRxl4crY7ZeqwN+lnhqV5iv2
	YVCLyHzoJgcobnoOpmwx3R3M0MUMJfa3x+d174T0xAOqZOKBIRbS6TCslxxXgwCqk3wKIUQhwf1ql
	/WPPYtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbNB-0000000BVcF-2eYA;
	Mon, 06 Jul 2026 04:56:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbN9-0000000BVba-3IoU
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 04:56:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641T8v3438097
	for <linux-mediatek@lists.infradead.org>; Mon, 6 Jul 2026 04:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8mc85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso2307732a91.2
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313756; x=1783918556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=YTZ+uhyxE6CPtMUrIuSeh9yFoHHcnZoDgOJ/FXC/3NwfDz/oMFUYjqLBXKk7xWBIGy
         aYYtJGm5Bpo2q/xhIMnUKr/2iN6lCcbkRPX5Q42k6ggVygsxKkXFhx/X5/LyxuZL7y06
         YKZzk7CPcIvNR2vC4byDAF0a7I6ap8qLR+U6VAAdPieUm5ESs6rx7aIBVBkk+7l/XE+Y
         BzjVbAScUozZLGkZ+pRqgz/HVBaxeuag3Ej+oH0Wv9jgd+dHRSp2yps8UFXnksApiRRD
         90nj7yhg3fud5PVNdDNSMg8tq+0iaeAY0ZpYnHyPMYKuvtANzJEXp480jdbSf2D7PCNd
         Wu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313756; x=1783918556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=ldQw+vJ0hYynOOPx646dpww1di41lkxodQQcgmpDFKVrTqrqmkJ/X2K5UHSgUJnYV4
         FltSeXbtpfhpPtD7YfaZB/MNjqa8kwRrj1ODRRo73roRmOe5fnmTLVW3LY9qzgDvOYTQ
         G1SDzmc3GbU8qtINI/uE01057bYNkI8b8aK0ZZDunZS4TpkRzB7QX+4p+VtHoWil/mm1
         M0uNrcqODouTVnI4DpTR2MRbLbuFDFc+dQOoVt7ThvbQ1YxbjW2BSVm9bhAq89y3SN9d
         Zai0DCsjwkTR9pCZfez+Euv6xa9ZhR01Vre8IKAx3I0vlL5+ZlbgcCUXmIdsexRkz9Bs
         prbA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5cCECYChp5tvzcgPpMkQdivzwYvykdqxWXjgfIN1syR1jZTGdvT4Q4NHK7/03039c4wcjdAUit74c4hzHSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoBGa3PAIrJNvQokZxNhhTRso0zKEUZwlpYppY6R6x/TRwGVAN
	vioUrVWjHOOjz4hYK5ayYsq08dSeJht7lmNGNdbJt/+pURn8EtgjF7ADpeW4RrD27qW6GsZU71q
	llfGj4VCApLnslMuo3FZkq9bLtm9z76YYx80o98uus0jXIR/YH6l6vBjdb4umNvMgucuAxY2iah
	4=
X-Gm-Gg: AfdE7ckPka4mgOplGX+awSBpDPAOG6cwQPwym90CeK+kkBdry+AWMrT40+L5TOPyqkC
	JUTZ4wI5bZrRo9cTmbC/2OanhXiz0g123HoLJAF5+xkTFbtUYcVizDCtekWdeI1vQ7QdM/5cNON
	fkko1TN0E40X8dPuRL6/swPgZIq4MHelGR7yfCa63t+SgDihwtuSEm5IwBlapTSWjqpO/wrfUfN
	yxnoKhUsX0pPKI/0Bg5Tpdq9T5ucB0DRdm641fQRM+XjTJXoX/mzudT/qab1tISnu9J81WsrScI
	eQvgPP27JOthX45pKnKado114AOLZFqfL5NIh8u0v0Uao7YwnY2ik7Dp0eTpPmzggFikYdhgB67
	YYhuHA7T2IjzBWZuEMBdipHU3V/9HuMHfANwOLCia
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328712a91.4.1783313756485;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfXzuXHuw7IB6RO
 iLR7G7jL4LQezG5D6CXI31Z5No8CCFg8G0q2FJdmg325QjrmzuLYJJ/2Ei8nQlahz/+pclzOpJg
 tsJLk1GlgUkTP6o+CLTHW0U5dhdspnOoh522Bfe3Qnwl4N/dhVQLtOuFwTgaRJESUh0tfxxDMlS
 H2hXDTQhAo+HgXgmABevLwi74eLvykS3/VKdGqFqpIb8FbURegr31mqEwnJFPXh2ceaMj8W+c65
 HAVCfCfOiri9kKmQW+nTQzoBL/6ewtctwQL4ggVHuamngyvQLw24KxERGPwYcprJmSyjDyIImgH
 Hzh81yGpxT5nhMxzugo8E+pDtSXuw5xOn3YDZE4vGMQD5YOvi2RCUVEahHlzEXpwcgLRoVyWoiw
 udzZQzzjcclZKvnK7LW/g4mx98+5Sj4Zvau+ESTpoBeFf3VfX7Zqo6uZEPkYiVkw5V0zrGKKNZj
 AeyRX8tlLDMjWV60SLw==
X-Proofpoint-ORIG-GUID: CzEUoLJmBpYJ8QTbQcr39XKua78WkHOZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfXzMDLubELHdgJ
 kdVwW4sRB5LrMzRk5H/CWfz3x6/eU5lkRmaO3GzrzPP8FNCVwb8qcry0OvGMf/a/EDZpADjpsj/
 PGQCTw4VKwY9oPGP7WctAm0c4NUe4eg=
X-Proofpoint-GUID: CzEUoLJmBpYJ8QTbQcr39XKua78WkHOZ
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_215559_955083_3D4F9749 
X-CRM114-Status: GOOD (  16.44  )
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

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,


