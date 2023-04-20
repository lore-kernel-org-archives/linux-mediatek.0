Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DF1C77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 16:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W8fUgFdlbG1eXmAnxyLNyaRGW9Xf4mwbBQ2j+9BCtc=; b=dd2cAlgUtchYzxcUdVCs5x4G/B
	yFUIowL4lZRDU81uTm5u/eViDIoS0HWAq3LcpXCCHUoaYv8Li04nHPNvdCNyJJNK36tzp0MariblK
	AC5wovWb1HLQRK9P4+AuJf8DlFLX6nyA3w4EeoF9pvkmWwpe7XKqmQPQ3nKzgknT01uK0gbCsqKzQ
	ry296oxC6dlpAc2rRjEUb3AHxGxgnOIxoC9IZNRGCW9e5hJOmh5mgds6ANLv8ExoCHh+ljwbTEvsr
	32TACHbhYdEnde7vQyeVZ+NR/6AFwy34Y44Uih0qg4uTrA+Ogo7LxYyguCex8WJL+pjVAOXeDFFdG
	izWeO13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWnI-008VB6-0u;
	Thu, 20 Apr 2023 16:06:00 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppWnE-008V9u-2H
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Apr 2023 16:05:59 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-5ef7c475379so3499516d6.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Apr 2023 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682006755; x=1684598755;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5W8fUgFdlbG1eXmAnxyLNyaRGW9Xf4mwbBQ2j+9BCtc=;
        b=EpjvgUNKPgmEMJvx+G8BIYn3z2Z/aQk8DLNPcsFzNptBiLm1YXCwvVQ9wogOsS7Kkq
         OQuyL1ysAPxVX4ypNmZoDfYx+wPuH5KyfKO63gEq455qy/9wZbB0GlatrFPaHZPyV9Wg
         w6UG0u/khtHZeAUyuGg04tsuc1ITQxfG33nUB6RCi5OzNYFQQ8j81xdWF5vq1NEdLmv8
         h5khjcbj4zokFOPvGn9kKR9nOwbVujRLdUIPFiD7VAIPhPqqXrAxUPAgB8MEap22V4B9
         cKdbi5H675pgxtdyfoCsg4ySVB1TGiFxK9t5749vw6025QPBhcs5l44HxcmHu+iSd4N9
         Pr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682006755; x=1684598755;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W8fUgFdlbG1eXmAnxyLNyaRGW9Xf4mwbBQ2j+9BCtc=;
        b=dU/mN+zYfzdPJ0KsxVcbrVkU1HtMVBCvCLmH6dEw63D2727QLwi7qTSqe6UZPMDrUf
         64LB9iK6Yptu688Ip7eDLEJgqr3mINO3YudOkjWlr9BzGy8EnKitqvlJiplLX5GF4d2Z
         OWkk2L3VE23DIMkEDUcKaM2ba+GjO4w5bIYL3iMskKbx/AVWjvTiETT82x6rrOYpHTP3
         8tn9RrbG7gea3nik/mW5sL6KDpcOlLiI3TZh1CkL4BrEs2wg1qXy2o989k9jy9nVLxW+
         P9ffaLyaI+1qPdPO1th/Fvwhab/LILsdEYCL8+OCRsgre1UMur/b7fV1DMjP+JOI1Yb6
         sJuA==
X-Gm-Message-State: AAQBX9d83v8s50YgoHjT1pjmAyMG16Jer24XntdkG34QtNSPyDLQdo0b
	BpYL+O3N4tna7J+j7hSf5534ec44fTJIFYmznP78jQ==
X-Google-Smtp-Source: AKy350a7gLtNR4uUV2fuAnmEbQobbYjR2Hg2eNsPtvYGx+RMCuFH9SCLPEQ8leqzfoGiFihrORk7DtPbMRqg5Ral80A=
X-Received: by 2002:a05:6214:e6b:b0:5ef:45a7:a3c6 with SMTP id
 jz11-20020a0562140e6b00b005ef45a7a3c6mr2678359qvb.26.1682006754858; Thu, 20
 Apr 2023 09:05:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Apr 2023 09:05:54 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <71a035db-4a1d-415f-813f-9061a0dccdf5@kili.mountain>
In-Reply-To: <71a035db-4a1d-415f-813f-9061a0dccdf5@kili.mountain>
MIME-Version: 1.0
Date: Thu, 20 Apr 2023 09:05:54 -0700
Message-ID: <CABnWg9shhujxfVhTFYMVa6VGjK-_mwzSvwa5pU4Y7zY1e+_tmQ@mail.gmail.com>
Subject: Re: [bug report] drm/mediatek: dp: Audio support for MT8195
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-mediatek@lists.infradead.org, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
	Tommy YL Chen <tommyyl.chen@mediatek.com>, Markus Schneider-Pargmann <msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_090556_965007_EDB3A6E6 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

On Wed, 19 Apr 2023 16:30, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>Hello Guillaume Ranquet,
>
>The patch e71a8ebbe086: "drm/mediatek: dp: Audio support for MT8195"
>from Sep 1, 2022, leads to the following Smatch static checker
>warning:
>
>drivers/gpu/drm/mediatek/mtk_dp.c:680 mtk_dp_disable_sdp_aui() warn: odd binop '0x30a8 & 0x3'
>drivers/gpu/drm/mediatek/mtk_dp.c:692 mtk_dp_setup_sdp_aui() warn: odd binop '0x30a8 & 0x3'
>
>drivers/gpu/drm/mediatek/mtk_dp.c
>    676 static void mtk_dp_disable_sdp_aui(struct mtk_dp *mtk_dp)
>    677 {
>    678         /* Disable periodic send */
>    679         mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A8 & 0xfffc, 0,
>--> 680                            0xff << ((MTK_DP_ENC0_P0_30A8 & 3) * 8));
>
>MTK_DP_ENC0_P0_30A8 is 0x30a8 as the name implies.  So 0x30a8 & 3 is
>always zero.  It's not clear what's happening here.
>

Hello Dan,

I wasn't able to get a datasheet for these IPs, so I'm unsure of what
was the intent here.
I've checked quickly and this is not part of the code Markus submitted
originally, so its
not a direct port from the original driver.

I've CC'ed Rex and Tommy from mediatek who might have answers and a
fix for this.

HTH,
Guillaume.

>    681 }
>
>regards,
>dan carpenter

