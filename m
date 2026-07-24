Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28ABC531FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=; b=Dk7HDnyRKJp0Ip2b3EeaBiiDZU
	dzpb4/2tI0kBeqKSfbDmVrYk803uJNwPdIBAr3nH0KzZyVLB9nOUAL9cglTRflTMnPCryeAQh9fxI
	aR2ddHyvtzN1LpMCcw3dA30uIb7BRPVkWPkq+mYXVPjkdeNbtveIVFu3EHCGZmXO+3Bz0+r+zBJxi
	tQN3HlNFRFn1C+aEIun2zJJ9ciPDyC/lWgd/mCfSb6gl6P/ULodnQVq+heZILJpjSZ2VmxJGbw3Tj
	+HZDBUsIAQ00v5lHYV/VdIbJgkdHnBOHLD1EB5whk2XLjuetA2TK8Tx2+zkmeccHq6aJz7r2+v1V4
	eWIUOJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmo-0000000GhYK-46ye;
	Fri, 24 Jul 2026 15:26:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmS-0000000GhT2-2c4y
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 15:25:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbL8t151720
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=; b=lUQ69t8r3RQ0hcwP
	F3p3KZcjvfYHlLOc9loUKm351F5eve2wv3d4XMk+XrsMxRN7RlNpFYWE+yjRBWCO
	q+6aOOoQX4zuDIoN4r4Xq65hVaMKtAN1iS8EE0uALs1dS/zO+b+qptb3kY+AGD9L
	iEeHPlz880faD+3qbfF6MXEUko4W/KzCS/irSMbceWx1sGxIRO2sxzfNkhvxRqnu
	FUKnBfB3UkLRGnNJRkm+bvOpHYxTW075adGj6sd51Y1m1QJRj2u1CTMmHGdFGKLx
	PH0wHKNebbZgmaQDL3OiUq8Md+iAS5iGtjFrDWSqlLnnUVqKcYwRr+uWBrXqfcep
	C18zWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8jj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 15:25:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso8951061cf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 08:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784906743; cv=none;
        d=google.com; s=arc-20260327;
        b=Qykb3wgwXty4vHTniveEyxBlpBPz8V1zCfDoDrB4FLEVU00gUYS3yHHLgyE+YZ0VIL
         gR4ZDcJsWjRQR8N15mu77sf3YNgB5Y/57eRX5Bhs+x62/3133HrloDUF/0aJG2fizxDF
         s47h4lRsFhwA+dAi8Z2ugsVM+XU03EtMcwoNn9oVmpl+2Fvi7Jho72WUT3dI9EzKjRHY
         ZRETrnM3BoFZWLxV0T271HYtutuY4JOgfGRDl39KfzNVzQ4vqYv1tMzP8X2G+aUW5Sc4
         5Y3OB4mPJQDXiuyByj4OLLmSPmTFp+HaQ/1PStzXtgVIHG+gR4P2eG7pO8Idzm7yJA4n
         rLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        fh=eRDwFXbpFfxDF+8Ye6UT9E/eQMGmq7SJKg8WKwgbqlw=;
        b=ToL2KnlVXR6RxSmoAdFXdSZg0VKPMqdGX5BXAsLvkjSDOcpWZ3VXlcWQ8JRZYIQWyi
         LMQZROpvscHoLH963uGSDt8r+1rMOi7Dj3LvbM78idS3vLxJ9/p+RinqrHMonqPqSpJH
         hR0MQKR4o4ruKuX0TgseoFk4bwHJBM5JjdiLtEiONZIEZwJERAN9fcozfvBIAVV6nKbH
         PwOjokQ6aOIwNTAel/RkKZJOn4gUU8a44bKtih7jyQbnKrtELJTIAs0JnMmpKxyaqrfC
         mxrfGSAQ2luHRFum+JBEw1cRv1YTh0NFD/bFqyOvofoW6yQrtvU3i5e29cwzksYceiRo
         Drew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906743; x=1785511543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        b=HAag0UG1vfIiB6B+DwbfQxjcrt3S9NQQfq5xxk8No1iSnVQiPxum89gaBWzxnj+Tpo
         AMPvFypr+PHqIfVJuWF+GqpIXfDOGErKTNnyT82jFZzPstNjkjCYIGjLQf5rZrKnIi47
         JaurP3KC9j7ZWKfjcUsyPGkZ0qAq2tdQ4LkIq4KYyYkRMwf2w8jVwsoijtqz2gIvf6Mk
         ztSLs85P6tDyVIiquc60sSEst8yqNNysFfg/dWg/pgMLofkCTZSGk2uikdoBDWCvsuCy
         EwCIgzpZbVHiGWD/6QI5qdsPCuuUeD63qyaPiqsjCaXyz+7cN2wdD0NAVWV8U9tPrdLr
         GDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906743; x=1785511543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gF/UkUqvrY1lcjLFHPeP744pWwMQJ7+CJ8FQ/U44hAw=;
        b=WAOpnbECeTkIms/NpjdeqrR1EDmYVVn8mOVUqR0kky8bqAD3oghUTI1IIx2ekKW1Xq
         e4UWQi8F7USWjj0MQOzMex0UOKMMhtY22VBZRgA8bgLWFhxIFEwZv0OIYrCfY31/8M9B
         i+N6VBygEeTkbstMxxvbjnBbME9gl25KtjKqx++P6Qg/0wvEO1WVh2nOZG4LJoiEVofa
         8WNS+KRTVjJl3T/lrncAZa2NCZGTYQbUfz2l6eylGw2MqZGW6Tpu/rodyuOdYWcLScfk
         89d0egIl0nsmfjDTJyCKQCU85lIyXRFkeoskujNo3XwIO9hz/a36aJPDfawk7bbIaL1A
         PWtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZDTmLvqQIGam16huia9tu3VckmOlbnWxtGqncKYctKNS50D8uE4N8PIXXO4KGLfILZEROFsfHRZJCeTdyUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy52YDu0hR5NPiCPICbHVDVY7uFxdLa5e5B6FbgNu8SsDGIGsJW
	QQ/sI/15/SZjx6p9ug0/ongGHrvl6La9XkBkTP2elmePu+BPXdQE1iiJOLYepmuRyKk1j4CQcuW
	1uX9rCuqhxMyWqL/83cT5KD8fD6WILOEDhCHC1zNFPlWYh0r5Bq3ATWvYP/AN1JrRZR0cU/mheI
	ZcN6hC6/S9rStScTLQaNZ8nBuyPD0bRbjyGbo9F9SneDa3ztw4Hg==
X-Gm-Gg: AR+sD10BNZ55H5VLQCDS1I5kra3L55iokZd8Yza0GftP8v3IKWJ9MWf9DUTCVlbYzZh
	JTTreJf94HGwH5zXHJ6nmzI9ck1+9rqjigtUqVl8Z296wbCwxerHylvs19e/8ZbJmwT+mqZj08N
	WXGxIYWywx+Ki4K8u7/nh0yA8KjMM8Hvc5hcpTmAYpchBsCuLCNNe1I2OetA==
X-Received: by 2002:a05:622a:22c3:10b0:529:a2ed:bcd4 with SMTP id d75a77b69052e-529a2edced5mr2053171cf.50.1784906742967;
        Fri, 24 Jul 2026 08:25:42 -0700 (PDT)
X-Received: by 2002:a05:622a:22c3:10b0:529:a2ed:bcd4 with SMTP id
 d75a77b69052e-529a2edced5mr2052841cf.50.1784906742426; Fri, 24 Jul 2026
 08:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
In-Reply-To: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:25:31 +0200
X-Gm-Features: AUfX_mz33HxJNiHzlKKDq7YYI97h7l3wukc4IVOHOz1B7cIf_lHzlGi_RyWl1W8
Message-ID: <CAPx+jO8gRxfM=pxMjHrJNcexOzDRiHjauVVDbpGutPKaApghdQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pmdomain: mediatek: Add MT6858 support
To: nikolai.burov@jolla.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        Nikolai Burov <nikolai.burov+review@abscue.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX90b1GGHLlF86
 F7K/dG5FM/c6PfUVLyjwLqoh0+rPPwz34H/cDZDeebMCzAxvSOV48t7zAdNVe3xY4p5I9HAtnuK
 12/1mfkPmtKKQLvhlTLGcF7jmGGZ3Z4rk/uM+QOdFiJbb1VZDh7uqE8joxqg50B2AYWURR7Aebi
 +pqiFv8WxQ5ELonb2wjABpHmLYeYhUVo8Muxwglum43muHpAjs/Dv2Gl3RRvuWXwK1LqNgo4AZe
 Up/zanz7lAFfPNe+hMrXkA9NH2Tm3idQOByN20rA80dtyjgGscr56frRjNtWwU1Yx7+vaWo6GIT
 9OsvODw86HvFGWqplm6GaWjbFtCte1wnofyMkwNtH4foRGXddCS4EyQn5F6pHEpsM2yIS+ShPgy
 3fzVfZbTIFhxgkE/YU+/If93ii/tJq9nJa7LIMlSddoicE5dUojFd5imxRYwxq57PMJwwQ9CCUl
 MvmnLj8gaKP/xU6kteg==
X-Proofpoint-GUID: MQD-fVbtAPGo84R_uoZK1sRKLYFNG3XW
X-Proofpoint-ORIG-GUID: MQD-fVbtAPGo84R_uoZK1sRKLYFNG3XW
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a6383f7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8 a=R3Y5_zZgAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=iox4zFpeAAAA:8 a=JfrnYn6hAAAA:8
 a=m8CDPgaNMIpP4pNAotQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=chadc-dSXXc7PrnZVOv-:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX8LASYvnc8vGH
 +2Dvi7pgBFXADPLFZrex0eBBhrCpC03Q8Vp0ru/aBfg1m1Tz31v6q0XeVlTk6uocjNa/Beq5jht
 tKWJFc/uocaRGzqlaJRhcYPwtmeEeMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_082544_668578_A2D83264 
X-CRM114-Status: GOOD (  22.67  )
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

On Mon, Jul 20, 2026 at 10:46=E2=80=AFPM Nikolai Burov via B4 Relay
<devnull+nikolai.burov.jolla.com@kernel.org> wrote:
>
> Add power domain driver support for the MediaTek Dimensity 7100 (MT6858)
> SoC. On this SoC, there are some new subsystem-specific bus protection
> blocks, which are listed here in ascending address order:
>
> - IMG_SUB0 at 0x1502f000
> - CAM_SUB1 at 0x1a00c000
> - CAM_SUB0 at 0x1a00d000
> - IPE_SUB0 at 0x1b00e000
>
> The VLPCFG bus configuration registers at 0x1c00c000 are also new.
>
> Additionally, implement the SMC-based power sequence required for
> enabling the modem power domain on this SoC.
>
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
> Changes in v3:
> - Fix error path to also skip sram_pdn for MODEM_SECURE_PWRSEQ
>   (discovered in Sashiko report)
> - Link to v2: https://patch.msgid.link/20260715-mt6858-pmdomain-v2-0-6293=
e87fc093@jolla.com
>
> Changes in v2:
> - Rebase
> - MTK_SCPD_MODEM_SECURE -> MTK_SCPD_MODEM_SECURE_PWRSEQ
> - Convert SMC command enum to defines
> - Based on the new SIMPLE_PWRSEQ changes, skip the sram_pdn stage for
>   MODEM_SECURE_PWRSEQ too since it wasn't intended to have an effect
> - Clarify that the SMC call also handles bus protection
> - Simply if/else code based on the assumption *_PWRSEQ are mutually
>   exclusive
> - Add comment explaining that PWR_STA_2ND is skipped for modem
>   (mentioned in Sashiko report)
> - Link to v1: https://patch.msgid.link/20260714-mt6858-pmdomain-v1-0-4f09=
bbb822e0@jolla.com
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Ulf Hansson <ulfh@kernel.org>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-pm@vger.kernel.org
>
> ---
> Nikolai Burov (3):
>       dt-bindings: power: Add MediaTek MT6858 power domain controller
>       pmdomain: mediatek: Add support for secure modem power domain contr=
ol
>       pmdomain: mediatek: Add support for MT6858 SoC
>
>  .../bindings/power/mediatek,power-controller.yaml  |  21 +-
>  drivers/pmdomain/mediatek/mt6858-pm-domains.h      | 466 +++++++++++++++=
++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c         |  55 ++-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h         |   6 +
>  include/dt-bindings/power/mediatek,mt6858-power.h  |  23 +
>  include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
>  6 files changed, 568 insertions(+), 6 deletions(-)
> ---
> base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
> change-id: 20260712-mt6858-pmdomain-b1b456c96675
>
> Best regards,
> --
> Nikolai Burov <nikolai.burov@jolla.com>
>
>

The v3 series applied for next, thanks!

Kind regards
Uffe

