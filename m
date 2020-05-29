Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1F1C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 04:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F4E920DD4
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 04:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z6yunYUC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksbLVNLE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F4E920DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myvT/tuGudy/btqYtzk67OmT1mxwO68bWSjcjWm+Mn4=; b=Z6yunYUCnUfgUM
	YMw4+EozvsKcQ04Be+NETrpdHVX3Tue1UXMYn86jZmg0+0fHVxyaXYsNAg8TTn+J7nxwimMvwDiev
	YooIC6S+FROV2SbW9CtAgSA71pgqAy1EZs6u8POEZCkf5tH85tihIo/YngTiMML3AYVQIflzuBc6i
	E+ofxYe5cFXhdSLwwbHo1reICsGf6rdzVer6yAU5hMon2Xh87s4TRN657vSHg2/MxOBsuRGFqU+/i
	/qPWnlC61WsBLj6bL6n1kVoQeM+umZRBV/QnfRdvaIegc51GGVh6mmf1igqRcKUaUce+wwo9x+iDH
	Daj6d51tmuwZsH+3GYXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeWZP-0001uW-Ue; Fri, 29 May 2020 04:24:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeWYq-0001MX-8Y; Fri, 29 May 2020 04:24:01 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 960102074D;
 Fri, 29 May 2020 04:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590726239;
 bh=fJMyAl90qtFQJpgC49iDk/YkbDfDSFgdM5htLAH8L0s=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ksbLVNLEgCpEH4uFaHGIKAFFB+HOJsWwn1by0Peh3uoQOTidhMUe+3sasmLqXxsiN
 +O1T9rzRkq12T+H0WOuH3DoDJEF2CpWKUGNAjO6bYhAdDlkLQDHExm1ArsLQL7FXAB
 5WDS9jqPpUPb/75I5UEQeqOy4/5OOzWZt9DzF1b0=
MIME-Version: 1.0
In-Reply-To: <1582278742-1626-4-git-send-email-macpaul.lin@mediatek.com>
References: <1582278742-1626-1-git-send-email-macpaul.lin@mediatek.com>
 <1582278742-1626-4-git-send-email-macpaul.lin@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: clock: mediatek: document clk bindings
 vcodecsys for Mediatek MT6765 SoC
From: Stephen Boyd <sboyd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Fabien Parent <fparent@baylibre.com>, Joerg Roedel <jroedel@suse.de>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Owen Chen <owen.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
 Shawn Guo <shawnguo@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>
Date: Thu, 28 May 2020 21:23:58 -0700
Message-ID: <159072623892.69627.13469443589395570717@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_212400_403689_60FE4492 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Macpaul Lin (2020-02-21 01:52:20)
> This patch adds the binding documentation for vcodecsys.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
