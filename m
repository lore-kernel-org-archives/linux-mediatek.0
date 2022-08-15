Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38792C00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 04:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pS/J563nsROKwWCcFt312kEX1dX32IScrFxHX9cd9mE=; b=EwsVGw7odYTiuBCVpOGgc562U4
	v1y44sSZrmgoHrjfvClFKuDdkXZ8bvwUJkLX++UpGpu8HnHA7AguxOv6JEPHSOBmB+lKk7vvybIBk
	q2soyqgvKaDUeY3AGGbPnyD2nfOuJAwBnCup6NGbKuVE7Q7GwNsnCARCkXtwu6clDp9S5K1A22D73
	3hr85xSKrW1Im2WZSX7G5/FIZEm2paVCJUL1BlBJaMAlIh1BsGFpHUXFWohEk8W8sxxFil548XzfC
	N/9RdkL5hGORevzBtpRsYqBEK3vwBnQJ1oWQeKbXwjMc9NlRID5NmIlqohn1x2Ee69hQl8z/RIfMW
	Wiim2P9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNRkj-00BDRA-FT; Mon, 15 Aug 2022 04:31:01 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNRkX-00BDLF-F6
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 04:30:51 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-32a17d3bba2so56992297b3.9
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Aug 2022 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=pS/J563nsROKwWCcFt312kEX1dX32IScrFxHX9cd9mE=;
        b=oDAqe7WvWsUaLZzZ1mQI9J/25o3q3Z/c7gFUwL40I9vndOqvwbHhqwUbtzmVQt6Auh
         bhaYRN2yJgjzDtgXnVu1JSLUi/lF+48CZPPhGu6cpq6tG03AbR2hdQ5blAbFVFmuQIrV
         EBpJM1qcpRfTpRoklUZeQtbfZrisGryTJspCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pS/J563nsROKwWCcFt312kEX1dX32IScrFxHX9cd9mE=;
        b=12Zil/bQTudJaiIlvsAJU5sR4DUkS6O8wQZ8J/4bYdrttPYgOpEFmbyByeEBp808VA
         aNM2hJnwkoPw/p6jvY3Bx+tbmEG6oslTS3HVLvUYr2jdJ8e9pBkJ7DhVXC1sISXaD44w
         dFA9uBPjyJ/yRd6SPFAnsm34dwvCiZUBdxDMCXTHfYJD4UluWfpAV7sod5pTxJNL+aTs
         2RwIlyTaE8kgCEpZhmGHDDm/4QOUcyxJhPFB/PofnHhJZjdvKfUBNeOr/u5g5m6w8No8
         SSEToR8uU1f1iYIL+1oWFNKUWgTMgVwauVlephVeoV1qSrX0mF+WQ4odFJp+vobn/kR9
         0YZA==
X-Gm-Message-State: ACgBeo0JZ8apvvGyfgGQrh4yYQYL9HaZQbJcoz8/gH2ZREcp+kvZiqAS
	RkaycvveXR16s3lUfmUQP/mJA5rR9Dw8QqhVPp1e+g==
X-Google-Smtp-Source: AA6agR6W/M9L7L4eD8jOBXjP/OWE0JpOBHM+bLbd7tMKbs8AZ+hlwifAEBSwzuC0AYJ2vsNzoqQwmlO3CeXXoICSoqg=
X-Received: by 2002:a81:7c54:0:b0:31f:61f9:f2fb with SMTP id
 x81-20020a817c54000000b0031f61f9f2fbmr11659697ywc.260.1660537844837; Sun, 14
 Aug 2022 21:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220815030740.28899-1-yongqiang.niu@mediatek.com>
In-Reply-To: <20220815030740.28899-1-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 15 Aug 2022 12:30:18 +0800
Message-ID: <CAJMQK-hfWM-o+MsA90PCqZyOxvXT1Tc6jrxSvgFPAqAkU9C4+Q@mail.gmail.com>
Subject: Re: [PATCH v1, 0/1] fix gce timeout issue
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_213049_927061_F4D2A6C0 
X-CRM114-Status: UNSURE (   9.32  )
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

On Mon, Aug 15, 2022 at 11:07 AM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> base linux v5.17-rc1
Can you base it on newer version?

>
> Yongqiang Niu (1):
>   mailbox: mtk-cmdq: fix gce timeout issue
>
>  drivers/mailbox/mtk-cmdq-mailbox.c | 57 ++++++++++++++++++++++++++----
>  1 file changed, 51 insertions(+), 6 deletions(-)
>
> --
> 2.25.1
>

