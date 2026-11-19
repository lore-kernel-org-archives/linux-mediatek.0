Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765B606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C+70MCDT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oODRBWzo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrDM1GBz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=; b=C+70MCDTsZ24H0
	AIPMks8PAMhduEa/72RywP4r8w3+yNuLBZxMtWHxPp250Uk6V4g5vmviO9FYoW83c0xxQ/DuRvHes
	THVLqpT7HNAQt5JmrCcWOO09MLfaF1Kv0g/VsQtZ6sg2XZUZCVxK5Q+bnsIP39OilDIH0mrD5ZDj7
	PwyPvzRqM4tColCZprcJghrkTw15MRZZnla7mDIK3MuwVDbqF4kPZrPM3lavHMDv9xz3MOSDJVQaj
	F87HwzId9pjLAtj1lgxVZaRfAZPMwjD65cZzR6joHrs92HFxk/lrnWEaS9et3BOwR7QJBYnPMJtFm
	FRVoGAdw7dDl2KHtxwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwIu-0000000B2h4-2zE8;
	Thu, 19 Nov 2026 07:11:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwIq-0000000B2fg-4Ajv
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 07:11:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6uU9N1559540
	for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 07:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=; b=oODRBWzo0WVLn/yz
	r/qqs4ew38c5s8Y2C9jWsI/MdgQ3doWeU4tpKM668Y59KVFjh5Ojy6BtYFMQx//Q
	c9O4rATzmpDthO9TmKuVez34+oEA7Nuu6SO3oJegQR8SukJbaO4NM0+ydcUpkxsj
	N7nhUFgdy1EvlApUY33U4k2hIVcTe/nwLO6gcnAIaiUOdcSg0qhmQP3xn/WImpid
	8Wfm6YaIiwoXMAuz4498k8qqJioS/+7JPdSnhH9tiZIhS26sP18VTwlc4xOFTxpq
	djd0eDo+5vMcTIC1oXcR0ck8bKKnPHKnc45xLa4LK10eS/pxzLtp36m8LTcYahTa
	Q8M+1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux85pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 07:11:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0329e57eeso1193875ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 23:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072286; x=1795677086; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
        b=NrDM1GBzj0eZzQ99GkZLTfijW2I9W9GXUY+KMRo3dPIsp20r8S31iO//A8OGpNyN7/
         MZWFLV31xF9Z01Hfl+a+VtsZnXizKw6NIEpM5KHtmx8c6NzoF4otoZDe2r5G2QxCqybR
         BpxJUTPF80y6gR7rCvxlc30Bk9+NyK+xVH90hBgUJ3mZ+DTRrjFdROmdILKsdh/ow6Mg
         mULBci0GtEhgTdSvd5SBTt519SHIBF2VIRizEpmAtzfIDtJyMEtMtxF9pih2o1JJ+1tq
         6izoYJROEmclJgEBKSQgKbklTMp5Lx49sO21qDNhGagQ2PWeyDT77GpneQkn+ZvVte+3
         vDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072286; x=1795677086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdDcVD4zeEPNRO+BwyCwbOJ/2pD/TbB/A2AoOr6cETg=;
        b=XlqKbtMQs3O6mMGDDGX2UfLAmzOGzOZuzArG+pndMYf8SNJBK1a9yFb3hwYDEKUr3v
         hWdHAxYvJxgDNkTAWt4A4OS3p7CQ7imjdYIBIYrmBDHOX06q7pXWS6QhWqwhhh3g2CmF
         HtWhvwNtquSGqyo2Aej2uUg7dZsB+qFCCv7sKzYIVEyaw6b/XKbg5Yqf5sBl48W7f8U0
         RnwcaD2IJ5/bZOMyw+TwvyCLSr4bhbB9i6pW6wiboG1hwihmE/FK2Oigk3oKhc9Wy8Fw
         rLr1ggplm4qgnaZbLFGuinBlWyQTznPUBRzmfgqZl/2t/t2jj7HnPVfELakY6nR0DNMJ
         GiMQ==
X-Forwarded-Encrypted: i=1; AL+hErEsdOJErWnpZA5BetFhExEN/INriMl/wuQt5oZpQ9o5WWPnROTHYYZXbqjkFVgRhJOWIJB/sVu9LnDlFl19xg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+g96zShg3mGfAMpZbI+Qhvs2WQhSJ3z+nUFcg1rhnN2vogKaRl
	AwddDd1ePtc2SZUIYQ9G3Z2pZQ4a/2ytfPqxHIm9zMbWASJ6LigRyVteQGGdAMJS5s9GGdwRzIL
	3zC276tTqhi0rYCMNnOl7BWf7hx2BIzgY4nkjrKUW7t6I5ZP7JwmbPkWuz97E4EQ5ys6bc1k4RC
	w=
X-Gm-Gg: AZFdTZfaA1gq7Inz6e2m/djBs/QmvaHcyaSW2X+KTh+vlx909nhLJ/8WEmE5GBARVkV
	JzSQx37mXuXyGlSOdTFW59ofEkLNKpF0ZGargB0ER3vh9KzSz2J3Sc73ZyxQpMzbKK89OlPkG8l
	3lox5jf2DfzpLihH6vALPdXGQyOXp59QFQNcM4lx3RBEe3FEXdEnUtGCXttHBKMNoORvvZ5SDSz
	QcD85traDQzujaN5uid8vdnwC/SlWjWwC6CUCPes1262R7EFub+LZ8em7yM3DypgXbZgDc1y+0M
	gme138vVPp5K5paE9rEYeZTW/9kXeragS4akoKJL2Ud1SxmT8S65gJU6+okC1ijy8omnjeTdY2r
	XI3Og/jyb4GLLFiJHm0+WdSTEMqEXaRGB/fPEZ+H2YCYKXyDF41mKXBPXw44eL9+UCWKlc05yNn
	YSAzQuodM=
X-Received: by 2002:a17:90b:4acb:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b3d07aa6e9mr4435695a91.32.1795072286330;
        Wed, 18 Nov 2026 23:11:26 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b3d07aa6e9mr4435659a91.32.1795072285666;
        Wed, 18 Nov 2026 23:11:25 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm1243414a91.7.2026.11.18.23.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:11:25 -0800 (PST)
Message-ID: <553b354c-70f1-4b3f-955c-17a197e6ad20@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:41:20 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: Disable slave events before RSTDAA
To: Defa Li <defa.li@mediatek.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        mingchang.jia@mediatek.com, yuhan.wei@mediatek.com,
        hao.lin@mediatek.com
References: <20261106062236.564607-1-defa.li@mediatek.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261106062236.564607-1-defa.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FOAYywOiH5BqV43LmZvWO4ULvqiOdSY9
X-Proofpoint-GUID: FOAYywOiH5BqV43LmZvWO4ULvqiOdSY9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfXytTM/3I5jW/T
 RQdm8IUDammg3qqG0SdM3rXMAwB0ZfwXd9luGYX42/4/4aEiKN4jDWEDV6qaU3m7xKzHA2jIlIJ
 Gtxu2KRbtaGg0lncYkHgP58lsiK+ACI=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afea11f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=mpaa-ttXAAAA:8 a=qpz-AGu6-bpAACMkIr4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX2M/YVUjD4nL9
 So3Bg5apaxnr/ECztJGJVfY9TaCSCgQG2zn+Y23B0bjOFpFtOfqZ/tXsETaR6OJ6SjvGcMdyQQz
 6o6Xh/3fDW95BFO2OBTJV++YGMlgNtoW33YuzRlx97GCT1cqAK/7Rqr0zkpkpqJG3AYWNTmyMHZ
 U/V6lEd5qDtPSMgbM5IwS+PbsqQG2J0oyw1llAYUHwq+r5Al0e3jFJ3SEMC4B4xc1ZP/nBjNTNW
 7yI5RaOaofHunE0qVJLygL4ifjCQhLhk7OVaDZPHr1jEwk1JBU/rG3bgfWrnaL9dHgRwALjk+KV
 zKa4XmidNYovQFSEexc2hxbH2NiHwauNYOj5PAnF/SR1dRLEQfKXjlY4zb8DUs6C73AXSs074Qb
 FMZPdBjoBuTjAW5877hKCGub9BYTaxZrGSGsQEDtgB5cAH4Ul8RfGF19S/yvEgek3/DqIh0SIxn
 df6rh/bex3VQN4MGiIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231129_145234_A437656A 
X-CRM114-Status: GOOD (  20.05  )
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



On 11/6/2026 11:52 AM, Defa Li wrote:
> Bus initialization sends RSTDAA before disabling slave events. A hot-join
> or other slave event may occur after RSTDAA and interfere with the
> following DISEC command or the remaining initialization.
> 
> Send broadcast DISEC before RSTDAA to disable SIR, master request, and
> hot-join events before resetting dynamic addresses. This prevents slave
> events from disrupting bus initialization.
> 

While the sequence you suggested making sense to me, but i am wondering 
before bus_init, are there really a target device getting powered up who 
can generate hotjoin ?

MY understanding is, post master registration and bus_init only target 
devices should start life, isn't it ?


> Signed-off-by: Defa Li <defa.li@mediatek.com>
> ---
>   drivers/i3c/master.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 01e05bad8661..4fdc8f721364 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2571,10 +2571,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   	}
>   
>   	/*
> -	 * Reset all dynamic address that may have been assigned before
> -	 * (assigned by the bootloader for example).
> +	 * Disable all slave events before starting DAA. When no active device
> +	 * is on the bus, returns Mx error code M2, this error is ignored.
>   	 */
> -	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> +					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> +					   I3C_CCC_EVENT_HJ, true);
>   	if (ret)
>   		goto err_bus_cleanup;
>   
> @@ -2585,12 +2587,10 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   	}
>   
>   	/*
> -	 * Disable all slave events before starting DAA. When no active device
> -	 * is on the bus, returns Mx error code M2, this error is ignored.
> +	 * Reset all dynamic address that may have been assigned before
> +	 * (assigned by the bootloader for example).
>   	 */
> -	ret = i3c_master_enec_disec_locked(master, I3C_BROADCAST_ADDR, false,
> -					   I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
> -					   I3C_CCC_EVENT_HJ, true);
> +	ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
>   	if (ret)
>   		goto err_bus_cleanup;
>   


