Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDC7C2D0D1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 18:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1125020716
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 18:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+EBOUgL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsLosRjy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1125020716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFwPLVKONJEALH95D6eSXDJf6ZLysFTzUjPw+ZCQves=; b=e+EBOUgLJMMvxJ
	wLcJo8rL2yWMB5fd8EgV2rNVV5orEchehXIb+Gm8Po80vxsCk/+0/DQl6rwgHVH/ImkEDC9PUh16K
	z4l7tL44XJ6gvd7IBA6JvQ3u1/PhcOdznC/OLuu9uTeZwapjiom1nK63vR7T997P0ZyKf2x5cdKML
	bMhzbEGFp7Lc5fCrb/KHmJgMI5T79OssMO2m5setifLaAwyoI2wr3tBHaGSnqNyDYzLWeEIbU4VNC
	Iu6OqSymXv4BQ3pyqutbPWrjm25jiqVsGamLZMcP/2Qx3E69a0bt9T2IPgbkDoURUBuPXFbE2hACg
	Pdbo/lvCmOr8ckgwcBSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii06p-00020s-MY; Thu, 19 Dec 2019 18:01:11 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii06m-000202-De; Thu, 19 Dec 2019 18:01:11 +0000
Received: by mail-ua1-x943.google.com with SMTP id v18so2273412uaq.7;
 Thu, 19 Dec 2019 10:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QjPQ9I3MaulCTCZ2YdAid7nxSKyySRyNct57kaSUS88=;
 b=dsLosRjyuSjvTAjKSLXV2e4+t0VYWTXQuFL+k20JqPB/UoaAMZPo4h1L8DlmR6qem2
 U3mQKxfqj2KdK8oG/Tg1BGUE/9neDB7zOKyz52MNGgqTkDXz2QLPBzEF2sL2XH2umOMD
 cbqrJweHNN/WfptPBOryXSaBIfTz9J8FkByItcChZ+1hEmzV6B01R+CvA3h2Z8C/3Rfp
 gEWWN5x+KIZwVHQaJ91U6UFmwfN0Bczg8Xk3buYK5KfpaY7gHj42tBzB1jtYrwccxCdY
 zLaqSUPrQMv0T1VKRlxzMiDSZNGOqOKCa1PdLeWoldNU4ZD0ojXcIGhbyHBa96vMtVp1
 ebrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QjPQ9I3MaulCTCZ2YdAid7nxSKyySRyNct57kaSUS88=;
 b=iMcSnmgCzFc3Y7vQaOiK12nQRLBL2fIWvzA03Jp2LlW49OMH9B3UOuYhgG7OCKcF2q
 vC9J+c6SKkdJy3CFLOMLFY4BjgmBA8NcOQnJyr7Fj2ZWMGLev1VgnZHSLdKWQRC5TTNP
 h6fCQn/ZQ1nsFHfSM0HZj4wSMlaPbTJJdYkZfAuFqy3GcM2EVp5sLRsz+4OCj3QLYbqv
 JpTmjz9TazS9E2oS5MR74xSQUjK5IjALO1bDarHEOUvF3teomG7YB0ypFxAaJWAyMyxO
 I0ZLCW1BvfTHfVcRmg2y4i9e1mEace9vanQDjzDGeAwXhCtbgiNxfhrp5JRLF5bXpAAa
 s68g==
X-Gm-Message-State: APjAAAUEKX8OFCR+AwIkC44M75M4DfaHCjX2x6MvMitL42W9wdR51QgA
 Bm4j1p0xPLKfbmwuwTtHhppFv9kx6vXm0pxHNBI=
X-Google-Smtp-Source: APXvYqwNBImtkGHDKyuRda18yw7naA/7n+2veuddJDpT4jKTMKEftJPEz5htPYoBKMPuYkbjM0g7DvUkosrf9MYJ+8I=
X-Received: by 2002:ab0:4966:: with SMTP id a35mr6112212uad.141.1576778466344; 
 Thu, 19 Dec 2019 10:01:06 -0800 (PST)
MIME-Version: 1.0
References: <1576468137-17220-1-git-send-email-stanley.chu@mediatek.com>
 <1576468137-17220-2-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1576468137-17220-2-git-send-email-stanley.chu@mediatek.com>
From: Alim Akhtar <alim.akhtar@gmail.com>
Date: Thu, 19 Dec 2019 23:30:30 +0530
Message-ID: <CAGOxZ50RKYAEw=HwYMH=Jm7cagUV12C-fwhauJhJqx6HscAmFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2 RESEND] soc: mediatek: add header for SiP service
 interface
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_100108_496458_88C20946 
X-CRM114-Status: GOOD (  13.71  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: f.fainelli@gmail.com, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, leon.chen@mediatek.com,
 andy.teng@mediatek.com, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 chun-hung.wu@mediatek.com, Kuohong Wang <kuohong.wang@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pedro Sousa <pedrom.sousa@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

On Mon, Dec 16, 2019 at 9:19 AM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> Add a header for the SiP service interface in order to access
> the UFSHCI controller for secure command handling in MediaTek Chipsets.
>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  include/linux/soc/mediatek/mtk_sip_svc.h | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h
>
> diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
> new file mode 100644
> index 000000000000..97311959d7d7
> --- /dev/null
> +++ b/include/linux/soc/mediatek/mtk_sip_svc.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + */
> +#ifndef __MTK_SIP_SVC_H
> +#define __MTK_SIP_SVC_H
> +
> +/* Error Code */
> +#define SIP_SVC_E_SUCCESS               0
> +#define SIP_SVC_E_NOT_SUPPORTED         -1
> +#define SIP_SVC_E_INVALID_PARAMS        -2
> +#define SIP_SVC_E_INVALID_RANGE         -3
> +#define SIP_SVC_E_PERMISSION_DENIED     -4
> +
> +#ifdef CONFIG_ARM64
> +#define MTK_SIP_SMC_CONVENTION          ARM_SMCCC_SMC_64
> +#else
> +#define MTK_SIP_SMC_CONVENTION          ARM_SMCCC_SMC_32
> +#endif
> +
> +#define MTK_SIP_SMC_CMD(fn_id) \
> +       ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
> +                          ARM_SMCCC_OWNER_SIP, fn_id)
> +
> +/* UFS related SMC call */
> +#define MTK_SIP_UFS_CONTROL \
> +       MTK_SIP_SMC_CMD(0x276)
> +
How about moving UFS specific stuff to MTK UFS driver and include this
header in driver file?
Rest looks fine.
> +#endif
> --
> 2.18.0



-- 
Regards,
Alim

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
