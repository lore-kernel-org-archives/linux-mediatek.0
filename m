Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A251C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCCarJuMYzF31Ehw8Qj9G5wmPn2TUs1E48XjIphSd70=; b=bNT0g+JK74U0so
	niN5rX4+9ZhODOMYt9pS7i7XhpZGQaeGF3Ue6IFS8N9hQAudv3UJGuu6BfslL7/DdGgS5xTieIubj
	Kz6a0PfK7MOXq/ICjxOCpwcPrla7qFUaCC7LwGm8LM7moDJBZpZ66sCvc0swkBm+WsgzRue6pSgmI
	3ET2uGIL6ce7n4HxoFnwFjD2s/swkZpFdrDtw5X8jQHb9YpyylyCh+PaVSQjdBWpJiYjZRfh2UWl6
	VjhWRINDz+wGIQV4Oa1Put59fvN+27+qJ+DtRVxfWuigVHS7labdAOFAHyGpUu8xo7g0Pxi8yTLgy
	aaxMKxVjf4O6ekzEc4FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwfZN-00250W-8G; Thu, 02 Jun 2022 07:48:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwfZC-0024yt-Gq
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 07:48:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id n28so5170353edb.9
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C12bw2A3CHzAUpNuzzn6m1oe/ljWC5uGF40ieL0miec=;
        b=c23FZNn3/bgRdRrIZiM+hV6SnxMmFq/Y9AfC9nSlI/d2+4TUVKcysKJsv5steIko2k
         IvH/PdjZXkV6xXTBidJTiTq8gzV+g2OKMM9zOEImD037x3t4Ey/nfLtJj9laCudpiuT4
         U62u8mJAVH18ZoErYArpi0gj2XvBwoJy2l7nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C12bw2A3CHzAUpNuzzn6m1oe/ljWC5uGF40ieL0miec=;
        b=QdMsTI24vWAkN03fGA6MiU+SzInwTLf5lNl3lRU4unfcdBqDIM9VGboFowQt13sdDx
         wY510m6caL4uZAlpT8oqmjB3xlUb1S1kY3nmPy/dHRFADPGlu8Ga+fbi9Fv4kSzzxJIR
         xnPanIISKXt5IxdhbVZ35HB/0PnBPTTkpOcNNhs6aJCjYM3ytRQhs4Ah3ZlrIm+HMwkC
         6cAMowNgSldQyxi1Cja14yaz03nKMREWgBg97dCKviiUuK/iuY7yN0YBMuweWwjCH6zo
         oybrnzjb1kiih+l8iQiP8rt0VZQDv0N0f2DT2IO3IzTi81ccwE5wePP26VNJUTel+WtV
         H/0Q==
X-Gm-Message-State: AOAM532cxC8lRDvls8/aDj7+pHakoDN+jOTIAZkBjtTUfuO9sBhk95zh
	eRkeVjftp0KYl5hdxBebKVkl1jVLqK0FwnwLAqR81w==
X-Google-Smtp-Source: ABdhPJxqp0Nxz6J6DoU+O15+uzvAOSxUtw8bcGb5LDcaau3YVt8AzcCopzleJr/PEA6I1rhTJZSaltGdDwWHodAISPk=
X-Received: by 2002:a05:6402:350a:b0:42d:d605:36eb with SMTP id
 b10-20020a056402350a00b0042dd60536ebmr3809144edd.99.1654156103448; Thu, 02
 Jun 2022 00:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
In-Reply-To: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 Jun 2022 15:48:12 +0800
Message-ID: <CAGXv+5E9s3c0j501fHZxhwsHSeK0vG+GEqLMhtZMvtvC=+etjQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Support MediaTek devapc for MT8186
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	runyang.chen@mediatek.com, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_004827_047159_05D41DED 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 4, 2022 at 7:55 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> This series is for supporting devapc implementation in MT8186.
>
> V2:
> - Add a patch to separate register offsets from mtk_devapc_data.
>
> V1:
> - Add dt-binding and add devapc data for MT8186.
>
> Rex-BC Chen (3):
>   dt-bindings: soc: mediatek: devapc: Add bindings for MT8186
>   soc: mediatek: devapc: Separate register offsets from mtk_devapc_data
>   soc: mediatek: devapc: Add support for MT8186

Applied this on next-20220602 (with a few fixes for other section mismatch
errors), booted and got:

[    1.948483] mtk-devapc 10207000.devapc: Read Violation
[    1.948488] mtk-devapc 10207000.devapc: Bus ID:0x100, Dom ID:0x0,
Vio Addr:0x13000000
[    1.948520] mtk-devapc 10207000.devapc: Read Violation
[    1.948523] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
Vio Addr:0x140001a0
[    1.948537] mtk-devapc 10207000.devapc: Read Violation
[    1.948540] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
Vio Addr:0x140001a0
[    1.948555] mtk-devapc 10207000.devapc: Read Violation
[    1.948558] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
Vio Addr:0x14000100
[    1.948573] mtk-devapc 10207000.devapc: Read Violation
[    1.948576] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
Vio Addr:0x14000100
[    1.948590] mtk-devapc 10207000.devapc: Read Violation
[    1.948593] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
Vio Addr:0x14000100
[    1.948607] mtk-devapc 10207000.devapc: Read Violation
[    1.948610] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
Vio Addr:0x14000100
[    1.948624] mtk-devapc 10207000.devapc: Read Violation
[    1.948627] mtk-devapc 10207000.devapc: Bus ID:0x200, Dom ID:0x0,
Vio Addr:0x14000100

during the boot process. So I think this works well. Manually reading a
known secure address also triggers it:

root@hayato:~# busybox devmem 0x1000e000
0x00000000
[  135.069121] mtk-devapc 10207000.devapc: Read Violation
[  135.069132] mtk-devapc 10207000.devapc: Bus ID:0x482, Dom ID:0x0,
Vio Addr:0x1000e000

So,

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

BTW, looks like MT8186 support in mainline is shaping up real good.
SCP firmware is still missing, so video codec stuff won't work.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
