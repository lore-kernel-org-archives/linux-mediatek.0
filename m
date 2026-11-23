Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02D1606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=font217J;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlfLHWi/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1XPcRcO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=; b=font217JY2smEf
	aT9Jn0imMfWv6Z3B+s7qoOFa/fga+E82KldD7j5fQz0o9aog/bZWLdm7zM1eq1T1PEe9RlKYQjJuM
	4bP32DA/HUnnMgdqOHbzuE75t/xjAT/V7VoCRFPAsuCmFNP0rgmpWuKKarh+B0AmIQoQQjYLe6Q95
	p/ptXrTG8oQU3Z47+rn0eK0smcwsrxsu8DKzPtU7dv4S6gsQsajKQcL/9yiWwjxklw1TFnhJHpKjS
	MjOOGoTrWL6dp14xcpMYW6usQtV3PmxmO0iZpnTJ7Lnb4X7wD/Njgs+Y8/nTcmPQ1GtOFBKMTuud+
	zvuQSdBH5SKCOlreb6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWnD-00000004Az7-2YNW;
	Mon, 23 Nov 2026 16:21:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWnB-00000004AyO-0jY3
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 16:21:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3AF1093835
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 16:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=; b=SlfLHWi/azcieUxH
	w+GfLXrOy8ebUt4zn5RipaVgHuzhkfZgHlYMpaAVq8dlK7vN0s8G11AQ5ZDq809N
	kLMckgPmXP5O2rqByp/YuwxS+Wd5vax/xuvdItZcyAOfnppmbAE9cTkCK6sp9n+e
	4VNFjZs8WTqtXRWhBrJyfIeyqNUgOC05T3bOUSwYRKWZNxUOYbWWK9l1U2e9CXmP
	0a3ZMeV/wBL9jA55Y3dLcHHhBsOJS623doTXOxdFqmQNsjJFUjY7ttGeKiEKN4pO
	5O32TXHnH9dsoc23YIdIj2rNVRbmpYLsBH7lNHMJqIXGZxzmBvuJfjXIicm1/q9a
	MoVprw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0s8r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 16:21:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddf142187aso1629175a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 08:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450880; cv=none;
        d=google.com; s=arc-20260327;
        b=Rot2m49ehA/2LBXxN712AIGt4uCPbUT4/iecM07hEwfv3GUKBcjcZc17uFuiN24dtx
         OHBUOQNQ0lyVGUSASrcx6JFEpHJao6LnrbtSWq4LBaQe3jDaHbWJU1Jie7BZdKv7+g42
         G7DlJXF9eEp2uhUkiTS1d/lYFcP3VhmHrvwUBbTjHcgR+QlJTCZupNb6tpL7cIJilYTO
         +xnvGojZoUOoX0Rhdeo5MvMuVl5sHxO+Q282zUgFHmdgTkkb9uwUZEZksfzCJUbe0OQD
         9uk6EprwsdFvlbovoJSGz1griKKSuxNmQGMImUub2vm92IUpLM/UhkST7I6jPnZAZKX/
         30Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        fh=97jAjQAYQ+U5mKo7l4ZzgJYFxBzTqpqrbZwmAHJE1ro=;
        b=MCMCVl8zPqcaUjaWVmydwVzCqdKIrkTCRW9VAb6sjqHLg2kHQ594Hu4NsWuYcxR29G
         PKvI5BassZtBaxsvC6gYe8BfRxgIVKse4RHoLFDPBkO5O/AfzCdpGpnGJ4qfSsh50ssn
         2y2aWTjyqI6aUX9nDR6tMTfHKuKzuuyqmHAUZjY8koKfLWawiPRli3hiz/r+aANmeia2
         5HCMeS1R8ObB3IQVs9ZZtHQnTGXubMajx7EgRb4wm1vHdI4q22N6xtPaaWZ0OVlRQl/P
         NLgodtpwyjRbJurjZ6mBl63bjCDUsftGVPhNASy4OOq0UbhheKayxe24uObGB57FojCQ
         CKKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795450880; x=1796055680; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        b=e1XPcRcOIevXmD+wImGFlBzNoPI2XZolYWuC5EZLW59NP3UYwPcBCovda5bp4mpegP
         zYxpTwUxPGSVgEo/Xo260mZaTNs4bnCwOH3nEZ/s4c0tecu8KEyO3HdsP0gBcxZHHaUd
         zIKAaXFbiyZMbW5CejfcXBApkSLl2b22vLkJaY47UijH5XOsGKLyxf9bFQ2I7tVB35/b
         PLY/CKMHcR3qdnejQEkarupOCoqtU2MjWrhDshCZwwQ34YUnfESnJFdauYL2J2VXMoad
         eVo/FX8RM9rlVgfFD38CMtmj30Cl8GJP8if6wzF7cW6uF7NMLJx8K0zKk62l8EV3lYbI
         MN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450880; x=1796055680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        b=LCUbBxXGzSgSbxmtJErSTKFhh5JUnTsghz+/kdwQboE/id2/M2ZxIiccHAq2j743TY
         8lsdX9DaWtWyQBj+gmJJstW2kFhBwONTvRVgvTReYIKd+HzQaB2BSV9+2D2f5YxyWCXp
         1RCHf8UE/J3q4dXlNoM+Mcq5xTLZH/OQ7CO/SsLsBtud8PZ3KxqIrXIxN5hpi5kSma1h
         1uosxPtgji1j5q+u1X18w7TOGUzd+2lndqDIvsdM282Fj/r6sZ+t9IvPBgM3+nLzIpYZ
         6IxpIhs+Itgjzqup08HpZAkfUXSf5t4c0nRwS+Qi/8JB5/nr9DoQixxPd6gisbLHlvkJ
         FLtA==
X-Forwarded-Encrypted: i=1; AL+hErF56N+103Gj+pj9LVhZn2pLZAMNW2b7JmNOuG9RypZ6Gy/xCMZjd7N/6ZoHBpRfIAKPtX87EbbGhQHyCZW9+Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+wCrgMWE+6YazaMHk3dR/vLb7uf1lBdaL4Yus2kbHp9tO6nG9A
	4+CQHNcCGZ4xlt87EdqQZLu3FPSAIOGWXsJ0noPiN2pVtKXeEZwTMHpF3fJmEby4ejhAEA9wvAs
	V81iG5Uox+qSBR4te3HVSc2CJD9EQ/impxv6neuCNQ6n6OlVE2r145Hjqewg8ZCjO+Xn8Urgsu6
	AQ4pjuXrBJnCKnNSk24J9ldRq9kZ34Lrhqz4/4HkIfTm6RpWhqkg==
X-Gm-Gg: AZFdTZcHleMxAc68A3w/J+I92Yo4k08VueoTLRFTmzkwPO8zvgEXj6IA1a0CbUymB5q
	K27oxE7AQKWWIVbuZy+WFGOMs0uSftIiscmGip/qZLiWe9THJoVFO0J5bX6t3VKjOmrN8Y8BglT
	ge0inFA45eIIR9h31+D3d0TwdfbO+0vNCyzMa5/u+Hm8EzgsdOGTwHI4CPjofZHvGzESHdHe9ly
	xJvzB74mV52UYUR
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr9851297a91.12.1795450879819;
        Mon, 23 Nov 2026 08:21:19 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id
 98e67ed59e1d1-3b41c98a389mr9851267a91.12.1795450879025; Mon, 23 Nov 2026
 08:21:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com>
In-Reply-To: <20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:21:07 +0100
X-Gm-Features: Aa3M54p0-foOOggcU7jnv7PtUHqqVznLL75NrrbIJ3AZrrpdKquyNVfoZD-nGbM
Message-ID: <CAPx+jO-Zo7qx4wwbY6WhW1_DQTh-WR7P34sht-2-O=v9iG2WNg@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Don't power cycle domains on probe deferral
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Enric Balletbo i Serra <eballetbo@kernel.org>,
        =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>,
        Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Rl6_II41z6tqD2dZoupWkZBOsO-YGrpU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX4RBIzCa0rmjq
 vwndx3l4EnEFn2G41yCBtqEvCvZ3yqQS4Nqw765v5Jqwti9BDj5DYI01xLtKvKwGHT6Yv+net8j
 aKeKEMz0pPLuCmD+ohityGmBlMzzwOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX5dWGhMcKF12W
 g28RYZGpx2vhkxQyA26nfhiCOpusXmz6xP8Jwo/NrSBq9GjUyoomk0IIfY3Ii725oc4FvyqKpcF
 tRnLSj9Aloo5HQ47ZgWlmZRcJgh3f4zkEH21fbN3Nq2p8r2ZYNGkJTmWcDO27lSpxVq35ERj24p
 0B0FPHjMzocxUl+dz4a1sruyhBsJjmNydNlJ+Atv2t8xRUapfkxpROIygNVcrZHdxPBVkQgk9lG
 o+/2AMPi7A02vdXLlQZiFhrvxcsI+kIb65j0hV7NJ25f60RLL8A/AttZCYOF9yYqztZ66g16ldB
 /mN9/XhjccisvGOef7sasxXsJg8if/UOw3PczeJAGQJ2qWnLIoIctntfgjXGsMAxdonSFWr05w5
 Pk1z/jQ9YGFVR/1+AUUCvlBxKuMhrVZlS64jce75O4tNPcKaw/Rq4F+X9v7zp0HbMrw1/nEff1W
 PNiLmjblyNXQVH6xfFg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b046800 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=s7NOb6aoII2F6go70RgA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Rl6_II41z6tqD2dZoupWkZBOsO-YGrpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_082121_222683_47B76D69 
X-CRM114-Status: GOOD (  42.00  )
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

On Wed, Nov 11, 2026 at 2:25=E2=80=AFAM Ryan Brue <ryanbrue.dev@gmail.com> =
wrote:
>
> scpsys_add_one_domain() powers each domain on as soon as it is added,
> before the probe has looked up the supplies and clocks of the domains
> after it. When one of those is not available yet the probe defers, and
> the cleanup powers off every domain added so far, whatever state it was
> found in. The retry then powers them all on again.
>
> A bootloader that leaves the display scanning out does not survive
> that. On the Amazon Fire HD 10 (MT8173), mfg_async's domain-supply comes
> from the MT6397 PMIC, which registers after the power controller first
> probes, and power cycling the MM domain under the running display hangs
> the SoC on almost every boot.
>
> Power the domains on only once all of them have been added, so that a
> deferral leaves the hardware as it was found, and on cleanup power off
> only the domains this probe has turned on.
>
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Found on an Amazon Fire HD 10 (2017), an MT8173 tablet whose board DTS
> is not upstream yet. Its bootloader (LK) leaves DISP_OVL0 scanning out
> when it starts the kernel, and the MT6397 regulators register about 50 ms
> after the power controller first probes, so the probe often defers.
>
> The deferral was forced for the A/B with a local test knob that returns
> -EPROBE_DEFER at the first domain with a domain-supply. Each boot attempt
> was counted from the host's USB log, since a hung board is reset by the
> watchdog into the same kernel. The hang does not happen when the
> display is stopped before the power controller probes, which is what
> our downstream kernel does today.
>
> elm, hana and the MT8173 EVB also give mfg_async a domain-supply, from a
> DA9211 on I2C, so they probably take the same deferral path. Whether
> their firmware leaves anything running across it, I don't know.
>
> Only MT8173 (direct control) was tested. The HW-voter cleanup changes
> the same way, powering off only what this probe powered on, but there is
> no such hardware here.
>
> This patch was developed with the help of an LLM.
> ---
> Changes in v2:
> - Rebased onto pmdomain next, on top of Nils B=C3=BCchner's "pmdomain:
>   mediatek: Don't power off default-off domains in probe cleanup". Its
>   KEEP_DEFAULT_OFF check in scpsys_remove_one_domain() is kept as is, so
>   the cleanup no longer passes that condition itself. No other change.
>   The patch does not cover this case, since it skips only KEEP_DEFAULT_OF=
F
>   domains, and MT8173 has none, so there a deferral still powers off
>   every domain the probe has added, and the retry powers them on again.
> - Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-m=
tk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com
> ---
> With the deferral forced at mfg_async on every boot and the bootloader's
> display left running, 61 of 63 boot attempts hung before userspace
> without this patch, and none of 5 with it. With the patch, the cleanup
> left MM on as the bootloader had left it on every boot; without it, it
> powered off all seven domains the probe had turned on, MM included.
> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 59 ++++++++++++++++++------=
------
>  1 file changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index 1b5cc9eb920a..6ec77ed0dd66 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -984,12 +984,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>                 pd->genpd.flags |=3D GENPD_FLAG_IRQ_SAFE;
>         }
>
> -       /*
> -        * Initially turn on all domains to make the domains usable
> -        * with !CONFIG_PM and to get the hardware in sync with the
> -        * software.  The unused domains will be switched off during
> -        * late_init time.
> -        */
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
>                 bool domain_is_on;
>
> @@ -1001,15 +995,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scp=
sys *scpsys, struct device_no
>                 if (domain_is_on)
>                         dev_warn(scpsys->dev,
>                                  "%pOF: A default off power domain has be=
en ON\n", node);
> -       } else {
> -               ret =3D pd->genpd.power_on(&pd->genpd);
> -               if (ret < 0) {
> -                       dev_err(scpsys->dev, "%pOF: failed to power on do=
main: %d\n", node, ret);
> -                       goto err_put_subsys_clocks;
> -               }
> -
> -               if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
> -                       pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
> +       } else if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON)) {
> +               pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
>         }
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
> @@ -1087,7 +1074,7 @@ static int scpsys_add_subdomain(struct scpsys *scps=
ys, struct device_node *paren
>         return ret;
>  }
>
> -static void scpsys_remove_one_domain(struct scpsys_domain *pd)
> +static void scpsys_remove_one_domain(struct scpsys_domain *pd, bool powe=
red_on)
>  {
>         struct scpsys *scpsys =3D pd->scpsys;
>         int ret;
> @@ -1112,11 +1099,10 @@ static void scpsys_remove_one_domain(struct scpsy=
s_domain *pd)
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
>                 goto put_clocks;
>
> -       if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
> -               if (scpsys_hwv_domain_is_enable_done(pd))
> +       if (powered_on) {
> +               if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_V=
OTER)
>                         scpsys_hwv_power_off_internal(pd);
> -       } else {
> -               if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD=
_SIMPLE_PWRSEQ))
> +               else
>                         scpsys_power_off_internal(pd);
>         }
>
> @@ -1125,7 +1111,8 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
>
> -static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
, u8 num_probed)
> +static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
,
> +                                 u8 num_probed, u8 num_powered)
>  {
>         struct generic_pm_domain *genpd;
>         struct scpsys_domain *pd;
> @@ -1137,7 +1124,7 @@ static void scpsys_domain_cleanup(struct scpsys *sc=
psys, u8 *domains_idx, u8 num
>                 genpd =3D scpsys->pd_data.domains[pd_idx];
>                 if (genpd) {
>                         pd =3D to_scpsys_domain(genpd);
> -                       scpsys_remove_one_domain(pd);
> +                       scpsys_remove_one_domain(pd, i < num_powered);
>                 }
>         }
>  }
> @@ -1374,6 +1361,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         struct scpsys *scpsys;
>         int num_domains, ret;
>         u8 num_added_pds =3D 0;
> +       u8 num_powered_pds =3D 0;
>         u8 *added_pds_idx;
>
>         soc =3D of_device_get_match_data(&pdev->dev);
> @@ -1449,6 +1437,31 @@ static int scpsys_probe(struct platform_device *pd=
ev)
>                 return ret;
>         }
>
> +       /*
> +        * Initially turn on all domains to make the domains usable
> +        * with !CONFIG_PM and to get the hardware in sync with the
> +        * software.  The unused domains will be switched off during
> +        * late_init time.
> +        *
> +        * Do this only once every domain has got its supply and clocks,
> +        * so that a probe deferral leaves the hardware as it was found:
> +        * the bootloader may still be using a domain that is already on.
> +        */
> +       for (; num_powered_pds < num_added_pds; num_powered_pds++) {
> +               struct scpsys_domain *pd;
> +
> +               pd =3D to_scpsys_domain(scpsys->domains[added_pds_idx[num=
_powered_pds]]);
> +               if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +                       continue;
> +
> +               ret =3D pd->genpd.power_on(&pd->genpd);
> +               if (ret < 0) {
> +                       dev_err(dev, "%s: failed to power on domain: %d\n=
",
> +                               pd->genpd.name, ret);
> +                       goto err_cleanup_domains;
> +               }
> +       }
> +
>         ret =3D of_genpd_add_provider_onecell(np, &scpsys->pd_data);
>         if (ret) {
>                 dev_err(dev, "failed to add provider: %d\n", ret);
> @@ -1459,7 +1472,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         return 0;
>
>  err_cleanup_domains:
> -       scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
> +       scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds, num_p=
owered_pds);
>         return ret;
>  }
>
>
> ---
> base-commit: 09078f3f8a6fca5c3a2d674b7059f4d7b46e21c6
> change-id: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb8240=
0
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
>

