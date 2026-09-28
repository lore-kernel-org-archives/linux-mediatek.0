Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3891CCA5FA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=; b=xFyeRnVCKfEc0vxLczih79okGq
	2DHyQsOGL5Jz2aQc6l1B8b+B0vtLNiuNv9ADcZbVhSJvYDp1U2GWL/NBt8idfK3QQO4TmPaqoPbGR
	zTcG5276mVGEGguL5sqqmsWTzX6y6weNk2cFFqQ/4FQLl6dg1c9vm6PBotjEg8hmXqIq9VeNUR+yl
	C1iJAtpkzjdcEy6g3QRtA/qP4p1ieAkE/4y/NxB6OC6VOrPlJkDKqeX/5BaiGHaNiuEhuGETuTtPc
	b0l11i+h+nAyPJY+ODHzvvfqKXWYYmExahKQgiSuGr4sLjBgXUuBYlR6u1Ju5kMCJ1GhPK68mLX86
	69bx77zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDyu-00000000yxc-0PAf;
	Mon, 28 Sep 2026 16:13:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDys-00000000yw7-0UBy
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 16:13:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe5l12298601
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 16:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=; b=keXaKdigOgfFZf+M
	GHW1mJShGW56EgQN5rLWHIkx+OGqQWKrHhf7wPBvOSmrGhME618Q+805FNgwbWvp
	iVAti+d4NJO340odNGieKmnT+hu3eM2w+dfSr7N75HsbwJly+zjzVkUP17sav3oC
	tQHaqamaPiZtPy+stjVqLxokIEOIUOrY0mdXnm9K6+arQPHqHCiVBvNRM/141XsB
	q7Z1/X4TbcdlgCVTf8paPcUhPu4N7gWDHdvzsxAzFJ4PWQRU06roWVaB4IWmRlz0
	8j/9FmE30bQhRJ4LApIFmq8ZSOJRMDtH9+NynoEj08Qiqf2VPEkzszeBUqwGMDgZ
	MVJ37A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6hpar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 16:13:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3b126c9fso31909655ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 09:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612008; cv=none;
        d=google.com; s=arc-20260327;
        b=QxY2ajkRJuhUo1hwiLRD7aLLuohw6KAIb8xn9JuDgBKXQWL7IqXu4y5UC5dp361IpS
         t3l0CLVpJudNirNNlqWPYRdBlhl3n+Nk1lEma0stjbm6JU3GLgUZT084U+Gz7CgNFqDL
         8Fc1o49eBhTHMvH/jQNRK9PMAqr3V1ewvZssniOWGFcicIL+hN6lfqrxeWdEmIRCrn9p
         fQQsGcT0YGvlfEd5haX2VMPxMDas/1VCUxeifsWCSYca+6cQO+ZGMQIaflWPRsi/iOCX
         j+YCdaQrA3zKLmt60n2yiXfhAVcO8LheGyWOw0eNdxoOWHYDNzHD3+mAy2wbzRtRRN2j
         AE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        fh=XkYJTJ7sinNDKblFxVQk1GpcpC8RZ3SlsVmZwRXfmzo=;
        b=cKIaUrNKd4g+EPxJcXkVu77m1AYjgPnY+lLs+gDRawXOIh+xSQ+qM1tn3JtUfR5yyn
         PrEoASS4x6yW9Znbz/YJ0FUp5mUwX/6WlTtSLzNvwOMuOkrYnLHXvJHgqka6Nf9TIFF/
         E8umzLZBEAkOCNGz3TPESCrUj24OPG1Luf3iKQqS5rlsNSwOzsJdMABsf57Kola1KV5J
         YzoWHCyr9BQmH9mam9Q1FA0nLCCHJMnMmHZIq+mbw7JE3NcEDfqMQk5gkdAVhnNgl9XE
         +2+zqIfau8aKxgml8OjEcjVKmyG20QfpfMCuw8nzuYwohVb4sL75wzBZrHG3BgwVojeU
         /mhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612008; x=1791216808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        b=Blzh6bMQUf7DKgH1XIj2nr+GuxYBmsCbR1EA1j5/FfDAuBIvJxzAR1+6Hwi/yhplTq
         KtUzBbGbqBC6/V/FZ08VC7UavAMgrzdRuNnadQzgMDYeYUjXljfE0Av2vwD1WUn3C3KN
         +fO6PB/p9gFLQ2MZQMyBu3AIMDjkZ7DuPNtqHV8BkoQ1q4gunn93qMgu/6naC8PeqsqJ
         6IZg5BRMGBoty8RGTa187hfVyl4j6cJRte5+I/aicpqRf4XodOOPIt7/Ej/8UwwRWeVV
         PgqIchmPq3JFO6Ltx4WLZWCSaXMOjWEe9nsebpO7gsDuwkT2kvBcNE0RDVGMrbvkJpSJ
         ElQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612008; x=1791216808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        b=hhcuyn9mgnCMMcg/Dirys1jWjB/oFNzcH4k1LYxQNnXN18FQ+dun5y/hYq/Dcm1iwA
         YLYW/EP1Mvwr+Gf9R0yRdTVIUTnpaAG+qCsje5BnMGkdiKWQNBTZNeeW9fF7rMBudnxa
         /boIhYp+/So2Ky6CENf7Jw1Bi0gaONTeeCqDyAev5ph3JS5MkNa1w0HE5ocvUEp3Dn0y
         a7HOBy1BxspC+fMX1Nu1J81CaWcYZhIquN49mKn9TgC4TBQQdc+xos3hX9arfH+7/OiV
         nDXRX/2F3cYKmAiXm2P2UqYRm2n3YZh2W7jJXAv8PdKL95o9Df95kXXbDa6Bmo6q7c/p
         zDoA==
X-Forwarded-Encrypted: i=1; AKwUvBzGT/O3r6oU8NGaHhm9ghTW54Hs4G7+ShcuYj5CRImSGPTHaJcuZjdBxOJJAvj4BzG5lMbVucZf8Klukm9mkw==@lists.infradead.org
X-Gm-Message-State: AFq9FYI8SS9puKRj+MqXRqUeLRSncGeJpFinQNtiw3ILumNXhfFN+GEE
	AmtzjHgLKSKlGoqBFvAw3yEq/LRQQZ+qJWr9HeiIpv/PYdGwUi2ehzK0YtpKiuMEwDjhuFSSEp4
	WgqWAI67pPqJJbxyyE3vCJ3MUqISFrjfAMObGBWA79eLXvc0643sVP/qgvYfcIk+WIzCf0/8qRp
	BzFPwIhGsfjxUzB4/FUs2bPzYj5H7RZaU8zIFR1pdLJQ9cFzCjuA==
X-Gm-Gg: AYBFou00Z5JUGP5DG7bVEgqU5us6T4m5ezaZMg6vWRMMoM8DI2V+1V1hS9oijwTB6Oy
	EPrpxjTLnoLZAqYgjaq3mLcJcC4ndULNcsws2mUq7F7ZuYvLVxs7TYlFKTaKrlY2e0HkoKoyxJw
	aoNDXdqDcCvFq7fE9qi8O6b3MfVKlxh1sI54GfhTojGjKh7loaF+qevS1iuA==
X-Received: by 2002:a17:903:2f50:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2df7e11acf9mr102165595ad.40.1790612007996;
        Mon, 28 Sep 2026 09:13:27 -0700 (PDT)
X-Received: by 2002:a17:903:2f50:b0:2dd:c053:ec75 with SMTP id
 d9443c01a7336-2df7e11acf9mr102165345ad.40.1790612007511; Mon, 28 Sep 2026
 09:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260915144457.3463325-1-lhfff@tju.edu.cn>
In-Reply-To: <20260915144457.3463325-1-lhfff@tju.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:13:15 +0200
X-Gm-Features: AclHuK9WzP7c_-qm5LpEcfgT6OqFJRgRH9WwCFERWptgUVAizTg-xTRVM_DTSCI
Message-ID: <CAPx+jO9q0x=mvwZhr=orFO+n==2g3rx97GcCNgGCM-BbJJ-LEA@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: mtk-sd: Cancel request timeout work on remove
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX2GVgtQVn+r8B
 Y+JXfr4DDcrZ3vRTOQIrbKp5/RBQl1dAsjZTZIFYR21QOHoVpuTZh6E/WZCewnbOh7L5qaudoVf
 q3MztExlvnTcvHA2kcPJhg22uGl1RGAKGTNHdso2iMXNW0e8wn3CMGP+QTDa/yG95JKUInWuAMP
 xARd/9nw4rqE1sHdTJtFB/bOQ82KOB1sQkGrm1ZEvRJhbmbqWKip59gw4aFPwoCSV8/sDsY09Nw
 EfcMbxMeykOHiowGKMOGRqKMM+uFCSFOR3Wx4FcC+r8K9wjqxufoobyp23Sqi3+De0ILTRArmDa
 qS72dWhZ19ozXgcM4HKBf0fHXqwq+KS6feQi56gggBviquFGLT9dw7x0rMQYciCgNpCcxtpV4so
 UE24TxZge4XN3BcQg/1A/xWZEANvVNYMvD+MG3OTdVcvoEE7SaqnnZ3soRJLuU4eZyDJGkPIRAX
 Fyh8gYYA3D91A5XspAQ==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba9229 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=mIaQsNjA2lESkmv-XRIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX+k1dE4Edlv3/
 O1TM4tCgJ9p+Q4+nihSS6JWkjU/JGi7UYEkd5PMg6DizD8fpJTzLtXD7ocHO5+Bo+9tFQYC6Ri1
 QYKCZczpxh1zi9kFfnMvOGTXDNqYLjQ=
X-Proofpoint-ORIG-GUID: 1fd9TiT4wdOH9iPdlV5WvXzF0feamZtT
X-Proofpoint-GUID: 1fd9TiT4wdOH9iPdlV5WvXzF0feamZtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_091330_270690_BE499375 
X-CRM114-Status: GOOD (  20.64  )
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

On Tue, Sep 15, 2026 at 4:45=E2=80=AFPM Yibo Tan <lhfff@tju.edu.cn> wrote:
>
> The driver queues req_timeout while a request is active.
> msdc_request_done() uses cancel_delayed_work(), which does not wait for
> a timeout callback that has already started.
>
> The timeout callback calls mmc_request_done(), which wakes the request
> waiter, and then continues to use host->dev_comp and check the SDIO IRQ.
> During unbind, msdc_drv_remove() can return and the managed mmc_host can
> be freed before the callback finishes.
>
> KASAN reported use-after-free accesses in msdc_request_done() and
> msdc_recheck_sdio_irq() in each of three unbind tests.  The same tests
> completed without a kernel diagnostic after this change.
>
> Call cancel_delayed_work_sync() after mmc_remove_host() has stopped new
> requests and before the driver releases the host resources.
>
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 01ea3adbdf3b..5b160fdad3f0 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -3216,6 +3216,7 @@ static void msdc_drv_remove(struct platform_device =
*pdev)
>
>         platform_set_drvdata(pdev, NULL);
>         mmc_remove_host(mmc);
> +       cancel_delayed_work_sync(&host->req_timeout);
>         msdc_deinit_hw(host);
>         msdc_gate_clock(host);
>
> --
> 2.39.5
>

