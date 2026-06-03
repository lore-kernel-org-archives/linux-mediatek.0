Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A11BCD6E55
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=; b=w6Ey2q/fNjJaYhMyZcAgJETSmI
	LNSEajNHGiKS3DGXjSWDH2ZLcLeSuTA+k6EP1/N9kEe2dommOrWs8lOvZeyixnXaJkGh8HojNIOVO
	brh1ZGNndvnZwFDfgeeUrJJ1ojJQmbs5QRNSHhxc40FkG05qAfQPoxmcWNPKG6bPDeei20Fq9xRRO
	3J1TF2b7QRKtM4a3wmApOOl/SspH4//GAWJWTouyJWJbP3Zw1g3BosL4BPYqYW8DKBqrn1/5Ispi5
	6fk23FxHEJ7aBIUfytJQoDoWzQzcxjB/hnGf1G4NpDmd9f3kB6Ma9LlWHVlxfYP2tIoyJSCzm4vWQ
	MZsgpUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUid4-0000000Emqc-1AYO;
	Wed, 03 Jun 2026 10:15:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUid2-0000000Empu-0bpC
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 10:15:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RMJ71740497
	for <linux-mediatek@lists.infradead.org>; Wed, 3 Jun 2026 10:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=; b=ln/Ht+CxkbGrBgNy
	wPjkkVIlTOOgLK2eipmC/+xX7OCKCHzDFzzB2Nm52nMjfKPJOUj3n5mfl6UwjcpQ
	7Udc9IUF1V/oDCXW1QBbbmZc6Sn5z1BMPWq5dBPOwXUXLyk+wIrSW0Nvt1Vk4OJt
	TrDaAm05OwjKwc9RM8jNDlPAZ+cAkDZ3iNO6fT2slHbotWYq5QqfJIyxPTkzV7m+
	AK7SEr/dt7wcZC6a5ecldZ/zraKys6A1ornmHmSD+X4oANirp//WIARcW42LKahf
	xkSN0ge2lV56EWn0rM/ph8mP/psnmHQO0fSqi0YcHDL7C6C0+O3w7a7EXN1xguQn
	byisqw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7s9gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 03 Jun 2026 10:15:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd51bc2f5so151234996d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jun 2026 03:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481714; cv=none;
        d=google.com; s=arc-20240605;
        b=V0NDr6PWRtI4qxWCv91CoCm4IAJKTmq7LhHLDTgn0svdwOh/mscSjFxSKv0s0wGQqu
         rJi16o0LRGREsl/21yY+1bjHM1b/Lf6TU23tqIhDH3OtXkjz6VSsOr2guP9mHhyEQApR
         NHpqIdNw/1ZpFBjTUuiZf/XwbU1Lal+eU3hrLrL9I+OvX5iBAQ7hrWP5UQ3ykeDou9RK
         4t1kyUe45BKx2yJXWuMg0DSWsajJNvHcXGIWQbEHmSujtF9oka+Xm29fkUvOoGpiHFaG
         Uu9ozEG5Ka0eO9U3UJrvIR0Ad+AmRy20sbo2XP71C6/5PG8LeUixH2fRcSL4NGzR2kDR
         j6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=;
        fh=g7a8QtwvzMVm1V+vLFNCo5qu6aYWMfahSpLqbjtM6L8=;
        b=Z8LlhNzvkG5i+qP/ZCoMZsnbO91cXoK9mlvxlkSDl/iBWB0Lt8zpWTk4L8EK6mDHXS
         y0nl3LeXgR7c8z52chuYmDZEyLRoBKq7yTR4ldjKCTzGwh8F4eCX4a6hnbHma1Dki5bR
         ploG2mRNsmXxglNNaX9w1hUJleVERVlmFrnRrb9MwSFg0cH98+gKxrsXerDKifOtpeYP
         wR56lP5iHc83A8tKW72FkGAlfBUa65PrX4UcVIkS1cATC1WMhKxRMcuM8INNcINIrqSF
         NSrnx4lqIqxxVLZV42JS/s6+pInJKXeJQyQu/vA0dlzLRIN64UZ9VzG+/AxIVRKKXS7w
         cUsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481714; x=1781086514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=;
        b=NZdWQdmeu9qN8Fe8Uv76V6kvFB6v27FwgIMmMdcLmBFRpDAeD5Pfap7PH51YF5osai
         Mk+5c+x638JIymMS3Yd5YzBoFL3Pioj+4j5fniwEcN8ell4d1GVrZMortIJ0LtsOYmB5
         OtgfsmwHS80tZbozvFeClpkmox2adD1cZOJmE1qSYdiBR4uiDJHh8BhNEEeAWubJIPwI
         GI3zL3JOfhzf6mmZHurS7yRLQQ/5H9nZgD6kb8epW/AeFo/gZSirKEDtdEYuvGhCf2z8
         QXxKuvJ5b/+V94KibPbsoVBTCcKDs9v+agSEXeAUcFQamZ0BHz6TODRWWHldECuakaob
         rpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481714; x=1781086514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=;
        b=crKNROXlXxELVVMvQGNSjZ3jQlv0qeqvBMOt+wuvhbZUDymnvZOG21DFZrcS8mtqWo
         lEwoHubC6qTMrDbKEdp7DIvhusLtHAvlYKcXx3PMVr2Yc/oDghy3EhfbmssfDthQjTFw
         BDIDIzchAfAfsw11mdgd2xKCHLuF46/S9jbTB3p7wGCmwMmWukijesWsU44Lo+ys8T9Q
         iB8/0b5dKX5HqKDVW6MgI0WP0mu3BFNA7JpKQd1WtTb8mWeQBRuKK04L3ffSmIi/Aqr7
         dDaGfRDUxD72CBfN7Kd/feZSOd/P4x3ArqD9nPrvtd2y6FdoAL1Z538GuIDah6jj2M67
         xPtg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ja3S626e5qfxzuobTbnIiqa6jR30L91XBBk71EiC9Lm1kBsOUUjC5kAszULpUw1tLL57Yae0SdP3twpKrfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN0WNa2snW7VgQbj1wC2ov6d73WZyUzNCCIg8YqXOfKnqR/xhP
	8Cfn3b1EON1xj/4Jsk/MUx5f1KNJ9tbGcCaaYQsAd3rSydQSzLwI/wicSQvbYZa4RO+dXlfLa3i
	tz897tIf9zC+3BjA11Wv1505lxboIPtYAGqytR8dYOc/pAXTCQ5gwIp5VzefJtSmxkEGrvtZGQc
	DguC9Z/B9bh5BgHY+JrIhrYVgiyL6n0GIKVobjIdhaTXkbIRu4tw==
X-Gm-Gg: Acq92OHoIqCJ72+k7on0TWATrLkaCI1UJDazvPcOEvb2UyrhlOELM1hHZwhb9P2mcSP
	JO3EHEfUK+yjv3NUUVXg3wVUnpEgrzGpNRb1pPBWwpkc65SZicYHUFghnNVUeawHEJaP5XNeqpX
	pSkALQ7lg6PsJKqytYmDhsfitBRwuE8sNCSdzEAjWGYStBcIdNWNUnYnq3XmDOKe24I8bxWfWfZ
	DxSdDObqGTHSP7b
X-Received: by 2002:a05:6214:838e:10b0:8cc:58f2:339f with SMTP id 6a1803df08f44-8cecdc3aca9mr28775476d6.16.1780481714582;
        Wed, 03 Jun 2026 03:15:14 -0700 (PDT)
X-Received: by 2002:a05:6214:838e:10b0:8cc:58f2:339f with SMTP id
 6a1803df08f44-8cecdc3aca9mr28775016d6.16.1780481714092; Wed, 03 Jun 2026
 03:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com> <20260505-clk-determine-rate-noop-v3-15-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-15-f3f829fbacdf@redhat.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:03 +0200
X-Gm-Features: AVHnY4LC-7sv-Yo8uO8EA2lGD_GeWV9mrQovi0mZKLxB119HM7ymo5rY21qtuRc
Message-ID: <CAPx+jO-zN7+q2CWGpMnistOqwVSipdQLi9b=fMwtZg_xy_Jxwg@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] pmdomain: mediatek: mtk-mfg: use clk_determine_rate_noop()
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX3Or39Kugt7NV
 PjV7U83Z2S8MivBt0a9QzB4hh2fE821N0PKXA5B+vT1sZ3S1C2q9gs2X7/HRHHJXk8/8nR73OOy
 7kPV8JQn52nIMJvahG/ya27S/wzEMqvzdoO0GXJUjLz0YUXR97qVvc7opByWtdIO4KOdnMUzDBp
 t0YKU0TKSGVLADvyuU21ulWm5j4RAngRNIZ5SKsgIWJVa2/0qcGAfldHxY7pch+eKP0huWjaZJG
 8J2Z7mJebmUKNV/WElCuK6OscA3GDWip8mR8xmPXamNyUTVNmYZdtKBlZDqRVWhglbN2xqm2eWX
 KyaRE7YKCPHgwvA3iE28DK936tYkYYkJl16aV+CDQzl/aeP1Oza1rZZsdP8sLWwqyGhXkbU2sgP
 pKYgS10hu6dy77fX/Lub/VqPjFRn/ivlB9JH/iFJG0+L85QqZ7nSxKI4hz8z/FqKiqV7BsJZPR6
 1eIdxL3nt8JBcdh1yxg==
X-Proofpoint-ORIG-GUID: YBoiUxuqG0guJhWWh00QMRFVVfiaHAFp
X-Proofpoint-GUID: YBoiUxuqG0guJhWWh00QMRFVVfiaHAFp
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a1ffeb3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8 a=JfrnYn6hAAAA:8 a=rQN42pXJ2LDxoJgk6j4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_031516_191312_07E5E706 
X-CRM114-Status: GOOD (  22.75  )
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
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 23 ++--------------------=
-
>  1 file changed, 2 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 3ce6fb74dd53..64fef838776e 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -310,25 +310,6 @@ static unsigned long mtk_mfg_recalc_rate_gpu(struct =
clk_hw *hw,
>         return readl(mfg->shared_mem + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;
>  }
>
> -static int mtk_mfg_determine_rate(struct clk_hw *hw,
> -                                 struct clk_rate_request *req)
> -{
> -       /*
> -        * The determine_rate callback needs to be implemented to avoid r=
eturning
> -        * the current clock frequency, rather than something even remote=
ly
> -        * close to the frequency that was asked for.
> -        *
> -        * Instead of writing considerable amounts of possibly slow code =
just to
> -        * somehow figure out which of the three PLLs to round for, or ev=
en to
> -        * do a search through one of two OPP tables in order to find the=
 closest
> -        * OPP of a frequency, just return the rate as-is. This avoids de=
vfreq
> -        * "rounding" a request for the lowest frequency to the possibly =
very
> -        * high current frequency, breaking the powersave governor in the=
 process.
> -        */
> -
> -       return 0;
> -}
> -
>  static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
>                                                unsigned long parent_rate)
>  {
> @@ -339,12 +320,12 @@ static unsigned long mtk_mfg_recalc_rate_stack(stru=
ct clk_hw *hw,
>
>  static const struct clk_ops mtk_mfg_clk_gpu_ops =3D {
>         .recalc_rate =3D mtk_mfg_recalc_rate_gpu,
> -       .determine_rate =3D mtk_mfg_determine_rate,
> +       .determine_rate =3D clk_determine_rate_noop,
>  };
>
>  static const struct clk_ops mtk_mfg_clk_stack_ops =3D {
>         .recalc_rate =3D mtk_mfg_recalc_rate_stack,
> -       .determine_rate =3D mtk_mfg_determine_rate,
> +       .determine_rate =3D clk_determine_rate_noop,
>  };
>
>  static const struct clk_init_data mtk_mfg_clk_gpu_init =3D {
>
> --
> 2.54.0

