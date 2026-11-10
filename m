Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F760A380C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oUYMS2TF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oe7X6rYC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bp00LnJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=; b=oUYMS2TFvvAF9a
	Ux6BTQnJG5behQY1IpgLdceYuMW+hi+kTXIUjxQRVTumslz8ZiKdJe8ds2jLxNPN8RRqQZe8ei/UU
	xem0Z+U8R5gc45TwCsGJNC2Vhw8TlpBAkQdZH5DlmhQBRQMKQ2so2SnIR86d2uQOZbS92A6FlPUHG
	VDjpGh0gl+McFqKMck/SB1PRsfDv8KoweG6bS46h6CLs1AFeLaZ2r2yC9CE0Kqu0mkxH0RAgVz1TV
	RR1dMu/u6fFqkICbK6YuIBiO/HW3j/A5Fdtq8o34FkQlMpWriW/blj1NLqVD8SXAZE0JLGyYzFk4Y
	rG5AKet2snjObWLDp7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVa-00000003XCN-1Lky;
	Tue, 10 Nov 2026 10:55:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVW-00000003X75-21nm
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 10:55:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l7nW1681506
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 10:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=; b=Oe7X6rYC7ba/GxLY
	1OYvKjjZ6uf3OAffFNrlbabF2j6cVGaxzg4fn6/E82YNIxSg4iZ1C7APW8DdxE74
	ENiN0wjxqWTlZyELXOx21oPG5L5rh7pROa/FzwVB2r4PJFSq2xaf24BA5eVpoCqd
	n94N7ixOpjlD0E1R6Eu+wPx1tSRWTK3hiGZzlCoAtUKRUdCNFfvXMxxzcYwQPtfs
	SOPfW6xghtNdIDosOPXruQRUcpbAEF7vY8V4G+onFhTXci6VXJc0uVczIg31KFCg
	ZOL6jgxic4Sxf+mbUym3+gb77zBlCMN3xILGCGKR66T0CV+zSTfYRjfSKZTJWotV
	FVc2Ew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkjumd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 10:55:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so2771734a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 02:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308116; cv=none;
        d=google.com; s=arc-20260327;
        b=shC4VOPCz2twDVrJIP4PBpiGFpSyC21WR+v1AXqU5/saAHFXWeLKuIoUXKHK1u6vpY
         /VyFBMu/jxB6FviPOjkZY68ZlNlZQJJ/L14RIO2WFncDPeE+0WEYqJMEYad2ipdfvTiw
         uzy3vgVHXXJb53U/UjpbQfNMdmjg/s5riMTGFsOIosgR6BtRk1zuEdgJxOQQuNJ67kJ6
         4mGAiYziIUx7kLdJ0/X2c+3rTM1/Mn6+1w0ZvFr4T8rpI10i6+c3afW95rHZfQlYRRi0
         JH5/PtIlqYcECDJyLNoiC5hajEISOjExyq/4KFYMfv2IhEKOnMvmqgllpBfDNj6Z1Kq7
         70yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        fh=p5YkKAz+W9ieBHcSfJueYPsq49qhl25Ws7Sf5iyqj0E=;
        b=aYmvAgeHY7rbTL9LRfHwMcjKWNq8guXYqzxFEpXAylpZZJWHSyFohAVg23TbXKon10
         wssKJd/AgNAPNqY8TnuYv/pbEr/mlpnXMQujXastYhOcY52pO40kKlRGqrxnmOxO+XrN
         9HBiVYZ+X9UGGVmtHl9XKaK3agjK42Mp7qCD9OdnjhgWM0dsmiasb6fwSH0Cv2VYTI8Y
         0voMqU8xSqceoEY0q7nHfjH4DRzN8FJuJTPmqoIBiq16jMyy+NbHOadPML69DiksJ2l3
         lcO4PcyMIJSeNav4j97WuTXKfnnk51HUcG0bFNeE6HMgKYCV2TF13GKRmL091YK1FhhR
         6ZQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308116; x=1794912916; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        b=Bp00LnJuZp+jctgnJZKsdQToMYMAHzQU1ynaGOFc3iNdE3K2K9U0B4yZf28FBc0rPq
         k3IJ+HZW2L1BD9MRSgElTFunt8gkiwDjLcyIbdAtfadhOya2/DUVijepvAja52bTSU1n
         iNIRuPY8jE4xPqWKpgFw4JJRv2xk4qDP2FmwtyuifWuoOA+tAbm8nES2AUz4EwHTifQA
         q40NZsfRijNl67C/wtSkE18nDLZk5i3ULKXEYggScq40x9r0zy5NMCGiWyfAjlFAgcFv
         IMuoXTm5cVv4PbFyeoKl5pro9bbTMccrlD+LZ2jw+rk+VWER7xedn/EOvb1pt2r0m9Gj
         ajeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308116; x=1794912916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uw+TYYaFouM8/NevocjevDeESMBzwVaeMMcXfxyfB8Y=;
        b=HjPnHKOZ3Q0UTM7sspazsFByZwtDGyOF1AnAyueg8TZmAyQuqzieMk3puJX5jcE+ee
         hU1Lrdc3NfELs56D8fEuDI/N6DQYAFvxh7GIH8TQsXm2kdjm4z1quEjK/1A1Qo0stoTY
         dqq6axWjxR/8AF8wnF3L7JAgEIVw0ESly4EILyrUBLgD7D/0tJuvnTgN+H+jMz82Tu/O
         E3Atj9HleCKuzMXfk1yza93/yGX/kK7pzkJPQoyPLkA+eeMbFJ+5mlxi0WSmgoVMu1DO
         YYzxJX/gFYs94G1QP1LOPgJFi1uTHpu3ucaj01Yw4BofUPh+FMp2ED5Ow6umb78oi3Es
         VC4w==
X-Forwarded-Encrypted: i=1; AL+hErG84sRWes/e+fBqtqmIjcIA988jhBUnL0bJk94jiaU94u6ilCG5Uj1ndRzB1/IEKrPg0wixJGPXh2jpbWbTrA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+6ye/IMfAQTnhE9Z+bu4LnZrmlATuunNQYfClzCVgZXwDTW1dz
	JZSMzxEKcZXB9bmPE660kyiQ6vunk9czOX9IoWHj5v6+2bbSzErj0lOgO3u+4N8M4WG+GLClV4h
	J0frAmhYIeAThRyrSkDHTsrctjoQ48TksX0HosDATcquVn/y0p+A9zPDNItH+7bONVfQ8yYf4pe
	nSUlkXPm4B+3nJMqffYUVw2mWFovgu8t9N7ApBDHOATHm9ILduZg==
X-Gm-Gg: AYBFou0wX/9peR0h6lJXPgKLclHgPTgEOgc/n6BfHIWccJAChJAJ1Zdk04SdQ7Pv/3V
	LllH2Zi4Gix2nd4neYLzI10vjRUmnjqYzgHyZbpd7oEk2kwvIMa1Dn6AlEyc/s3bUMzGbrHhL5/
	XJXkPaak1cFYZMTPLWcfVz3oKpRo/hv/g4CiD0hud+vTLBVO4ykknfF47KvQ==
X-Received: by 2002:a17:90b:164c:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3b166c84952mr2169236a91.10.1794308116379;
        Tue, 10 Nov 2026 02:55:16 -0800 (PST)
X-Received: by 2002:a17:90b:164c:b0:3a8:9d0d:ca50 with SMTP id
 98e67ed59e1d1-3b166c84952mr2169224a91.10.1794308115925; Tue, 10 Nov 2026
 02:55:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261005131923.291619-1-nils@buechner.me>
In-Reply-To: <20261005131923.291619-1-nils@buechner.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:55:03 +0100
X-Gm-Features: AclHuK_HV3ZZmq-KfeYfcuWg-ilNBvuN8Akbycq_to22pxvhsiankk74K8OHQ30
Message-ID: <CAPx+jO8KitFsFdDFfza5WTZGwVzOOtB+Agr=qKESHf=54q10Ow@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mt8183: Fix silent audio from
 premature sync_state
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 8LV1U96sA_5Ws0iNVBMpSD8Few3ENYmB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX9Via2gCbvvFR
 DCtuhUOLFkf2SoKfxHg9i2VPvnkT5eta/K7nGWrN1xdOH0YsPkVb28K7tcSqDPQlwRMYa1SK6mP
 jiMWijYChozTu5vpa8Huw7qzJV3rJ44=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2f815 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=byjLVS86Mrn06biGc8YA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8LV1U96sA_5Ws0iNVBMpSD8Few3ENYmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX1YPP7xxiG7cL
 3p/Qztyc6wjurJ3CXrzlEESC9MF0TZZx6TBf5IugtJjElQO9uJ8YrwqM8p/ZENPe6LnAFJVmh8a
 BJtAL5S9Zp9gAGa6YjoWFangUAdsVe5VCfj783QFeFP/OhYrCGeWjM+bhTQPRQRBEtHS4zWf8Ds
 me/fH52gQJaQHsNulXThOuMGZoI6rmKMpWl3wNuxkgjoWShQNj4HDmAy+NzSVmw8QJ/hXaWb/G/
 R8ApDY/GlRV/k+Ag8Pp7mPQG647XUGRTibbNBoc2qyLrEmvLELb35yPIPanR76c/qpdX75UPk0k
 +bdkcEO0lzLuxu15eKzUWu2Ovw8FqHQZZz2EuO/R1O188olthojZD+XFXWF3sM1sHWxZC/xtfH2
 5To7KtdfdAeWUiaMl7pM33bFUIYo7MvrLoEiTaERG5IbXRgauUsrA2rNbB30iGWGqYJYvUczN3n
 5n1WADrNAEAXIMph04w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025518_655748_DCB16E44 
X-CRM114-Status: GOOD (  26.96  )
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

On Mon, Oct 5, 2026 at 3:19=E2=80=AFPM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> Commit 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until
> sync_state") made genpd trust that a power domain already on at probe
> time is correctly, fully initialized, and stopped forcing a real
> power-off/power-on cycle for it until the devicetree provider's
> sync_state() callback fires.
>
> On the Juniper board (Acer Chromebook Spin 311, MT8183), the firmware
> leaves the audio power domain in exactly this misleading state: genpd
> reports it as on, so this new behavior never runs the real hardware
> sequencing in scpsys_power_on() that clears the domain's AXI bus
> protection. Register access to the AFE block over APB keeps working
> normally, giving no obvious sign anything is wrong, but the memif DMA
> engine's own bus transactions silently never complete: its current-
> position register stays frozen at the value it was reset to, the
> period-elapsed interrupt is never raised, and ALSA playback fails with
> -EIO. The net effect is silent internal speakers on every boot.
>
> This is the same class of problem already fixed for the MFG/GPU
> domains in commit 818d56ac1d ("pmdomain: mediatek: Fix mt8183 hang on
> boot"), which does not cover the audio domain. Apply the identical,
> already-reviewed fix here: MTK_SCPD_KEEP_DEFAULT_OFF makes genpd start
> the domain in GENPD_STATE_OFF instead of trusting the bootloader's
> "on" state, so the AFE driver's own first pm_runtime resume triggers a
> genuine power-on transition and actually runs the bus-protection
> clear.
>
> Root-caused with a git bisect across released kernel versions on real
> Juniper hardware (audio works on v6.6, fails from v6.16 onward),
> narrowing the regression down to this exact commit, and confirmed
> fixed with speaker-test playback after applying this change.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdo=
main/mediatek/mt8183-pm-domains.h
> index 5e33b8628..8e29e5117 100644
> --- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> @@ -22,6 +22,15 @@ static const struct scpsys_domain_data scpsys_domain_d=
ata_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(11, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(15, 12),
> +               /*
> +                * Depending on firmware, the audio domain may be left
> +                * partially on at boot, with genpd detecting it as on wh=
en
> +                * it isn't fully initialized. Force a real off/on cycle
> +                * instead of trusting that state, same as the MFG domain=
s
> +                * in commit 818d56ac1d ("pmdomain: mediatek: Fix mt8183
> +                * hang on boot").
> +                */
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>         },
>         [MT8183_POWER_DOMAIN_CONN] =3D {
>                 .name =3D "conn",
> --
> 2.53.0
>

