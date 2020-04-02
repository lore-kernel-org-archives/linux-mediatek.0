Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE38C43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 21:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2E920737
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 21:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jajCcCiV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmpu/9Ec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2E920737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTq6/ka225xvCGhynr6jLsfy93rzchdN1yymxId7+XI=; b=jajCcCiV5nfyqW
	zooXwRg6rIK6AdKs7JyrCW85BpGBOpknKDkgdWLkrB0TrrVV4+uCqS9dGLuYzHXvjgdcu9V1vfZPt
	OoPv2TOsW18Nl4Gw6CWaI4m+oGQJ7wMGmyQkXNwB4NCvmI01UrQud3mf0IA7LR6PfNhSeCVaTswIw
	9KMtJCg0YXWsNNKCzn2w+bLNd87DCRQBNiRdi/NRhumyxjAwP56+I1kZmuQwdnTQmakC/zlSUeb7M
	tlFp39KpKlx6SLsBnEUZS7q0Y9/KfdYAHoUS8Co3ypqf6c8veogTccn2gvJ/CdGQrN06yCZWX3XyM
	lPwV8U3oMaa5hh/As83A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK7mx-0007u9-SW; Thu, 02 Apr 2020 21:54:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK7mv-0007to-Mc
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 21:54:14 +0000
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FD062080C
 for <linux-mediatek@lists.infradead.org>; Thu,  2 Apr 2020 21:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585864453;
 bh=ifZbGHnq4XSFKpzGjErqKmzIRZfeEHpwbTI1v1xsxf8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qmpu/9EcW2cQevdKXSa7Ez4jHJr0TIo//kHLzYP6SV25MJfyrkS7O6fl2TPIjazFh
 f8sYJ8f2mdDdYaG/9T4D+qWHaW7gZZ4SSFq+f4UITLTDGX9pvDxnxtCST1kc36YYNq
 wJJ3TBj6qnfmXf3waZJFp+T/jM9P9XAosTjMsOGc=
Received: by mail-il1-f176.google.com with SMTP id r5so5247698ilq.6
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2020 14:54:13 -0700 (PDT)
X-Gm-Message-State: AGi0PubWefH9CChSTOLR0HgRwNus+PX5Yt0peNqPhEeew6/5nX4tO1dm
 p0oQpWRfUkhtur8wPGbNVLnRh5eRvOAsOE5Tyeg=
X-Google-Smtp-Source: APiQypJqE9xAhP2+8cfncIZAPL7MQ3zdxRtHZdA2NaPrRmu/HgB7ZEkrDqNoDL7OcnBWFZSfK8t/QbnQ5WvflzZ9IAE=
X-Received: by 2002:a92:8183:: with SMTP id q3mr5520322ilk.43.1585864452700;
 Thu, 02 Apr 2020 14:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
 <1585128694-13881-3-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1585128694-13881-3-git-send-email-hanks.chen@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 2 Apr 2020 14:54:02 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoULALLvO+x2TnO=K=pSD05bJFowB-usAcrpz0ddEN+Ug@mail.gmail.com>
Message-ID: <CAGp9LzoULALLvO+x2TnO=K=pSD05bJFowB-usAcrpz0ddEN+Ug@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] pinctrl: mediatek: update pinmux definitions for
 mt6779
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_145413_762792_4D39B771 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Hanks

Just a few nitpicks and then Acked-by: Sean Wang <sean.wang@kernel.org>

On Wed, Mar 25, 2020 at 2:31 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt6779-pinfunc.h | 1242 ++++++++++++++++++++++++++
>  1 file changed, 1242 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
>
> diff --git a/include/dt-bindings/pinctrl/mt6779-pinfunc.h b/include/dt-bindings/pinctrl/mt6779-pinfunc.h
> new file mode 100644
> index 0000000..4698d2f
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt6779-pinfunc.h
> @@ -0,0 +1,1242 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + * Author: Andy Teng <andy.teng@mediatek.com>
> + *
> + */
> +
> +#ifndef __MT6779_PINFUNC_H
> +#define __MT6779_PINFUNC_H
> +
> +#include "mt65xx.h"

Use the standard include path instead:  #include <dt-bindings/pinctrl/mt65xx.h>

> +
<snip>
> +
> +#define PINMUX_GPIO209__FUNC_GPIO209 (MTK_PIN_NO(209) | 0)
> +
> +#endif /* __MT6779-PINFUNC_H */
                   __MT6779_PINFUNC_H
> --
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
