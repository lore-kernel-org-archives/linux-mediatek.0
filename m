Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452CFC5518F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=; b=jKCB2f2nOzGeLM8c1hXjdrwEE+
	n/Vbh/eplmHcGGEVk2DDNXljVO+eQghAp2mwomtK3tTsyGpbrSaGBTau8MfC0nW31uO7OasIu7Fws
	LnoQ9UxquYG+pa8gI0Sx4VM68CjkTUJ8w+H4dUR/spXUtq5iULvKAO1R5etbw1FF6K2ooMUsYDiRo
	VaIa2c3M8dWiqPBSYF8LdxnrgjEjadku5ueEOk7R1P+0I0u9NeVtQNU2koK4YEw0Q9YdZQB5wizoh
	WDQtFLlujZcgbB9CfljJYssSv/RjArSabJ0jt+pgoHm8l9GD3B3VVmvfVuGlAgttAN3Qv4JpiCz7x
	m6dDmcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGHU-0000000265e-38mH;
	Tue, 04 Aug 2026 14:38:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGHS-0000000264R-28bO
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 14:38:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CWwOe3211645
	for <linux-mediatek@lists.infradead.org>; Tue, 4 Aug 2026 14:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=; b=bnJhHFml3sy2gaQz
	Ci9sZKYL5yG+Oj4FnR8ardvu1diFIEzPYOoDyi2MBDkws7UtwGx5DdY4SbgkVHM/
	rjB5F45uD1naCjeUuhfE2hn720XV1fP5rhFMk7CagCzppXhXY9cZcMcUHdpWF86k
	ang3AV6bobCsHplowoD7u1DdABblZtmgz4KNFHA7HmBegrvSLch4YcMlTB5u/3Xj
	V8wxWuiAavYP36IHqXQrqdbBJudqfgADLtBWEp7wSnwmSBkAgYPN3yJBEqYWu/gE
	hH6v86h/WN2eKhRULlmY19wxzW1YrgPDQPg6s+DZnZEYW3RBIQh/W3rQokgGChoo
	5pegZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23hc3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2026 14:38:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e934385db1so47065176d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2026 07:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785854289; cv=none;
        d=google.com; s=arc-20260327;
        b=A+ynyVUjLJhLAP3HfDaoa3RVSuh63nwgqQZLFySjwwvWrdwY32xKx6Iy6oekNWNPzQ
         r1Vjur8SqJgMzMSLFlX9j4N5AJmPBJTArpxuO8MavwSpxQnzNpZgbBoWYRtfRhUbXWWo
         RCJn7cwlpToDU4nDCIk8EdyIDYZ/eN43HoeFuQS+F7qT94E3MZzREBP9aK1bsii1AIhm
         wdeLzzJu1nZmP+jNC46GXU9w01XCGoXoYj+dr1WXfv/KtCXC98rwiASqfFRT5F4bSQO/
         ShPYKpdsJYKrYqNwIoJD7aKquS6EkthSir9usJIjevWTH/QFYHLRfC4PSP37QcMkosXn
         lCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=;
        fh=zCvJDmV0YcGF8HBULR9jM4xBvKcRQAk05AyciJkCk7Q=;
        b=MCTIsPw31WF/Hl5YGn9/oJHhPrnJP0z9iO4QrC6D/v3wl7GYy6Y1sYy7uuDSZR6Q2R
         N00LCU8dee3Y/pnFRDY+mB1q77NQomnKn0M/PuRlTXgmXtAGUAf6nsjoDI2s5QoUlaA3
         w/75RSKTXeIIOGWT4D33mI3XZZkYizjY2mU1vtYO3EwCAUGCASqZjSnlX6UXq2oyspxn
         LUlmhvduwg764f5RrOqtIxU7NcRe6UXaSixSINIbKbsQwzWs8HpLYfyupIC+ZFWQBo7n
         o88W/L6IS9DnCqmAbupeHDuSEnPgNahpiQgKdt7khYVnOTjjaiv+CkWPxx71Xg0zHJc0
         o8DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785854289; x=1786459089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=;
        b=Q6/SnKwLDqEgOzEE8MTseRujTy/syZgADYO69wS9BE8l08chNNaD6+2kpLNURdDFsM
         cBsAIjilk0+DycvvXZZVHcdgEiF5UXTr6RMkYV8MmM9LRL7uzBkAtf/aDSXfF4j8D1My
         Tfr7Ht8+v+Nn/od6m4ujNcAU1xdLfBc+240hFY/xT9Mc2sB4nNnRkRidyH7UCCNcopFc
         9SwEdrqkr9PkU6R1s0NI32BCkIDQvome1777CQR06meB7/hpMT3uUfIFvcm2XByLxF/T
         qsiMxBLav3P6PJqKX9hnXXFAfnYmzXbJMOU9YQ787hqy8Z96vtH/kVRKW4OHQacsLF4j
         IamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785854289; x=1786459089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=;
        b=QDJcJxqD9g6bIFkd8o3WRyuLZ4jX3YhURCzASnhP59t1soW7IR4bXjUKIggErd3YS7
         GBiuiNFZs8DnIpb8HwFy7q7zGoedu4a/9dt5dolAWSxDyjjvFJ7zveql9JKBxgX3WeAk
         gZJHmnXKXzVpkpax4jbS67BrOR8KyxFz2qhv3ckU6yFQ92CiYng+7Ox9xBQFvPGG4L07
         TWJAIdz9pUPaXNltTrvtR3p0YnvIIDpGUl3GPKVbXlPkvr/MXHDIUIpIu1c0xQMDAkdA
         gDAZr+4PICaLWbP0jMNhxYuVkmQTGcJQPqhVcPSBqQoGaejkGDXXpEBKd1ImGYKkpfaW
         Z4Ug==
X-Forwarded-Encrypted: i=1; AHgh+RoYDwDS6WHrJAoHs7Cx4k3KIrLlKNt8KD9MaiKYorxBpVqPWOT7lBC4zb+mScPcmx8Z4qMcIgZ9+QQ1cw/5RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO7B82eCqyVivfwRgvn1ef1fuShJTEVKdsIBl6fkrs6A1aa1EG
	83x/Xvy/WA6WSQNenswxOl0opbxvs7Srv/ZxhwlHPbLHyG9Gb18Oxw8UIUOtci7c3DoaESIgOFs
	duVBKY+8nBpWKygq/bIe9nW/NXJTachS4leVOCjEDADdlvhUwFtVCCM4esYgP9Q4l4nFAQex1oG
	DWwj0dlclPOExYZLXxZG/O3Ps5F6kr0vgMdTIRnpfFUYkd/6Z+cQ==
X-Gm-Gg: AR+sD12kM5QZKGJ+Rrop88uyqoW3lJJOoBZvS8ETAOLHxBUQhtZ8pf1SjVqYRXcwgEZ
	GrwcuQCwUpKxtvoW+awmumKNfEo1j+QI2HZUFF3p3lScO7bfrkFGTVEtetq5ur1h+xdQCCAOlym
	4cobpp2lIRDY+kU7aAwqJ8N4mIwg3UxyOnCO0dS+kFVjmtIPu5QkAZDl2Ffw==
X-Received: by 2002:a05:6214:4009:b0:908:1bd5:9c38 with SMTP id 6a1803df08f44-9084957bcb6mr304720056d6.14.1785854288956;
        Tue, 04 Aug 2026 07:38:08 -0700 (PDT)
X-Received: by 2002:a05:6214:4009:b0:908:1bd5:9c38 with SMTP id
 6a1803df08f44-9084957bcb6mr304719426d6.14.1785854288513; Tue, 04 Aug 2026
 07:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260729125907.830090-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20260729125907.830090-1-dmitry.osipenko@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 16:37:57 +0200
X-Gm-Features: AUfX_mz-i8dB5SWfHvWpOVnVTkawqldOEJi0_Rvnt1_rX3o7xhgWlAFvXqEMTd4
Message-ID: <CAPx+jO--DskGufFZyhObH_t+H_idykV0gBPqPC6=g5uFUAJeRQ@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Fix mt8183 hang on boot
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: zuKuxNiu2OqTt32MvoQ06exVaQbibvSv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfXxpILIbSv7Omo
 9BgVLRofXNC7UFgmdzgATvY9yMYngOSwBgOGygkM1oiRQsFSvAXJ7FYJMdbXVKYtpELQRJz2gNe
 qetbJV8d/uXqgVgbVDeY0lFeH7p2tMg=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a71f952 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QX4gbG5DAAAA:8 a=W51c6IlItZHyHODVoFAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: zuKuxNiu2OqTt32MvoQ06exVaQbibvSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX7/Q92UGGRf7M
 9KcyJcdVVpyH0rUKmAd9gkyssg4o8v4TRr1WjDudTEp/csH6QIsBh1bzUbCEFToYzilVARRxcJ5
 derJA+xMJ3s9ivw9/canXLReR8n6Mg9YpMweJGLtSlQSYfALmBG28ZdlQShxmgf3YEnoJlcILZ8
 se233rFbRVDNWXOq07l94dOGVxb02+z9A2hBRNiiY4tM8zjHGyzMPDYf+NuYojfgaNXkNEdCEXt
 GHLdNAfAU9GnDJPcPQ/vweoE2ZvXrs4lyj94dtAQQPvtj5Fc6mUzWigOZzQtC+T1/7sMTyPxmnJ
 qFa83SIJooN7PCa7gNhtyM1zTuwmy3QfBmUhkBhMDpoyOnjcS7tr4KL1RgE/l0+dDVKxBxYjIKx
 7Zn5PhPa5woyl1zUo/z6yVfp2LchTJijdem9l9B7Cnlbra+9pqrZaomODAP4KuPwoEVfvP6jfSF
 TtQHLWH+viZLEXz4Cyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_073810_762415_01FCA0F9 
X-CRM114-Status: GOOD (  26.38  )
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

On Wed, Jul 29, 2026 at 3:00=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Depending on firmware, part of the MFG domains may be partially left ON
> at boot time with kernel detecting PD as ON, while it's OFF.
>
> Some of MFG cores may be left powered after bootloader, to let the ACP to
> prefetch the GPU region when the display controller is brought up for a
> continuous splash animation performed by downstream stack.
>
> This doesn't play well with an eventual delay in probing upstream Panfros=
t
> driver when the display controller is fully set up, as that would make
> genpd's sync_state() to power off the domain while ACP tries to prefetch:
> this is causing an AXI stall, effectively freezing the AP indefinitely.
>
> In order to prevent trouble from happening, the sync_state() functionalit=
y
> must be obliterated on all of the MFG domains: while this guarantees a
> power leakage if the bootloader boots the kernel with MFG PDs partially
> powered on, this is the only way to ensure stable operation of the SoC
> during boot on devices with such firmware because, of course, those will
> never officially receive a firmware update.
>
> Fixes Kappa Chromebook hanging during system boot.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until la=
te_initcall_sync")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>
> v2 - Expanded commit message with more clarification about kernel wrongly
>      detecting PD state left after bootloader.
>
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdo=
main/mediatek/mt8183-pm-domains.h
> index 3742782a2702..5e33b8628e85 100644
> --- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> @@ -47,7 +47,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D 0,
>                 .sram_pdn_ack_bits =3D 0,
> -               .caps =3D MTK_SCPD_DOMAIN_SUPPLY,
> +               .caps =3D MTK_SCPD_DOMAIN_SUPPLY | MTK_SCPD_KEEP_DEFAULT_=
OFF,
>         },
>         [MT8183_POWER_DOMAIN_MFG] =3D {
>                 .name =3D "mfg",
> @@ -57,7 +57,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(8, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(12, 12),
> -               .caps =3D MTK_SCPD_DOMAIN_SUPPLY,
> +               .caps =3D MTK_SCPD_DOMAIN_SUPPLY | MTK_SCPD_KEEP_DEFAULT_=
OFF,
>         },
>         [MT8183_POWER_DOMAIN_MFG_CORE0] =3D {
>                 .name =3D "mfg_core0",
> @@ -67,6 +67,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(8, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(12, 12),
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>         },
>         [MT8183_POWER_DOMAIN_MFG_CORE1] =3D {
>                 .name =3D "mfg_core1",
> @@ -76,6 +77,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(8, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(12, 12),
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>         },
>         [MT8183_POWER_DOMAIN_MFG_2D] =3D {
>                 .name =3D "mfg_2d",
> @@ -85,6 +87,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(8, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(12, 12),
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>                 .bp_cfg =3D {
>                         BUS_PROT_WR(INFRA,
>                                     MT8183_TOP_AXI_PROT_EN_1_MFG,
> --
> 2.54.0
>

