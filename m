Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C56C5B56A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2026 09:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=; b=W8QgJliqUhRvspMfXXW8GYFXaB
	ippdztjEkdHaMlDK9RMewICFFn7DTxgSYtaxE4UNYxkyPJ7fSFHojkt83JCL+iBYYpdv29cu/8Iwv
	3uhxXZOClByiNEYdOTyJPfpZSg6Ozdn/CP+DmbqYDqlw9LE38tsXjqmcmU975J8oiar/yEvOUWncP
	A+CwBRB2hG7PgC4xmyl1/4cSgWrCUe/V/EIMCM3uc2l3sB3C4i3QlS6/SGDgt5vMzyJlwuaSKnRj1
	/ho51qluQWSgIxJFV9tPIpq4HqXKoR0mJ9g0+x/1qbyLB+SG2GYD8ZSwaZPfrzoJm7BgWldKOrS/E
	qZvTKAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu51y-0000000Fiiz-03GR;
	Wed, 12 Aug 2026 09:13:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu51m-0000000FifX-1enU
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Aug 2026 09:13:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YIj12933606
	for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 09:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=; b=L7sFrA09AFPegeVd
	dwP8/Th3CeYGncUc4G8wz5nz+cru39v3r9jFGPTdx2eJYIGC/nJkbn7Mhzl0oAVf
	PAAM5fTe60+L7xOyrbw8+Ay04V9W0j9MPsGUr3mfpb+PmxpshMEBHDiP/as4Q8mJ
	vhxO+n65OvYhvbUQI6rKOM/JBL3qiTRME6KI+brCiZO8Fja4G5gWMkwjDsIP1JS2
	WyPNlIQyw2cA+SBz9kDrJQTKnJxzk90AzEEUoICMkAwbsgbThSfbarmxmESDRczJ
	TQQAqZ6/h8YrTGqfWMrSq4rrwE/tSOnEHnsWYvfwj/dBgpC/W8n89lDQdAQ030st
	Ibhc8A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrk2vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 09:13:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c2b5fcbe87so179330e0c.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 02:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786526017; cv=none;
        d=google.com; s=arc-20260327;
        b=KRGHzvfCwTfbTkQtTenm9y4mtVuxB0NOLkWh5gv++Zk+bpNXzPHQP0NqWfTBkPPJy9
         Ygbph9QUtHPW3KamNAhWeNtGVQ4A9shsubePcKGmpgVmR21T5SYD5W3rNutlcoKu36kA
         DADXB+QsGtN4wZGaxku2tCHs7qWIU+INuU6lZD1o25icMRjsex9yfdgYMv17HVxA4kmA
         utrX1PnIPCcu8g+oxkuVWYSVJZQgIbTnwtdhqp2fc2gygkRi8Tm9qJ+p2WoXRvDV6Ggf
         Eri+wEm40BrnAqTcvUqzQ3xAjuHd66Th3kLKQvLgyW/fugqbBTWuvKvNArbUAK2KF3/K
         tRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=;
        fh=UJCnSESBXdaKuduney7jedVx38uEjXykYdIBf7Ozf6k=;
        b=ZUkRs5BMo8A7AfjxXIQrVBME+FWignKc590XBCZYk/ufeHUYZ14XQgSJkLMm8Dgr6E
         laBoQPM+IbAs44I+VbAunJWYPcWwHlF79UhgjyX2azs9CyuIFZ6H9pqHW7P9R/bmF0n4
         0fneiWv7bNIb2tVr/kGTlOcVhusoqGFUthSDLJHWzjVIK4OgRZfETOUpeEDPri1F+WVF
         DMUmd0aWMEmw02WEM+PHSTKwvVukACKFAu7363wvXvA7kcZ72F1jFS+4V1Byrn6WM5Ig
         9pUGmsRyRrb7it2qW4JT6R+qIZU5Mw2idHhyJ+28mv5zArSBZy6aWLWnnxbL+riY/Z5O
         671Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786526017; x=1787130817; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=;
        b=IFibTQ567HkBeP4V8NN1o4Z8yVyboPtu+zKMJ3/mYWVUsYdQOObGnKXw5aDW+jFAwH
         naaIV+NpG8Q7YwsVB90bX0n0M8NhUGzy/0ZYdcyiqj2su9DtO4U/POUg5EbDcFPR09CY
         8lPV168PTAB76Ey4j1D2NVgmMN4aRZ9ZwW6z9uR2AolEg49U6JOoH2rGQs7sWJt8iApp
         O+8OLbZakQTP77zL0+WxvEkTLUJQOnqNVEXeUi4ire74T1ok119mwAFXyk2/OgWFnaJw
         twCzNlDqEOc2WnruMSr2N+kjSnUtfgzKdAYXKhETf5QqHcSMSxCJ4gayQB7R8pkXWftD
         2Xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786526017; x=1787130817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=;
        b=l1g9rgDKQoBpXTloJ99uT4q5TlTgpD+wdvikoTe3pG+hq2r26kudVHloaOFHk4feb9
         NW4PDhK1ZAnNoBFipQbOyFmrZEG9GL6M647MuGfRHtWKxEwRTXvBacpENnopry+S3hoE
         bXv/qBx3ir4pgLEBbKFPA9WceLerTIwjK51sgUCNlsEQuHPlzkdNEA9CPcYMg6c0uns4
         qevZmfQevnnXmUiIK1LMvwIu+Mi8NWAgWG9SOE+L2q4SVnsethf+Dq4EZKg1lyPzjYXz
         Z84t8cz7PxIm3iVWycu8DbkGEm+kOlckupE4HQ0ifUvCkEioxb98aM9bPvID2uRR7k57
         DFxw==
X-Forwarded-Encrypted: i=1; AHgh+Rpf04VB6AOnFdZQwWQ9ck0YZkmgpOPK36nyk0qBFjA5ccgpiB012MJGa6PIHwV/Ts6RJlHZnNovYU1h+qGbSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya3Fb4zzer/23t88tM173gvt2D4PVOm+8TYulect4GYMtyRGma
	emT43xi4QAmvTDOJQCSIJMisa4T/90Ax6V/SrWm2MwyTXlJqEBD1qqiSrSjGmWoVQBWnIT9oGMz
	j8Em1UydaUgDsKBSMcJRuBNscLHjfwaqPdIvLEWDJO+Kf9IP5FD640DhFcNyZYkB91wFUQLO1+i
	wPDjw6rTKmaIciNO0dkL0OrdtfXKgoClEjxdHalHXvBQ9/IGLuYg==
X-Gm-Gg: AR+sD12N9K0atMCmkt8Eigr58+y3RDoy7o+2y83VIz+BZWFiGyAQTiVz0F9AfHYhZM+
	Odd6l75FvZXWyUX4Ofvs44RN7uz7iw0XbsBntqk/7hNaaktml+weZrLDH5CoEAg8sSPwyX0WxB+
	+eL0+4WKyfpA4BxQNEMxeWaRmweXj6c0gCA/N/aeKz/R2PfsZs0KoBee2PL10xgIxbYYMjcK0tg
	kckTE1Vm0bytbKOuQ==
X-Received: by 2002:a05:6102:c13:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-76c877585f8mr619080137.2.1786526016777;
        Wed, 12 Aug 2026 02:13:36 -0700 (PDT)
X-Received: by 2002:a05:6102:c13:b0:6a2:b2a1:f16a with SMTP id
 ada2fe7eead31-76c877585f8mr619064137.2.1786526016415; Wed, 12 Aug 2026
 02:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260808150506.78534-1-kmehltretter@gmail.com>
In-Reply-To: <20260808150506.78534-1-kmehltretter@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:13:24 +0200
X-Gm-Features: AUfX_mxrjM8iyAWaDhMnquvm67hwsMzBGMAivc7nk1vv82k5vyDswHGVflOUtdY
Message-ID: <CAPx+jO91LMn4SJXvy_zi2zOcmrDane07Mnh_+bKLztozFyPF-w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mfg: initialize prev_o in mtk_mfg_attach_dev()
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Brian Masney <bmasney@redhat.com>, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: SHcElia0niu57cDGFUjW7wy74zgFvs5F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MyBTYWx0ZWRfX0jBobLu1pcyo
 Luv9Jod+KIQWSmCjIdMTusN9DVmy4rdjBr/uV+ewhVlSitrdkxKurpVrHDyGpVoVIHNt8Lw6HpA
 +8SjgFr8BW1mvvzGVEO+FOdDmVN3XKg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MyBTYWx0ZWRfX4ier987sh3/g
 VPeG/BL/U5210PZexrUQle1W0Hb/4dSwJEenC3QV3+Xob/KXgCd9Cz0YK3LMXcaoamErrTekSf4
 TZbALE3GEhBeQGrhlLdy+LFyWYng883ZHS52jrfmF8jQYjnGeVuSTXiSKeZ+oZTVESdFJHy3Cqu
 ExgNR38BH2Fi9U6y8GcVfqaH2qw5S0LZD/rw78Li4QKZk5jUHhrvbJsXNBkbLoVfsPwV51AG2qv
 +scE8nu4JXWVIG63lEuAqEQxlLxeB+9/3PhE5S8UCJOYR4ck2fnhPRMKl5zCkTsmdsydz5NswDT
 dTlXN2DJZ4oiFq8If/fR2ABuCBSpn/B+XFrCAGTS8R8ZRmY3HNKHTL0W8RKMGtOEl7vAePY0Dny
 Ilt1wB5ZcQthjY9ntEtdjSNMYt669CsNgRrw/Dgd7IGgXyXXQFdCHzKlrJimkCLJGmR+iBYzEjI
 67P+NlnR2JiMBTpdw/w==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c3941 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=xhlwbj9xLX0jMGTAeIgA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: SHcElia0niu57cDGFUjW7wy74zgFvs5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_021340_643785_9C3F15C1 
X-CRM114-Status: GOOD (  20.36  )
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

On Sat, Aug 8, 2026 at 5:06=E2=80=AFPM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:
>
> mtk_mfg_attach_dev() reads prev_o on the first iteration of its loop,
> in "if (prev_o && prev_o->freq =3D=3D o->freq)", before prev_o is assigne=
d
> at the end of the loop body. On that first iteration, evaluating prev_o
> reads an indeterminate value. If it is non-NULL, the condition
> dereferences a stale or invalid pointer, potentially faulting or
> incorrectly skipping the first OPP.
>
> Initialize prev_o to NULL. This matches the intent as well: there is no
> previous OPP to compare against on the first iteration.
>
> Found with Clang's -Wconditional-uninitialized.
>
> Fixes: f08e7a4e8d6ac ("pmdomain: mediatek: Add support for MFlexGraphics"=
)
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 53bdab66cf157..9a8a38d98cce7 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -657,7 +657,7 @@ static int mtk_mfg_attach_dev(struct generic_pm_domai=
n *pd, struct device *dev)
>         struct mtk_mfg *mfg =3D mtk_mfg_from_genpd(pd);
>         struct dev_pm_opp_data *so =3D mfg->stack_opps;
>         struct dev_pm_opp_data *go =3D mfg->gpu_opps;
> -       struct dev_pm_opp_data *prev_o;
> +       struct dev_pm_opp_data *prev_o =3D NULL;
>         struct dev_pm_opp_data *o;
>         int i, ret;
>
> --
> 2.53.0

