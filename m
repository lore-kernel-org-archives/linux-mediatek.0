Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFBAC5DF86
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=; b=sSf/GfCe825KahKgOv1JRGSlf6
	l2np0oxHucOVmkgjseBb6o1+KQUbDn3FoqinUkJTWi9WGgdthLV6hTh1YrDC5tK8rNx143hm9T8XJ
	69jCrWdXOEDIZI+KbwCCJwZyiphWBQVzEmgoF9IUlyGvkqrcSzRQc5vLh+b1fsH5tHVMIAtVE9yoM
	DsV9GMfD3qoHzGBpUsYHQH5F+vudrxLismOm6CpG/aUW41yJMUUAD/yZQBPSbUPj4SEVcxSuKuUkh
	bE8GGUzS8wMSdDoHyiszKD6Mn0lzqhaUgeMlr0egLOj7NDNXOPDGeCNkOi9KozhUU1Z1gVbwCWbqz
	1ivtQhbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweEr-00000009dsh-3lKV;
	Wed, 19 Aug 2026 11:13:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweEq-00000009drZ-1baf
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 11:13:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8Aof3984399
	for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 11:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=; b=R6KbtOGk0MOGWZ1p
	gb4jfVydfHxpojFg0GJhs/q21UKl0i/VEiMcB/DcdwHtPGBYoMh9TelId8APGW1H
	mpPKtwLl/mIxWgYIR8VeZHgVifvtEMkhIxaUenX8yCpWRX6UUErn/p0Z/tbgCq5E
	z7azllfMmg6bu707r3cmjGJjj5A22/uc3byH36q4v6RtVqDR1ovUIJfbXPM65JbJ
	HBzd2gq1Jwt7/1TUCgQaILpad8RK8lhnHnmp/F5Kq0Q5IhCm/cW2VwUWd353s6em
	hslwnuteh06ocWdwq+C8G72MQYUVL5B6khbQ/E2RLw6EtvSj50lRTRT4hhS/+8UB
	pR0x9Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjjyrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 11:13:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d57d17d6cso1932151cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138023; x=1787742823; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=;
        b=EW6H3HXdrBYEZ3TsgmUF/tbTz5euP3moYN/3DEbWTQC0ek3DjZUi3k7o5zFWDVINqk
         c68GIYxwWb40ATZAoAGmAWQtnjaw5YcZ7Y44m5YlnS2zBXZgl0gHrVgjVgPNG5yaflmx
         VBMLVxsswpYNgR/drf0evi3FAuXUnarlaSZ9WYp8pWOBkhMsWluM8X1twkuT821rWtxP
         Hejzwun57VjFyRHdK8Jc62+RwVyPTAtyKV8DjPETTDRU2O/63BrZuIfoz5LhJdi+uvGn
         eG9DfEaEnm5VZiDHxtKOknfSxrxVvmdyQRmDBWjq0o/TLvqKuGrR1JYnESOQ6dVmSCcG
         vEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138023; x=1787742823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=;
        b=X7NlPWneQDE8bJjLrkw2V+906ATAlQehBBkfkn7VT63mIjZMbmvyWjxIkDRkXet+JW
         f90TWZLZBPIfvC6GVnL0tUU8a5pdp1fJbnmFN8zsv+n5Pc8Jq6gXAvlALrDl0VN3vD55
         E9lgFxET9+nN8kFl24/wJTMHTfHTAcXUFTa8SwUfsJ7AURiSlODZkzwkbwNUdZNE3lG9
         oazSzQlMR90XC7LO6wDu15CT85gq1X/54upHdIeVyqYkk6nzzwLhlz2u2IShe1h6Ll2b
         3cnY+cFj5X4YvgkGOu88hQsw12Zk0JaOBuCRIDtdwVX5O2Myr9rr7tAcitMLAaZQl7zk
         O63Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKs5DrSFVMHseYkNZVeeJKFRhWT9d1NKiPGHoEDsXwxks74M9x3GKUx4srCVqRROEW5eTxxVTjH6kECeEo2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAonTpTHWQ4UtPAIoRYR3DkXgADGGKt0GHs9Dp3EnYT3VdjorI
	gP9oBwfS6IWpksMWMY13vbcLUibXLw/lSTbj6FE0x0DSTdR/fijvuF6w9f3a++N6VAOyQv8v+z3
	zXubZoSl5PaAqo49mSZ8T3AcQDIAGb9UpWFCYB6kF8/RNwHYpo5bGyc6LCiyTagJW+yKaOFMXrb
	A=
X-Gm-Gg: AR+sD10mFvYFHqdxpBqG+y7H2HBCipq4LhL3aE7dMcVKFZmlMncTF5OGV255l7Vb9Be
	6ZNjJhssLdjoqnsA8ntKlTXtFOgyXT35q4CFyvOX67FVyhUjGQeBszVy9Tq4/VeXY2oqfergo0C
	YKzo1stcPHLO1CREm9CfcA4bSI+l9C93I4XzxWzMpInoVDvh2C4JsjAMkCQS0kWOKXOi/O0TCMR
	23JT4ycsEPLYnE2ZWyDZ0mbLf3HBr8gqHJnwXPe0SdRVn1pzNqGDw2QPF9WYB9JlAAJb51PSoej
	L8rj45QfZ8Uc08OooKMhP+fCCDFzxEfKGvWN4RXJ6nUjdyxxTkwSfEGnlqYaY8HI0eUWL+21w4R
	t8dk8syYA2Gu7jkSQ6E5Kqzt7
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr25088771cf.3.1787138022824;
        Wed, 19 Aug 2026 04:13:42 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr25088541cf.3.1787138022385;
        Wed, 19 Aug 2026 04:13:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7a6bd9sm57416566b.23.2026.08.19.04.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:13:41 -0700 (PDT)
Message-ID: <061e5547-4109-4965-8e97-fb126dea3a28@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] serial: qcom-geni: Propagate errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com, Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li
 <Frank.Li@nxp.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Yenchia Chen <yenchia.chen@mediatek.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Zhiyong Tao
 <zhiyong.tao@mediatek.com>,
        Sherry Sun <sherry.sun@nxp.com>, Robin Gong <yibin.gong@nxp.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Zong Jiang <quic_zongjian@quicinc.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NiBTYWx0ZWRfX1W23unxMBGDC
 0b8GL4oQNPnTJSFwbWK8Z212cBQJCF4CCSbkJ2D8oVkYGV8LgaaQODRcgW9eNJ4KPnTVla9zBE8
 WS4sFVksZe6uXH2/yKnbz+r0CugfGquZ8RMwmV8Ztb6NE+lswIlbEi/oBdfDEuhTKYHoEoB7eB4
 d6J23HPMYxcqw4Bar4zQHrtVsUXriUFEikNmVCVA7flHPjESIS4hzR4XMmmsg/TElXzP9ofdwlz
 m8JZccAc0e4o0sisigwLn+vexNKWt/P3pqCj8/b9fHJ9gqDg139oN/MPaGE9U6rs5V9hc+CwP5/
 wmnf1wbQcFjtEvYyk/c6LZVxnpw8PNUzqhs44iZyssow1skl9JuohyIA+Zt9xNSxR0pZjA0vqbV
 M9MQXkqFle4zI/74xMvvJ5PDgNOLK3N12WvjOBnBQx9rNoxG7yTZrcQfEKlNV8IAqe4zKbLDGWA
 03q5G7vgJPrPayJv3JA==
X-Proofpoint-GUID: I9NpvqSWvytKV1ocUIodRBLRWV1wfNgj
X-Proofpoint-ORIG-GUID: I9NpvqSWvytKV1ocUIodRBLRWV1wfNgj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NiBTYWx0ZWRfX/MXLCKIY0Qj7
 SAYLbY8VzA6CY930ZDKGebcg1RT76tgBxlWR4Fv5SOduF3z3qmOz6H7wNYPzNneOhdbasL1ffjX
 sOLUlYSsdW1EqgiXKkmb6gd9hZE86QQ=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a858fe7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HsG88Ws7tFqbOaRkTuUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_041344_537645_7D03DAD7 
X-CRM114-Status: GOOD (  11.89  )
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

On 8/7/26 11:09 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

