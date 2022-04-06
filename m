Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Jsv4omvkji9Uoz+6v3QIyqrwm0A56LrHCPWZ2gN8Qs=; b=FmyotUulKocplv
	AgXVukRpRtGycPWz2Tfz5k/GzA17AClOdBnin7RL75myuTNI7hB+NZXt/+jsqN0NUNIu5SDjJU1Y6
	h+P8fnBhz8DrdCEwzLm6YgpZIBxUKWeQs2M9BUDEK6R1cHf7hOOVXXuMP/Q+dL3SdzfPvGkXadPOR
	WFv3wPq9mQOXSWQk4WhFa360xVGy6YSTsv4D7O/X5Y6ncwpK+7uJdp4zFR5Gf0OSqPD8KKhNCU0en
	lE+2IaEMtGZVU/6AD80onsSgJA+I8drtYZSNsM1wLLRCOSF5R+agX5vvbcgZYiT51f/XJBsCuwCu1
	IsMMhR3ajct2nvgAVF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3HL-005Ypm-6G; Wed, 06 Apr 2022 10:52:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3Ek-005XGY-WF; Wed, 06 Apr 2022 10:50:08 +0000
X-UUID: 2eafadfe573a4014aea9ebe49ee38133-20220406
X-UUID: 2eafadfe573a4014aea9ebe49ee38133-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 882004864; Wed, 06 Apr 2022 03:50:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 03:50:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 6 Apr 2022 18:49:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 18:49:59 +0800
Message-ID: <42e890bef5927f2c4854c146f9bab2f974b64a48.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <yongqiang.niu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 6 Apr 2022 18:49:59 +0800
In-Reply-To: <19a1af29-19a7-a546-b565-a2cc973a7f28@collabora.com>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
 <19a1af29-19a7-a546-b565-a2cc973a7f28@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_035007_160523_07711DAE 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, 2022-04-06 at 12:38 +0200, AngeloGioacchino Del Regno wrote:
> Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> > The driver data of MT8183 and MT8173 are different.
> > The value of has_gamma for MT8173 is true while the value of MT8183
> > is
> > false. Therefore, the compatible of disp_aal for MT8183 is not
> > suitable
> > for the compatible for MT8173.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Hello!
> Yes, I definitely agree with this change, it makes no sense to have
> both
> 8173 and 8183 compatibles for 8183 (and similar).
> 
> Though, please, add a note in this commit message advertising that
> the
> mistake was only in the yaml binding, as the driver doesn't require
> any
> functional changes, so that things are clear for people with less
> expertise
> on MediaTek platforms.
> 
> After that:
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Hello Angelo,

Thanks for your review.
I will add them to the commit message in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
