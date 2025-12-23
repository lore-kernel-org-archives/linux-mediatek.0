Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DACE6F085
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPBInWUU+hAdbqfFG09sngcW/N7tfHu+5Smtzp1GCOg=; b=LdMiZCLOEyRkXKNtpObZLaf3ME
	XpQvWWSv6646YNYSIgxy5oPCps4vummz4K80gjhH/O18trQkyPjPorbNCIxRr8OCk3F0ZqWg9UoUi
	IFCJzT9FOfalMFQgOeocC7JyWuOHLqqZ3k0yoY6+RpJ92dS0Bv/ckR1kvuC/jl10X3US7iLAARe3h
	HiwYF/eO6TV7kot65F9rfkHbiPF2ZTzgPBEXOWLYmrltsRKykmNayjQHcJ45aZBtoFVYQAZd7Kfrw
	YbfjEUv9anIyu973iguR1txVecdV8rwARXFbyNGubN//rjExHSl9YjTR/O0JMtT9f9lUTTEGlIGzm
	avPLE5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5rg-0000000FnGK-2Pw0;
	Tue, 23 Dec 2025 17:08:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5rd-0000000FnFd-46Xp
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr3R74134145
	for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPBInWUU+hAdbqfFG09sngcW/N7tfHu+5Smtzp1GCOg=; b=W0Ag5pY5jrz0kdXC
	dq0pDLHqS1nLbZBjiuX7i9g9id0vu1GFiDPn8YermEqxiVAKJbDvfrOSadnssgLB
	+SV+IN/abjuWFEgA/N9VZtbntZgYYh6DojbbJ7wR2xriwCwyu48J5mqGTJtPtDKL
	6ljmhGhR662UN8wLKzmi3pa4JbEea/ppn2II8D+PgbnYjssoDoGYhnzOi/UGU6Zn
	T0mEBjOY3JnL0o27mbkD7i9/4H7VwWiSYxksZRa71xjNhEPwSSHMbaz/hH8QMrZ0
	GsaBEgD+pO2GCFvnWzObqQ89wnzlthNw79DmPZdRBU80nL3/5Oq5diwSE5I9EpPt
	bJY3jQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46r880-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:07:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5e563c429c4so8452893137.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 09:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509678; x=1767114478; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aPBInWUU+hAdbqfFG09sngcW/N7tfHu+5Smtzp1GCOg=;
        b=Lr8Q8s4cOBSwmwYpTQSAxVa+192iBvBwxbFgxoHnpII0PH9ZTujcoOaUr6HJHd5i7f
         IJ6JHfjIPPDI3VT7187qnDus8CDNPUCYAFu4WxcnoEW0jdb86m9eiU+guwa11QKRwkj3
         EL6unKKxTSDN0BXC2UMre7m37M7WveqqCJzJQMluJsU7ZiVZjUEA3Yn64I6YTvRwIhZJ
         7fLyv75Y0UaDamVyyOCFbp3BQqrgQ96202HzAKfYzP//7QAlAKcrwSICk/DYp2QtwLdu
         C92QzGGvae9k6AB4OOlC38c9VvVA9CL5qxC/oW4VzPJP/RAKt9DkDRcuMbCr3JRdLsux
         xUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509678; x=1767114478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPBInWUU+hAdbqfFG09sngcW/N7tfHu+5Smtzp1GCOg=;
        b=dx38S4F6phfWA0fcbhwdn4+/PyZF3y4bk31/nltvOnkya1kX0GGhzO5QfQeVUDCvRN
         8trJkc3qIB7/mQWIxTnOV/a9lKTOfQjP1tG6BIZUYmSNQqqeAyBVTuvk6fSNiCMNHUDS
         CfrsvaBNjhVmlBaZo5EIL+ZNeCiMGMHLRqrM/MdC+jQxpCquJzPWSbtEf+It0Njq+XNZ
         x2kadYr0B8laxJz/HoO/9byl0gB8+0tnfiatnPhfTZpN+bhuOqFu9X7Qj/HAbZwu6uzH
         CuQuJoIYuyt791HoEJL0GW0gJcNf15eKxL0XmK66ut9uAeHwVRJjBcP0SxSzghe7F+hU
         B/eA==
X-Forwarded-Encrypted: i=1; AJvYcCVr1tXxqFwrIx8Ssxd7ExOLrz8SikSvpWCSaMJvq+qmEv3F+mBqA1ZYGLubiedI7s+XnoEG95SEiBoRemQgUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9iYfmbRR7qOyyEzIKza+sAcOhuWYk/dWqMtwDxYpK3RI+EQGG
	mSSF8HaSZd4SkoiE8FMRt27LBTcoEyqbhXvMt4DHQCEvPhYqHx1Gv8Ee66inQnDwlLOnyzrkPvr
	14KEqHr5keps4raiUduscl3qhGzYBikG86EsKkvj3Se/daWkqNCEHzKabDMcfDk/RZTimA/RfTX
	o=
X-Gm-Gg: AY/fxX6wupqisTRm5Vuc5/iG36Q+2e4lSXY7CQQVHSweH8BwHnZxMerZEFarnmjBntc
	epT5XxVxWqTAL6lay+zPoWrsOOG1Twx5l76Woxkp0uMWkyuxUfE+DJnWai78Q9aQymZDEwSBvaE
	57AfQIQRypzAJIniEmFoHTm7bIABPfmTIFOumq9IHH6YjQa+PeUFRoeyYEvmktUK/vq6ZIj9Adw
	rWJ15xoK0QtfHF73PNhBp10DeMM9O0LZMda6b4eEvDQcY2GOQ/V9FzmtTrUYPu1s9u0iP1qXZfL
	pEdj7tW8Gh8Y0WNzGYV1UoL9EBrz7UGdHrmWZmZDSjfSh4zUtoiC1517+s5nqFeluNeinfHM9Oy
	5ci6Gm+gFXJVyxPNVdH6Y7p64d53V0KDRW2cB5G3MVZK2Eud8O6sjWkyTYGmt0XFaqdD6koQXI6
	EADIvD0VYVmIN3cUedHylxkrI=
X-Received: by 2002:a05:6102:2d05:b0:5df:c1ac:8ad4 with SMTP id ada2fe7eead31-5eb1a41d4eemr5433482137.0.1766509677713;
        Tue, 23 Dec 2025 09:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETm5QEXWpf7BGzE7LdZDGB+prGUr+uYy/GMDUx5kG1G/sLsB+UB6U7pT6XEYtMMNKfoosnow==
X-Received: by 2002:a05:6102:2d05:b0:5df:c1ac:8ad4 with SMTP id ada2fe7eead31-5eb1a41d4eemr5433451137.0.1766509677223;
        Tue, 23 Dec 2025 09:07:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186287e3sm4266065e87.97.2025.12.23.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:07:56 -0800 (PST)
Date: Tue, 23 Dec 2025 19:07:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lucien Jheng =?utf-8?B?KOmEreelpemInik=?= <lucien.jheng@airoha.com>
Cc: Josh Boyer <jwboyer@kernel.org>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Albert-AL Lee =?utf-8?B?KOadjuWutuWujyk=?= <albert-al.lee@airoha.com>,
        Joseph Lin =?utf-8?B?KOael+iUmueFjCk=?= <Joseph.Lin@airoha.com>
Subject: Re: [PATCH] linux-firmware: Add firmware file for Airoha AN8811HB
 2.5G ethernet phy
Message-ID: <szpymr4gdhfowphfg4ut7fmake6pxtsnh2wgk24fqqmmsshdwc@a6jo2zgrykxh>
References: <KL1PR03MB7407AD36EEEDD5CD24FED069F1B5A@KL1PR03MB7407.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KL1PR03MB7407AD36EEEDD5CD24FED069F1B5A@KL1PR03MB7407.apcprd03.prod.outlook.com>
X-Proofpoint-ORIG-GUID: NFeCvWbTmhu0ZFgglLQol165708dc6n_
X-Proofpoint-GUID: NFeCvWbTmhu0ZFgglLQol165708dc6n_
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694acc6e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JGXwu8-eAAAA:8 a=1Q2UqFy8AAAA:8 a=jwVX2wLjnwsJry3LTV8A:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=-p01NfQuWD51nzoNXB_L:22 a=Sfuq0_7asQmReVo7cE7s:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX8BBuS4hKdLjW
 E9lxSTh04n+fXDAitNV1zuNuWgaeFQStBzrOCgZuKnQLUQij1FZJzUN5wbp74CoFd2+zqXb+Mox
 ov20S6ugNIgfAAYbNZvV7PSFtRdaXhEjLuVGPu3D2tq25JerdX5LgDUWjbpbR35jZEZLUz2eh3k
 ZWDbpWTTMbuGGCgwZvNwcaHi9zuDn8BwTggS9fpBbr3h3sS+o0oxiZUvA0vSeNWK1urh8SbBZFi
 xnkEFeFq2KPsDtS4d+JCrUYhyRwsb3KAbhL+r41shRQfpPj732c9CllA/7PwLIbfzjgsYk9e7Vq
 2f/C1HRM1nXvctCgb6rNKdd7Q9GPswiSziQ9w/KDk23imOYRR3lMlsd+Sohb1R1CNzpYrgWodmp
 3SF45v6TddDrAtzqeuwrenbUGSlvs3rwa/R4tDdjNC+VR6Er3VVBAV/0zMLSbFpb2kox9opQIHw
 9DjW1p5E7Q0UsluYZ/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090802_024984_0A0B9031 
X-CRM114-Status: GOOD (  15.14  )
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

On Tue, Dec 23, 2025 at 04:28:54AM +0000, Lucien Jheng (鄭祥鈞) wrote:
> From: "Lucien.Jheng" lucien.jheng@airoha.com<mailto:lucien.jheng@airoha.com>
> 
> File:
> airoha/an8811hb/EthMD32_CRC.DM.bin
> airoha/an8811hb/EthMD32_CRC.DSP.bin
> 
> Version: 25110702
> 
> Signed-off-by: Lucien.Jheng lucien.jheng@airoha.com<mailto:lucien.jheng@airoha.com>

Drop the mailto parts. Use a standard text form:

"S-o-b: Full Name <email@address.com>"

> ---
> airoha/an8811hb/EthMD32_CRC.DM.bin  | Bin 0 -> 32768 bytes
> airoha/an8811hb/EthMD32_CRC.DSP.bin | Bin 0 -> 131072 bytes
> 2 files changed, 0 insertions(+), 0 deletions(-)
> 

Please also update the WHENCE file, listing your firmware and the version.

-- 
With best wishes
Dmitry

