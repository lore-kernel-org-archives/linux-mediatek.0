Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3DEE784BE
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Dec 2025 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugrvxXR35YW9JUlVvf1+Ke+e4pbkY6woYDMu04/14GU=; b=PymN4ESkb4x/IV/mQkU12pNPmP
	5rQE5NEyk7+T2wKEYUtzNBrdUWRUiZbSqiV4VRKTQoBhWzp9frw7k0sTXcIQk2UPa/TEvf862DSfz
	Jp3Y3ueDTkKds7+tarxMt/vlDMFlaN1j2WXg06yTH0IUsVD50KMJL54afDso0NQWgVANxAEE2qRca
	ce59OSSoTYYWe3D7ca3N82lWfLC44rgAfQgImU5wn07aBHFTQ8UVtYnfvgtcRS+gCqFSnAo/zpYkA
	BDjH2ASYnmGuNzQKxk5hfZugG9XeufC6uu0kHCQLV6oGzCM2Yl9R3+3p+/krr+7oYlAkHoBh8i189
	8AuqCduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrOR-00000002nT6-3bAJ;
	Sun, 28 Dec 2025 14:05:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrOO-00000002nSg-45z6
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Dec 2025 14:05:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSAYiTo2289713
	for <linux-mediatek@lists.infradead.org>; Sun, 28 Dec 2025 14:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ugrvxXR35YW9JUlVvf1+Ke+e
	4pbkY6woYDMu04/14GU=; b=iA5HDRmpgbJVVW9Q3T1+NODje0VRHzw15wA285i+
	Zs0ar4xqa3cOHFpTmMermRCvWz/R7fn/JNoAJnqblOwZY4S/14nxo3NhV7vSwOZk
	OW8TdeGjzdmDQkvxlTOYk+CXJaptOrp2FmuV8k9rzFicopMKQ7MLrCSZRgsys8V1
	RykUrefHkkznZFIj/3GRH/TcPf5M4VRLqoJQoYLFia9ag0F2Ui3yymlSjqEDoNdG
	vvn8tF/aAk1/VBzChl0YaT7vESKOG66VzTSMegmJuHbYoP+nGGdo8wP5nQyKc1Th
	KTCfzoXNRnmZKEeNQMMNXuXYb+aphAOq7VFfbbl8rWQp4Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1t9k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 28 Dec 2025 14:05:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f65d0a94eso11542284241.2
        for <linux-mediatek@lists.infradead.org>; Sun, 28 Dec 2025 06:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766930707; x=1767535507; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ugrvxXR35YW9JUlVvf1+Ke+e4pbkY6woYDMu04/14GU=;
        b=MycIFsA0bam9oOzS0M/AZn5+RtK1saL1TIZj26VIOdOZ8pLA9a/GAq/ERhQ4+ujALx
         EkU3B9jA7RppSSX6yFeb/Zp0lRv3ohaGUZTAqDs1bbDby+ETvH0NO3Atdq9mkes2LhlS
         wkgMyRVGj9yfaH6Ko3lB3HbW0VRWwwKKEuikv/NY2k9aYHtCV65hbHOX+jibtsHEvL9v
         E7KgjKvwqtPuZLHJpCuhoOpwkKaJ4dPpL+H8rPm7SN9byXI7lIn/4It+oaGmJGzbJRB+
         Rh4cXpTlD1R/LCmqkckzDvWKrUHtvX26Ttl272dpMs/DtzhAy60Kumt+vi+nVgpDwgOQ
         K+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766930707; x=1767535507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugrvxXR35YW9JUlVvf1+Ke+e4pbkY6woYDMu04/14GU=;
        b=bkmT4evtiMiKoF7HQgWKy+54QL5im63blbcyedJoMNthfjRl48RbzJayTl/QRiShmK
         +zwyRDqLcqK1M+hQ3FSq70X7+rFemd/cWRFbaeney/qqeI3S42utaC/NUj5mlhPmXnqi
         fYLVKn6V0AY/sjfEeqR5HsZmqw2L6xn1hhIAT6drptoZsbdzE6HWx4IiOoKl0lI/mYCm
         4ntraCWtAbM0301SmiJdr+xLf99Q7oJjf21rufweQxVc+ecu+C5anAl/9xCv8htUreOi
         9GS0EK+gXJpmKuUEH5OI10VSMiOmeugOdnFQpQZw0D+mtQSA+J4C4ptYa8EOgrS+UlFk
         1fyw==
X-Forwarded-Encrypted: i=1; AJvYcCV1t2sExG/QK3UMtG2vu1pi8ukZr/Uix29+7Yq+u+rD/2NoZ3eTTjZkKx8LqpXhKuKyIkqtfgiII0iGX6yRpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM6Q6El7XQyQqzQqOQyjGCR0EJJZSVQOxGVXbuDY4hc/6emIOc
	5q4efvQHZ7f/d1JwdijDMJiEIXWPasSfwBQ0Avh79gygwbqIu4hzyE1hk5+UbsAIpcvaUzfIpqH
	aeCwmdocKC8n0VrD8FxhNF574qId+YG+cA3ZTL8+qu7SD+lOXoFNv4adhddo3se7D9Wd7Pjp1Kx
	o=
X-Gm-Gg: AY/fxX6XH/BoCJu5zD+xfV9K4s2oKzTvD+pmGOgQeqCMnv4wB6OSA+iSld9RA6wk4Jf
	AhrvNQDkEQlH7pVpTM38qytmVyosNk0/gj18gTTb9xcT7mFAbGy24fAXDITszqFLmhru7imZOu7
	Li9zARQl2wKVvcePinMqRIXdK19IIPU6uFVvkEOs+4XaC+9JmxinCsIfSdviVIpxgOyoMRW+G8i
	dOWPQfLoB7lpCoDLLAU/UtCUKXrTDQcPGj13SSggjrClvtPxbrIxr69rFyukf2tghpUvx0wyZEl
	1ebxI5xTt1gCrrg0SyNvCWcvexRpzOpq2QZTohf28JRKPxzmv/HxRKlwemx8nvVR89P6s4mdrVd
	ommY1c5L4w59x7eCQIUOaZ/CDpgwVwAkF6AsKfQ4y/QDtvkC8n4ez96z2P1bmfx85/jIjLdzsn1
	CrFhfwcbVG/nXmlz/kk4XKI9M=
X-Received: by 2002:a05:6102:2c14:b0:5db:d60a:6b24 with SMTP id ada2fe7eead31-5eb1a7cdb04mr7039361137.22.1766930706909;
        Sun, 28 Dec 2025 06:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpJiqH3Qfc6zG8knsMUNSPkSkwqqlAEEkjhU9eH5LBdZBmZSRUJC7TEC/wb+ZdftiRv/VwQA==
X-Received: by 2002:a05:6102:2c14:b0:5db:d60a:6b24 with SMTP id ada2fe7eead31-5eb1a7cdb04mr7039352137.22.1766930706447;
        Sun, 28 Dec 2025 06:05:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ef1sm8102267e87.2.2025.12.28.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 06:05:04 -0800 (PST)
Date: Sun, 28 Dec 2025 16:05:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Lucien.Jheng" <lucienzx159@gmail.com>
Cc: jwboyer@kernel.org, linux-mediatek@lists.infradead.org,
        linux-firmware@kernel.org, lucien.jheng@airoha.com,
        joseph.lin@airoha.com, albert-al.lee@airoha.com
Subject: Re: [PATCH_v2] linux-firmware: add firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <carcf73gefo65hgsdvvyg5o4grh5tg4a6hxrcn6ejl3ellemii@ryv56s2lbede>
References: <20251225163003.4797-1-lucienzx159@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225163003.4797-1-lucienzx159@gmail.com>
X-Proofpoint-ORIG-GUID: 9GlL88RnIkUyMbSxmIfUH0rdWUN6qN1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEyOSBTYWx0ZWRfX1WDhe3bT3Hzz
 QVF3QApUl/Jof/CffrADdeWFVloX8yJ/jd4rCIWDmibLkeLvfr0SoM7anIseqITA/xm6e7jt7kF
 +eOB0K8fv9wzUQTt5gFBgDqJjL0HCrE0T+RYR+L9meJSA3THQgg3mRFE2hgvqRc7QwoED2sCQi/
 NpBUSPVApawDHwa49banCQU6N/4Hyhgs5xIRmnWDjHDtqFDPt/y9DjZoQc5WpUeagTs6BAb7Sr3
 FQx27FFr4AZ+XlK+BMnpLuy13ib00OexYtsz7NXSN+dFI1QymMJhWHICwBFjmbbC29ZKpUccV3p
 lsWfG6/lLrDV36O+LXN+Z2D90DzZCd6wSyNyUjgrQ/X6rNMIOmxM3nzfY5+aOQt6kaQzhf50hPT
 xC2pFpDFip6ribPSMlUdMFWgMSFh4rStSsTKez9GSMEgqUVhbYSyyS5kbBX8FObhDDVsk380jiZ
 gfzlDEGetrQ8mNOR8rQ==
X-Proofpoint-GUID: 9GlL88RnIkUyMbSxmIfUH0rdWUN6qN1E
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=69513914 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JGXwu8-eAAAA:8 a=o5e4f_8DYfgMdY4lUuEA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_060509_024761_4905AC39 
X-CRM114-Status: GOOD (  13.03  )
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

On Fri, Dec 26, 2025 at 12:30:03AM +0800, Lucien.Jheng wrote:
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
>  create mode 100755 airoha/an8811hb/EthMD32_CRC.DM.bin
>  create mode 100755 airoha/an8811hb/EthMD32_CRC.DSP.bin
> 

> 
> diff --git a/airoha/an8811hb/EthMD32_CRC.DM.bin b/airoha/an8811hb/EthMD32_CRC.DM.bin
> new file mode 100755

E: airoha/an8811hb/EthMD32_CRC.DM.bin incorrectly has execute bit
E: airoha/an8811hb/EthMD32_CRC.DSP.bin incorrectly has execute bit

> index 0000000000000000000000000000000000000000..0df4bb8ba5b3f6fe5ea209363625fb53367cf7f9

-- 
With best wishes
Dmitry

