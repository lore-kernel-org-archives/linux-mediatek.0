Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 03:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjDz7wTMsLujhd+/qE1m/+tarEvxhbBUoXsax0vRJW8=; b=lgj3zEEHV2+xQI
	ybXohDRlqNfi7lwjzxE/md12jcKbsVbP398JTzaPhxj8EW8nAujpriQbK/fvbOfndUq/qDsERlcco
	gNZ9tixGRq1E/vu9bj5UjUs8x9fnc4GnU63s2GyRYEueZvAIbsLrAn/2pS4CpCimqPkW1YvTRZOb5
	xZn5qLPEDckAywQ/LfYzX3XNOSYTS6J/27rX2B5zfZOtV/UnLNBfJfQysnWtXI53DL0FccchCsyDT
	VCmLUsXGV6iwaEa/IheGe5PgRd4szu5y3w4MIgP40KBHg8FfdS80CvAUbX4WuCJpK/tiR2CqRI9qp
	IAlaU9Am8IgMtd7OLP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJReR-00D42k-Ko; Mon, 14 Feb 2022 03:03:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJReE-00D3yb-Rt; Mon, 14 Feb 2022 03:03:32 +0000
X-UUID: 27784ec140574427bb5f887c16de3c28-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aJI9bcms5j915pzLWLQnAotHYJE/CHvsaEyDUpQ6VeE=; 
 b=dyQ/COg6sYHjWTWyLU+Mt4Z5jeF8VJBPv9lUdbVzItSlYvVTkUrBbfQzcVQz26auqeHjNmsjlzcIt+fyaqvsykEZrWMxs9id3Qmrynzd6r1vPqtGynKeVxQii+s9iZDWIcp5hgmVTpjyrqg0R8sRo0EuAgGpxx487jLGBWpjTXg=;
X-UUID: 27784ec140574427bb5f887c16de3c28-20220213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1214567631; Sun, 13 Feb 2022 20:03:27 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 19:03:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 11:03:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 11:03:10 +0800
Message-ID: <36bbe3d34f9d9871eee821fe46ed335402091d56.camel@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8186: add pinctrl file
 and binding document
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Sean Wang
 <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 14 Feb 2022 11:03:10 +0800
In-Reply-To: <CACRpkdbNef4MH2UFOC6wvCFB4jUV6Qmar6H2Dqq9GYfmGtfkPA@mail.gmail.com>
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
 <20220210062122.23974-2-guodong.liu@mediatek.com>
 <CACRpkdbNef4MH2UFOC6wvCFB4jUV6Qmar6H2Dqq9GYfmGtfkPA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_190330_929635_00F69C2D 
X-CRM114-Status: GOOD (  10.85  )
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

-----Original Message-----
From: Linus Walleij <linus.walleij@linaro.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <
matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Sean Wang <
sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, 
devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8186: add pinctrl
file and binding document
Date: Fri, 11 Feb 2022 01:10:54 +0100

On Thu, Feb 10, 2022 at 7:21 AM Guodong Liu <guodong.liu@mediatek.com>
wrote:
> 
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

I see complaints from Rob's robot so please address these
or explain why they appear.

Yours,
Linus Walleij

Hi Linus

We will update it for next version.

Thanks
Guodong
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
