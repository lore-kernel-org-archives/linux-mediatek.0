Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FD9CD0425
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 23:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjT+IN+3pB6OLoL0p6vIodrxL3i5GGS/wibQF1H0K48=; b=UHEDRInnPWP0dwWJbjcfCFOwEL
	VDjRPEN7Oka8DNdiqmvv3Rx4nEkTXRRTqYLGtO1enA9aWpx4r1KskFaqEwMOhjK9cVj9vy6xJnZfG
	MLPn6O51hGL3wnb0AiwSf613FgwXhpe09CrssWJMBYxlgnp7OaPmF+XUja1iia6N9J1N3KPECJNmr
	hDA+wUvQiStLsVs9X/iGDj723RBCS8YOkXZH5PHBcsH5KWOQTzw5gqwekhCiJ8OWYnegpVgfhBssG
	Hsz3hWUKm8/jetWGYyyRUUqicfUqJNOYIaqYsxuKVEjh/lCRWUbziyhuoNiWepig04Cv8mgjf2bwn
	h7pNCG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcu3b-0000000CExd-45iP;
	Mon, 05 Jan 2026 23:32:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcu3Z-0000000CExH-0D1U
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 23:32:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605MFxIi4032740
	for <linux-mediatek@lists.infradead.org>; Mon, 5 Jan 2026 23:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VjT+IN+3pB6OLoL0p6vIodrx
	L3i5GGS/wibQF1H0K48=; b=I+ccXijFTZFkr5CZpf6ZBRHyY9M34tTXipP8+DY/
	VF66qu7jLqcMQhkH2oOdcOBGsQ7wuuHVBvrlHvXscx8ZcuNupf+cMFa9kzsRlhXl
	NwL21MlzQRBsuV0GLqnfG+MVXaYIVCvWYsCqM9YnnqX1uSvZFwdG4YZyqmSe9sMo
	xE00cHjlwcN09Rd3sQ8l2tTmnDli7Ckqz7VvP6ZTtOQj0Zp7mtv9/CxsAeGdZnpe
	VNwrcnJjYfl0+tl1stzmToKf/f/Sl7JnhaPL9002Btyz+ZqVNCpl8MPAv5OW9YJ6
	NgLs3YdOuWw3rRO0p21PNILpxzAp1BDTfWkEwkvrNBikuQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79njvm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 05 Jan 2026 23:32:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8888447ffebso9357356d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jan 2026 15:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767655931; x=1768260731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjT+IN+3pB6OLoL0p6vIodrxL3i5GGS/wibQF1H0K48=;
        b=ByOP+vjUmiSGjXku6gYbuOlh3lsAIiwjt38AW8O5S38TIKQU9ZssqNtPZSU3izNuHL
         tUBQYqhZSuQI/phc1J2UvhtEe1uWvimoO9/wy3vUN/LVtJHP0AZt67G8ttBOYPFKus4h
         5kBJCyOmlGs7B79qIc8hGzRD8HeIvE0TfoZah0H6x0qxKmgnkORiTeJOP3i9zM0HuYPe
         +yiDi6U3r5MpMI34HPgKdQUhMEVI8R1qAggtJQOpg+yya31uCxNHnlSTv6uhulClsCWB
         9vx5kvOnnsgsYLSEi6e/pc3P5pxcA/ErEOWxSeDQi6TZ//Ol5/2iP/8mt5DDdsPq2/ra
         CaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767655931; x=1768260731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjT+IN+3pB6OLoL0p6vIodrxL3i5GGS/wibQF1H0K48=;
        b=l9FL4T2oOO2Ty/j2YCYPCvjf6TVRpPRVTOcH9GCwJnTK8KvuOHVoGqstXPgl9E5T/p
         MMHH4y3NhWrqpP6JXdY510YkC92l6HI6ZtMWnySqLcjWMcb1xD8CAv3e5sb7g1Drtuld
         ggffUPSq1YFpXHIXJsUjfMKMQCORS3WPzodVExvoJrncahYFt8Ue/EKn962snizuY8qx
         0jHYSdgaL62ZtpPMtPm0/phLjsclXeGOjWY3AnhXNX5H1HhYqWZzc756UPv5dvIOGsfJ
         yTVhCW7FRaRut9jkpK2FdwiAzGS9X7QJqoxkxWZAFI9GqMYZtORhI2hwgoB6GeR6NoT9
         PeAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ8urno/p0NGMY58pzCUt4Slu87XH0QKuQtGNBijT6GfzZNMO9AcV0kUoFjZH7c2KW+ck/guDGHLyhbWi1LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5x0m4CAfkBcSIow7sbNqZE+zSO9yDy2lmwbsc8UZ6BuqZLmTM
	LGpSTjOXtfqI69S40bYg22BLFVlTNOw92PvwiLEf6UqkqgICVCgrmOsZdHthkS9F1W4nDvgWLm9
	HHWQsKqUfUeuSd19dk1TXDGT5JOX8/wUzqHthWZUZnsIiD+2yGHJnKZhddTAAFe6xRhh8sUsu7y
	A=
X-Gm-Gg: AY/fxX5UneK5JPxOi1ZqELMnUr/awiz6PfVUJGVt9Wyn38um7GJjI7cpnEcRommeMv9
	+4aE3fYLkXB1oq5+f8XAJvMihSPNgtHMeKby1YPtfU+cAac/RVTSreybJ14s4/5XexS8MuJ641R
	c039VxVoBRfSUB0NlMLlqRL5p8oRjMHlRDeLj2caEB00MwfqAfsuVSZQULZ5dG42Z7a7QjXIpbE
	Ig8zYCRUpzEwu3da2xXuNMV0CMED98MGMfoIG6reeGhZPxqGi4WvcCriTIKUmm9auEaKVty4tKR
	UT/VSrKvf6RtgyE5Z/2mU5zTDflrcywpkY+LfkcHenmSTZKuvR8F8wmHr0C8Lobkk2xGRZZw8LT
	zKyU0sfBfzrTS2o6Kt836UtdKbUUPtCib9SXtMcQCHFMzcXL/u9C64CLsOSsHR1thI2Xl5VTlUe
	S1FkT2/nxwOfWUQKxaPbn2qj4=
X-Received: by 2002:a05:622a:598e:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-4ffa77a8178mr16608011cf.42.1767655930842;
        Mon, 05 Jan 2026 15:32:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgU13geSlASOkvIKxaVQuYqXGDI6LU/M3qnDNPH7tiNMewPmKEhrFineg8VxZBr5wyBzKx2w==
X-Received: by 2002:a05:622a:598e:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-4ffa77a8178mr16607811cf.42.1767655930350;
        Mon, 05 Jan 2026 15:32:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65ceb9aasm139380e87.4.2026.01.05.15.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 15:32:09 -0800 (PST)
Date: Tue, 6 Jan 2026 01:32:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Lucien.Jheng" <lucienzx159@gmail.com>
Cc: jwboyer@kernel.org, linux-mediatek@lists.infradead.org,
        linux-firmware@kernel.org, lucien.jheng@airoha.com,
        joseph.lin@airoha.com, albert-al.lee@airoha.com
Subject: Re: [PATCH_v3] linux-firmware: add firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <d6q6sxlltho6viwuh5icywxea6xayyy3fjoxexbre3jym3zyum@b3kw2ebjahq5>
References: <20251229150411.2862-1-lucienzx159@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229150411.2862-1-lucienzx159@gmail.com>
X-Proofpoint-GUID: uDqwo5IUJS93tr3eGDaP-fj7t1jGUe-l
X-Proofpoint-ORIG-GUID: uDqwo5IUJS93tr3eGDaP-fj7t1jGUe-l
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695c49fb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=JGXwu8-eAAAA:8 a=dqLlDCLHrhP2iWWqnqoA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDIwMyBTYWx0ZWRfX5ehZcKl64K+j
 vh8iAkwxFQWrME1EiIrMl/+TRz6IJD/ES8sIU4t4gXQ8TZveZBOT+BGEyzt9OsV25PcNK4cqc/Z
 LkQeHh6XviQFiUlWfzrELPGQIhwLfMoNSyXtYc4lWA4qk9/1NIIfhsKvQ4HXy4Tz6dYH4Jdt0hn
 TLtI0jVj4rAKS19e0IFfRp2FRcOpV4QJFNi5oBlxGJBfhnm07/beljYcVxna53kyzSNLFcIlCED
 v4cT0/TykWEny3byUgmcBe1vmrHE+CiXduoPLl3WkmGdoozsq+8d91ASPorqOV69bxjqsccn+be
 Ahw0c/GUR6ChzkXkU/MLnllI2L+f7bTP02Y5ebp12ecxNZ/WKYR9h9rn+HWhZCqSSpE8Jz+8onT
 IAagA+1dewb5hscbkjwqqFPtsDwvZibqeMTj8MeIUI40DhiHTt0SArsT0VTKpsFVDHKKenmRv8g
 1qq1d6F0TGU4WNd/Rsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050203
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_153213_216066_4FDB3E3C 
X-CRM114-Status: GOOD (  14.46  )
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

On Mon, Dec 29, 2025 at 11:04:11PM +0800, Lucien.Jheng wrote:
> From: "Lucien.Jheng" <lucien.jheng@airoha.com>
> 
> Add binary firmware for an8811hb 2.5G Ethernet PHY
> 
> File: airoha/an8811hb/EthMD32_CRC.DM.bin
> File: airoha/an8811hb/EthMD32_CRC.DSP.bin
> Version: 25110702
> 
> Signed-off-by: Lucien.Jheng <lucien.jheng@airoha.com>
> ---
>  WHENCE                              |  14 ++++++++++++--
>  airoha/an8811hb/EthMD32_CRC.DM.bin  | Bin 0 -> 32768 bytes
>  airoha/an8811hb/EthMD32_CRC.DSP.bin | Bin 0 -> 131072 bytes
>  3 files changed, 12 insertions(+), 2 deletions(-)
>  create mode 100644 airoha/an8811hb/EthMD32_CRC.DM.bin
>  create mode 100644 airoha/an8811hb/EthMD32_CRC.DSP.bin
> 

Merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/841

-- 
With best wishes
Dmitry

