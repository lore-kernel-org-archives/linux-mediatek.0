Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2404D31A28
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 08:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPB/c/bwICUTH/W1SLH3jFpE2mn6yMg2cokKDnZfXyc=; b=JhxITdmgK144SujCkAjKXHDAQI
	yz/CnXVDntsRsejWVoBD3H0tCPc9iEwO7EU7leee+XrPKcfPlAhPUMaaoWHSzztQiNWsepanhKGgX
	rn+zikOz56r/CPtydb7hY1rEk1XUCdAYI8bmp3swCVCjmBszRO1+dNI0SjOnAxSw/J/nn/nuc5Y8c
	iMV4eTOSegXWts6zbDtahJKhouIm1yw06XsMbminPQE76DDO+TdhXTAPujptEqy1KBMyv7Qme+FDt
	FTYwXwoJBVMuyOnoKN2sNyq6sacMqme6SO6UC67u60p4kv3qzLe4vaUo0OsBmico/3V6Pt9YCr88n
	XGUo10/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwDr-00000008KlY-0f8c;
	Wed, 14 Jan 2026 08:27:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwDp-00000008KkY-02LL
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 08:27:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j4jm3270864
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 08:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hPB/c/bwICUTH/W1SLH3jFpE
	2mn6yMg2cokKDnZfXyc=; b=cpf5TyQD+CqCVZMmGxMuVNi4e+Q6WnExkWvzqkEL
	CPmYNiDTqqEBZoLGqvLAMYcS1Nh6oezl5yXYTgdtkVFoorCE08rVyQmEuJGRkSSf
	bN4rspbSp3/wjpQgtFbuQuC3Lys/s44pdTKRRuDgmXR+kBGTUKPsOUYzycwoeRKG
	Id0yVaCwZ1En5xEpdwYOcEWSrX//M3kAQmsOevI0nce68diokz1oNpLfNnZtb4HK
	9BPiZ7hNL8bbkM+uKy3YC5aCs1JL96PREf0HMPE5TDdfk6lCOm6UNMB6er0Gj0MP
	mN8LZuk0zzVGLlQdgyrD8hVtgG/Qcertbuuvl8RShgzg8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v2xpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 08:27:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b8738fb141so166647085a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Jan 2026 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768379238; x=1768984038; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPB/c/bwICUTH/W1SLH3jFpE2mn6yMg2cokKDnZfXyc=;
        b=kTOPM6+arzwuiLpUPLXph4vkKTw/mh4bxT+s+QsFCRbNSaG1WDojfn8HQvKmBoTjeM
         qNu5qc+kEd2fInrCrXD+p08p/MQIfyMPgaCCqTJ+++dE/MkwrbuIDo46zzMju7MXOUhb
         JuHpqFW0Znp3IgtcijiNS0clLOkboB/8IeQVAr0agT8yq1qEsTx0eSZqFdCaR/tLdpKp
         5r6gMLrbTiroFkdhRZIjtuf5G2Nb/gkZgpHNFsGI/I9ZDi/WRrZDhGgSWETSZ9qc1eJs
         yTMtD9GAcAbf4W+ZZAmjQM9jwgSNJ/muvpiP3qqhs2cQqgmoxuT6rDeh86R4/TsnX/br
         vOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768379238; x=1768984038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPB/c/bwICUTH/W1SLH3jFpE2mn6yMg2cokKDnZfXyc=;
        b=XnEsnRbYgRmR0nW4WD7jqQoBTFZD0ktUO6A3s4CPDwsXNLm6oPTeQLM8BJfa2ttzN4
         +DxgbkFmlT+QxlalFNLpbXL8AAEU+eewEdT5N9ck5UtMta1PRygYK7FInW4Bvp3BBsv5
         yE65NswQGuZMYjWYIHdxnRfibxQ3YrdjE8VuCk7dTkmnUlUnFL+ncRjZrSjupLgu7RSn
         um1vt251Qzf4LMBRsn1puRdJNzt2b5DMXVR4gdvbVv9i0prHBXK3Sr0BTm5CHGL34vhW
         wIs0R0gsFUEaZDSDiQxdALCED5Lfd56J5QydBbEp62V8cWAZzD85jZ74MBSVhE+oQG8J
         ZkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeeQswAUYexsZ18mCHIvHxm8P6oNJvSrXVhi8jSJuLhXqItRj4yaJ9zn5UMehfOPAlOHraC9EYoN9IIURESw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCChEkCMuHKNBL7O0KugdyNftB1GjhHeOZRvPSmm6+lGzJSDld
	GBDH0HqtDYHs7mUbm2F6FHu2j0kWKSM4r1GjfGQCWhGcKx/+s7eqhT5t/ofU6lRQAyHAQrZ3DmV
	2KzR8/DDr3fJncFf4o8vml9vMOPnBKxZIDjGVwGECjsaPx+yjFQrn/Ue76vTD3nfu+UAUlwhhq/
	jBV5vVHh0=
X-Gm-Gg: AY/fxX7G+HIBTAK6NiKO4mWSk8POFro8sh9PFXzsgFBExdUk22Svg0frGns2+WXZqMM
	hlvLjbP44BUzmkv/foBIkq7b6Uz/yc1VenTS3fn8x7AmdFGAwzq7llAEQnBq/bjdbKAeSM4rhjg
	mNMNp0lPR/B2SceUbZR+U8Bnsl0wWCRZxNL/Q7r0/0F9Qq9PPNSguFHnF9okk8dB96ojWkXrO4j
	05wIVo+vmpqec6VpvSB+dAR4CSLVTVq2i4DNu6SAhd0Mjwg6V4LSlGeqMyr+B4KA+SXz2ayHkRL
	x29qB7iw7Y5pZ756h87BL9kgrL9TrPvZ+OihcauuWPUXVmVR/xxSl/aYrMNzdGCfNpEivkdl9fO
	cc3pgn48fCCq7nqgECzppha578MZERtwjR385E15NWv7ziWB8SPhD1YVvYy6ClcOZaxjYn3Xioi
	M2pAIGIhiPec1o35YqkacUc2A=
X-Received: by 2002:a05:620a:1a9f:b0:8bb:6a17:cd62 with SMTP id af79cd13be357-8c52083a633mr732317885a.15.1768379238196;
        Wed, 14 Jan 2026 00:27:18 -0800 (PST)
X-Received: by 2002:a05:620a:1a9f:b0:8bb:6a17:cd62 with SMTP id af79cd13be357-8c52083a633mr732316685a.15.1768379237736;
        Wed, 14 Jan 2026 00:27:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb90a4besm44790211fa.41.2026.01.14.00.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:27:16 -0800 (PST)
Date: Wed, 14 Jan 2026 10:27:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
        nfraprado@collabora.com, Jason-ch.Chen@mediatek.com,
        angelogioacchino.delregno@collabora.com, Macpaul.Lin@mediatek.com
Subject: Re: [PATCH V2] mediatek: rename MT8188 SCP firmware
Message-ID: <ybxcmmbn725wwh4gx222lzosyklp32rrc5tzspczqnkyob5wzc@lmvexbvibp6z>
References: <20260114072433.3076970-1-moudy.ho@mediatek.com>
 <20260114072433.3076970-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114072433.3076970-2-moudy.ho@mediatek.com>
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69675367 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=mpaa-ttXAAAA:8 a=0SH4ZisJB3LRqHAEhD0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BvWshD0QHFkLyK89zNb2_cD59ReBkRup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA2NyBTYWx0ZWRfX2MRCD8WDk/Hs
 8rZFo/NE084F68ytmWIFPcnvrMG5QDrtsq1ckr708kDARqXomT02ysrg9cVoZI4puVo0KRCXinY
 3ADxkQySr4ZEbioExOCPj/6nYVbyR/OMn6wTdDmquI+CkXMuwIzSkvvattHnvgjVhZ/+CZ4uAXT
 gtJXHLjx7nv3SSNHBQh1yD5Bg/BMZYf4EyLlB6PyrUyxQetc2hROqrY3NCxKZuJAnTYAJY1kZbT
 FrZLwUBW+1nN7BNQ7aYdHpmdUs/Jjj+6K4m5zWYDe+pFWlIJhO6Svp4bnnhV4Fq6Ve+aj2bQLoQ
 tYrcPNfbKzwKV84TWjNnAH2991DM0ybl20rYHpVszj3gcvdpPAJ7a3okmGtBxp3UWRAlbIe/Je9
 6n4nas7R1iWUMPvIgrs4oI6qdwnBQ3LizkNbH2QY+E87wpIM83Q9GpRucUXPH26+NbDVx8nQtzA
 Tca0o5eC03nE9dy/Rjg==
X-Proofpoint-GUID: BvWshD0QHFkLyK89zNb2_cD59ReBkRup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_002721_165521_F47C3AAB 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, Jan 14, 2026 at 03:23:03PM +0800, Moudy Ho wrote:
> The MT8188 device tree (DTS) is configured for dual core SCP, and the
> driver by default attempts to load "scp_c0.img" as the core 0 firmware.
> To conform with upstream naming conventions, this patch renames the
> existing firmware file "scp.img" to "scp_c0.img" to ensure proper firmware
> loading for dual core SCP.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  WHENCE                                  |   3 ++-
>  mediatek/mt8188/{scp.img => scp_c0.img} | Bin
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)
> 

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/865

-- 
With best wishes
Dmitry

