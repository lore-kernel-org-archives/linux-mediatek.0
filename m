Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D971C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 03:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uF0xST/nsOrMeUltIQE1rjfZvclfKyTALOMJNHcdGFI=; b=b3QV9G5uErGGqp
	RRTB7so37H2XiPPG/rUm26a1Ue6leT3FgJ0vYrzBU9hWHsTjTg+X7ixNmMUEExRiXIw8g+uIQCyII
	GU+YHdPIWy4RHzqSmqfJs3ucQdl/W3FYq9bdGCX4KHOTN5iki1nfVpxdwTjHwWlVfaqeYcTge72IS
	wOTQg91/yUIAuSHiv0A7HH04HdhQDbk/qnqOfnbGt3wxR+r1lFLNy/nokyLuXbVTnR+/hlxZP2m0a
	bEswZWr6Cit5NhY3Lic9SXRZ9M97FJdK7NIPDLdtBUPVqKLM2dD1859dAQoz1hrNT4l8A5o6pYlPB
	iHBXRf8gNQcPXKkOyGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIN19-005gy0-Sz; Fri, 11 Feb 2022 03:54:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIMxC-005ejw-LN; Fri, 11 Feb 2022 03:50:40 +0000
X-UUID: b1852fa00f7a47e0be8dc272593230fe-20220210
X-UUID: b1852fa00f7a47e0be8dc272593230fe-20220210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2131570300; Thu, 10 Feb 2022 20:50:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 19:50:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 11 Feb 2022 11:50:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 11:50:30 +0800
Message-ID: <053d70915fe6f2a8b3848fb0e83a3113d156d875.camel@mediatek.com>
Subject: Re: [V11, PATCH 03/19] soc: mediatek: add header for mediatek SIP
 interface
From: Dawei Chien <dawei.chien@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>, James
 Liao <jamesjj.liao@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
Date: Fri, 11 Feb 2022 11:50:30 +0800
In-Reply-To: <21030007-f135-58ee-ecfb-8ee0fcfdf155@collabora.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-4-dawei.chien@mediatek.com>
 <21030007-f135-58ee-ecfb-8ee0fcfdf155@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_195038_729260_1AAF4823 
X-CRM114-Status: GOOD (  11.92  )
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

On Thu, 2022-02-03 at 16:14 +0100, AngeloGioacchino Del Regno wrote:
> Il 12/08/21 10:58, Dawei Chien ha scritto:
> > From: Henry Chen <henryc.chen@mediatek.com>
> > 
> > Add a header to collect SIPs and add one SIP call to initialize
> > power
> > management hardware for the SIP interface defined to access the SPM
> > handling vcore voltage and ddr rate changes on mt8183 (and most
> > likely
> > later socs).
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > Signed-off-by: Arvin Wang <arvin.wang@mediatek.com>
> 
> Please sign-off this and all the other patches that you send.

Thank you for your review, I would sign-off all the others patches on
next version.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
