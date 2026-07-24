Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C667C531FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=; b=nE39KTUTlDMu0hg2L//q08GpW1
	J3Pj52W66uGY72HZAaCKYGhSTKCG7GQ7cEIj5YUQsHhbXnCK70/LKxUSMifzn1L4i+h2RAFmMBnlU
	f15SnH4VXpQcLOo5F82FwXi00tkyf6GiM/MC9ytZ8E6lSVWR4IcK/3eK8W5C0uNwgCPJA8HS8k3oY
	M4XyIM/7XJeoeizTteJmaoDvhSQ7xFmBVlvoq4Tv8tZUdDCE9LSFPRIpg36a4RgXaQsYWh0CpPo/M
	7IN6dauRLUBTZZ6GUqzXxYlH1SI2zeURtbte+WhAJ/SxFkG6p2AKNhs53TlQ0kFU+wJbUEsAJnR8o
	XcS+aWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmv-0000000GhaI-1w3z;
	Fri, 24 Jul 2026 15:26:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmb-0000000GhVO-0yJi
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 15:25:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBM93344426
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 15:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=; b=JdX8vmXYgiLsdgga
	VDfAI2QzOnFN+oMi5LDZiaEWcU64KTI23UWiipG9UKkg3tn/jRYNR/0+WDP3iI/n
	Co5tBTs4hVfTThCD265yDnsw3QqF36F0RwcWIZ0JxQ69bB9PMzJs28ZK6r/WTqca
	yGAkhT1Up8NrfnuXUIpc2lXDOs9A5CiV4k71J13CRnqODu22IWamPZKeNBIHBpw+
	bfcGLnSIXfdoUQ39b8Sze5wC94G6Izs6DdECHpH8EiCIUHVa1nCryk/1u4Rp+2Ld
	HwSTv4AkbsAIRGm5a0YUJx3vuqpNiDz/6kXMiLs5S4NWyFIPtqiHnqnRxYpyzkpG
	igMAQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0kwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 15:25:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9309af14fd7so79975885a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 08:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784906752; cv=none;
        d=google.com; s=arc-20260327;
        b=sGIWznk2CnVZZviA4ZE+EFBy9yUvxXN0v1XiYWCfVLMBwLBSduxbvuFnOD5/UXF+cb
         NzTp3dFEqfvvWc1IIYi6Lb1W2lBg5BsZ73nqqsGY1xOhXrwZzgp/7QwBAMmmIOcsx652
         TNfQR+eOcYeK/Hic0Hfp8xbr3tFK2wuc++YDZkHkRNV3i+LQmKPfDFDPnpemQjFod4u2
         4A4bRHnHSwibrueN72mLXLu2ynlocYl2IUy2faAf+e1kPN/5mvV8NT/yzk4nKRvxzREV
         /TgbUknhzjhogCiHHuQvw94KECR5daiPetTDiFtZU/lOIV84PT8UDSZxDgD9TMhEOVy9
         A8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=;
        fh=eSWCKzn4uR2Cyj+cyaccWElNgowEjsuRQAZxJLbp+cw=;
        b=kFVOnBbJ/6M9L3ujMFhrRPGVxATtfPoqaYXj0Bo4mC5dxv7a72BYcegHNgCB6gaJny
         OhQHSjVTkHTEJJqT6ANmiPu4kpTMvwxdwP2Sw6KxaBHGa3V1OGiNIu4yyTy5CuYzvMB2
         WpeZcdae/3cEU3IaEueVt5oWThyI6SiJs377YWWid5hXBRaj8zkOZFX/8pGURKWaJzcP
         tvzBjYbsmB5RexGXz+LsQe14Lg/JbYF5OlOeyjV9WFauN7chcba8fAEcVWORM8LPboqi
         7XHactOHmxq36OtqehFFhknqBvEygFWfS8X/pkxB141p2TFd/ypknrMH75CIjWjL5KLo
         BfiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906752; x=1785511552; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=;
        b=aSFikIBipg8Z+IxOUQSOWv73AxRTRS7haB64GUa63xam5R5LwL8DmbfXiNjMWkDRF6
         0HQTgWhQWmaqUzqE7TGBejCBiWlXfNhNFQp+Dj3uYepe330hUUZEvwJKGPT65KZ2tm7X
         AwrQlxBq2zCrK8w9cq+Ux7F0HvfP74fHlVIvpyghwJma/eqgzOqa8JkbtXg9Vr2vs+op
         +H7BFycmOZWUnjKhpMqXLCb+M3edg/KAvevnd4T8CIy218X4Dy+oAEVOgKhFpi0EPeGG
         Dg/umHyE/r46DS6EWTRTg6mOapKZGCHwqqR0wF7Jrfxt+X48KMw4Kmoi9HHl7RKng8US
         QkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906752; x=1785511552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=;
        b=Ts3wNdNmIbd1Bj1PVqTwRmjvKeKPFvrqZrb0oA47FtWqOuPY7OiFMPMWyoxmvYIASp
         AVBT4KWDWsWcKMggzh0TRFY397gm6qSxLyBhguMBz7luJ9zyXirikq89RJy3Ds4gM4FK
         3FDGZfT1lyDMLzDDbnK6z1OnjAuTrJ5st7Qvp4diQ5bOnKvJjGxM734cmIHEcOitxgEn
         zi41/ATO0P9Yr0pCuOs3AbrKL8NS7xh7gtATL+sPvF6EWslJB50TdHv8MkZNlG4UoSMk
         h2P83aJLhaQSgNeeeK+KJsBoneRppKGo2ec8M//5fiaTbxIldhVdWf8EgJswQLUnAKEj
         aang==
X-Forwarded-Encrypted: i=1; AHgh+RpfSJ8VhlqMLmsJT9dyAFnXaHBLIjE9XHhUy8i5MZzFS3lxR2E5dnllHZYN1Qv/J7oR99uGsJ1p64seFpU5rQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwlGcYV544JfVQCTMMwb5eFe+ACqw6rRn07+zscuqs3NLV9Tpp
	cS7iKyeLogIrh6bL9Q2M0cyil5hLx+yJKg1IqxU9vYTqj8Ao+H/d1APBRXZ4lg5861LTMuhp6Vg
	Dac93tAKvY/9O7EwYzo6z/6gud2nW8ukpqCuB2RCKea5HH5L5m+Ja46rkaej23+njus5a6tmNzr
	BID5SNMD9LXPugkd8jvCwRIFRpMvk8DntGEflH1vp21X2zoWZXNA==
X-Gm-Gg: AR+sD11wmVqL7rxZSM5h+GSqFDmsv0gDGybBUw8o5RFuJPOu3G4P+WkqDR73My1Kg3D
	va6ZQEH60x+w28MnB/gTuK2oswXjq1p4z6C8QczuBTJiBAB9xnIHHLIYacr0U+l7P3djQXYEwgj
	e56mUTyn3vtlKvWxLAHLwVkJx/AghaWQYa6cxbBEnx/rx3roFhGfaTmiSpGQ==
X-Received: by 2002:a05:620a:4414:b0:930:9c64:330 with SMTP id af79cd13be357-93103a4e832mr831463285a.87.1784906751846;
        Fri, 24 Jul 2026 08:25:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:930:9c64:330 with SMTP id
 af79cd13be357-93103a4e832mr831458185a.87.1784906751389; Fri, 24 Jul 2026
 08:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260716114247.49685-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260716114247.49685-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:25:40 +0200
X-Gm-Features: AUfX_mxVC_giYxUaohart3sP181-Oh1lGOCSPJ7_kEvq1OppxaW1JXZvQ16t_ZA
Message-ID: <CAPx+jO9t=te39Lg7BijMvSV5xzGKp5hNVETRhd7-N5p32jFL2w@mail.gmail.com>
Subject: Re: [PATCH] pmdomains: mediatek: Avoid setting RTFF's CLK_DIS before NRESTORE
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulfh@kernel.org, matthias.bgg@gmail.com, nfraprado@collabora.com,
        macpaul.lin@mediatek.com, irving-ch.lin@mediatek.com,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXzdy6qiE4fXXb
 Y6WFVy6ufncvbNdMJPvQP8z8Ub0OPhcS15fZiB1AhkCsXWL+c7mDlsPBwUbWQQ45Qk5QsBPRP1V
 bn4cMizxUAzs88fxPMxtAYuO7hxIDGw=
X-Proofpoint-GUID: 499-J7gkO67k1VgSGUzsu4NNS9s9hScE
X-Proofpoint-ORIG-GUID: 499-J7gkO67k1VgSGUzsu4NNS9s9hScE
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a638400 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8 a=fzz4A-KDz1Fdncvdh-EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX+LSP/C8Iz/p2
 l/JeuG8aAiUfDGJPPXJWEUafgiCPvQSPI9NZUi43KGUkrRDaXyUkE9twuXv4pDCX/z/T4+Ohv7c
 tbkao9BG6EHbhS867JZtxSkdrXveCeLZl1kqaCan385FjyxnR+OeBzXOBgJF6UxBuIPaQ/2UyWt
 GvCsRnOm/LZkl/cNL3CugCb14UXtuABj8d7j5HYr4LKULTCaCD1a9OC08UjWlkiLcXpoT2Nt3wi
 5n6JjYZhIkK/+rLynVg48tOQJY3JR8aYsS3EbhttSNoYtyjOEb6d/9F4lK2SkH6JQIwubEuJAER
 yFYzEHotg3Rk/GhHiIPCQ/15KJAAG63+YElI2Ue84DLHfvcA4dy6qItEGSBFzxgHOr4X/hFcQCN
 yqIk4VQTV4r1FvmNEBuvVBDuZFd9nOuaoL7pRmer/FLCoe6VbrXjaQFM92hmtWwIIVVGTXDCeGD
 zv28oMrPgd4Wko9NArg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_082553_293613_961CACF7 
X-CRM114-Status: GOOD (  21.99  )
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

On Thu, Jul 16, 2026 at 1:42=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> For the PCIE_PHY (also called PEXTP_PHY) type of RTFF hardware,
> there is special handling setting CLK_DIS before performing the
> NRESTORE sequence for resetting the RTFF and start sequencing
> from a clean state.
>
> That special handling, though, poses an issue in case the machine
> specific bootchain (bootloader in particular) ends up booting the
> kernel with both PCIe MAC and PHY enabled (not just power domains)
> as doing so will partially corrupt the PCIe MAC/PHY registers in
> an unpredictable manner, producing either an initialization fail
> in the PCI-Express drivers, or even a hard lockup!
>
> Resolve this by simply removing the special handling: in this case
> the bootchain, or remote processors, setting is getting honored by
> the later check for PWR_RTFF_SAVE_FLAG presence in the RTFF ctl
> register.
>
> Fixes: 9d02c94342b3 ("pmdomain: mediatek: Add support for RTFF Hardware i=
n MT8196/MT6991")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f69cf69ba0f6..df8e93638e08 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -480,16 +480,8 @@ static int scpsys_ctl_pwrseq_on(struct scpsys_domain=
 *pd)
>         if (ret < 0)
>                 return ret;
>
> -       if (pd->data->rtff_type =3D=3D SCPSYS_RTFF_TYPE_PCIE_PHY)
> -               regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTF=
F_CLK_DIS);
> -
>         regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_B=
IT);
>         regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
> -
> -       /* Wait for RTFF HW to sync buck isolation state if this is PCIe =
PHY RTFF */
> -       if (pd->data->rtff_type =3D=3D SCPSYS_RTFF_TYPE_PCIE_PHY)
> -               udelay(5);
> -
>         regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>
>         /*
> --
> 2.54.0
>

