Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F7860A2633
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vUwAH5oV;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIq2FKal;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQueM0DC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=; b=vUwAH5oV9X70Nv
	cU1+v6Oep++OMDg9v8uPSRdFxp0b3e+d0ggBBM98amsOPK1b3Cn7C1f0ktX7YDjPVIUYoE3QY4aVo
	gzEG4hWRtvEL4EqAMSJl11v+FbN7NOlYnh+jPn5X4W0pzQF6TOh54Dn4gPBQ8uIvEBlFZpH9ifAEE
	H9tJLYnc6bcY3jpuqLc7WqNj5fJGNg3HMRpBZYdxFiVZKb/6xcVngtghGQvssfy0D+UL/5b2vAbu6
	aGqZwWcz4wPSurxK8nygMENk5bc7H4vnPvp2kwvVAmivht2S32pHVtRht26OWF3Ia5R6t/cN7Pr2L
	IC/XF7xJok/nQGYy2EhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVS-00000003X2m-2cFq;
	Tue, 10 Nov 2026 10:55:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVM-00000003WzN-2Wla
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 10:55:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8mrf72888560
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 10:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=; b=SIq2FKalNnAEkO2P
	oIkOZMlWpOUnJ9sGWRZrSd9VTJoz1ggGjeIgAcwU7l+QMtNkT0zVc6JPRXaYU99N
	LzFJZwYiQjttoE7IbpNIV+HBteYxQr5flBOYSR9G4gADntAZfgCxaW8Crp1DuiLa
	c47wDPuFdtAOCJu4ueco1U6A7wGwrhQMNbq0ZMQHHTq7FlquqlorT6j4DzV3Posc
	qe/bHHKmGwQ1P+zR8Ot6kd24HmnhH00i5gbJkRv3alyFe4cwKk2azhHErstl/geT
	KmZTB7ADiQlKqGB5wim9lEcjL/UGXrg9AMpkaWgK+mv29UUB75zXBJSSdcGiIbwS
	YhZliQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crety-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 10:55:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed077a15c3so19415735ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 02:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308106; cv=none;
        d=google.com; s=arc-20260327;
        b=jdDVHdEOa7yzrRLdKPKah6/yQ0G9C7XnUqOPbE/eAZHHWtraxMq4TOCA4N4/U0k/Di
         oVRO493NaJgJ7ArOJRHyuOnRuthpgFZm3Zd2/QXVwNAmU55kIsilbo7eyLu+2P9G8TgO
         mcgrCwFBcnIG+kfeKQOpvX44jGrKccF3YTZa7LIsP/OjWsGjUR2vT/oO+13zJAsB+qMv
         k8jvezt5rQJHi+78wgclKuDCuxKuViMvgPYUigr/OxALl7AG75k/0Fsrk9LgMpEwwLWx
         fdb3/s7WkpaDa2s6QkOe+FFiBCiqedXmyuj7eAPDaUTH3V2P4lPQZtZDPrYra9xv7TWu
         RuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        fh=NYEo0zeH2V8Ars2yO5Rani5AQ3vUvowk/D0vQWukxYw=;
        b=LhTED0ZXQ9HQ9lRSXKs7pu5sZoxWTfFdkOZP+GvzZY6Yfi8w/EajGvZpYJZuOrgBsB
         2Up+DM/u5PKtK/lEJTqIGZTwZIvUmi7Cbj+xZxWqluYYIQY9juudxxA8xRRg2mtVHrKU
         BKyxGhZOE44Xqvr7mGyibl+Dt8EIGH5nEXKKJyq/sQ5jge95sWQif8WKjlarMa+WEC19
         RqCgGS9sOZntnEo1lO2WqQZw201WSWSc+YbomCHgJd42RUvgeiDcVrSbEak+SuLq0I1w
         7N7ORDjLJKqmNZRlX0+OuKr6WfzIGVlbw2x5Ki5dHUB2lxp+kGb4z9+VpllHMg19v7El
         g8Vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308106; x=1794912906; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        b=TQueM0DCgC2Y9X4pnmpeY2sAMcDdlcruT8qBxbPIOokjVo0Ui7Tg2VoB/+wDggaD95
         UdnsOzTUSceZoR4pE1pX1//e5/nc2LmPze5+syV55Q3yZfm7X9ccKcmfAdpBXNJteZ0z
         Jw8TbUHjTv0uJCdDbyYQ5YO0u/dGlRnRvJ+Y/g9cSwHUNdvtOuJFrkN7uTgjjtdhK/ee
         CbMfUI19NExFae0p8r2x43imEgQZTak9pN1MP1+i8nL/DmMPHoz8Da4hgI/Hx3C5XRD0
         rROeqkiC+Arm3j67wQ3DJKX/tPgtC9s84dOfACo7gQwlr8Tj2MXr5ulNtNC4C/s44a7v
         FG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308106; x=1794912906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        b=hJC3J6mfmkLgl/Pp35oQutt+g0SKbYFr476lcc2NyJILMOPt0OZaaqvMPqAyGcvq8M
         Hc6L8kDg4kjiuo0nSUbvLTLq1FQH0GuuZfHGDe6KWqY8FrT5W9jGv4akwCw0mSdxEWOB
         QfDu8eCGOT4BoRkeTjiIL0kIqMLvwaA7HADhAcVZ/1dVNPUCwRBYcpiSvCUiCgDYQtQR
         D/gLOmDeefRUGQE5Pbcz3Ls4fxqdE6psrvYYaX7mn+1XqlAoTaFvJ3oiCg3M+2KeWOa9
         FsEUI0n+YH/27LF97cT11eOIsK2yX4vJX2BQeB/lU+z1G53Gjhw7kDoGUfD1mRbuFpwP
         18WA==
X-Forwarded-Encrypted: i=1; AL+hErFIUvY+eNFtA6llujJF3jByAFnk3eYGTiV2zOEPIy2wFi24Fh0Mj3rtAWkSf5JWZWIVAZmCUE5IcCE+gXzODw==@lists.infradead.org
X-Gm-Message-State: APuU4Z80uy5oG/+n6zko6ZT8jeEcHN7jlLqajojqg9T2F5WlTPheEB8K
	kttlcoHh4/iH9s92Ls/Kko7pMN28QsCsduJ1U9hBvF2EvieNNy6MknFuhuCR5+N6/Xh83C/mC5w
	1NHIXGu6JctyP35L6UD2bDvu+cNtQ6mwMNftLvtFhKGeEvZbC5DG2PUc4lDp3YfdKFCmL1pN60b
	0HryyU0mBLs3rO8FuYiZbgdME0BAvHHHlnnutvevsy4rn6EyAd/A==
X-Gm-Gg: AYBFou1rfSOenVqyL5LLjSfed+XJ0EfHT7B0se1YHLyBPj6i3lvzzhmdDSEGC5K8f7b
	Lg8199webYDWyCg5hDSiM5HV7bkeyHrzS9hVvQ3YyGl3xn4Fvm5XmSgSWu8fsEabwvMc3sVnzsy
	qTpG40QnhVNH2n7h6OnI1eaMaPSyaYbtalweagzi+YduKdDq1C7i/Itoxxlg==
X-Received: by 2002:a17:903:1a0c:b0:2ed:4ea4:2dba with SMTP id d9443c01a7336-2edb8fb3d86mr20040065ad.5.1794308106407;
        Tue, 10 Nov 2026 02:55:06 -0800 (PST)
X-Received: by 2002:a17:903:1a0c:b0:2ed:4ea4:2dba with SMTP id
 d9443c01a7336-2edb8fb3d86mr20039865ad.5.1794308105831; Tue, 10 Nov 2026
 02:55:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
In-Reply-To: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:53 +0100
X-Gm-Features: AclHuK-wCHxxV1sk9ELba0eXodmE19efdczWGBPVlSLOk0ffW72xQC95zfSkjvQ
Message-ID: <CAPx+jO8r=bBSZiw3SVfyaU6XRWtPGMj-okMT3=NnTY=Su+fwEg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: scpsys: add MT7629 support
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: o5oMgAkD0OsYslj_9NxShFoDMR0LzGsm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXwLpU73Mfh15P
 uy443UDuKfBfsyleI7n8cPkLY0kdMirih6wqZ0OgScxyE1pQG+MlaKFe8snWevbLBvB146QR+YU
 I9TlXb8krqdOXgKLQlaA92P/yx3NIfY=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af2f80b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=3fVjQ_tGrbk1vConURoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: o5oMgAkD0OsYslj_9NxShFoDMR0LzGsm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX+el/15Ky3fGH
 ApVvrti7pewglrYg0gm7/lCzvt5YmlIwJ7X8bD85pEI/Vi79o2bbXUqXTPOvG3C3jHVwMYFC9SV
 zXxj9kC/GA+dwIZS2LXbI0SuE3Jukh6pMCQKmkYW+7WU6ZzYYX6vEuFdtjAoo/ayWY5QizsQWn3
 dYYswfNAqM5cUJN6b2WdX2+WsaIWPcDZE6AhbfAiex7yr+qWQrBM2WxowqHjNwAAQWZJZfROefx
 Hc4k3BW42omx4dZHKfdiliX2HTbuuIfoC+pZX/VqrL4PXvLuurLoXfBWCj8rXePQgBjoFJdrE7+
 vELU1AG8d7TDAxOtFGI4KbiQgaIK/sH/PobHpLtTM6PuITBaQbJZ4eanR5iPX7cCyv3bpXPy/fg
 vVQ2XyyHnH8tPazWwnZfe58Qp2fYDGl1d/Dl34/cW8ElrqSgYlXff0RWlYX/8mJ3uIf2Jv43i9c
 c080m0YU/FtkHwCNclw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025508_757624_2091FCA7 
X-CRM114-Status: GOOD (  21.89  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Sep 26, 2026 at 11:59=E2=80=AFAM Chuanhong Guo <gch981213@gmail.com=
> wrote:
>
> MT7629 currently uses the MT7622 domain table through the device tree
> fallback compatible. Attempting to power on the WB domain triggers a
> warning during boot, and powering off AUDSYS times out.
>
> Add an MT7629-specific match entry to register only ETHSYS, HIF0 and
> HIF1, matching the domains exposed by the vendor driver. These occupy
> the first three entries in the MT7622 domain table.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-scpsys.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/me=
diatek/mtk-scpsys.c
> index efc8f276ffce..2b5bd8d61cb5 100644
> --- a/drivers/pmdomain/mediatek/mtk-scpsys.c
> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
> @@ -1073,6 +1073,17 @@ static const struct scp_soc_data mt7623a_data =3D =
{
>         .bus_prot_reg_update =3D true,
>  };
>
> +static const struct scp_soc_data mt7629_data =3D {
> +       /* Reuse the MT7622 entries from ETHSYS through HIF1. */
> +       .domains =3D scp_domain_data_mt7622,
> +       .num_domains =3D MT7622_POWER_DOMAIN_HIF1 + 1,
> +       .regs =3D {
> +               .pwr_sta_offs =3D SPM_PWR_STATUS,
> +               .pwr_sta2nd_offs =3D SPM_PWR_STATUS_2ND,
> +       },
> +       .bus_prot_reg_update =3D true,
> +};
> +
>  static const struct scp_soc_data mt8173_data =3D {
>         .domains =3D scp_domain_data_mt8173,
>         .num_domains =3D ARRAY_SIZE(scp_domain_data_mt8173),
> @@ -1105,6 +1116,9 @@ static const struct of_device_id of_scpsys_match_tb=
l[] =3D {
>         }, {
>                 .compatible =3D "mediatek,mt7623a-scpsys",
>                 .data =3D &mt7623a_data,
> +       }, {
> +               .compatible =3D "mediatek,mt7629-scpsys",
> +               .data =3D &mt7629_data,
>         }, {
>                 .compatible =3D "mediatek,mt8173-scpsys",
>                 .data =3D &mt8173_data,
>
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20260926-b4-mt7629-scpsys-88d0cf37c6e2
>
> Best regards,
> --
> Chuanhong Guo <gch981213@gmail.com>
>

