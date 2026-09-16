Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0988C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 07:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ut7kgm3lbIbgif0w1qtAKfZwX8AzmJ0SyvmVTj0gdA=; b=lrC5wXPE6HmGCvcqgW302cvWDE
	tOjpiXUzYfi10j9nnoa1RsnoZVNWT559mvag7jin/v2UdWnony0CP+yjUKQBi7+dM+5b8Df5HT42p
	LBZjHqz9Af/wHW8MkR0uzUe72DUf97P31NP3xpS318iPMKqGX/egz1dVcIFpYvdCUBSgpsNyC9TEY
	FYWAyYxtGUMSedL2f62OSzx26EaJS1UQCd7G5WzQD2d1b/q4j2CofvymuGYYMDXCQvdEWgvAdnDnT
	majFBJl7Jm9FSYTE8sEqpddYVJsW7XiAHq60Ajmn4meFZ9QJVaMG7HOqbKZM1vZ+XO9F//5GqekQ/
	dFLQ9bFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jeI-00000008Xr5-0kqq;
	Wed, 16 Sep 2026 07:01:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jeE-00000008Xq1-45Ca
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:01:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68pKQ2265748
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 07:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Ut7kgm3lbIbgif0w1qtAKfZ
	wX8AzmJ0SyvmVTj0gdA=; b=bWMyIdc1uc9hXJVKe6ZNjVUgWVVhrdlwyggBXLCu
	8Kec5D51yYBYDR/RNHQXVGOtgTZMcyBsEtUzxZYUh/KTZzTpqf5GyiO+n7yzeGAo
	z34c39SWYjY7uVEsA4e+YfLRQOMxdO5XUOEemw75NpETLdhekixFXAAxRWpoP8jp
	yCXAq3GL8FV1NDi0pIq3TcN1qaPa+ZdT7Gli+FRte3GfXTuL1PdlFTyV4Qt1Y0zv
	MfTFO5K4zAccldwD48CSX2coflm5RF1CMwL9yc/H3l3dHSj5soWM9fgq31L4T6Qh
	WrrkpucoQ2iY6V3l/HAwb8je7Ir91nE0PcTyoiiLaVeTpw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftuhfma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 07:01:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so3660844241.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789542094; x=1790146894; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Ut7kgm3lbIbgif0w1qtAKfZwX8AzmJ0SyvmVTj0gdA=;
        b=O/0FV6zxYcSXQdT8SoxiUeZGktZhsUmul62jD8NiEVPWiJ/Bz/yrGGan3yM/FsE3RE
         zR2k0gjH8pDiQeTLwARyE/xWZSPvxr6Z2egECLSIOfrb8alRjjU7Uknpglk++ZCxKnjC
         +dDBEHvPhsMPxEX7dw5GSH2T6VNnqCHg1fXVKyOEseTPXtBCvZhh8u1tRoX85dElWVi2
         FUjjIDP1k0HT1arwCtpsM6MKqc92F68DB2DpA9kXld1IzLZIlh9HlZ7l+17F1gFjpmK1
         SYpOMOy9gJMX6MKvyfl1veDD70ZOEllhhXTzWigZ6eE5nKXBO5vd55H1EL109zunO5N4
         /soQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789542094; x=1790146894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ut7kgm3lbIbgif0w1qtAKfZwX8AzmJ0SyvmVTj0gdA=;
        b=V/6KMST5iJ6Lpb/gKTQ+6oW6Uj8B6og8xvyPq8Idi+lFKLVkmg3/V+TqJN7dR1eOED
         3ZSCCkaUDPudXp32dLTbrmdS5UX56NgAlLXfMeTdkHQ6XzB0E2G8nmfWVwk18w/Q7f3x
         lesCKt1x2i8s8NB4w9pwECVUgNA5WqjonedZvNkAF6kCkD/UWCRltaHleSLuT/Jc2F/p
         tTGwu+r5/v656dZTUje/pzkbwQy6eLrZGt6c5mfO5qzsLXC4Nh2SzO6IK9dHU+UXjPoA
         rUgELOuuOGwxJPFCsk7P+pqVr6QdwYbW6lyWbjoDGYDX1TXul7/VhhOPf4t3LOt5Khx5
         Nl4g==
X-Forwarded-Encrypted: i=1; AKwUvBw87nppFPbsOn+ijOAfxhKFET4L1feJGdzOjnqUfZITENk3bNbZXEpGnTxoTWi6j0Vhw/F6gE1nuOnIXh98qQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l9AGxqvYx8W7QACiFdcLSoNIlohAosoww09nSneZpp+kgB/b4T
	K14MzMA2PsmZ/he1blcB5Y0TzgXaUY13B1tHXlDcS1lMeOgIVQUwu+UHnmwEKCr1IsHDQXSmHMO
	4JiAVdc8cZgzcbtl0QSYIKvLPUuYSjXL4hpj51ga2PxAvDIEj0SJZNOJm0RAsgUdXpgp7ls+nQp
	M=
X-Gm-Gg: AYBFou2QGZj8LmV0t2Zx4hzf49RvsXYhUol/o9Ye/q8fORbeT3+16SJ4Uw+Z+bPqkX6
	3nUJ1eQ8XNNP1SbI3XkIzzYKG4oRDybkD6i7wwKGZoh5MWdZUvDlxLBrBrMMEmwsq1yIiJLIQ0c
	76ZH6V++QroocrbZVIOLnn67mYNXFythQy2VYe2cSiECha06CyevE4W+SOr4Lu1MSA/TbLYa5UW
	vvUpvq0MISeJwIWe1LqOzh2vJhAS1v+q90gBH5nSoy6083vQuElPv7VYmEe+fap+fVkcuorvhUz
	cu+0h9mIttMRutxzIuVGnKuSmxlQyiw91jCUgAA8UADh9Upf8Ryt3Vu6YydmUTN1Tsb0Pr3Btr9
	iFoU43lusWK3VFA==
X-Received: by 2002:a05:6102:41a2:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-7a0247f043cmr1487034137.1.1789542094486;
        Wed, 16 Sep 2026 00:01:34 -0700 (PDT)
X-Received: by 2002:a05:6102:41a2:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-7a0247f043cmr1486975137.1.1789542093963;
        Wed, 16 Sep 2026 00:01:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ed292fc12sm34571555e9.15.2026.09.16.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:01:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:01:32 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
Message-ID: <aqo-zBZDb0v_20w9@lore-desk>
References: <20260916051618.2904439-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JPSBXS7aDo/qX3Vv"
Content-Disposition: inline
In-Reply-To: <20260916051618.2904439-1-lgs201920130244@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4OSBTYWx0ZWRfX72BbrOh/M/b7
 5wBL+NKEoHQ7oJV3P3Bnn9vb4cydxzNiB3Sm6JgJ/bh4ldc5xVqvcyYKM4aX8HhyX7+clCucO3v
 kV+TAsxWyahCZSkBos8MEIK/bzwQHJdwnCGO+Y3U5WJ52j1pFAUw+rkJpDJTDChZUEoQMdb3UfA
 0qYibq29HNUxBOlrN88tWfGh+UkwiiZo6A5p5LjdTue/pwduU3ogOTOX2xSRZWv0A7Q4ZnzN35G
 uu+UNbcEV7lkoFUWFMCSR3enxdGiE90CVSy4MF8FfqQvGQWYEkiobPK0+w0netmPDGTl2dxe7EK
 CB0TDj9m05vhPD4QMRJXC/zGZXy5VkiCz9B21ts+8H/NQdkagRwQWJQkLE/R0VGHXQcARFAYPEa
 MseEdtpf4zGfl2U9E6w+dRO1qqz6vBlagG6ti7eGFug5CVy6mSq8gqDgLPdKnu7uv2/E9fH34tN
 9hUCPAuAOW78HLZwdJQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa3ecf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fix1ya3lApHd03os7AAA:9 a=CjuIK1q_8ugA:10
 a=NtCxNmvqVL2YQJkQa48A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4OSBTYWx0ZWRfXyq1QS5qKi3FC
 wzneoFC5ksyTXVOLnsnMegHYuQxM9WAbkev9dOmLzLlkstkVuh9nWUEkK1aU/0X09FB26D6T3cC
 IgOkwW+A84NvnX6LZ9ulI8W715Uldpc=
X-Proofpoint-GUID: MWyGUK4xT1INu-mAgEOTsLWDHnh5boAb
X-Proofpoint-ORIG-GUID: MWyGUK4xT1INu-mAgEOTsLWDHnh5boAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_000139_130030_C7D1B69B 
X-CRM114-Status: GOOD (  18.88  )
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

--JPSBXS7aDo/qX3Vv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mtk_ppe_init() initializes the l2_flows rhashtable for each PPE
> instance.
>=20
> The probe failure path releases these resources with
> mtk_ppe_deinit(). However, after a successful probe, mtk_remove()
> tears down the network devices without calling mtk_ppe_deinit(),
> leaving the PPE rhashtable resources allocated.
>=20
> Call mtk_ppe_deinit() during device removal before freeing the network
> devices.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac ad=
dress based offload entries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index be3bd025c41a..04d0a1eec4cf 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5394,6 +5394,7 @@ static void mtk_remove(struct platform_device *pdev)
> =20
>  	netif_napi_del(&eth->tx_napi);
>  	netif_napi_del(&eth->rx_napi);
> +	mtk_ppe_deinit(eth);
>  	mtk_cleanup(eth);
>  	free_netdev(eth->dummy_dev);
>  	mtk_mdio_cleanup(eth);
> --=20
> 2.43.0
>=20
>=20

--JPSBXS7aDo/qX3Vv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqo+zAAKCRA6cBh0uS2t
rFAWAP9S+DvP3rvVFwcvFbsCuUr8lmqmNv6uJJcrmYWW6kMSmgEA2kxhcWJU0SBx
j5014OQKU1hwFlulxNmz3jzfj8R4dgw=
=eEvR
-----END PGP SIGNATURE-----

--JPSBXS7aDo/qX3Vv--

