Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482AFEFCD99
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 11:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=; b=WITeP3VVXWtcTQX0UzyLbFBPh2
	AtE3AjfpuHGnEBQqFDx6qCyqeEAMW2cqoa6vT4HUDe5OBVNNtbt8yFP2OKBm4dWZdUQfV/YnKRM7L
	jW4E3DEQBbzlypxzQ5jJh42YPk7lRXZ3GfoUpnvpRFd7cfaDGXrWQP7Y1FfKK5TQMQ/Qx8eQnf/4h
	mEucdMPn6T/2XpqBNEAu3U/ZLemEV3o0QFxSK6NdJyJU2q7B6LHHomEBGkZEH+dsq0GLjj+3SFVIn
	k4sDnJ9S+4P9IYHjLLtNJ/2CAZW2IbDlPdis2FQEtx6oGhxMT4UecC43VQcgFiuDFZ/AXwwTSUU8M
	9zNdstqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYVt-000000079b8-1P89;
	Mon, 09 Mar 2026 11:11:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYVr-000000079Zz-2TqM
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 11:11:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629ARxXx1587414
	for <linux-mediatek@lists.infradead.org>; Mon, 9 Mar 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2vcqntBHnJ9jNcmMCrhjcICJ
	WTC4/uHfcjNc+otCaEk=; b=JeyvWL9CvFdqMvYH4Uwf5YXE6DfuYFJRKgNHwPFY
	j4P2q15t+EjR4zrgqEgCtY6mhfSEZVxpWD8Ja4EEbbJDJoOAyAd77b3YHrktAGR8
	sNrWbQJZhKLG1cyMMGplh0w41UKXhpoPf2MeJiOuhVMxrIJl8FxS0tnYn5yh/K3i
	tdp2qiAEg51gDf7PkG3fG37g1BIo+w6nyF3PQFjASzyrU9UmTqeePxxdNJ8YcKQo
	GTlIlhBM6cKjrIZ9Et6Uc7EyRo5Ofl5HTG3DK13vijuu2TQ48ylv3nf2LEd7a8DA
	ca2Whh2J67xeuowrAUHuoD5nRjBWvj1EenFqV0oJlTNgbg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy98kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 11:11:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82988b04c5cso10757589b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054662; x=1773659462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
        b=LzxhZc0t2ZIdM9BqnoswHC1DufTvsz5Qmeed0wocDBXAbFNONYJnc7r3qEpIH4n5Gz
         3e0KMtRiTNLMeB5vvz0hwUdUh6ntvXDlYw7ALUU9p8r4+/Db4ZMxCvZDDwkthtB4ktZO
         25LpG2DoNS1phmaNEN1Casprbd9WgrsrHrqGT9HHL8/zUBoTSuvBSSXQ4OQw4GSvdJHj
         ReBD9y0d3ngodICyzCjRqvYz+Lx7FMjgI0KJphYJu9WzrW6J8QxbOYECSvfS1ENvMzUY
         tivU5KHHWDhHV4PTuwKgRMTG4ubZZ8cKZU6xvpcR6/mrQ172tWS/bl0M4QUrahDx2ju5
         vyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054662; x=1773659462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
        b=EsUzAdvBWq2jOfwDylMlBxNmU11D0+TVsuXgsClE34u5hFcpDblQsFvIHE88CLpltU
         B0XxbmTB7um0Q54saadNQ9VBvw9Yeso+Kxe2AyI4EaJkLR3kLPEy8pZU37pADLHdP0Ep
         5OrFQoKxZoxV7Yw9ymCbdV2PQS3P2u2wrmh5kehh6UV/yGa4JNbnB06lvPKnRhmwi1Vg
         oVW0ZzEYYI4neHMtWeRxOufNS3Y5S4piohP3/7G+gZzoqWOC1PuBNj493Ft33uE/4HJj
         ZrhX3+3lDFSmGbLS1C2g1wuFXGgTzZiSMeNXYU/aYLerHgSTyJAXJuJTmnv65+cDjNMA
         mbbA==
X-Forwarded-Encrypted: i=1; AJvYcCVKN7el+tX+F+C9O63go+7pNrD5OFbKm+FBEFBlj5bLuGpdNMsfQQsinIkqkymtqk6h8v+aIs/CYsbuXklNrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB/2VxzlBkYyGRMjvYRvbyysTjWm0B4OUscrFRed3StlYN2A/6
	JEb83FT5guN2qHKK0a13fd6jdrB8i3ffIZyw0gsmsF8sxUIrtGV2zej8htvS0WqrOOfLUpaJ5hw
	18rR9Gj+TyGTA2GcI2NOkZIT+8/96KkfVST0rCAjBKQtFcd/G5K59G4mk3E4QPo/fiqCr5DPMGw
	s=
X-Gm-Gg: ATEYQzz8Guz5AauxcVmCLjymXecKTdCFs6NTBTuRiwxclbkrrw4r63Y7qcz0NkoATfw
	SJjnYklIKox2dg7S/Qd51KFYTnMhgJ12qNkOIok/YkxgUU3ZICSKycc5iQRzz8gbrYBJrkj8RAY
	hJ1/W/hkicNbYPT4CdonXejQlbPo24igYHWeiqNt41okvQtttFtFAzOp4DcLVmTaPPa6/Ut2IWH
	BUHygKKMsdgxDVXqn9RFIzG+/I0QKQENyUF4dJp+7BELlzBEie3Znk4HBb6Zt/6sXHB/kN98I1b
	U+CrZBbaeTtyU9oB4AgmdgJAW4VyKb7iiIVVo4areoejIpXGgXpTcHfT2UhNnWte78qe5dJ+6tm
	ygR1BV1CMqghISwxBfRJzYznkogsSyjzhgFc=
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829a2d85103mr8988606b3a.20.1773054662325;
        Mon, 09 Mar 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829a2d85103mr8988581b3a.20.1773054661861;
        Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48676besm9478833b3a.40.2026.03.09.04.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:40:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 5/7] net: stmmac: use u8 for host_dma_width
 and similar struct members
Message-ID: <aa6qu7oWLeB0Dpeu@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX9xuxjnzUr7p7
 dOBjlxx65Q2Lm74kufw1tno6cx99Zo/sfUW9+HJ7Sk20IHCzEfdpeTTfTS/6Vq37vlHoV16hDEs
 aErobN6RkF6fE6JfwWzxUTc8N+kI6rGOTLBZVZuVa75hs5Hn6lK1VGZ8VttKQ45yJm9YorXerXE
 pZOVqOHAP5fy+hAIKnNR9IR0BHakglsn/Ke9SMM+9nblkdjjtBqbGg3SUOmxQ1KLKw/FrYIpRgx
 tK5fcG3z+6sJkmLbtri0RHzT/bcKigLLh5GbkHdtUsoTKM0yGAC5PkVPGmx1QlQYw9JX6lovPje
 M9nGUFCKG+FKV5AKpeOMKgqYgS0VMhetNffsfaNlFqfKnW845UGX8uVV89IqQoiLapIZJQuaTae
 2HzMCteJz47HEWej5X7uy7+oRa8Op3nTPWtEcc9NqJH3xZiK2R80LOvWRwHXh+ESiurftTyB9C9
 T266hkJdFzLluVgd5ZQ==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aeaac7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=nXI6kmJP-DpmoF2jiF4A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: q5yyfensI9u6EuS28_mfwVw7x4LpBxZe
X-Proofpoint-GUID: q5yyfensI9u6EuS28_mfwVw7x4LpBxZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_041103_651342_186E8688 
X-CRM114-Status: GOOD (  13.46  )
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

On Mon, Mar 09, 2026 at 09:39:39AM +0000, Russell King (Oracle) wrote:
> We aren't going to see >= 256-bit address busses soon, so reduce
> host_dma_width and associated other struct members that initialise
> this from u32 to u8.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  include/linux/stmmac.h                                  | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> # qcom-ethqos

