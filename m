Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD03C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B028861164
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B028861164
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzdjtXadH5nCUiVKoBdr0ksjihkLFesCD+SqHXLXbAI=; b=ScFiVuLEf+GXTEPnDbV2FqBq7T
	mUPzyb9P7NGanaww84YEcqwyjXSwChx2+sB6CkvQV9ybzlYGVJTbdfvoDu0OpW4BO9lsYra8sOTT2
	D7Nwgs4rzaZ0WvVTelF4J7e23au/MJ/yQKrRIFBOIrvPwcu/R+kXQ/w5BKSiK96ufRepUJhsoCfCW
	F6tCOeMjK4nt9tMDygWFlwLDK7O8iZ15R64WrEKQr2va1OboK1rwauzCGhC+W9tRTnw8T+5VA+t01
	ySR8064Nj8Wrb7WUcJ7jEHNmapuk4GQ0uxNL0XrSWaqYOSlOmbZ9OIs+0gPujydGz9dHDTauOU3Dm
	Yo6TVx8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5Ls-005YnD-JZ; Fri, 21 May 2021 13:38:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5Lq-005YmP-Qc
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=; b=ETB1LxaTW2gYb3zwY+m0enzhtW
 TXSwZVrOFG3hay5njiO20seG5Utz8fQcBmdB96s8qwQ5g66ugt7/xJvW7FfgydrzLZJ5WKSwIVsV4
 fmnqmXSRzDe5+E0twWzLbVRINoAjBRY82S/+bEXgglbaj7dCtdwhTDUiC+1yl0wWkuvRUhe7AqTUk
 FzbOZiSepOMMMMQWgYgELGzYqz3zCGhg1PQzTAf8QemYYBlSOsVJ77prDTwZXGyNLOt/ftaqO7jrk
 WY3X5cq3/VIMCqrDfZUa2mNIrqa6+aWrIPMwIxmpwx/gJlw3aVk1/0lVzQWWxapEvGaWsDXFkd5Gy
 nUriyEVA==;
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5Lo-00H9Vu-Fc
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:38:05 +0000
Received: by mail-io1-xd29.google.com with SMTP id k16so20115281ios.10
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
 b=KtETHqZDAe0bJjmaAIYzTN/XHe7zUKB4VbFuegX6nBkxmWG5ohFKpBq8WIAM4LXtdS
 7QemHJe42YQXMZdex6MBXYh5wnhr363+ZnRQBUyg/UDkHhdTqJKaR0BBPhsjIGBU7dRd
 nhzszn98cpFyveOVBYMaiBR25mix2cYwQlxzgxlnIMUyVp7QMgG6RamNqkyCsU8HyRF5
 NiL2J9z+S9m++uMBY2ci8baBBo7xNe5pz0utcvSR9g/2y3oYoB8LndiQzNguoMIpTHo1
 H+NRK4f3O9T4nOkH8ZYODufUe7qifKUTQtVP+hB8i6JNA4jfYOX9ZK7LMZrUgfKLn1bz
 Gshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
 b=oHBya63C30h8VbfHmkvW4WQ9HLlGzIBkmU90/Vgm45v9gnbMODQgxyscU35ljmNRwd
 2cd36pCbStptUcxFB9UcdxQMB+bWj3J8KRWD4oRZ/tfG/8d3ewa/G14/TBkX36k3rVwa
 Mi54tpNk71fFvPRcyEwXJ/cByAoFj0B5us2lTu2qaUIk56rct+YG+qOOV3tKsno/tU84
 kUq60YMxaU1ZFuNJ0RvsnR4+6VGvLt9tt7/SLpDwiFM/adZKvOaXnO8vWldAxygVHSRs
 ER4DROrZ1jR/R3mwqHdcP5ch6vsoWML0p2At22OjHtjPc/940BWirbmeE6leQ6qcbnox
 nTNg==
X-Gm-Message-State: AOAM532qJD+jC41maRzvkzW84SAdRgxqOZsHzcxMVC8jxPQEJm7htfab
 T0gilKUsHZw3sGt1FOXxkQ5wm1MyrbowShAkOhX2WA==
X-Google-Smtp-Source: ABdhPJxjJ3OhiEaMgnj0+LP0FY7WxmjA9Xv80M0Ki+88S6bhxNx6ra6pMlVDuKgWNIA6QOd4QDCiQsFR0wThZxSrLtI=
X-Received: by 2002:a05:6638:44b:: with SMTP id
 r11mr4423545jap.85.1621604283084; 
 Fri, 21 May 2021 06:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-9-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-9-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:37:52 +0800
Message-ID: <CA+Px+wWod_E9_UcytNwybrvPGujMVV+XUkJQXQKJsUjO9t1yNQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] media: mtk-vcodec: support version 2 of decoder
 firmware ABI
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063804_529392_DE02A16E 
X-CRM114-Status: UNSURE (   6.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
