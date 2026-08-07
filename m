Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5403CC5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=; b=RS35wC5h2WSn8R
	gkhNnuoIlQ0mxTcWp/bpIq2kp3A56sF++iiXI7LuZXzCUzfBpo/6wyNTTV66aUkmwTxc3DChPHIQj
	WAEH2RiDLKGBvyasWlAkJWNCDBfaCWEzXZ58uam5EpeclNQN0kHHRNpxnp5ri089itO9OiIDV+Sv/
	9eUs95/vm9+WwRiNkXBhJSSIlE1sNVlSOHN40ioPveDcxPJW1kyGPyeg6j6dLRyF9ZYKTx1RmjN5e
	O+1HRVxUguDbaCrXC21/BbM8/RltURe72Uq13ier6tLrmUeKC1Uu+yeXkW7AXl+AKsIMAki8hFCG/
	7tcBG3gRHIjLnMY7hOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJPl-00000007znf-2yG8;
	Fri, 07 Aug 2026 12:11:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJPi-00000007zmp-3lR3
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 12:11:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6779WC5n564645
	for <linux-mediatek@lists.infradead.org>; Fri, 7 Aug 2026 12:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=; b=fcdIfSMuj3HLJvrR
	FVFOIUGxLVpO3A1PWuCnkR3uTVoeQDD/YnUUd17H9FNeggns0tluDyvT1asx9JrH
	f8AEeVCEVlNSoGMahDbYKSHDa55cxKM5yc2LplKk4A04+mVj3/XLRA4bYUNm8PoJ
	uJXzwOw3XaBaqpcoXGqLCQtlAIBHJ/LLehKXYkGpF4dDLcWowGphWBkhXUwJPr7t
	QCF7T7fWn2dBQOqdrfZTAEmoTPrDBPIU2eMIcEMGRoEkyPKfeXTylw2AJdH2odfN
	ZuRf0wUKftiQrppaYOWNWLE/ZtAPbkXUAP6vMD5l4RHrND5PW3N+OYsamJS64YxP
	qzwL4w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp8h4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 12:11:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so34019441cf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786104661; x=1786709461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=;
        b=HW9GoT3DWkJ5PetWhOKUtGiTbOcsLQ2t+6ZtzIWf9d3DJubjRhbmp4mvGUgBrCO5ka
         OwF13E0mx1ysKr1HIq98/Ks4grldzMzAA44E8i/ZdCoX5suco1/d0NWXlGmD/jNTrPg5
         gUx7bcfwa2tlqrw7jHSEi6MzzfRQO5Glwxy0JQP5p4lwRe3fTOMVXso4dGg3sV/v5dzl
         C7CeKMSwBO8GwVYVL2JIsAusaqzIE3r0kzoJKJaRFT7kU+lTbSKAGuIDw1WizYK+2CRP
         K4PS+oaCjB5nOGlVcXL6FfEFQVmoIPtwgIrrlgrFF7muVt3pK/EGtvWi/yw8aAKVsrak
         fGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786104661; x=1786709461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjdnzx+QsVtgM2X6y1LWePg9rWQkquFUfDwdlQM/D0k=;
        b=gIdpaUqSHRIt2fOMCNRti4u1PtHsYm0uoK1AnxrBk67l6ASi2Ke5BJufmapnadlPIf
         ixa18wuOJXkw2Q8cnnYwGiaC8HQYiLLHQVOsRV5Zr34NDJV7CG69T43Bw1eMte2bgAxH
         xRTPmDL01TnXnSjJvRUbJnLelFcXMkWqHajC518R9xaNvR4XFhcdjcCRSdMw0bhp2u5V
         x40Mdp6d17iJeECnMESjKYJ8lzV2NCx3QhTf0RqGQ3YTHI2AkTUAht6OOByiZJoZn5VA
         zOxJvLwu3gZmyO5xQqhOBGN37Q4OfjkW5EHhD1XeuRkTrwIj3oNx3/yk9OyZHHQr85yQ
         mihg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6FBAhhnt8MLi5tBSS0HMSfaQOXmGGHmOikHDK6iotU6uzmEaTrpOCTU6GjH/sRv1Dzzv/hMUcXFZ9qYjcrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Bp+tclu+N4+Wq+F2Kp7ODhL1bOIpA8Fmkm140+qYfX08BcBn
	I79he5FBJulxju9M84f+XtBabE4E8RzJXeDfkhENc9wRAckiBDBXN47ui5s8/JkSVz2/lsRwUUj
	RJq3PJFF7K0e2kNe52Zl9t2ZDGcjzWF5DYqf7+21BaqPei3uoSskw2X3+F2WzktKgYXTQo6dBEe
	k=
X-Gm-Gg: AR+sD13p2wP5MVFPxC5dm50PNbQu9491F6QN/0CHKa1HykwqYrwQWkOhmtMwe+vfq8N
	roGi4Hx/moLPbuGrcndGx0W5yq6/cJFjhGKWvr4LQXPBndYnar1GhpcoyIok7UIy8old+WImy4U
	9xGlYMZKaCZNM8P7ANmZNpdAFeJ80ikT6RJgi45hPZIxQGgowkRAXCQUAKhZJP8+eDRvIy8WOGW
	dTG6oA2/53FySaj7froGNKABoNgX8ggA2VLUvnOPYR1xWinCQdlgecHM2mhcfvxjTWQvS6xd5jx
	W5f59puyMo9EoaMCFeoucimDWYE/tNzRW5F0VqQnCRyD7LpWN/ZjUWK9E2W0aN9yjmBwcEC9j2p
	dZkkbkYyv7uWCCitIHqpInVhZQaT0WJNQeuPXutpOvGLbRg==
X-Received: by 2002:a05:622a:5a0c:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-52ce61fcb59mr247580271cf.43.1786104660339;
        Fri, 07 Aug 2026 05:11:00 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0c:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-52ce61fcb59mr247579351cf.43.1786104659899;
        Fri, 07 Aug 2026 05:10:59 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea27b29sm41957535e9.11.2026.08.07.05.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:10:59 -0700 (PDT)
Message-ID: <14ea9fce-2bb1-469c-b751-32f7a2e28f48@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] lvts_thermal: Make reset optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        rafael@kernel.org
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a75cb55 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=rXlwX46IFeUSpfNkUDcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 13gQjgAMQpGeYbzfGSdpBK2kZgoIU9z5
X-Proofpoint-ORIG-GUID: 13gQjgAMQpGeYbzfGSdpBK2kZgoIU9z5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5NCBTYWx0ZWRfX9ZxbH1XEyf2A
 JkKVVM3Fe4mcw0VOjiKUWMDKZrwjVVKXUYcClCgAGkTDN2syQtAnAo+XE1YsjpGQCcb3J/000og
 P8keRh0IPBOXJfFeq+pjhIQd+2HRIMuuAmbbg4K8xsrzsyY9NAU7fHJICDr1Ni11bu0HcGe0JZM
 ipe6u5SS7OEwL2SngJL2srUlaCHm23O7SRRb9j/rDYnnHuKOqpu9pq0OOEUiL+16+dr1gkqoHXX
 sV70vw4G1U1zdFk+thImK18veFD4g9WuJ9TSa+D006oTvrXNtt1ZNhzdsJ7bxr2s1swvK1598aM
 k04wpFoExt9M7A9qz4JAxRAYLPozWcic7ImJWgC4tOF6AIg3pGpw5U+CcVWjrjuqVs7YtcjerYH
 qiQFzh1l5hjYTG9ecSzM3RjVv6Dz0PvXfHRzstEDJUYWca3CT/j4M89T45Io975Wf0rRPxwFz7D
 u2ubP4HEwXcYJG4C9KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5NCBTYWx0ZWRfXwyrWf9EMFyTT
 41iREfAXrNk2iBrTIIfNpQ06sjv3nkzuVs9maeUgNiDIS/D3kZx8U5TAn+251qzgOKdPj7B/QIz
 Nce+dHRz/wCdCa+6GUIqtb1GCEP0o0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_051103_044350_0D8A1505 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, wenst@chromium.org, linux-kernel@vger.kernel.org, jiapeng.chong@linux.alibaba.com, laura.nao@collabora.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, daniel.lezcano@kernel.org, matthias.bgg@gmail.com, rui.zhang@intel.com, kernel@collabora.com, krzk+dt@kernel.org, lukasz.luba@arm.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7/21/26 12:52, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>   - Added change in bindings to allow resets to be optional on MT8196
>   - Made the code change simpler and without paranoid nonsense checks
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: thermal: mediatek: Make resets optional for MT8196
>    thermal/drivers/mediatek/lvts_thermal: Make reset optional for MT8196
> 
>   .../bindings/thermal/mediatek,lvts-thermal.yaml   | 13 ++++++++++++-
>   drivers/thermal/mediatek/lvts_thermal.c           | 15 ++++++++++++++-
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 

Applied, thanks

