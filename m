Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E7AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8trsCe3S4HlQf/KVNS6DsavEOHYUBXbbFu4+n/Migw=; b=SmQcZGR9cXWiBR
	Eb/SCcjZ1lvUlkrr35J6TaqrmqrtqiyJ12pOWPTbhW1DQWt6W8aDnOvs4/b56cSBcYYRgn65o/tPR
	sBAyTxBoOL6qGuhbYLalCFI73jihTOkre6vPwwXJhlYKu2thRUnaB4KTLfn0wa+h79CMPM4LlAgjL
	sj/VqGwaTOjqexhz0nq4waVF3utNS8Mo366RKPb5D104imgVBbzE+k5Q3rziahN//9rdYD0EyDRi1
	c+8NsLlxAyeRtnViXtcelGGmX4w/cESDxhXvlQJuyXZoRK+I+P0O3Rg+ODf2D0/rvpxMN8aSnwXyW
	nY1VOVHf1uFjH5bP1UGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na45c-003w67-1w; Thu, 31 Mar 2022 23:20:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na45Z-003w5T-VF; Thu, 31 Mar 2022 23:20:27 +0000
X-UUID: ccdbb246a37148b19b736494399e2d20-20220331
X-UUID: ccdbb246a37148b19b736494399e2d20-20220331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1565761099; Thu, 31 Mar 2022 16:20:20 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 16:20:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 07:20:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Apr 2022 07:20:17 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <jitao.shi@mediatek.com>,
 <lee.jones@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <matthias.bgg@gmail.com>,
 <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>, 
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5,
 1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,
 pwm-disp.yaml format
Date: Fri, 1 Apr 2022 07:20:17 +0800
Message-ID: <20220331232017.8829-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1648730873-18505-2-git-send-email-xinlei.lee@mediatek.com>
References: <1648730873-18505-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_162026_049415_FC933238 
X-CRM114-Status: UNSURE (   5.70  )
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

> Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as suggested by maintainer
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
