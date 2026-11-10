Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E160606A33B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2sDcEocm;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d27fe/gl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hKNgR+Rp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=; b=2sDcEocm5dzf4v
	8rnDHM6eylQ+ArQHJKmsNRRSOnq9PxpJdc15zyetQpDVoYh0JaN74FheiraP6J20uvyIVXb2vquCn
	Fey5n+iYLTz3XJNzsS0l4lUvdmy1g7F4KgZ0ovVJp9D4ShHdbcR5/DifTK/x+cQp/Q5GhENv5bkKl
	NMKVIWerSIp6LsBAdkdBQZdUj3qQazYe0j1+/RoG+xkl8yQBz5hPsozWOabUFuRx0SCl2yOoJxq3p
	qxGqqmZWbm84c0didNKae5MJa5sZsnp2cl4qTrrx2u3b931lC4EFwraX2OOX6gN1Fr6hFzN12P8Wi
	jigDCIcv8aKcmTv7GpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVT-00000003X4f-3Y6t;
	Tue, 10 Nov 2026 10:55:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjVQ-00000003X1O-1u2A
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 10:55:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8WJ6J2833851
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 10:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=; b=d27fe/glQtKvSlKW
	CAKbr0p3yZ+zq7kpWozN7Of0wddOy+GbY8+15C74oKoRd6X8fM/xNQfXPyA2eF6c
	70y54o1E5S+YPwH+hVQkiQWDpXyviMaXUXWBWdcGYfZRdhBj2IDPVPvn1f26O9WH
	RcRE9boj8DQnBC5yoRcDxl435ldSMAPqY4JrLiQ0+7bBQB/8m7qwhQzr3u0BiaVr
	Jtyle+CtQP0IIxB9fbJbou3IYe/4rSFaev5s43I7bsNNtIUCFPmq2nvcqNcE6C/g
	YZneFWIHNazWtm00fYAEalEeb7Y2NL+Z4qUb87sEQ6plV6Ev0f8jGcwseKsPdWic
	ZRqm8A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrgj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 10:55:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb061cc4dbso1166445a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 02:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308111; cv=none;
        d=google.com; s=arc-20260327;
        b=nqEHcfUXq8cZ4X7fiBP99t4HlHhCMDUCIXLBaGvm9Nwcq5IXs5FSHUT9TkstEWZkbo
         xxZAb6o1OSY/wRKhZw45cWOt+7nN5vJzEvCFibKanG1ih9jA63jR22WpeenurG65MW9c
         Dj1XkX5bt/qbCZv1TJJtAWpIqCFKxWk/g67hb8XFBFquASrdFdqt+ftUnf5GbQ9DF0RP
         wtAmyTfQnRNgoY756fQKmmOADbhoLY41LifGsQeMuBL3Ks6S6apLWX9qxwtPA5hml4/L
         twb56UWHw+NYgeY99tEU9L2UNJHxvzENNAHyrma1dCOPaDt14fCjEtx5tkR3f3OYeEpe
         txhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        fh=rzD91oKqeEeAeJzdifS4H/Wh4NQsi7DKgevTcJ1F8zQ=;
        b=IYzeUBM4Nt35h3rOprWM0cNmy3/xeEXt1uOoKFSEkXVt/YwNxddxq9pa13+bS+nVSh
         ZDAPBVHETecVaHkuYKqwqKsFsmX9dqRvEGY1hFyQLcv58ULJtzDj6vdPK+xhMtT2huTK
         ZE1RykierVz8sZoajaNpb+E12CtLkkLQzsYqu+AaEGl/rPEk23ESUKMS7t20wJI3ml8O
         /S0IDYYrN/YMeewe6+sNa5yqR++2ysn/gTR/C8Go1yUPNdQxcBgX1i+dYyb8fWCOihwG
         hGal443aZgigO3byO6DrkY9tWC8gjXIntzfZi8PJB6WU7tuT5IE9Mf83N9YoDCXndslC
         vz3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308111; x=1794912911; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        b=hKNgR+Rpcd1pxLbn+/ZvhqgP1RtPtMqG/dZZ3FR95BEH1xn1Kx0X2AKDBlW9W5Myyi
         AlIT1redIO5WAr1cz0lSBNXrpsJVZODkRbnQvY01TYRQ+Z9biEKXWB+uNTAWeOoHqQWN
         ujIkrImFI6M41VIqew/Ks33LzqVkuNHFavc9utlIYXL58362hsmCo/nkdcJfQeksclm8
         Wmgo5/1EXjgvwVal73ztppEHFKJIVUllCiApLT1aLgqCD+J5B578pwxN3zxnueimNwqq
         W3xyHolrWIEwNCnTJpc5vANc+3dB6MlVnzoKndLWgEHaZ3bNrxaG5dqwtsFNzcGbgqVh
         m2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308111; x=1794912911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        b=ziQ9BWcarWFy4AwK92ZmsB4uRF/vlONVDcHADg4mBXWOrDBwmJBz66/Q8OtwYfMuiV
         3oqrCmSZv15dqGHvhd1bLzZOTfGJQRZXl3atZAW7HE0bDq0E/gaYltBnFyArmt7eDXAJ
         7MH+UMOYDS5GnU4HkzcAXVZimLb03dN95rGCitIsc6ec98STOhbcVVLhvFMkK23+vh/m
         1vg1o24iLJJHRf1jZaoSh2a/WLJFuR962Dli8f0pn9WtqK41iIAlpssIcachHilA6J1M
         h2hn6E6rpA+yGNWpwYCQxlhGVTfZw0anmml9/jaNNd6pCK/B3h5v2KJXxBzEAzfiTXIf
         IaoA==
X-Forwarded-Encrypted: i=1; AL+hErFLtjlGvr3eK2soanNJUJPy/OfBX8hw9cFvaNBv7cUnCJLu7mh4LtQwZsJXDjrVTaycianaCazobwSpCrPQiw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8U5MwHwANQxCT7ZOMIAJ6PKEIgXNCboHPtxNiIZNBmSXLJiomV
	cO1UWXLRNBe29Tu1Q0zVhfA3siGpuChhCQMsV/XVZ2qoco9gHf2GJpGe5DGrEnPE+oyUevVix0J
	YJ4poYVIY5i3pYGAN3ObogO5eRF/Wd8x86wARKwqlwi9/olXxwU2uwn/ESqAJL4CFsVbHSF1y4Y
	FKpn8Lxq9MjRUd6JnXqRzC0rIRMcGN/+74vy30gdj3E/xDzNZutA==
X-Gm-Gg: AYBFou2w99kk7TPQf41vNIdfNNoa4TsZ61EL8m0ul1N8Z/bkZVqpmHqoqFz2d63z5KM
	WETVtquTpy79BpEkhhmrkAnMbA1heEMEomJslth5o2vVUUjEdYPn0+36mmBS7EZBLQSrf9SUSUI
	R9jFdBIZWt88a3yep6ztR8TE1YrMTsEd9ns7sUNr2fST080io7BgpvQ297/w==
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id 98e67ed59e1d1-3b167a3863bmr1285320a91.42.1794308110741;
        Tue, 10 Nov 2026 02:55:10 -0800 (PST)
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id
 98e67ed59e1d1-3b167a3863bmr1285304a91.42.1794308110234; Tue, 10 Nov 2026
 02:55:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006025318.503422-1-nils@buechner.me>
In-Reply-To: <20261006025318.503422-1-nils@buechner.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:58 +0100
X-Gm-Features: AclHuK-yZm3sakUxzv0BiFEttCIYN0ZmBsfWxz8lFwhcgpjwm5RE5v-I_qmF6-U
Message-ID: <CAPx+jO-18BxWDeKWrib+GaKNiy_DAjUqtT2-s2d9YgYtObJgXQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Don't power off default-off domains
 in probe cleanup
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: hxHPmD4DaC8Eaah8JJjcSsU6UjM4jD0Q
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2f80f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=t40qi2bwvM8u8KFdrioA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: hxHPmD4DaC8Eaah8JJjcSsU6UjM4jD0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX/uSuNwh7rV5p
 ZgN/NixPbuWwpkTdwiiUuTN5GFvL7859kraF5X9Tf3oZuw63znINUVdTaZ94Wiu4kGbV2bqla35
 vb7zmhhohFa8dLtMVCXKNhzt80kkb6c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXwwhbJDwbMD/g
 uEa3XBnbckNJU1NhCiJBh4NDWvpTY6go1ZTA3nRaJ+B1EWZrAtElJZJYvU2GFQLkci/q6ZBCxwy
 /WJfKY2B3yE1BtRrjSYBiY2+vw2XTlRzYzM2O2ZGJcKJXM+Nc9eVKyoNeV6SDXa6F6Fq/guwI8b
 pEtdrOT3ypKnRPJ+tEaiuBEH9VXIaq7IDBnNMi0Po5a0dd7kaCgeHMZ/rTSDBffZHKz6KgWUSiI
 AVacY65E4Gvzu4iwf3PL7jvE4iDv+PWiMt5xZ6DMRL4MYDr2yVF+E9gMhqbFdxVtx0+y5V6urOy
 TuGmbN2G75IvDuD9/5D8Qe1Kwze0DU179Lf4WBsIjtyqRwWoY2pbd5lbWHMBNeOz4oM1/G2heZh
 bHjVHAy6qcd/Yz056IqulA6CCVwf4yK7nDn3lhE2VpZBkZpCpPu59fiqU5s/hSC+yaTfhWCKsL4
 N8hZ0m9USEzeISvbafg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025512_537210_77C58527 
X-CRM114-Status: GOOD (  30.58  )
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

On Tue, Oct 6, 2026 at 4:53=E2=80=AFAM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> scpsys_remove_one_domain() runs the power-off sequence for every domain
> that reads back as on. Domains with MTK_SCPD_KEEP_DEFAULT_OFF are
> registered with genpd as off and are never powered on by the driver
> before the provider is added, so their clocks are not enabled. When the
> bootloader left such a domain on and scpsys_probe() fails (typically
> -EPROBE_DEFER) after it was added, the cleanup disables those clocks
> anyway, triggering "already disabled"/"already unprepared" warnings from
> the clock core.
>
> Seen on MT8183 Juniper once the audio domain is KEEP_DEFAULT_OFF: six
> clk_core_disable/unprepare WARNs with backtraces on every boot.
>
> Skip the power-off sequence for these domains; only drop the clock
> references.
>
> Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
> 7.0-based kernel (the hardware is not set up to boot mainline);
> build-tested on mainline with W=3D1. On the device with the audio
> domain marked MTK_SCPD_KEEP_DEFAULT_OFF: the six clk core warnings on
> the deferred first probe are gone and audio still works.
>
> The change and this changelog were drafted with an AI coding assistant
> during a debugging session on the hardware; they were reviewed and
> tested by the submitter.
>
> Fixes: c1f3163d8ff3 ("soc: mediatek: pm-domains: Add default power off fl=
ag")
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>
> This is a follow-up to "pmdomain: mediatek: mt8183: Fix silent audio
> from premature sync_state" (sent 2026-10-05), which marks the MT8183
> audio domain MTK_SCPD_KEEP_DEFAULT_OFF. With that applied, the firmware
> leaves the audio domain on at boot, so a deferred first probe of
> scpsys runs into this cleanup path on every boot. The fix itself is
> independent and applies on its own.
>
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f0fa79e01..2b41bb8ed 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1100,6 +1100,16 @@ static void scpsys_remove_one_domain(struct scpsys=
_domain *pd)
>                         "failed to remove domain '%s' : %d - state may be=
 inconsistent\n",
>                         pd->genpd.name, ret);
>
> +       /*
> +        * Domains with MTK_SCPD_KEEP_DEFAULT_OFF are registered as off a=
nd were
> +        * never powered on by this driver (nothing can use them before t=
he
> +        * provider is added), so their clocks were never enabled. If the
> +        * bootloader left one on, running the power-off sequence here wo=
uld
> +        * disable clocks that are not enabled.
> +        */
> +       if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +               goto put_clocks;
> +
>         if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
>                 if (scpsys_hwv_domain_is_enable_done(pd))
>                         scpsys_hwv_power_off_internal(pd);
> @@ -1108,6 +1118,7 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>                         scpsys_power_off_internal(pd);
>         }
>
> +put_clocks:
>         clk_bulk_put(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
> --
> 2.53.0
>

