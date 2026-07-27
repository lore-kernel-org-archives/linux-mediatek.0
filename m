Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E170AC531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=; b=RDC1TFoITQtB98nUSRTiPQbfa4
	J9JZGACEtYxivd67KRMMwKEdOeRXy8nddXvdgrqvJyfEhzDN6f8P0cWAd+31+fMpjjIKrt1tLlEf5
	tI5B+GWgAuM4rt6zJEKOE4IqNeX6bFGW+rhQb24ue+bgat9MHx/HPRwD9CPL/FdplbKx4RvodfV/t
	Lb3fnBZHoCjpccQ7dzeIg8MYs/XVukmwpmYg13Tz5zpOW+8KlMYP9xe2MCBfB7P6RsB9FZzPvRrrB
	IOHixAi3ig3/35jjWRPvR8xDXLtylY8/lXpusQimZaXFEbpacLItp/jRYrXqaIqwdC5ZEGyvwpVKV
	4V9yXOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI8z-00000002Q59-3VoK;
	Mon, 27 Jul 2026 10:01:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI8w-00000002Q19-0eqx
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 10:01:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9bVxk2846463
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 10:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=; b=chWU9KHW7HHUtuwi
	ckvJe60dImllbKRrEXpmMbo43YJLOwI6raHkUQD+DgAlCs6stQKakPt8Ji7/+xt8
	pUi9OZPOBY10f61PgprMwz3cRIxeWuad4Ip1Fell9knLu6U5KMIOnHDRV4XF8k+g
	zDxgz0SvApLDoFIzh2s1jnhFj6oAyxjCfgQg+mf+sNcMy/SwGahJ7goATVTbU+8z
	pKvxnxCtzHii4tkT3y//ITKDoMpqG35gjDeDwGh3hV6YvAXuAHwSDQLlRIntkgva
	hmbzqaOitfFQg6cDCQTGQg/NJUuVhkRV/flLziRJBj2/AqVFm8u0DbGVKqIpbABQ
	ooAPsg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v6836j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 10:01:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907c59bd65aso26671936d6.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 03:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146464; cv=none;
        d=google.com; s=arc-20260327;
        b=DilKpSQD7foqfSFSeyBDIujIehbrUfUQl7fwmAopCAos85Z4hAWcyFt0qMmvlD2Bpo
         qdIce+g2ynn0Dmimj4ns3S4f2WEPl87oEAnlwADnb278qWr8qWVdP8P8c7iy6GPn7uMY
         y6Vtut5uCwWlapNMM/X5lHP4+TV+8c9T5Y7gK2d6+upTvvi/xfp1ZoukJ4KIvh5hTDDQ
         0Oc4q3FAKcigQHd2S9FYdyNlBKKzPL7pAljWwLH9Z9V5gJa/n5Yb06xamlpwgALzyFfU
         Bg+/7VKr58iLMAubVA2D6wcnvOe41EB3560tvYfTXr7qRjRt/7d488t4RlzNRlfL9qcm
         2TCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=;
        fh=4CIlIsI4DF0frS5xb2k/v57FNEyfs15dwF4K3HnGdas=;
        b=jTEdZNYjNqWZnFm0+c+ijY+DIP6uGUPlaaLDB1XUUzcAhKQE3uREg33M3neF4rtcos
         BbSmcjdxNBhw8Ihg6YwWuUaVzd2yJ96iROpp3Qb96iBt9c/frYl2aColu01iQ6Zyi75b
         Ota2wpCB5g0C4nHzWKPiW/gps2F/DmkxTM3Hk+Q/o3PTvpIBf6uUdb4DzfZy13nhG83T
         AfWpO0VaxGmXn6K0YizcGSHuSz07BFbO6rOiSOY38rbEWPMUDsKnkkL47tLgPD7ATxJ6
         RD92ymnO6FSO3MO4mduuv8P7tefS7S06ggPxzn1QKLw6sC4s6hNiThgcSiVxPr6NC28y
         r/yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785146464; x=1785751264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=;
        b=aUMQQlaSl+DMOtFWaqnHerp8ssW03uZooD5KuLn2Rak1gEm2FQWFZvMg/sktsRA0Vb
         YOMWrHiuQ9OeOeTRmr8H6UsB99Kr+716SUL00gX24narpCKUSaOmK8ZiIK+rskHCyH6I
         wZzaQju6MjiDOrFzLbv6zXdLJPo+xzTuT1OkSnKv1o9SZn2zXnB9yGr5K7fdbKmC/GM9
         /GppNqNY4/bL+F89K58w0cy0C2yevpc74jtVekY0fPj/lnBvdWP+7ipjW9kehPB+aUbs
         0ajsB7IaxdZEfeVFZmRxxGVkDEFMayeoTgB76zTDuU34i4W3VeGE/FM/vCDT+pLCvjCn
         CVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146464; x=1785751264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=;
        b=Qm+NRXhLyWTBnoiLN7Ie3O76YUZvXLiGHtagikMJKUnt9AkJ2EEHU8p+EeMBP4uVk+
         iSEfOqQzrDTl3Cg1Wh+XeiMAq/ud4daAww4pxbi7M/ljQHN8cIiMYF3R/ac66q1qqBtZ
         Mh5yMqvgZBCrq5nxFOD/IObzJkGmyLDADoh7jf1nr/PP3dSOUACSVb06G+AkZhtZPhoc
         4Oan7pJ6Drhrj2uwBFozHUrhSIT3c1xbdw+DGRpzmX9osNp5b9CZZ6B2AXN1Na2d8y9K
         zmRbfN9anRh1uR1idLJ2POCucfw4HYDNCxKwgVOjOFI5YCY3vJcw7Y881QSW4lVy0qhs
         9zIw==
X-Forwarded-Encrypted: i=1; AHgh+RrFRab5NJP4tvesP6NFjB5X0MyM27aA4b2C4+p2UN80PlN3ZZv8rBvPUcJxmrVIvqEJEOG3UofI0MvazSxFog==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTGvRExENTOpDG0ajCpXn1az+l7TLzKohRo4AVFLd9nUPHtCVH
	RSb5+ZyqP2tuWGF4ou4bVTz83mvyMDhqkklcChQXQJ89VrTZ/kUi1lvHsOWiLAdVOnhxzk2cHM2
	asZQ4QDPsM/Ib/4L7ij6e/H8HiDbmI+n8ITNoA91tJPpRjIFuDWMwKNiwUgMn20kAGN9lSfpPkq
	Lvd96lBdzT/LGfn6tiFJC6LbyAwrTaLJ4t/5ihiTUTt3A4dYN2Kg==
X-Gm-Gg: AR+sD10up3FED7NObCnW3c5le27vQHLzfRgLJvy4g1uHEvfyYzT2rU662m5FkrdLYIK
	MwUNIMzXZ00O3VYx1/jyaTsPucANzxwExxYoygHmbONT1+FR8jQAbjrTc97NSYpAoe50FO9yYT0
	bysxaNvigc36977kB/U0Uo5cSBpD6mGxXdPvpGhB2l4OBdkd/sdM5+w+/p5A==
X-Received: by 2002:a05:6214:5a09:b0:8e8:b302:8afb with SMTP id 6a1803df08f44-907ec5e5c77mr86121126d6.0.1785146463821;
        Mon, 27 Jul 2026 03:01:03 -0700 (PDT)
X-Received: by 2002:a05:6214:5a09:b0:8e8:b302:8afb with SMTP id
 6a1803df08f44-907ec5e5c77mr86120416d6.0.1785146463265; Mon, 27 Jul 2026
 03:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260708092038.741308-1-lgs201920130244@gmail.com>
In-Reply-To: <20260708092038.741308-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:00:49 +0200
X-Gm-Features: AUfX_mxRMxe0tuzgdBvzQ99tJNh8MEcfgARzgUQyUvcrVWwi5yEYYKrgP-hzda4
Message-ID: <CAPx+jO-fnCyJqKz6sZR=y4=-CWLicrT5gvw6xqoecJk_dimGMw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: fix remaining %pOF after of_node_put()
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
        Irving-CH Lin <irving-ch.lin@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>, Adam Ford <aford173@gmail.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX45jdpEML+jsn
 fu5lUEb9GoNkWfdDcL749gwxCdc6kOlc55cqPIvfkwhqXPSH0IWPxuKvXBijlcXg67F0cfsLS82
 jzSFADH5TxQ2G7Agn0T3NU8fAzuuctc=
X-Proofpoint-GUID: 2sIZtCv3N2S9EzNery-EJ2Qs6t0MnFNx
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a672c60 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=R5A58VEcyW3-00s9QQ4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 2sIZtCv3N2S9EzNery-EJ2Qs6t0MnFNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX2DJETvH1GRJg
 a4K+eFyq/OBcyfjxwSEX03h0UBk8mTw56P/H1MWcd+qRer6g1UkUL/Y5mdIwpGfgGtDMfxOMQ3S
 LNlOCUDPfQk2ujAAj94OICryImIcIVSgRdH2jmquylobHrBzQLkdXqe3hvL0jhTsJbEWV7oU3RS
 0ihK/QrSNZsbHDTTluhIGAMhocUTRyLd5RQiL+Y9NYTqH6hf/30qVg63vLsfuxfEkTLx/q/bA7A
 ruMZx3jz2xT30ULj19gpTmQX0CIQ8PzoqWVIRTRxlAiK5+ToVc+wMYqoJbrLpPvSap9qhSpOYLJ
 kyBWmarT2eizB76B/I2VnmZdn/O2cfjdmmKWqExUbtFTyevMfDmwBMzZmpUv9qhslDiFOvyOwxg
 Cot3NXTKD4Eb1D+H+E5gkG6Y4OKnhLfLHtrypib77SrQ3BoLRktjVt2uNM2tbUHlMQj2PGvz96b
 4Ix9vC9JDi0HLJHqu6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_030106_209686_50DA7DEB 
X-CRM114-Status: GOOD (  21.78  )
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

On Wed, Jul 8, 2026 at 11:23=E2=80=AFAM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> scpsys_get_bus_protection_legacy() looks up several legacy bus
> protection regmaps from device-tree nodes.
>
> Two error paths put the device node before checking whether the regmap
> lookup failed, but still pass that node to dev_err_probe() with %pOF on
> failure. If of_node_put() drops the last reference, the later %pOF
> formatting can dereference a freed device node.
>
> Keep the node reference until after the error message has been emitted in
> the infracfg and SMI lookup paths. Also drop the SMI node before
> returning when the SMI phandle is missing.
>
> Fixes: c29345fa5f66 ("pmdomain: mediatek: Refactor bus protection regmaps=
 retrieval")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index e1cfd4223473..f877d6694dd5 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1032,12 +1032,15 @@ static int scpsys_get_bus_protection_legacy(struc=
t device *dev, struct scpsys *s
>         node =3D of_find_node_with_property(np, "mediatek,infracfg");
>         if (node) {
>                 regmap[0] =3D syscon_regmap_lookup_by_phandle(node, "medi=
atek,infracfg");
> -               of_node_put(node);
>                 num_regmaps++;
> -               if (IS_ERR(regmap[0]))
> -                       return dev_err_probe(dev, PTR_ERR(regmap[0]),
> +               if (IS_ERR(regmap[0])) {
> +                       ret =3D dev_err_probe(dev, PTR_ERR(regmap[0]),
>                                              "%pOF: failed to get infracf=
g regmap\n",
>                                              node);
> +                       of_node_put(node);
> +                       return ret;
> +               }
> +               of_node_put(node);
>         } else {
>                 regmap[0] =3D NULL;
>         }
> @@ -1046,17 +1049,22 @@ static int scpsys_get_bus_protection_legacy(struc=
t device *dev, struct scpsys *s
>         node =3D of_find_node_with_property(np, "mediatek,smi");
>         if (node) {
>                 smi_np =3D of_parse_phandle(node, "mediatek,smi", 0);
> -               of_node_put(node);
> -               if (!smi_np)
> +               if (!smi_np) {
> +                       of_node_put(node);
>                         return -ENODEV;
> +               }
>
>                 regmap[1] =3D device_node_to_regmap(smi_np);
>                 num_regmaps++;
>                 of_node_put(smi_np);
> -               if (IS_ERR(regmap[1]))
> -                       return dev_err_probe(dev, PTR_ERR(regmap[1]),
> +               if (IS_ERR(regmap[1])) {
> +                       ret =3D dev_err_probe(dev, PTR_ERR(regmap[1]),
>                                              "%pOF: failed to get SMI reg=
map\n",
>                                              node);
> +                       of_node_put(node);
> +                       return ret;
> +               }
> +               of_node_put(node);
>         } else {
>                 regmap[1] =3D NULL;
>         }
> --
> 2.43.0
>

