Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C255D185F3
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcIISBP1b6cEtGMiwBv0Pa6Mx4H0sGl4XAIy0JgephY=; b=CLnCsewmsn1kbK0GXdHIpMDiiW
	McSEw3ArJYRAJkEKaKwu2N3YKHWlwrT5OFYZdICzJg68tLBwbfqU/qEmMYAgo5nOUUSWhYD/AiJfW
	S7QpC1UqDvfFjyFhIwCDAnudgJ/gj2V57vUkXVdPIWsTjNt+D0lv4mVDGQfkhAReu/0aVodVR7x/W
	w5rS4cCVUi7f9ORfYTemnJJbW31u75XtjqJWfiRQa8v/+Ao3Bpl7A1fGIWZaLng/WOluu0YGYcY9L
	uLFbADt/tKE0a5pczZmdCCootESGZndgJ72BBiJ4lHWPK4Wwzh4qZlO3PUH8n2db66PL2iDCs1buc
	p8d/CV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq8N-0000000HAnC-0Dkx;
	Thu, 08 Jan 2026 13:33:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq8K-0000000HAmO-2u1a
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jan 2026 13:33:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088sbID877405
	for <linux-mediatek@lists.infradead.org>; Thu, 8 Jan 2026 13:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HcIISBP1b6cEtGMiwBv0Pa6M
	x4H0sGl4XAIy0JgephY=; b=mhQIfvt/AolCHOumQ8dBf24bbD8wjs8VDvn61bpv
	BqT597jVo/4N0Vu7pd/jGOByFxddjCfyfl15UWV09sp1zJD3B9T/ap4gNELwV+Ul
	pxNyeKmm6pGGWDTJ95d9t1bRN8GKhcD8L/x0d1U7Rq3OEo0nWP/4ZotvjXEVOPgb
	gVDALYgTkygIVuY2dP4iThSy8cGKz8rnAJuqT5KPQWSJTVDv0J50jyRwlso2x7ti
	oQxn2C/Vh2tmbXb1TqfqFIQ/00Q1XBxTHS2Y4AkZ7kh6Ztk0f/B2CUpRru39HLm7
	ADDaoroPBHuyesUeMGFDbzhc0uNC/T+cTdmfTxrH6+X/Gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2r322kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 08 Jan 2026 13:32:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b234bae2a7so842155585a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jan 2026 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767879178; x=1768483978; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcIISBP1b6cEtGMiwBv0Pa6Mx4H0sGl4XAIy0JgephY=;
        b=GIlI/ukv3EBoLLQZtRv0CugsIjDVc92+IFxbSyYHG9oy8ceqomdO/G6fEmxVadwqXk
         1UsWVV7X19Z0InlQ0l8Wko8Sf237YlVNkGN0kSsZC9bcUrgNkQg4uSuv7WGaHvhDAPX4
         S5xrVrlpOurnAjxSBMZVHJZLlGfiujMGU6WevDzp6oSguHX3Ww/XEMWybZDbEWWf+Z1b
         GVDIaDItmxVBwFV5N1PV1ohQ+S3aBiIAc4UQoDiA/rw7sjpaN70rBy33iWjCvthqtOrx
         FX/6Vyl+Ay39e/bxvytnshd+i0QdYWWjMqNFHWb/xGquw1UuOGG0D1UjGc5FHV0T2+xf
         rMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879178; x=1768483978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcIISBP1b6cEtGMiwBv0Pa6Mx4H0sGl4XAIy0JgephY=;
        b=o/ov4+PS6i/7vYHglRV2bmRuQLAMULxk9K01DG1t99aECuMmix0Hn75hVlSPYYWqoG
         emR8o+H3BofG+rMvOAzTNYJ4C4bryg6jo5wVDRM1AkmYPBtfdw3+DUTbjuk1V6PGojiP
         FPY1R0X3MaZYwI03a+CDRM3GAkMcNxO88l9bGUuRNWOataGnienbFcvIkZ0q+CNU2hHa
         AtruhyeqjomWAb+NJqfbRM80g50Tq1oYQU5ExgbFqFOI8bqpUcT9onSJiIqimfJufH8x
         o2tvWITGcgMORaN+MzeL2PxWuuDlN2EYScF6EWIfqaXhgfhMBmu3gWrdMr/8R3SipNag
         PTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkUmek/szqiMikemRU/qv4vLwgRHDl3NYjyJgqmhJ9stzNAtKiTqgxnUFC4EFkA/0uxoqHvs5ByKOKqNag/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvNbnDCWVpwm4MO2whmnnOWEjwfgTjJSqLxRAp6osa8N7mZnej
	0VzXe4kQpKB6j4aD+rOLr8K9+02nJw0KjH7Eq9VaTqA+x+7Usy+NQMn17ZnVZ1ENqIMa/CbkYXs
	tYKiPhk85DWx0/fgxi4TRgelspgxEoKZy+iYutYiX5wPZofoyTnKCpI0s6g9SHNWsyXcYkI1uCK
	E=
X-Gm-Gg: AY/fxX40SUgiOPILDrJfSn8LFzGcTSg3ulTLopLvFOvfoe8bJkJblCk4kItD1hyRKHj
	v22RJ6yXucv3QlA68uNEQjzgZpwL76EnEsFs/TlRr5Ic/9XrERaVl9bIdtwhgpp2nPJ6mn9+R4J
	3TEFkikPiQ9a4VaiB5+0god//CnXoxklqkMB+tBj5ebPA9I1jg1QUQa5Sgxqjc05wYUSs+gu5tw
	ioQPknEuepCLUoXtPkTqcKhdX+u+WhhA/kp70rgAaJdb8nbL734G8t9iMtV8Bzg1XntDkQxn+db
	1QQEB6bzYtWP+oQxPClnRKuxdvyNN1cvCYTHCkR2ryju0KigQGSgYW+YAQ9X0rUjtbMlyd0oJzb
	6uqjrQgexsE4B3T6PV/CkX24QweEtO2zWStCr6WNQZqB+5BTRFiynPVf0CBJDBWM2FEHNhnyajH
	D46NEDOyaRNZjxFoRsnF4jQZg=
X-Received: by 2002:a05:620a:1a18:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8c3893eccfbmr949015385a.47.1767879178156;
        Thu, 08 Jan 2026 05:32:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNq0BF8CcWxyGvWA2v3GYPI4BzBH5aF7V5Qo/ygFizqocnefYcuOnB4swoyC/eqGV/Li/c6g==
X-Received: by 2002:a05:620a:1a18:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8c3893eccfbmr949007385a.47.1767879177639;
        Thu, 08 Jan 2026 05:32:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9c39sm17049151fa.23.2026.01.08.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:32:56 -0800 (PST)
Date: Thu, 8 Jan 2026 15:32:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Allan Wang <allan.wang@mediatek.com>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>,
        Soul Huang <Soul.Huang@mediatek.com>,
        Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
        Robin Chiu <robin.chiu@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
        Michael Lo <michael.lo@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
        Jack Kao <jack.kao@mediatek.com>, Chris Lu <chris.lu@mediatek.com>,
        Sarick Jiang <sarick.jiang@mediatek.com>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] linux-firmware: update firmware for MT7920 WiFi device
Message-ID: <yi4rx4ddzn7iyprkklcinnnoup7azhvircgapzahvcexb5glu3@xqcc66cmxffm>
References: <20260108074546.3643110-1-allan.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108074546.3643110-1-allan.wang@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NiBTYWx0ZWRfX93aQXRagFW7/
 7NuDvyEhQDKSwyCNpk2fZXONG/l9CEzcqF19qS1VJxqFXpGL9fzgNitqk844mk9sXYA/LqqMh+V
 Gi6nxi9Bumz+Fh87MRLY+gAuKbxVr2+T302D8HBYnSTc3fndCHAI6oi6dOJlEXVkQYVIfq0qkPl
 wYdw3/UvXt27EVnY8hl4x2DkUJBlLol1goE6tdavZzwBx/tuHd/nfLH7nVMQU2ctvXqorkOZgbd
 h+gVX6PM/vBH3sIFiCiSESOYdWP/Jq+tBAqudThcFXbMQ+UtfhVpUsSqldtzB3v2y8dWRR0/jqi
 jMBQOJ3f3qTX8O5BW9XIqACI/VGxUUspNU3tOJO3F39l2Pu4wwGJGaWe6VcxFttEt98UhpONA0e
 FRQF9/nSY7m/NO9WvN3hRnnTLfVlqW3jkoZst6gK6OLPkZG5TLwqMinC0owq/zTkYCj7hMwhSnR
 fouPdShcGn+vMaEMD5A==
X-Proofpoint-ORIG-GUID: iNJHezhpLxcCKj4VMYvu9ulkovu9Xnmv
X-Proofpoint-GUID: iNJHezhpLxcCKj4VMYvu9ulkovu9Xnmv
X-Authority-Analysis: v=2.4 cv=S4nUAYsP c=1 sm=1 tr=0 ts=695fb20a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=mpaa-ttXAAAA:8 a=5dgp0IrvZBRSxfCoof4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_053300_854491_E996BCE0 
X-CRM114-Status: GOOD (  14.58  )
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

On Thu, Jan 08, 2026 at 03:45:46PM +0800, Allan Wang wrote:
> Update binary firmware for MT7920 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin
> Version: 20260105151012a
> File: mediatek/WIFI_RAM_CODE_MT7961_1a.bin
> Version: 20260105151805
> 
> Signed-off-by: Allan Wang <allan.wang@mediatek.com>
> ---
>  WHENCE                                      |   4 ++--
>  mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin | Bin 100384 -> 100384 bytes
>  mediatek/WIFI_RAM_CODE_MT7961_1a.bin        | Bin 802680 -> 802744 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 

Merged and pushed out, thank you!
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/847

-- 
With best wishes
Dmitry

