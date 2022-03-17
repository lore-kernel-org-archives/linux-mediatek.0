Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A2EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 19:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cb4LReF8prl5qz+1QTyry3rp2JOEHAXGXCZybGdhS8Q=; b=rv0t7QkvMPYtCs
	svGfD/cVG3cQ1WQVdMYddZ8QKBWjIoVFtVpvQj0HBeVuDpbLiZkPztjtQtBazzNun7EaUB1uNryPI
	tmP6fwjEjjdgc0RkI3s/MrzfHMrcTjJspUaER58VTKAzWUL6N8vwyBWj2xoyEwsBs9S7+Sx7BHoQg
	4DqILMAzzAAvK8jVHPWWx5lJS/LfOSM/Zj9yf9FxsCArjk5xZYVeDYZu9KvYMYY3bPtY9WbbRGgZR
	aVP6IoPvkF9y+4Ng1KUvulrXVHg8VnDQnOMxYSJgViO0a3zGcJYzXSDjZeiPphD25UGoxEhN4coNF
	2UQCJqoRqISU7KAnrEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUw5u-00HEEy-Ud; Thu, 17 Mar 2022 19:47:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUw5j-00HECl-3U; Thu, 17 Mar 2022 19:47:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABFAA618EE;
 Thu, 17 Mar 2022 19:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0947EC340E9;
 Thu, 17 Mar 2022 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647546442;
 bh=8O4xojYXJ2O3v1mIxSIElqegPelL1l70GLiAdhxHFp8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Rmu3sp6XO5V4kWS5PcgJND2BvL8Zt+ZoZ/h6/YTsa+Gsi0WP0VcCeafoeVI9xysMJ
 3Fk+E4MkYkXAwPq0/dqnpnJz2ZNW8d4H0fzj4VXImoNH7r6ooHGxGFooyXBlPvUCfl
 Cd9SbHehrGuLEkkeAtWreQ5kY+7NGagrsfsJ1MVdShXOeMvQ/Xnya4ULh0qo6GebZk
 zy/ZMWD3O9HXaGMeh2qJl6Id4LbsNkuL2gHE4tj9iaRJ3Gzgs2N0DhYDYmtKMRpPoV
 PRYoSS+vnkfhdghGIqbwqarAmP9hQSXKAe7AEsXXbgNKMfjsmHDtRIlDnDOAYjp09K
 T6rxMLrZvALmw==
MIME-Version: 1.0
In-Reply-To: <20220311114229.32504-3-chun-jie.chen@mediatek.com>
References: <20220311114229.32504-1-chun-jie.chen@mediatek.com>
 <20220311114229.32504-3-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v3 02/15] clk: mediatek: Add MT8186 mcusys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 17 Mar 2022 12:47:20 -0700
User-Agent: alot/0.10
Message-Id: <20220317194722.0947EC340E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_124723_202085_217592D8 
X-CRM114-Status: UNSURE (   9.92  )
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

Quoting Chun-Jie Chen (2022-03-11 03:42:16)
> diff --git a/drivers/clk/mediatek/clk-mt8186-mcu.c b/drivers/clk/mediatek/clk-mt8186-mcu.c
> new file mode 100644
> index 000000000000..6d82c5de16c1
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8186-mcu.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include "clk-mtk.h"
> +
> +#include <dt-bindings/clock/mt8186-clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>

Order should be

	<linux/*>
	<dt-bindings/*>

	"local.h"

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
