Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6463FCD6E55
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=; b=ANQVdTq5FnzwZg7p5tCgDur92p
	7/Cn4MNznF5bJrmcdNZelwSCYSpitR3IxayCLA+u5IWseFFbt/Ip8u/wAIdYnOvknP0qIsN87XUjy
	/3AFSTgQdxDUagKhwGN2j5Y2Caj3GxAU54L5oe4X/wyuQDkmZvIBiZyagTbGrHXiVyXxr2TAlvcRl
	xSrgW9kdjCnCkfBqQ7y+F5xfwQZZk8+8XHeRTb8WeXk5opjijKoshDWOEdcd51khyzxN4U0oJfSWn
	2Y6OARNBC9kF5Zh0Z/1rxDyZ2r/qRV11uODo5SMzQplOdE7BJLUjHDzRzOg5Wag3/zDwWPEroqkFR
	9PCNKxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUico-0000000EmmF-4Amp;
	Wed, 03 Jun 2026 10:15:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUicm-0000000Eml9-1LJW
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 10:15:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395owQ780676
	for <linux-mediatek@lists.infradead.org>; Wed, 3 Jun 2026 10:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=; b=SmAGzEcNzMg6EFVj
	AJxaoFZzHAlq3ByG7/Al8YvqP1vWkmRutw/OAjR4YxtfS3B2Ymh2GWsxwnq71NBa
	h2UXk7QxDOu7UtdUSzPwrvUkENvND2wgWHL9TbcIhr1yC/aGridG4+njldF6JQ6j
	ZQzMai1HHyZ1iw3tXnZUJl31CyDDfvcGHRk1vZ4Wx2UJb9KnsV6x5w4JzbiozVd+
	xVhpVP5oyBtADnKRqkrWDNyojEGs6HOx1/DnzpPJfz46un779MUCu6D9n8IH9l0I
	1ub8sAGJhafr6IV+vflXwme6o8VXQxYrq0jnup6Tw/4K3FRxiK9NAxGW1PvOZg63
	yTCo3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb09y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 03 Jun 2026 10:14:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174d1b326eso12130681cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jun 2026 03:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481698; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNuYiLrCbXDLeCR2DtvGCdFpo26Y86pBgJxBBwCTs7/iSJyXlQJNbyJ99yCGZ+XVcC
         PLU2t6uC9U5fzaQoN9r7W6VGYwntzGg93+BS3js0lBNFeww+KHBSwPCI61ZFWX2ckocH
         +3kV1SHQUI4VoR9Lecer1CxWBnhNTgdBkahm3T/F1Fd/1Y8QPzoOsYB0xpLlAMWlPc7z
         XYSdchqrxNFtWtdnKHV9eBAmsy6LBnGMBaBlmWdg/GO6l5TZaVKimrMNF+ldiqxB4+Vt
         3pc3ZvyrUwhlWrnXAHUFj+63qSw8dFZHmL2dNTvFbRcjhmxBUqyIYYjE7RVltxx7TKmt
         KA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        fh=HEEmawelGAJM9geITnCw5CiUzLpM9AFmKKM7gg+/PyY=;
        b=lrNGJV/JM6nmsr4M+k/tdnQh57kfnYX1s5O8CBUMElPO/rqREZ/AVh67tffMHn6qWy
         /WdJXd49q/qQ3jghWpA1q7G8bgbyGgBUg5aqL5qFBMtFk0XiR+n4MVQg2dZDfV5Y3GZL
         kjZDR3jH1NlvRoC0h9v/apwR02S+o67SuCg4J9R+/4N6XrWivk4AHeSK+1VDgFxhfC8k
         +cl4Lp/d1c3P722DEJMBkE73z9qznxSV/XvjVZ/V1l3gdfbq9SfIU+tj4akfSOcqIUJD
         2qBdRz6gzSgp8CagH9wQfuwoEnMCdcKC0KaMALjTr88SA0pcT7VUgj8AduNuUALQ0od9
         icUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481698; x=1781086498; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        b=aKyxlPvxR8E0HOjq+W+5wgk8a3FlphHMtxsLfrDJncpqK7eDUQTs0ODJoCYowqaZmP
         qgRYtizj+FeLwuQNyDOR/gzOZMoR8gXZZJPb4+oF1tAPjQsUtO+rsSAWyxI+VJiILaBC
         rORO88yTOshfTZdCNlOJBjnUbR5bYON1A/v0ZjrrJR5PiygvD4/GFq3jexqu9mu+m+V2
         D5ihBlX40NquWmBgJkVFaSTmJBhjYdJNb4JMN+4LGfTWK4AMLEt4TG9W2mZCxQBNEhn6
         ml/kdEV8ofgqV2lej7jw85y2laXd3BS9l1H+7d7PrKoiVPTCAZDqC5BPhGB4/JonjfUU
         3VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481698; x=1781086498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        b=Qjr4Okqm9sloQCHdFKZsadgHva+KhwmE2DMFSy6zzRvtGFG8gJ/MofyqOwMVBIDBgY
         hg0f3d5mpYZLTeN0QTPmlIo572uZlsBdgx9MTBkDvlxn/4tcMvB6YRP/rplWDtG779pe
         O1BZQ9dRc6fikqBBJ0YbhHovDjNWJoNVic/pzja1QyqVF29EQBqfCKKdLJW7Lv/ZEod5
         sUy2OLVeTbWJ1sla5yKNlKdNEO+OYr6cGByd6rpTq6dfuJC5JJsWsEQ7QLiNZxTuyQby
         5zYQWte2rfuXFG2MKAaxjjgkkYXbHvOZTpTu6FgY0V04vss+Dcj+WkT5oq40B3hy30yV
         Nutw==
X-Forwarded-Encrypted: i=1; AFNElJ9nsf7fogYRZ6jdyApiNLm7Qha2LN0esfbwST6EvoudV4yWIWqCpg2SgjDJq6aRzFQapH31M/PaKoTpa0k8sg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+gylphlgbMDamVWkVs1vcPzavXFx3pRlLrqbvYy7qAOtlfK4w
	PBx5Y9VCtEIjtrKu3o8HDHnlOvPFj9Z4HFmwCcJvILz5qHehpYCSVpc7QUWNQUlH7fRpvV7nZW+
	ZIyMco0zDQuckl4iusWPPAX101dcfVtfmLj6iqNnv99ZMhDU65vSJ/Wnfver7ZFG7VkAXXoosyJ
	WwyDWbrMIrrsRhfRD/vOYaesyschzt4Nhx7O9vV+FeNPM7yEZONg==
X-Gm-Gg: Acq92OHizl58qulgesoIQBAxQV4KBUZtIX7D9112QcH4BxqGxdcCdtbxUKSZTqhC5C4
	7R+otWWVGFxdCQvajJF/bEuduZ3Ey41xmhb2rj53o3hVKeNRSCTyld/uAb4Rm+teuufeGURJMLu
	e2y7kAK1u+7vg8uSPqbl2xpCDYeAJyKEiT4kqDZMOnLx2Zbo5Jkj5FORgM0VL1p0ZVlvi63yfpX
	CoT/UNoEEvGcM02
X-Received: by 2002:ac8:7dd6:0:b0:517:6afc:b644 with SMTP id d75a77b69052e-51778770b85mr39837231cf.47.1780481698263;
        Wed, 03 Jun 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:ac8:7dd6:0:b0:517:6afc:b644 with SMTP id
 d75a77b69052e-51778770b85mr39836981cf.47.1780481697866; Wed, 03 Jun 2026
 03:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com> <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:14:46 +0200
X-Gm-Features: AVHnY4KYEhjVLt8HCP2S1uMOezJVDgrkFC02GzF0MnbWrCfiBI8GGzmmmTGcP78
Message-ID: <CAPx+jO_E4XLZ8s8iuMXwUg2pXZKCo7V+9PWNyX=NmUnv3QG6bA@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] pmdomain: mediatek: airoha: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 2DQlKPKRKiYOw-_w3p9YvQcC-iMC9b6x
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a1ffea2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8 a=JfrnYn6hAAAA:8 a=qVNBMPF4TgRESbWuf7kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 2DQlKPKRKiYOw-_w3p9YvQcC-iMC9b6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX5aYsruUguJTi
 BJScgDScDnM2ESJtMdGLuyGKFhwCEno35zO26bgUk+tGlkJCzJSU2+YV+EYRN4/ljRmWgaQdYI+
 58IRb5jghfqLAPbONLZbnzB+vlhg9KlBJvUD+nLrWek85WXdcxecE5N0NZHqXZdhP9yhLCd4XRN
 hllZeR5rvMrnzOSSmGhvDFneCkMTxrdBI6MbSnuPwHvFTectoygG3+XsVHUjY1nE1aqlOpaxEyJ
 fXlJ9LqYe7Iimmued4BtNiuESGa89xc5m9rTTJfG0GQHStpKtPAOi+Q0h/sB2e8sbq5wLoPqw4i
 EC5Vzt5e0towrMbEAvefE2MAWnRfpVDe0/3iLCkGAV/XCrTZtHI7TCJjQK08mECSq8zQ3Djygpb
 DoMCPlokFRMylzqIlnIPuNvXvJD4g2K4URo9aagAuNiwBjkRfOTHgvnKqkujX/wopqhWML/lFio
 wN8dC3MGm7Xo/4gfXAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_031500_499034_92C29ED7 
X-CRM114-Status: GOOD (  19.36  )
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

On Wed, May 6, 2026 at 2:49=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> To: Ulf Hansson <ulfh@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney@redhat.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c b/drivers/pm=
domain/mediatek/airoha-cpu-pmdomain.c
> index 3b1d202f89dc..5efd7a38f4da 100644
> --- a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> @@ -21,12 +21,6 @@ struct airoha_cpu_pmdomain_priv {
>         struct generic_pm_domain pd;
>  };
>
> -static int airoha_cpu_pmdomain_clk_determine_rate(struct clk_hw *hw,
> -                                                 struct clk_rate_request=
 *req)
> -{
> -       return 0;
> -}
> -
>  static unsigned long airoha_cpu_pmdomain_clk_get(struct clk_hw *hw,
>                                                  unsigned long parent_rat=
e)
>  {
> @@ -48,7 +42,7 @@ static int airoha_cpu_pmdomain_clk_is_enabled(struct cl=
k_hw *hw)
>  static const struct clk_ops airoha_cpu_pmdomain_clk_ops =3D {
>         .recalc_rate =3D airoha_cpu_pmdomain_clk_get,
>         .is_enabled =3D airoha_cpu_pmdomain_clk_is_enabled,
> -       .determine_rate =3D airoha_cpu_pmdomain_clk_determine_rate,
> +       .determine_rate =3D clk_determine_rate_noop,
>  };
>
>  static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_d=
omain *domain,
>
> --
> 2.54.0

