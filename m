Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B224EC11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 04:53:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572A5613E8
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 04:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572A5613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2plGJbY+O4WePaeyDKSVuvqBAs8mJ0eTb+TrJpdgh+Q=; b=0Pv/EQ9zGTqIKD
	4Ic7anzrO+AebnBbc6wskWcQnTQF+I38HBNOgQBeeU9+ZfwfOyOIhYSrj8c/yB2yIgdODwzOsw+Di
	ajXCf0wSmm+v2Su461dfP0ATvueSd1bkCuoAH2Al+yqmMagfMkSUXF0NohnPyPzJ+YRQpHHO4PAHO
	8Boih4v8op+/wA57sKQDpR+z7tVtdInRxfMOtG/eEVgbm7+Wn43NFwyjqNEUkAb5Pw6GzV9F3z/o1
	pvZpS0oFAVOcs0+Odmb7ztDy/PvLhXmD4ijZ4Rku7p0BvAFfQRIf7+ugsNAe9zFatUT313dpnwDaa
	VgW1FBnLDtX+VwhrB7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzBAq-0026mE-G6; Fri, 02 Jul 2021 04:53:08 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzBAo-0026ku-30
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 04:53:07 +0000
Received: by mail-io1-xd31.google.com with SMTP id v3so10189771ioq.9
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xA/EyhzFSdsz2sFUNgzwIXBEHw1bTOcRizpVrKwHnM=;
 b=dvzH83kdx5KIUmDVS1w0rMisasSOJ6Ccukbr8vTiM4s/WjHlF/yx/4+Bk9Q6lEJDgR
 Tkx9f4CuZyje++eY/P5t1ukwyC31q1YCPAk5cCjsy62kuOtRdByvF3GU/AW0vdvHcxEE
 iewpk/DHrdNe8EBlHHAvfMArsB6CCwwV+wTbjCG4D1wuDbV5Ex3y0Y/aV9T8Y5+XBNCj
 LAAe6OZwusANIPlvsXl8zUZAnIfzphE2fjbBYX/vbbGG9aOhq/khkgFzjATkg16sTHSL
 Cp93Fzo3wDmW9KdhbY8xP1EFMYlUqVEdWJKvi2nzyulMAT9WcnQvO6JrFDbzlPZSbQxf
 e3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xA/EyhzFSdsz2sFUNgzwIXBEHw1bTOcRizpVrKwHnM=;
 b=SKj4K+k7WwX129RxQVHQAgDNzEp70lNhNcBgQFAhBqhzhCmTg8U8rUwH1nbn/afU00
 ETRvAgEt2p+bbQvQRTtCtEKPgYSgcg+1OSJ6hzZ3Sfy3osuqMyl9HzphAzOirttt7O9Z
 fS7Q9p6xeHEN/OuoRY8GyApQNmSexDpn/+x3hX94vX/SJ6mVllT29fq4Szf48WeuDexn
 NAzZvjoBtsbpiatLnOI0L+ByeaPoo2xcu6nRGQuGkeMVcnqR7p9C9Oh4VH/pEvioURR3
 O5BU4zhb5XqrHlnTTqlRQnvOKiaJdsLAt3cQkYW1Ib6N5ZUwy9YoJrY1VKhDbf5ErMpm
 U3+g==
X-Gm-Message-State: AOAM530jGv51JW9x5034JFNkw3QTll7h74EGX40G84wEWtKX5Q0DiGg0
 //5pamRC8xnBTkvyRHHkwUfGrWHc81SYK01wwFYgiQ==
X-Google-Smtp-Source: ABdhPJzER2PdkKXa7rEiTZOGbSGSbVenXZ4wan7olcH+FTxEnJUIZmIMF3c1B9X5F+NiSOvBNYDudS5hptFhheGDthQ=
X-Received: by 2002:a05:6602:15c5:: with SMTP id
 f5mr2245918iow.53.1625201585165; 
 Thu, 01 Jul 2021 21:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210629094339.874120-1-fshao@chromium.org>
 <20210629094339.874120-2-fshao@chromium.org>
In-Reply-To: <20210629094339.874120-2-fshao@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 2 Jul 2021 12:52:54 +0800
Message-ID: <CA+Px+wVXREb73UfZgFJx7Ncy2+dtPO1fyM5wWxjF7gD1WnTQ4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: mt6360: Restore error message to regmap_read
 failure
To: Fei Shao <fshao@chromium.org>
Cc: lee.jones@linaro.org, Gene Chen <gene_chen@richtek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_215306_172764_7BCD5062 
X-CRM114-Status: UNSURE (   7.61  )
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

On Tue, Jun 29, 2021 at 5:44 PM Fei Shao <fshao@chromium.org> wrote:
> This adds back a missing error message for better log readability.

I have no preference for the patch.  When the regmap_read() fails,
mt6360 will fail to probe and return the errno anyway.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
