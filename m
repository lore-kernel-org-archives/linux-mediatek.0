Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F63EEFCD9A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=; b=KoAnc4S5j9FIRWY2SfMalWoj2O
	gCf2oWbHHgNUZQ4+sj7FaRovmV6aSf70SOPOE8PrmlpfmjwBx3MA4d25e3tJ6vONU+MWKd1i+AvCt
	N2+zk/JyAOh3NLngdTb8sysXgpteuyQpc8DkzY+AgNKeUu/mf169Rliz+Rvg/emXMHe2URqe06NVP
	sasJeuOcVd6BhbH2mydv+21G2OQelgaWk6VH4xVv9H/OuS1yVTORoVlvlQFktsXZWCnIqOlTrZYyf
	wjEid9r0eHoQf+f9w94yjEyeToCG8DRWX44dAdsxgCqFMqONFfglHs1HYi4EIn3VxDzIZ51dSEYej
	DolyDBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYRx-000000078lg-2BBW;
	Mon, 09 Mar 2026 11:07:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYRu-000000078k1-2N9S
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 11:07:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6e1c2195117
	for <linux-mediatek@lists.infradead.org>; Mon, 9 Mar 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TrEOcA+LHeeXNlAZJAw+XIej
	7hfOvjSZS4fXCV/6ZP8=; b=cT5pkRzXP6qVFsUdkwZYKvpu2QDIkKWB/m+APQg3
	xlQJXyfUDxe5z5j/J9YHHaQyCPT1iK2NE/VExyzQbVIPzEXUZl+ZXZxrAH/SZhyi
	tKDLTr3m9k69Gy909AFRL0cI6KdJD7DFNOmt3wC463C8wLM48cDSrkLOLtV5Ix/o
	EDSTiDTPnhe+j3+TlBGosUM8+4DtPOw1rEaWNMn42G008p9ZCTZJMzyltrDd9F4Z
	O85hGkC/n+PYGdq5mEMfYii5Gpg1wSToemHQAr1t3Jy3ucXGiNbcLnHmcYvBMfaf
	Gujxy+JLvzq0bucFV/9+WtoERcTQlj3aLeDFfn45uRcXQA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u866v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 11:06:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35979a03106so8634824a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054415; x=1773659215; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=GvozxAKPuHck/JyAhVHnOTTZQ+CjkDAIKr76umGOk1gJQmskLYTRpiYkpaX7Xl1tHg
         nWvGmc1b2YNMHrwGMG1V4hH0NY0BeIDIaUmjDuNk3We3fMrQJre684AhqhegDLUKMu4q
         Nk0YXzR5uW7+KGcSxUAERfouSV+I/jrSLBlwUp2zfh+P9hdm60ZtqGwTn/q/1TmXiFKE
         GXCndBkQFQosBlXqXqDqPAzgLmhA2rt46JCcRg9EJPmI8vg3cvPrkenDtFM7QcVfwTQg
         qSsIEOMZUPrYPiO9WDF6wMZM8AcJqJAybX5QmFQ3oRKQWihUwJAOACzDpToIt1PgQjZ1
         21dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054415; x=1773659215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=RDapVMCYhTXYZlXWSo3xzSX/xg2GIwTQzTz4DACiXj2hLz0/ZBpmwHXGZkSC7TljYq
         Dlf2KCm7ZqpzFI6H9UoJodSxTWzqF3YjPFp2Z2qSZpSl0kf36ffRp6NXhYWEBQDJpRSi
         MweYStNRjhBuEJ5rzG4oPPp5+pViTwNYCx0bwJf6yNV60NE7Vtueu6qfzyyX/Emg9jpd
         oZagUOCZDsZ+0E1BEYbE2Mqxh+R0S5dM970zZFyV9mY8Gty6ahos8/NhfEJHbYHbDLaH
         uyUBXvdtSNmI/y9HWdOuGaXNMHmTUzkmWAgk4u2UsUbOlGJMoCtmrAybKk9TRh+jUPLj
         QCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmEmZvxQbM3MRkcYW0FDDf8yiSUZ2KqmWsY97Z8VITVdeFQUpZ3ia8VxSzqFwttuVoJ/050s7HvD2eQ/43Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi8c/OZybtopc3QZSTclg3w1+rKX15xnSoyfZC3PYtQ7O021Jz
	/YasRui5x+XKKGUhxGje7csLne1WZCV96rxcnd6bNYYKW/wSyhjJ9WIh8xIVCD6i23evIZ9egb/
	WvltARz2ANDfjmklXAkWpTxmOY6cpFKWLKP9K/arzNFbUrK2E6i5cgJhFQjn8VhqB61e4/+WvFD
	k=
X-Gm-Gg: ATEYQzw4/wPQ/ccdLletzPXJNd7BelX3cLHUUCKou5/cmaYENhHs8ExGJRP3FbNcpyy
	GApBaAzbDjavJA9b+N7DKPr9bW4FJECENdtriws3aW3nZQKKGrsa/TZJLAqBRBp/0PaeAQzllUZ
	W3Vsj0XZVnhxVN4sxqkJLak3Oc5/EoySMQYwArIlb/ew72gMheUfpdm/9ptJ025ReMOJEpib8U8
	Mxjx74vh5up6mOPMUb8N8JyrqT0LZR5f21NHuihFR8edkPU00TwDvYk9e2wN23ImS/8bMAzK7oq
	KZYbH4MW+n57fUvMbXwQ8Fg7Lou0ko+OGNkZY8MAAg5fcc+NAKsg7LtucUT+NAxY2D/cexyl52x
	jzYYtwqq7YZRTpDBBMPSrJLwSitF35DqNvMk=
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443430a91.34.1773054415398;
        Mon, 09 Mar 2026 04:06:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443395a91.34.1773054414906;
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcc2d096sm4067057a91.14.2026.03.09.04.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:36:44 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aa6pxGDvslU9ygra@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
X-Proofpoint-GUID: mbN9gZ8kA8oOu83srTcXUGG1pm9Q6y6b
X-Proofpoint-ORIG-GUID: mbN9gZ8kA8oOu83srTcXUGG1pm9Q6y6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfXyTaJLm7tYIZd
 yuHUCFFDe4LLkbGIE1z6huNVyZV+BGzt9u9Wi9ESOOgCTX3QpxZOt5vunkPGK/OibRqLmZdBYql
 l9HVIz51cWuV7qnJh+W6KvcAZ+jV3UEMQxbmykj7fDHUF1XMLn2+2X67nCnhRvKfhteiVXcPvY2
 iCD2U13LbPS2ahN/JHyHFfXvw12lsjZWodmVPVjC2OIkVF+jXSP5vflu0q6dD01BXl/YfNwVbjS
 ur1xbyjx5quYP6XwcQHGohNBPeZw2GuFW+xys7VxlWdjqqqzGpsOGp1A7i0VhjBzglaM/43po14
 YiG5jaOX6DBtpZlJMvvR499az8uzneIIFSiIyM6pcoP5ebaTtH1ptbvImDwChUlKnCsV6UEATBN
 MGSzeZrH9XJENhAnLd5EZKxC0UXDA8aIEWC+lg1sfhNh7P/e6hTAlN6sVj2zFWbxHpV8Mp3bu0C
 LQuT5NZLcGJO2ELO9Pg==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aea9d0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J-7NsHqoITSIJWJjikQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_040658_755243_DAEF5687 
X-CRM114-Status: GOOD (  18.66  )
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

Hi Russell,
On Mon, Mar 09, 2026 at 09:38:26AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> Lastly, add documentation for struct stmmac_dma_cfg, and document
> the stmmac clocks as best we can given the driver history.
> 
> v2:
> - fix error in commit message for patch 5
> - fix typo in comment in patch 6
> 

No issues found with v1 on QCS9100 Ride R3, so feel free to add:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

