Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11BAC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE3D61078
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DE3D61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvEbBAnHI7nItA2wXRFTAv0DiRNL4TRk7O7yD5dAmXs=; b=JZhlxqxhlDeDXO
	joOf2z+bcaUs96KUCA1JWbKhBum/kcRoAQA6pyip2c/dJDQqcz7XOyvGOa3lC/So2R9r59uXZWhvC
	V2sufNyPxOIIYaP3dq69+l9g3Nxr65g75GDY7jzGzY7VjIXVcLi+tBGv2uxVfDQ3lZX30OUhRykP+
	O+AM9aZir4RKBBC6Evb//gzlnJ4D49dGMPpIL8+dVvYyseglSIONW96yIDSMmeo9qSTGuMJNChhz/
	CVD+IF5rTfnBB82zJVGzOc2tKdDi2FA7PRXbKUCtyxjaR75zqQ5GK/j9RhPks5aPmCwc2SJtLS/mG
	uOYiv2KjBo3yyBLbB90g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8F0A-00DFS1-VC; Tue, 27 Jul 2021 04:47:35 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Ezc-00DFDr-4c
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:47:01 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so2350288pja.5
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ti5+nTjIMGmJGpw/z6LqKbHFp/KaMX3fxXfNJ8H49/4=;
 b=diXZU81t4iyvnv/18XGbkyNKsHyeTT9MhBeINHDsCaFjhj3nWJ+Rjt3mLI+jjXblu/
 MsWhavsHPf+L3BrTp4KG1nB9DENFuRXtgIl7F+eti+sB7higo79QsJAGV3StfU/AOJwI
 1LQjVuXldV3S5ZFqCm+iiqPFuli0bfz7aGmUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ti5+nTjIMGmJGpw/z6LqKbHFp/KaMX3fxXfNJ8H49/4=;
 b=ANe47Urhpo4MRnGbp1kQsXJQHalarW5zLYd3BHCdgI0SclqBBWX/LpHD9fRnksAVF7
 rCxfoMbldt6JYom7t4+Xl8uzWUdWX3VW4+tptr1qG44rlzl+7AU+mB3jrbPOHtOXKfn8
 +309uDeScbrbC7T5ycxGHefOYZ9XK0goDQM+wvCHhz8Js177F6EPhBU9QfGSrT/hBpJE
 4Fesga1QzACr07gf8UT9mdFvW/zkddxzN3K7JIGyCo2xmYs92raG2nvF8XhuqhaOHAPt
 ErXmqQAABJ/mBeIeapeS+EGVmtCKY/5hNM5bDYm3DQJvwmRXiaF7G2RTmKkVKz/KwlFD
 w5vA==
X-Gm-Message-State: AOAM532h4gAQfq0DS7D5bCbHaUo14WDkM5EyqZy/ooo1qD7JthJLt023
 ruAoiL5R1lqOkWogJK0Mv/j6xWSc18MdbioSqqOuYQ==
X-Google-Smtp-Source: ABdhPJzNMWhPWVTRIcWwCN3GmAc9IllPsC7xBOZ11CfMOfTT+kPcwdmug6nzk8s57FDGJfS0aOZkGmjiKvm8+NzOl8s=
X-Received: by 2002:a63:3601:: with SMTP id d1mr21382265pga.299.1627361219535; 
 Mon, 26 Jul 2021 21:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-20-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-20-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:46:48 +0800
Message-ID: <CAATdQgD5EpUv-R7J8keHodbkBOeuQGxWQO-9HXsCFxDu4_916w@mail.gmail.com>
Subject: Re: [v14 19/21] clk: mediatek: Add MT8192 scp adsp clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214700_245905_739ED9AF 
X-CRM114-Status: UNSURE (   6.96  )
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

On Mon, Jul 26, 2021 at 7:12 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 scp adsp clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
