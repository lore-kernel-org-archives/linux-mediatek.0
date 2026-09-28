Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA001C9833E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=; b=lJ1e1rJv12j8yneID+3rSGrL0U
	fVUSwM7WZWTx+dxCDWTJyopjPyeQOsfpEadSmGlSGZu9Lzcil3YAy5120RXnXK3xuFz4hylI3SY4Y
	Jhj7LCMwgBYDqRdf4S2jvT+q+T53gBb/B9VtfTg3EgjqCbsyCH6DBZbvaw2690txGodzPWF6ePIUm
	SGH/L7JDsuEmQrrLbB9CWJzksRZ6zeLDnhjCfJXf+m5e1UOtMA2ecHnpWPLo7occzxoiuUyuP2N1p
	bh/xlHofcUkxOj3B6HqFPQFSpRfIeSy9S/h+0kUTv7GhyH4EIxTg0D7UQ6zzZuegQkG/7HyEi5jYT
	BrSuu6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Q0-000000001l0-3RJe;
	Mon, 28 Sep 2026 08:09:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Px-000000001iu-3nz5
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 08:08:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xMM11982076
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 08:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=; b=SKDSW8Y5QhLznaQ1
	yzxkud/7TYJOhk6dx/p3qyA8tC7kxFki3tE+Nd56wjxF+b9iJASw0vjxii6TezBT
	ZMdgxRrVQ2HKFKydfWaRhBoF1GZenEMTC9ZAlW7V7JbrI6fP8P5Zye3NyIqA3FnL
	bZR5CJzL4DXRwrnLCl+DzAJSwTuaS9FLvO/Sz22RXBSSG5drpv8iuVkBtm4eQsJG
	dpY7YaSJfuQDnR8mcWdZIemD2SZhPnkbHriD1NzKmc8auOlu68yM325Jq+Uh3j4G
	/z3D6lwBxyFHr4YBKSDVwA3Y/J+s3jJDWavHdfwb3amjUN9uEsX5VHOL68NyDm0u
	n08ytQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t0h2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 08:08:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so283446785a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582936; x=1791187736; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=;
        b=AAChiHA1cbAT3S+uel57gcKsYBtY6FL3PhIOZXURv9C+u76ShIDzlZ0XAupDabujZa
         YRNhC05aVwxFQbCdAWCVa7TI7aAZBaI7UClSTMi4A5jxcL8IHEE1RoDx3Se+A78I4cb0
         VFyY7wr7ppX/I9MeaCbLXwv3FM71RdoQL1fCFiryIMi8lGuzGcoxNCBJbISbpM2hyJud
         j5NsKBL8pS9hMxn8de3ipHy16pQhhMVMEqCBoCY/gHBek94La55BhHbXFoB/JTQ7ptSC
         Duh9wueTKChkNAUKLS0hXNfvhW2yatdGVSMT2grPhmw1WJNtEQwdaNKhlhHLWBYv3LmT
         +/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582936; x=1791187736;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=;
        b=kcXj50nCZmnrfANQn1H6XmLGq1pTEPeB7smLX1sKQTc1Kdtzldvq8I/iOkcPRfvgFE
         Y+yA2lIbywcPj6vW+Qh5XtDUpgQNJuiA+EUmNrBMyxJnMddXr2n36kjXg7s11oSEOPdb
         S4J/FMnTJahcv4XZL5EAQGKN3BOCytuoXOe95HzHs6KeE1tl19Z3klH8OuSWi12+Mxmn
         JPruhABtt8tT9PL+hQqnfzDa+1EbVjuqMTTMJESWApzqmWRzqXwrPRugJUDpmMgyyV4o
         meidoNt4SJgXrtCYfhZRXW/57Ua+xVx+VtGFciw5K4kzhzfLCa4Pvc1iYIqe2WnpAv5C
         8clQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4WfEN3kFf0YWv3cI0icQvXGS3E2V/+Jw31y+7DgjQjj8RCaZS/XDauBuCmccdIqTIDCkGFEJU4fT4Uo/N3g==@lists.infradead.org
X-Gm-Message-State: AFuF++mWvmTg8uf2Kbzai5c7JhrDQXESaneLl0ZjD/vN7HkhW+9MKmWl
	jagd244Lks/9p6FYjvdoJH4kXQlnL6mA7BhHE5M2nJOqX4XDvr72a1hoEJKZwKcUtajOyABtLLo
	0Pqny/MBoCWhvz/9f5dqwe76+0zp/R6bybo+G5cnmfdqseyFdW5q5DfrKGmsSEbpeytFvM3WI7i
	k=
X-Gm-Gg: AYBFou2tJP+3x9ghEpGNSedzN8MwHqbkJ1+ku2vh/dQkrn5oEFrpzVhWdxF3+YMunAq
	xKYPtJHu+cwTN2TZgjFZc+kFzLXOYh7TYNTEqyM8qTQeQNSRp/4IO/9IosI9ayDp5JScCB7sCTc
	GQDi4X8v1GLEC0gfgVXi2HJuE9B8Mt7shgehbZj1U9m+6/3v+ucOutoUq3NTEj4QQ73DeavgF6b
	u/M8MEqfeGwCdQJQyKR9DP3ujJostWflJtfI5D7gNJDk/7AA9SUaItW6UV24+/VuXUGltfx7rXl
	/Hb3paVWcPMobUoiGpRDd1bgBpW1ptrE4a/njofSD7DLSEUnEhW4EwBoLr8f06iqSbBWlaWdXW2
	6N1eiA3fBLrgSGuDNvxkjzgMTyiwq
X-Received: by 2002:a05:620a:4150:b0:939:a003:7127 with SMTP id af79cd13be357-93c43d15a2dmr1823459685a.52.1790582936324;
        Mon, 28 Sep 2026 01:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:939:a003:7127 with SMTP id af79cd13be357-93c43d15a2dmr1823452285a.52.1790582935772;
        Mon, 28 Sep 2026 01:08:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm26045947f8f.12.2026.09.28.01.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:08:53 -0700 (PDT)
Message-ID: <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai
 <wens@kernel.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec
 <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini
 <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
 <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
 <20260928065837.GA22609@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260928065837.GA22609@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfXxJWW/IW5mkNf
 AfTyS+k5LRetlrGvBtdvo7qOvwpC67zLpwoJnoeBRMV8ygE6D7pJy22fPEJNnazZ8hzWEAGgQKg
 51KYa1j4inEEtxgJtLbfF0Y5i3AHv/DtXn0KRC5U21xHISxYf7RxqHfqPIU5II45awIN5bVmdiw
 QGL2YBD+tksyCubln52DoRZVQt0f/nJfgyzDhN5PE2ouZiOmBUp2033a0u/wyROziCJoscH13Vv
 uafibVH4Mahts7gvv8ldcHXoIsiGR25oq9P/00aQwo+SQ+W17f3pq60KOrQAhT+yz94d+xWxU6M
 oWM9RkqbdsRGKrM80Nm5KFba2Q1iY4Ibc6CBJCpChCnkv4caq/XvRWBrzdjB57Q8VXKPb1h6Vt/
 ycmou7iRoemm4MJ9IEwtzH6VPBuCCL5OEe9H746is1bBydccC+lT1yQFrLjciPTjiuV08PV/MCa
 gEsALWo3Kocr2cvbMtA==
X-Proofpoint-ORIG-GUID: X_x_lKxAQiWju4U3CT9MAxNUG99y7WNP
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba2099 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3sPRIKSABCI_lCAVw8wA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: X_x_lKxAQiWju4U3CT9MAxNUG99y7WNP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX1sfuS+oxUIhG
 NanzUXWfFH56GsRB11CENr++9nSWsDERSRsu0qQvPZcA4kXzHKjS9NOnkCxtwCV8LzMyLGXVuPE
 Lhsy2cuyWYaCiigyAXy2wvO03ddwUX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_010857_981983_936C2694 
X-CRM114-Status: GOOD (  13.61  )
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

On 28/09/2026 08:58, Laurent Pinchart wrote:
> On Mon, Sep 28, 2026 at 08:03:18AM +0200, Krzysztof Kozlowski wrote:
>> On 28/09/2026 07:33, Luca Ceresoli wrote:
>>> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
>>>> Correct indentation in the examples to consistent 2- or 4-spaces
>>>> indentation to fix dt-check-style warnings ("example 0
>>>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>>>> re-indenting entire example just for that is too much churn.
>>>
>>> Applied, thanks!
>>>
>>> [1/2] dt-bindings: display: Use consistent indentation in the example
>>>       commit: 370c5d9004f8b754351981d59fc26851bf943e93
>>
>> Thanks, but I expected no one will pick it up, so I asked Rob to take
>> it, thus it is already queued.
> 
> Please explain your merge plans in the cover letter next time.

The merge plan was this going through drm-misc. It got reviews, no one
applied, even Dmitry for msm only reviewed the msm-bits (second patch),
so I asked Rob to take it. This was not planned, but result of usual
drm-misc inactivity for bindings (many bindings were not taken in the
past or with noticeable delay/pings).

Best regards,
Krzysztof

