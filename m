Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BAEC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zdU6Pup90orzodnii2pfvWwiyo6yIYxYb3Eq3AbB44=; b=YLohtDIR3y1s12
	FRLe4uv7hDKzyW4SCnQbCeLyUWUdtitp+t0cVYRWv/se/+3Y2PndRpTzjqiNuGw0y4sM1NNXT7dAL
	MOlNdcbx10E++Spn4BdlHNGrXPV7Dcm1YIk2BxCHnbbWzqR2rjxaCyYVx4z1V/0HP6NxA7va2fsYr
	T674/3uEP//tRV+d8WPFAU42mN1MeVIG/orDlHwNJp32ARke5ZmS8gaoW8WJAOwk24u9zGBfAH6pR
	/rGjuQpjQoP6ZCdu3ikI5R0EfNB1FO7oafVJbowNm18xu8IomexctXWznbIcVq6qBXFgMy+f6xBQc
	kuKsV3G7uEJqOCwLlErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXXDU-000bSO-Sn; Thu, 24 Mar 2022 23:50:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXXDH-000bPH-An; Thu, 24 Mar 2022 23:49:59 +0000
X-UUID: e6080b5e212f49f38188c4565052c13f-20220324
X-UUID: e6080b5e212f49f38188c4565052c13f-20220324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1343338609; Thu, 24 Mar 2022 16:49:44 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 16:48:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Mar 2022 07:48:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Mar 2022 07:48:43 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <devicetree@vger.kernel.org>,
 <jitao.shi@mediatek.com>, <lee.jones@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4,
 1/6] dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,
 pwm-disp.yaml format
Date: Fri, 25 Mar 2022 07:48:43 +0800
Message-ID: <20220324234843.20641-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1648101804-3584-2-git-send-email-xinlei.lee@mediatek.com>
References: <1648101804-3584-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_164955_395687_7A3FF3F3 
X-CRM114-Status: GOOD (  12.43  )
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

> Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as suggested by maintainer
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pwm/mediatek,pwm-disp.yaml       | 65 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 -------------
>  2 files changed, 65 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> new file mode 100644
> index 000000000000..f844695d605a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek DISP_PWM Controller Device Tree Bindings

s/Mediatek/MediaTek/

Thanks,
Miles
> +
> +maintainers:
> +  - Jitao Shi <jitao.shi@mediatek.com>
> +  - Xinlei Lee <xinlei.lee@mediatek.com>
> +
> +allOf:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
