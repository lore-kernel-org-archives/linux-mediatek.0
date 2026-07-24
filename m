Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0682C531C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=; b=cJr7/6pkbsLqN9diUMxVbaZs2T
	vcmp5xEudo1hdFWnaYURuPdhjFD0OopMdwf1mbdJGscpPDLGGBtSPN5E0hDFgYT/0c+iNQd8jP+Rx
	ymHVeUBoKpRju7YIdb5wXJpi4A6OvdQ/nH8NYNFhxN+njqT853ScYwKM4eWbpbhVdr1eemfvXqpyV
	cxGZfmguqH6AqhjIgnFLOGzOke5F4yIVGpydRzuNLm42o0zgRBrF3ShGSTE8L1HaaRUf451VjcPuJ
	MH7SoZGfKCRwY+/QYkhT4+yvTfiftzdnEwHtBxaDvPkltzCkvNPNQoX9fCV7kMiaUFdjDJoO7voEf
	e03jJ0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHPK-0000000GdIx-169J;
	Fri, 24 Jul 2026 15:01:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHPI-0000000GdHk-16AO
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 15:01:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbtmJ3198184
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 15:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=; b=Y4OGqcDoSP91mLoj
	Ie/WNF1TbGYkZhheGKZuMX7DXMpAOzWGIEIkPV97Pilj/04TI6bPRTjT7cwbc/dR
	mdNLx93Phh11sEc9a9uh+h9xGPWpE9wEVWkFPD62qsIkVp0ewA/IvuCopDh9xPRf
	Odv/D+eUk8/HMyqxdQfGlARylz7WlM6PPSi/GE5GYO2d6LFBc/To4woo9XLp/W68
	9pneAbBjBA33iRUWbUF3T/kqgkHKigWGA8ORqYjSPRELA8hvAma+vewxRqXomP1L
	WjTEtCcONNzguVikCaGnqoQ6IeWIp8rj5XvTYrMOYYsbEC3tos5PNrNfYPTORVw4
	UM4FZw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p52af0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 15:01:46 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-667bb944299so529350d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 08:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905306; cv=none;
        d=google.com; s=arc-20260327;
        b=Z68qpe0XJuBGfZuf9wCczfKwQsscJup5oqFR4arE80KPDjEMDZA/Ax2qP3Obefu+uN
         AGlq2SJVcpR+mEkQ11feikba7NUmQcJTCUnaooQNQheC31g0DR/I13khT3UAbKQLlTtl
         AbDMCK7a2AYb8OwMaHohV9z54XOM1UiDsRRlmz2E4ZCnZytBQoiBCZbGBnNh4qtWvfhG
         xf7Rkl2JsnMbwqJA2Px+zcsaVt+T8wE0Vi4d9BIo8KVmC4AxwEq1DY97u5bCTKKybDxm
         v2flgKSyCuQ3BSkP1iGxpOdbnVo7KHhv6gaTswxOFz0lcsT9AqF1Pd1w3mX4xa7eT1Zh
         Acfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=;
        fh=H1xiy5NJkLzjG9POooEyvbH69g/3iiXvJcJG5vFMmdA=;
        b=ak+tbHhS9BtpK5/XM8EaBEkiKQUzxrBDyhHUboz3i2FxIWEQQ0q2zZ6zWpTBPL5BCf
         pgNfeqJ+bslSeOwXQjOIgRuukoH58cmXw9k76i2UZCEVObDfqsBFHyb66y0kyR8Hrvsf
         ihQ5Aby6CBFg+KmDkj0U0m+vBwxe4kMk8/A+dv7Zn/EttS89yTrP7g/ZFcZhpxLNf/D5
         2Htyty6LFTQktEUPQP16hFiuKfO8bZiZlTArFtwfWq+r4Bb2iimz9Vuwa6xgRVUBnbbH
         yXobgMGzkIAMh1v/AFZ8XxFWv1UeV4rgv0vGF+r1FzA84d4P7VbOQis8z9Wn1l/RP/YJ
         NxtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905306; x=1785510106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=;
        b=QyBaXfaHi50uIKJQEQfteXTH+gbC9+q6z6vvPfLx0bzd1UiN0Y2RCD0ouHhKIBS6LJ
         X+6yOJMkjyvDNluQzU/K3TpDTrdwgPlOWXZ//LO+e6iM3hEn9/RtPv9QUcmO8HThNI9q
         5PL8ZUfsKcbB9M174n68KKdcgNMcYkcqpPHhO95T7sY6jDkgXss2GD3NSRKdL9dMOSNF
         FE3omTxZ/hb84e/rO6Rd4l8TWPk0+JB/x19qyY9WwVU3h3Wc0ulhHq7LGOyeCWOoqmke
         tZr3bTg1MQHS/nwHtuh5z4X17YYpJB5Axn2DIhtLxVKIipCz/O4cEpfEyu7FTJmuArEl
         YCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905306; x=1785510106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=;
        b=pkJxJWUpKAz+L9sYVDe/6Q4WN+UNaJBIH2aEp08ViG7gsKvfnh/376Pi6FK6oc3l1Z
         +wid++bVmqFUA2PSU/5/lCXsxBSWMou2R1ZP6p3UpEC24OKeChDRpqAyHN2G+x9ihvK9
         PxGR9WBvg2Y2CjjLfrSPvK6XamjMeRhB1hBSNAYxUrcTqJv7N664SpGxyorWG22Fvnl7
         +E3LlOo0AfmDy1SizH53pXXizbb+52QT6nDYOq/nvBMefruIumbmBL1PiF/VVLvqfO3y
         Ptt89L1YMBnV5W8bQoUw8Fr/X/hgt8gHi5PTc0DnjTrmbtlRwsliWbcYGAfN0y6/E6Qf
         OrJg==
X-Forwarded-Encrypted: i=1; AHgh+Rqc1VcOSDUoSQtZ+mnUa6gp9x/D13DVG1r/5oNq8QMlaN1UMN2LphnJ604xsMxR1xaQVkyiuxhZgqPhWJVLrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yywg0zkmtEwUY7uKDsJ/DQ2p0kx2ZKf8OmWzppD0oNvEYZg93cH
	W2SzTL0vfLdUXk+WrMvoDigWeQ9f37+0VfLAKL2j1utFVtfH6bQyvznJR9nSDw0orgRxBsZJcZ1
	5hbUM8XySHfLb2UN2GomIL6N7wSTPPZRWdDafG8fVIvPuIYMKTEPMcb2bIohAPzSLOaR0TsiYGT
	LaiwJurNPRrTktuqzFKSMol0FWasDWA4VExifk9/O933tCY+d/pA==
X-Gm-Gg: AR+sD11yZpAT0ZfPJVJAYY6E/Ciaxt75V7YuL7fOkcKT0bXkWX1jJgqEte6NiqwIiyK
	x7rQI5/ac1VBRkrnpNxp+RBVhz9jdDMbERdRJ3NpBhA7HYd6eplaxcv2IMHyh3bMnyMYmjdnmUv
	0Hx9H/DkhIuhXr/VWtYOVUDCKtr4+g8CQxZr6/qtpnpJiLkgSCdkMTdEhgGQ==
X-Received: by 2002:a05:690e:440d:b0:668:7e4:aeac with SMTP id 956f58d0204a3-668a504e648mr1538825d50.106.1784905306066;
        Fri, 24 Jul 2026 08:01:46 -0700 (PDT)
X-Received: by 2002:a05:690e:440d:b0:668:7e4:aeac with SMTP id
 956f58d0204a3-668a504e648mr1538798d50.106.1784905305595; Fri, 24 Jul 2026
 08:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:01:34 +0200
X-Gm-Features: AUfX_mzjLOgOcCUz76_T9HJlbASNTyiIQVZ65cjhf0ZB5m8FWwTsm9XV6DD0K38
Message-ID: <CAPx+jO-1_ZpYcnPtoYxRn5vv34tiP7TXnjKZ3SaWkEzdeTfXpA@mail.gmail.com>
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a637e5a cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8 a=W51c6IlItZHyHODVoFAA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: SKyyi4dUu3mZvmHgdFRHrMRUlkKYLFlF
X-Proofpoint-ORIG-GUID: SKyyi4dUu3mZvmHgdFRHrMRUlkKYLFlF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX6qVYnZ2z4DaP
 KfoNg5YwmGmSN9QqCxT58ZcyFR1btPizAy9hU6Sz2eAdcElIUPugHaOdKNMxKz60xV2COnpv72S
 Anr/TuoyFXbUAm3XkEVBPXQeZ+B2d8A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXzFt3aCagOBW3
 lKWEe1Sw/z9DN0BNIhXaWtyWgM8Sae71z82t/GglLQuMlmQpYYuphhK6tXacRdOA1wUxHf3zetT
 xGUb+3wQ3c/XMXE/DGD2IP/H/bi/oZcZTeuY0N3a/FGPcG8yN2ayT8/AZHJmbPZkMV1AyT7F5SJ
 311h8RsDFTcpMNT0XzYI8li8cHctbkBYzLpEkQbfLTed28Y0bAGA2stKQMf1sGY+p35yFxVKRuN
 iIljpWjlMA8T4qWZgVSFpBwNg3Mm76vQKnQZPzjJATTogLXKve0WdTU8ROVgKU78ruHZK6IAEHn
 le91y+Y4hzkGGGPjJCEvrJd6AKXml8+WYCmZRdChkbaa0E9Qgwi2zC+ec2LcRWVUnmzil1tSzLM
 umd+sxKTACs3ocv5mXBAQpyc6DpZ0RgGxrm7bkr5oTZ7PCr5GO+2Lx2sNhwOPhUhMRnw9mhDaLH
 edZCjW1q4yU/ieAvJUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_080148_410022_53392BB8 
X-CRM114-Status: GOOD (  25.60  )
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

On Wed, Jul 22, 2026 at 3:28=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Depending on firmware, part of the MFG domains may be left ON at boot
> leaving only some MFG cores powered, to let the ACP to prefetch the GPU
> region when the display controller is brought up. This doesn't play well
> with an eventual delay in probing Panfrost when the display controller is
> fully set up, as that would make genpd's sync_state() to power off the
> domain while ACP tries to prefetch: this is causing an AXI stall,
> effectively freezing the AP indefinitely. In order to prevent this from

I haven't made any detailed investigation, but to me, it sounds like
there is a missing consumer somewhere.

Should the ACP/panfrost devices be a consumer of the MFG domains as
well? Or perhaps, if the ACP/panfrost should rely on the display
controller to be probed and powered-on, to be able to probe?

> happening, the sync_state() functionality must be obliterated on all of
> the MFG domains: while this guarantees a power leakage if the bootloader
> boots the kernel with MFG PDs partially powered on, this is the only way
> to ensure stable operation of the SoC during boot on devices with such
> firmware because, of course, those will never officially receive a
> firmware update.
>
> Fixes Kappa Chromebook hanging during system boot.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until la=
te_initcall_sync")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Kind regards
Uffe

> ---
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

