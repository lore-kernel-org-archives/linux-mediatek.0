Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B23AD4A5F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6l0LWL7wACGdBi9bOHrGQqSn2ahnUwbZBs4QuWBHvw=; b=BHjNvYNUyXikUJQEHPTW8M2xnC
	NuMKna57NILVZsnuRsmc3y8qOLd06+zLwlRwA7mdfME9OxPEqqqvgz4L5TpPLJbyF3F+NOrZP9Gx5
	8I5eqmRZ/HtWHVb76A8GKXT2u1nWBC058+q4uU3+Yvf6fSpJ4SMyXrM9BkOLuSNpyvHUTOY1VcvCH
	yRdbpV48GyYizcaL/7TSc9sojVb/ZF59181O6uFdVm0LuHU00kxPaTjq3+gC8RGAb97evwYHCvyvW
	2C0kwN4AKtn2V8RYShBB4aSgMSVanl0aLMPnF0DloxLObpeQ+HqGhhi0y9wCQ09+XpHJfXKhyL6de
	NxxFNZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjuZ-00000001W4G-2frf;
	Mon, 19 Jan 2026 07:42:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjuX-00000001W3p-0IvA
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 07:42:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILQSjE442327
	for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 07:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y6l0LWL7wACGdBi9bOHrGQqS
	n2ahnUwbZBs4QuWBHvw=; b=FvzMrArUyx2f9vJEQCiS19NjRavKmlRTkPsI2yc5
	xktOEWqmihjoaM65QQUohAxVQCPLbHmRuzWawJegXFgd0yDysEVzi6BBJ9rZ1Xwt
	K+zC/C67GOT7s5nSrBD6J/Y18dUQ4NYsMScUGjqW8XkpfKlBBS8TqEWtVpgIxy2Q
	8bEIsBRlXiTsLg6rl6rT+nce/eGm9E5QSaU5M6WKHu1iANel9+ZRvVI8keuVAenj
	3mFmJg7RlkpYJwvE6wSCzwzW5YdnshtaOY3wKwGvHmbQab5ZL4bLc3gXmQG2ZNcs
	cqMT0+CelHh24zNt4ttHvyNDyPpEFTf4PvNs3XHMPXpeCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5marj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 07:42:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bc4493d315so1162009785a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Jan 2026 23:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768808570; x=1769413370; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6l0LWL7wACGdBi9bOHrGQqSn2ahnUwbZBs4QuWBHvw=;
        b=Fxp6e6oL2pIujhEl/BUU6ntd3QxkfTfPVUHDDrKlGIDRNYebh8KUsji9FSTcvoKasq
         IyMzcy0JMd7SeofYHG0WEOpsLu6gGTpNiEqZngt/S/q6f4ImZpzla+InQiMmP1OFy+q5
         n6X+EVoa1RfzIDJaYklfDuM98hybSbSClO3vQ6Qp+9ZqQMOlvuuH/YcUprXoKbXvyVdI
         Scym9vgh/0F2Rge6qBCsHkrIF8edEDfoNaMwsFtu3QGn8mc0uvfbJZbcFpHMSJQEYoP8
         SAYlovAQs1ce9jpxlPuJGAGyEK/J3M79qVAcQn5CN1/ADktcvqsJSOePYHO4TbHVTFP8
         1q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808570; x=1769413370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6l0LWL7wACGdBi9bOHrGQqSn2ahnUwbZBs4QuWBHvw=;
        b=cnXjP7s/3eiaNJWogYBbw09CoJLSqEk92HfnKnMSSPDOHn8Jgcei9z901muI/3pnuk
         7NQ6baC+B7BnmKbTAN8hosGzvUjwRgqZo5XqxJEuGqfbmaq53kbJhnRVCgf/+rHiG6rE
         lx7DFk9YIKJyn6PFmBjURXkzqQYV/mNLL1Tt5KpYivCdS+tEOprlAoAN+ah5SfofgJV6
         YVpOv7bbJMvrI3ciClw7VZ+HaD6ek3xgrGV1siB0lQQpYKTnilBJoEuDELWJcBByEqvD
         8gpdb9Dn1bL+AbbBLbHf5WTfl2kdAnO/ZVF07QbWlOdA14EOHqgmvjTdC5lOz7kvsLwq
         nPow==
X-Forwarded-Encrypted: i=1; AJvYcCUE5lpmxkMKVLzpCknHjz/ejOJz+lgZspf6x5tOzC8N78jBHy6YKV73iTJvkIW8BwgwpvEAWc9FRVgr00J5+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCkG5TO/L8/hv9IT2a/CqGmz5CeBqiboinPAEpctZ6w7O7GMkd
	xdoxH06VOcN0tx1bvinW/ui9rlV6ZVDli+7kr41q6sWIxikt04W4SEv3COLYUv8uR74vpJ+wVcY
	4yQOAFH1yY62EVc9t/4eXsPal1uof9ep48nGaa3B0gMB+fUB7Q1yXD33VQ4ENlRTIl2Y+X8tk5c
	A=
X-Gm-Gg: AZuq6aIDP4R+1xl+QiCR+LKdzmXqw0xTj/ZChBE7ure1B0EPfnN+iFUfxVpG7XqWvhe
	uvWztP0E5R1iJt7EobcBHx3PrX4D6oN7m1i7Rx0TY6BVcRI/tyAMN2Mk9vgrCU011wF7J/5blFj
	tCJHdFQfSt88fMeZQyaKet1dnrIiq9v+cCPcu++1vfw8BbsoP14z6ygnkflW4NB9hm/YKlZbAO+
	Of7PzY+PmPpOCX5AuReFpTPU3KEJg2AaGs9z1+S7m2gwzEi++2gv/yn5C3c5ui64ClSYttQJNlj
	1qomPhjCtw2axcomXqqlj8b+97PbCk15SNPoZKVXAouZqYxAfbSQ5aDChx3Wdo3JKlKIkxqDbCQ
	8F4dOVaiz17UcWyCJAcVumKIRhLQN4lxnOmxNtXwNgPSVGjen602HJ28w81tPOmq8mqxWUJpZf1
	cqKNkQAe/Qnckcb1HOW1XRRks=
X-Received: by 2002:a05:6214:1c87:b0:882:79dc:71a with SMTP id 6a1803df08f44-8942e4a65ebmr173739036d6.46.1768808570476;
        Sun, 18 Jan 2026 23:42:50 -0800 (PST)
X-Received: by 2002:a05:6214:1c87:b0:882:79dc:71a with SMTP id 6a1803df08f44-8942e4a65ebmr173738926d6.46.1768808570051;
        Sun, 18 Jan 2026 23:42:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm3138500e87.66.2026.01.18.23.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:42:49 -0800 (PST)
Date: Mon, 19 Jan 2026 09:42:47 +0200
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
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Message-ID: <3sdwtf5qj3svipxcnmj43qnmerv6ouxnonmn4r5s7am3ebykz2@yqxwrosjcnvs>
References: <20260119063300.2741850-1-allan.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119063300.2741850-1-allan.wang@mediatek.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2MiBTYWx0ZWRfX4QiZFLkfOgY5
 KYSYWvPZFJLsQXIscA5DvuV061Jjzcj8Pp7ghOVSOe0koBWY6S5QOLHZhg8KV+aOIxTm6Q5v+YP
 d8qAQTT9wP6DPa+drkY/uB+Drfrurwynw1OMUV46iq6YQHI3K7oh3yIBN4hbCVoP6/Yqq1QdW0v
 0vrAWzerhu+S7BAYFjhRgf62XPFPzlXLUUc8j1Hqe+1FIwhyP/rTyEbwj6aJnA/f3YOSo6+R48T
 RrA05A4XFveHsEF6GhkuuigzZs5ten+HOG6PKksA5v2HugnfPJEj+MbZbKpZoQ1JgjADZoly9ES
 dLORxJpG5y8kyFznsuRxP4K9pSIOkDb/U2p5YoIRxpvRR6TBm4hCA5j2Vgf876VNlyD5EVO7rbj
 S3s+qbKgpq/WUU8K7MTntQ7/EdUov4oaivqKfXSRgIrFPQcPrLjcnLuISEzBJtp79nZCarDkcIq
 vXXZFfptI52hRfZxoCA==
X-Proofpoint-GUID: p0Awg8Fw8jod4tZcGVI91n7KEA3u18Hs
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696de07b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=mpaa-ttXAAAA:8 a=BbqIKv7TG13PCbykag0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: p0Awg8Fw8jod4tZcGVI91n7KEA3u18Hs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_234253_229404_F686C8A4 
X-CRM114-Status: GOOD (  14.17  )
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

On Mon, Jan 19, 2026 at 02:33:00PM +0800, Allan Wang wrote:
> Update binary firmware for MT7921 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
> Version: 20251223091050a
> File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
> Version: 20251223091148
> 
> Signed-off-by: Allan Wang <allan.wang@mediatek.com>
> ---
>  WHENCE                                     |   4 ++--
>  mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin | Bin 92192 -> 92192 bytes
>  mediatek/WIFI_RAM_CODE_MT7961_1.bin        | Bin 791588 -> 791908 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/871

-- 
With best wishes
Dmitry

