Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1D1C624D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=; b=SJ5+lahUJUj78+wSqj9zO7RkpY
	ekEHrrOJMPoSPhpj2NEKc4TbviDnLqdBDWFO7DHz4PFH9Qk2rOLWk2DNbIh2+EvXzuytk+Sc1uWEj
	x2fQVakhOMtxaqW4kZDMsdBY+AsSPJPAWtLy+vcGeGUu5srxijOismJl3mIdS+sI5MhoE9099q6W7
	21DaXPNp/0h6F9kDtnWq+qzuj8NtRfFtCnd67PTNq1V5WyP76jYD4MlD/vNAPns3wcu18Fd4958hN
	wTk+8WgEKn/Kziz2L30h0/0l3DrDuAwrXXo/3kQ+uWSvnjeNs3Q3pU+YvttXAwkGcs+9v28FtRcJT
	IGKNuD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qgf-0000000CaBM-1Ffj;
	Tue, 01 Sep 2026 15:46:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qgd-0000000Ca9y-14iy
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 15:46:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9Rwa1638686
	for <linux-mediatek@lists.infradead.org>; Tue, 1 Sep 2026 15:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=; b=feYTI9+AXed/U2aQ
	urR4ihwgtlD6ItpFSuAQtQEVdpvW/fhqqnRBzvM8xzz9hcvZK3m3gA19/Y8/s6co
	STQk+LdhxM8bCRTz5CeG1xf4+1Bd0Osr3fH50gOkQlcSbZpzi/0FVSDyG9RFqoRU
	QUw1PuLsqUbMfpGZeJk/ZLXRdguuyBWlBZBv8zcKoazxEe8k7zD58ccU4eAl7dWl
	yHxtugvSRYVgOOAe2HecNQDneJIXfyWjML+QoJCW7tqM4OGxoiPEg5KoeZnhHu4Q
	/6rGV/R30g4y9ExEGzEwmxUS+9DNxqYesPbcPBJmpIFk1ud+YEDSKJQqXAG4FDsl
	Lp1Bzw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjqp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 15:46:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so7716544a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 08:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277570; cv=none;
        d=google.com; s=arc-20260327;
        b=cFvD/3e1kliDWN3tccOSp/dRT6X13q5hXjSWRcLsOBektGk7rMVVbIdvq9R927WVoF
         7gpfQ/BYM0ltKhptDE/2lkJEs/v9nMITUfhzNjVwQampI88885ebKhr/MiYD10ztJRa/
         s9e6HDvuT4eDVoZF8AiDGtwpTGDuFqUSgUI8gp/88h6n2OSiBeV5zTS0pwE+n+89Ab8g
         YQp1k1hufv+YJP8r0O5qcHx1CBznfvTkA+fYN5CfdE3Nb6ek9uN/cZa8pSLN2ygLoAyE
         N44jMGrCn2spFXK29Vx/qK8pbD1eggsvECkM2+5NPd1tgWdJkQ2EWV0YRi8RmTEBJqt+
         1pkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        fh=jL6esIM7LIwXtmPgfB55lZcjhfBOGzfYm4JTv7raEgU=;
        b=cfuP4iEsuFNviHCenfXBlq/q+fiG70QXgJchLITBR4vGntF/T8BMew4+DlTgLkumLs
         SXQyDqCOKDnGTgyWE5xZnUPeFYYBi+xro4FC1YsdeW4uJtEJOGaRalNrIIEpsEaI8Q1S
         1/tQniJ5hi3eDwfDPkZNOykbnYLzWG+EBKSSXHwPpUwWdfPpkBY86N1Psi5D8K+r0Moz
         HKjjaVJc19urKauxG4yfvBCRvDmzUEOLgOBIxnworYrjjCxqlUn6iSR9xPzLSUwd7e2T
         czL7G/PRpViA3qVqBnw9p0GIoECC6lNW1zwZGZ9INX99HJJfeNurQU1vcG44ag2ZFQy+
         OIHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277570; x=1788882370; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        b=hXAFZPOVtztJ1HgSLW+F8hs7gMjaiw77f97LBSmELmbNC8PDkHnJTQ2iNuKHCW7YFN
         0HW75OInjcGF6vi8HPvO+TYVcUMqnW/wUTWxVJTkUcNrzz7o34jt0BOoIK+A5ee6AkJ6
         wLGT6lt4TDee1Xc9EFu8VT6X1q/YqLEMOy/JFXto8S2adfVSmJIDBBXKhZAZ8SAeK1AK
         Ki7XhAHW4BfZ91GLxFjkLHnQQiZYlB3QPTc4rUltx4xpRYSA9VnyU/oLBbJpKnyRKCSr
         YmyGmod59v1tW9yuwH5+NzezGDKAGddkgEk8mA4+SCcxSjG/57fWnRLdCaAgT01YVisz
         qjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277570; x=1788882370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        b=NB/wUVpu16KZPzn47z8aRoq8sKO3Bi5q5ve1uymZd/xvrAGxfdQZ7q96qw3rGWhtzL
         2VQf5qyx+/KxXKhrOzBi/HFQ3MJcIBbi5G6W+CUUKO5ulh5zPp4p4JRA1/auEGbaTa0J
         D6rqMBi7iS14KiALvNHVBBXm0nZ+bzYnaAwix+lq5vkvyr7lqhkfcQEV3WAmhDOUNWP6
         bpSfZ4ScbKdb+OYs+ESB1JUCeDH0P/+NFsexVtWt2YqZ2LC9i+lc+pGT4LzzWDDDFwEu
         wwjd0E8j+F4DMZ8kzKAk07kEqODblyPjrzn1q6TaOQKLwRP2L2fdgGVApmtGH8dU7R6s
         339w==
X-Forwarded-Encrypted: i=1; AHgh+RqV/GvbuUmua2gWF6a7w622KWPa3ywTksU0MBC58LaHsbc5zy5dlweouAy19Lq2THgQL9Ya/Bif6Yldmpzg9A==@lists.infradead.org
X-Gm-Message-State: AFuF++kvuBMzktpTsmb5nfd1kBHY5MSOLNFVG2YS1Zix0ffzGpELshL/
	FORL0+qY3YAInsyEG7vuhXo5/IMCuYbWEhY3TcsgbF7gjQsl0Qcj1tJ+FrMoNwMJY3yr2zuM314
	Ll4gB9cPBgmc2Y36BLbZzMOR4wBQL47Bc2/UJjuWC9rcX6OcDqWKXx9ZzumYVXjU/jRURgRpqRZ
	mdsk+VxVfh5uobAv5+AiNNm9sK0EceCub2MYxxnaPu7bl/gKQl8g==
X-Gm-Gg: AR+sD10jZwEN3asbC8Hl6T3DqT5G7HvKVZVFEwNGZZjsxtPIFhLztfKv2avdsrUIe4w
	iM5I0i4Nr9jiveGSnfTfqUGFQVpND01hJCLALRTMZd7In1CM5Z+siqGGZp2TlAOxUe9mKb2+frJ
	KqFpnCt7u/ZMm7DdJs1NyI42XoVRQTJgDYbPXS8nd/7VdcxNDd0azgVOk7Gw==
X-Received: by 2002:a05:6a20:2d24:b0:3d3:af66:9f61 with SMTP id adf61e73a8af0-3d7b0858c0dmr13796019637.27.1788277569848;
        Tue, 01 Sep 2026 08:46:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d24:b0:3d3:af66:9f61 with SMTP id
 adf61e73a8af0-3d7b0858c0dmr13795922637.27.1788277569390; Tue, 01 Sep 2026
 08:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260821085222.140633-1-ansuelsmth@gmail.com>
In-Reply-To: <20260821085222.140633-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:45:57 +0200
X-Gm-Features: AcwNN1X-ZkG58Ju7YGsTebESlLv7OBivRQr4LICy-o3mSGUv_1-w5G-mpWoo6R8
Message-ID: <CAPx+jO_T3qLTYh3VORuPB7_caWXXOXy4XYfwXhT4THEjTghj4g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfXwOXXhUGBvpck
 +WuNlefKkw8Y/Q4Mp0Vh0k9AdMi/IWu/njh/Ce6vFIRY/wXrDk7XZouIrpOm3e9nHF1HwwV9JfJ
 7/QRT57Xbtay9o6vHMf39pBRB1wPpDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX0Zi5MMPFhcyI
 2DI9WT06pPokZ9V/3S1N+bjBlH2oBalSLBNrSKt4zWKgtpNl+n3/h54gQzPXksRSTnux2L2x4oq
 UpKmI+bPDMhMdV62NpBK6r/17NtY6C2R/HznlStP9xgPfXFhba7tDmS3acO2rHXgAas0A1T7Z2Q
 fmQB4+nN6Lph2Z+1z4rs/LgwrsWH//yxRggxFKYBVOa8gxisn1WlXpG0hqtOaOW+LmanwnD8RvZ
 4Pu5d2v0FRA2GmduIE6NtRrjVCQoeI9HslDCcMPrZTpe6+MlidmlOIh5Iz1YtHFNtn4QfEBMZmD
 wDTkQXs73EYhdu3Uwskzdd2HeRRAX/3W0lLJwe32YPypg6jEfIuF1LG0W5zguo3VjALZZlbYGeH
 m245nHwSHm1mr/oolpp45h5LRXMjfMqSesQ82EsGY7iQMz6jbCw8AAB6ajJ6VawiRws/oXIUN/B
 T54sDQn86xxZtbfroGg==
X-Proofpoint-GUID: TlLqYonSxhTfmUPwt0AtdbnpXPPlgtuA
X-Proofpoint-ORIG-GUID: TlLqYonSxhTfmUPwt0AtdbnpXPPlgtuA
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96f342 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=95gA0qMHRU8tCJvgjbwA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_084611_297332_783CC4A4 
X-CRM114-Status: GOOD (  20.55  )
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

On Fri, Aug 21, 2026 at 10:52=E2=80=AFAM Christian Marangi <ansuelsmth@gmai=
l.com> wrote:
>
> The AIROHA_CPU_PM_DOMAIN config was wrongly guarded under the Mediatek PM
> Domains menu and was unselectable.
>
> Move it outside the menu so it's now visible and correctly selectable by
> default on Airoha SoC.
>
> Cc: stable@vger.kernel.org
> Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support"=
)
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediate=
k/Kconfig
> index 8923e6516441..a2eb704a773c 100644
> --- a/drivers/pmdomain/mediatek/Kconfig
> +++ b/drivers/pmdomain/mediatek/Kconfig
> @@ -43,9 +43,12 @@ config MTK_MFG_PM_DOMAIN
>           This driver is required for the Mali GPU to work at all on MT81=
96 and
>           MT6991.
>
> +endmenu
> +
>  config AIROHA_CPU_PM_DOMAIN
>         tristate "Airoha CPU power domain"
>         default ARCH_AIROHA
> +       depends on ARCH_AIROHA || COMPILE_TEST
>         depends on HAVE_ARM_SMCCC
>         depends on PM
>         select PM_GENERIC_DOMAINS
> @@ -54,5 +57,3 @@ config AIROHA_CPU_PM_DOMAIN
>
>           CPU frequency and power is controlled by ATF with SMC command t=
o
>           set performance states.
> -
> -endmenu
> --
> 2.53.0
>

