Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB9DC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:40:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3DBD61184
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3DBD61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FZ2xuyhzTqEUK2H3y81c0tWNuAorv7+xpTAFcyZawt4=; b=TIQcA3fsWw/ta+7+Z4JKHdca1X
	dqDw73l4mkWAfMgxFKmszLJQoSv3XNhVqootD6Hg98Ix7/rvk8VTh+jr56hEck9+S4xBY08mbh0HD
	ZvDfbdaPgfzJ3VoUbC1BcTwQPqquURZGjHr56JtbTlWIwVY7TQuNbW1hPgtOpyjDeixFQUREdJg/L
	X1chZgUvzqDvSdoE0dKRH5r4xJFA9nD0GxIuUtTcbjF2PzlSFUB0iiiTZuILkzhHooUpQjs0VKAsW
	9bRLidb1HM6l5kdVdCMjWYBnZQbXwDRs7HxdHsJvsvInvGsRAMsaiTRALtSJ2k68icdThuUHtITKI
	PvtrRl/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPdQ-002REz-JZ; Fri, 16 Apr 2021 14:39:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPdA-002R9H-Qy; Fri, 16 Apr 2021 14:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:List-Id:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:In-Reply-To:References;
 bh=ZCdZrlyVwQxuiKkvxt5vv5UGjQXSjY78bJlAi4Q2CXQ=; b=JNfQtRVRkOtMmVoGw0ofSAQFwI
 clUitFhmAWAF370sj3/PFghSLyIV2ezt6RpzykqBPt8G/7o0F5mtWaQN+Nfj/fNnCZOlTjnCAE8lr
 t+CbEr6ncbLP7BHto5QQqt05fvyLOAzUH+PNrpEK16HLn9qCytnhvCbrrtd20hf0+UDyDJnOP83A4
 1QvfiiPwRutybvEqUZhoor8wmdX6+sFeFMWXsSwtJZ5SP/iX+1WVfh/2mWH2plaBYOwnYJ1HUj+aC
 FB4m6Q0OcDSaamo9rmtxhAPq0i3RaO8Yun9GONM1UtC7KOoQwdu8O9qMImtk7r15t4RcG+beKaPaL
 F8wSppNg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPd8-009SbE-EN; Fri, 16 Apr 2021 14:39:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF653611C2;
 Fri, 16 Apr 2021 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618583973;
 bh=OvwYzUWAq+F6jUu3zv85BIbsufle24EDLBJL80W5lv8=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=rDuhQhn1WfFYm3ASpVlGtSjJhme8acFo2yTImNM6LHGiDPwj2Jsgeg0En2xFloRIs
 nAsNePIbMFbF++dtP5ZbtA/NCcDdYXHk4oA406PpUXs4rCJ8DzHVROaz3rOu6mkbyR
 yir5Vm207OuErJOpebB8k8/d96GjsRN/Eb+nPyDARDFjNOoeQQ5AhiB8gWY5pJKZRT
 P1kbzSk8vN9Zrq9mYtC9KPasgm5yDieNDnrNjGIK7vJh7XG+5wqh0ej5IIDBPvCESu
 0uILVxuhlVXT/eJP6ClpHtolhnOkwzK4JSrk/rpbWDc2XexJl7lVkR25JJc2bqb//1
 xSWwvj2pn/EvA==
From: matthias.bgg@kernel.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dts: mediatek: fixes for v5.13
Date: Fri, 16 Apr 2021 16:39:21 +0200
Message-Id: <20210416143923.23406-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_073934_523028_A2DECF12 
X-CRM114-Status: UNSURE (   8.37  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Hi Olof and Arnd,

Here come two smaller fixes for dtbs_check. I realized that we have tons
of warnings, so I'll try to get rid of them over time, but it will be a
longer run :)

Please have a look.
Regards,
Matthias



Matthias Brugger (2):
  arm64: dts: mt8183-pumpkin: fix dtbs_check warning
  arm64: dts: mt8183: fix dtbs_check warning

 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi        | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
