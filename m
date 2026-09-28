Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B34C9833E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 06:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=; b=p6BhU5R5QtDpCC2GNZnGYd1L5Y
	cKzQxKqHI7hDgFmcKWso+bQWeZYQQcfqaT2KkGA/FFDSJh8Mq1hIHLKDCfchsHi0gE8U1r5lqOavq
	8RS9bHsESFaowVdcpZ+FrN9iBsdb0oWKZgbUWCX+NmiMx27gSxCBRnAaj5iRCRjcFPbZ14UkHJobq
	jYMRRxUTqjM2TUAsitW+k12mp4jCoZd/kP3nhQ3y0MmhxecYunsmgQscSLdYqOKwiCMWTNQo6tBkA
	JKibBJSiMOtwSMHidMahnPLNgEQqtuBVva9UFXIyrO7B46GsYsGSTg3j2qc36YBnUKFtF/qaLZrw4
	YOMA2Wwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Sb-0000000HPJa-2A6I;
	Mon, 28 Sep 2026 06:03:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4SX-0000000HPIR-3zuH
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 06:03:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RJqvbs3311483
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 06:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=; b=MwXyitkkxn0o88VW
	l9uaPIO/lY4hQjuEshUjTOfxwQkdFJNbJIC0x2nXV8IPoAATJPp+VfKXE/zzGZUq
	7AxOj80knHjC2avsCthYU1qqiucB8vcecCMW8FTfVZPvqrVtD2iTPnvPG+TZmnKz
	OA4LQ38+62mzKc1gkv6N5ot1OWCQUX1AGVvGbSNXdMTBqiBH6SIw9/EapQtuzpjC
	tpYcvEvzYJupGnDV+Kro/VYrNwrYGwr2Plc0/uKe3+V/wEIVJ2w4ZP9tGBWV4ang
	+l6dk1hIOOc1RBADy/vhUFthXpbi6SCtw647X+H+yFZI0nVr+ioHqSZn4D580mPZ
	SoAkoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5cgmuqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 06:03:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d86d40acso66527561cf.3
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575407; x=1791180207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=;
        b=funHDkjOvW71qQPL0HrV9+K7gYHKiaQG8wDJrWDeTQjNHNIg1fPyLQXl0bWChYpRk2
         plGZggOUB2UziWpaz1vGrwe58f9bjPNkUb7EE5LpvqH/K2wRaBkQK4dJpFyhkAeiUUiI
         0QXX+CwSVSmOwFNCM5nAVuzSgesISHL085Frt8DsFWbdHYT/eybZidvUKDxM2KH5wQ1b
         8UQactZD/B5/INOsyaApOgwKChAQk/Ruk6XmlACUrgM+KgFJDqvRgIVmwZJQAp+hUQLr
         DJwIoD3nxVShIow6b2w8JorP7uR8dSyeoK58HlK0Aygb4BK0t66rXfP4wwMs1E8mdasv
         C1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575407; x=1791180207;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=;
        b=AHuH6d6CrWLVLjxYLav8YU4rP1ott2i4WK4Fs2kKbxF3DbdQ+YqZQLZd8rTY/OzvsT
         cG9mFT48m84oEwjfzWzqQbU6Rke1loACsHq5BWRmFxVqMisnh4A7vF6+bmreUtnGMqzK
         boayNNvaszog9t1PuB0PHXwFLGJhCVrRSVaBoVMiCJtY28QtbtIvwWwywmC/L5OXhIz7
         2HFMAQluC076npux32ieU/po6Edvy6XmkInIqm0sDvVPaBx9WGZnLqY/YNzUHP64Wtqu
         j6oOpq32s1BBGmtu2eEwoNSQ7yw2karHr3zd+FJfzGLmItsra7qk4lxRHT3O1oOevjuP
         vvrw==
X-Forwarded-Encrypted: i=1; AKwUvBy0LGYmn/phSXrHsZ12bZYmbaY8+plxYinn2XvkNFgsuymDOMv6Z5ghdytxTeX8S0fBc6GnhmuVAvR7BM8u1A==@lists.infradead.org
X-Gm-Message-State: AFuF++lAwI8yTH84zxbhCtqIEreMnXpC2+VVby2aYbxQFTznss91J9wQ
	LK6wYF2Jyo30egqoa9YfQANKHtL8T26qO4CSV2Dm7zm2u0J01li9SoVObiFzqOoEfXLeI27m7VK
	Oej+iBumx9sNfBB30PzLKw5LmJ2z3CJSl8F36eTg3VJJALOV05r3jZYWi7eZRrmKSGQnFO6EJjM
	4=
X-Gm-Gg: AYBFou1Bj65qf8L1nqZLAPEhHWyqaqEgXPaQWTIjk5oZyv5m7xd3M2o1Ex2BcGhD0qV
	5r1bX6M0CO+31wvut3w0QBATGYQmBNeHayfY4ODh08+DMfiywuUP4N6o9kjEjlJC7RoOIyV/isY
	WFVnzyj0j/VLXrTm+8oroXtxtNgGvK/ZF0iCjZtAynaLGxnNpfEIuLIKJ9Zqre0e6ldX5xToZwS
	66mmTYUApyLJ7BcOlvB4ufaudDeMphjHC64U7+AyYfq9trEyqMmmzehbaFMH4TUJHveFqURBi5l
	f9+JMfYQxSBZgTSR+lRVpF/xedTW1dtWEYjUV4Z31jhjHeMFiIhELdGiuYC/YdV5Y9/RShPr/p0
	KLxjU8HnLYNqHHzMK/qGj3IS/2umu
X-Received: by 2002:a05:622a:580a:b0:530:8853:1be5 with SMTP id d75a77b69052e-5330dbe7652mr183346371cf.10.1790575407294;
        Sun, 27 Sep 2026 23:03:27 -0700 (PDT)
X-Received: by 2002:a05:622a:580a:b0:530:8853:1be5 with SMTP id d75a77b69052e-5330dbe7652mr183345631cf.10.1790575406762;
        Sun, 27 Sep 2026 23:03:26 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017816efsm113080805e9.9.2026.09.27.23.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:03:24 -0700 (PDT)
Message-ID: <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 08:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai
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
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179057359762.92994.13773102514654073802.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfX1rFBUpj30zRa
 8r0tjt6ENPUPfr5V3e4/Je9EenaUgsEu5lAcO8v61y+R1plRRdKCnjU/AJevLQXAoCTlvpDDs0l
 XS0v7BMNNAGvVwySBaCM++RDSuhNJiAsT22ddd8JnFD+Ov6tlf3pniyYF0HSt39aETdAKgPl/ZZ
 BzCFhVGAspnpw0Le0SC2i3biOlfYbOP7bBogJwTh9w2aI1wlVmc9p47UOrMl8N0Wxes3lR53imi
 4vEOeTbtq6Ei/ynCzc/KwMoqRglKnHYHDzw9QneBCsbkibxEXacDzjz0jM/dYpRGr7U/N3SXiLb
 Rt7Ag0ffaGmf95/TQJm7jReTOa2vFSODX8YB/eobYdAtKM9I8BHo4vLw8D/V/4y6xZv26V/KK+W
 Q1fiw+3xE98LBhKPukMzEFW2VOvfR4QOABuWPLl+Y9tBip0z0m4XWexwu43pUMGSDc+AcPsozRo
 mJcHeDXSWet8qptItNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfX0eQwfszI3U1+
 ZJdTq13J7EmeQ5R6GGE5sZ5Yw5BkCkCpwOAT5SamBqacfEzmbHninqd64S76wO90Fd8JC3XOb2q
 F1HKwlhpS0pBfOZhfjwfD+kaMcSwOdA=
X-Proofpoint-GUID: tMm0IIlie4NARfhC2rlZtxkj404lOo5Y
X-Authority-Analysis: v=2.4 cv=QvLLTlyd c=1 sm=1 tr=0 ts=6aba0330 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tMm0IIlie4NARfhC2rlZtxkj404lOo5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_230330_115058_83D3541A 
X-CRM114-Status: GOOD (  11.88  )
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

On 28/09/2026 07:33, Luca Ceresoli wrote:
> 
> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: display: Use consistent indentation in the example
>       commit: 370c5d9004f8b754351981d59fc26851bf943e93

Thanks, but I expected no one will pick it up, so I asked Rob to take
it, thus it is already queued.

Best regards,
Krzysztof

