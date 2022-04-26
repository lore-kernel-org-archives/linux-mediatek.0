Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DEBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 23:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJR6t0EG7kEbVx2d84foxNX9gpeZLmhS/V/p5r/2uT0=; b=pkQXJWM+1SUEkf
	LLTEp9jOoizVy9e71xP4R8oPkFjQ0saZGUkcVRg4YjLF19lfvmHZXmTb5tezXHlZ9Y/vpsQjuuCGs
	q7HbBkwxhi3girmMw3QT9hTVMRoqPdp+eXgvPRR1awuoWURju1NxiaLnJlHWN8hzDTg+BqiO2WUH+
	WenR7ded7yhOfVI/1VfpaE5rVx5Nm9WeziELbVJYsDrH0+fa0lP+yY1P5lA4qpsPOlfW13XOy6YeC
	DtVu4fD4Ypgs2RCsOWWMnP5yyMw6T9dPRuvs1I82tYqbdM/6rOhZ2z5yaymRAPcs8AUjKIWa5lmB8
	DEuFRuOCrgauL3WgtUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njUB9-00Gb54-4D; Tue, 26 Apr 2022 23:01:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njUB3-00GatX-O3; Tue, 26 Apr 2022 23:01:05 +0000
X-UUID: a89d0521ab6147c1811020f66e4909b7-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f13594c7-79ff-4add-b9e6-2e10038ae5cc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e16693c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a89d0521ab6147c1811020f66e4909b7-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1853065182; Tue, 26 Apr 2022 16:00:53 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 16:00:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 07:00:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 07:00:48 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <allen-kh.cheng@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <hsinyi@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: Add Mediatek SoC MT8186 dts and
 evaluation board and Makefile
Date: Wed, 27 Apr 2022 07:00:48 +0800
Message-ID: <20220426230048.20685-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220426125046.17311-3-allen-kh.cheng@mediatek.com>
References: <20220426125046.17311-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_160104_150767_58593A23 
X-CRM114-Status: GOOD (  12.05  )
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

Hi Allen, 

> Add basic chip support for Mediatek MT8186.

s/Mediatek/MediaTek/

> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

...snip...

> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

I think we should use GPL-2.0-only OR BSD-2-Clause for newly added dts files.
i.e.,
// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause

> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + */
> +/dts-v1/;
> +#include "mt8186.dtsi"
> +
> +/ {


..snip...

> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> new file mode 100644
> index 000000000000..e8d8867412e3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -0,0 +1,932 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

I think we should use GPL-2.0-only OR BSD-2-Clause for newly added dts files.
i.e.,
// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause

> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + * Author: Allen-KH Cheng <allenn-kh.cheng@mediatek.com>
> + */
> +/dts-v1/;
>


thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
