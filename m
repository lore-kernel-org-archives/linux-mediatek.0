Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C46C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 12:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67519610FF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 12:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67519610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zptS6w2vO4Ap+rdhgsnwK0FmpwNlNrjdO/O2mS+HAVY=; b=Hl4q+IeqmntO5H
	jRP90uExLdoJqxOwOZ0YxUMzfd6DHJSrjzUZojnMLWM7LbQw8DsHMqcy0LymLoPjeji+8Fz6vIFv7
	Mx+NSHW2HdI54Q3UB+mYUIqvki0l3G0Xz24cqU85olD4jEN5cF+udz2UzRBIPkJu6K23P83Ogfol3
	L5/twxxr/Ix1OzgoD4qFttOs3Wf3TxdSNvPqpRFxgwCqSaG4QMQGGhZf8jtkBM8tzXWkYyXiNX/HW
	ds5oTsNFr9NMj/6BjaogphYBPn/f1WRAC905ecfQkbm3s/ix7YrLQH9SOytUZ/7Iz+tB9WWOl5+g0
	33yfVl2smpkY4schONJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mByWM-00CPSD-7E; Fri, 06 Aug 2021 12:00:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mByW9-00CPLM-N9; Fri, 06 Aug 2021 12:00:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 568EF61102;
 Fri,  6 Aug 2021 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628251201;
 bh=8CWEa5pug1TqjU/0+6MgZWQeHoGlugaUWEqNFqlUCL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RDSN6L+kPd4HfYFQhwnsZqxDGut6rHSipG3b2BU+aVZiPXU/OSzSP0jMtsp8oTe/V
 oA5ypb5sWtsk9GbVmMWG9AaUDsULpVWGmIrV+U8QCEn1fgTzzr9aH47vKrluUtsTg+
 W0zPEtZTT0TQL27yD/QOcV4ft7ivU85W5og+M2Mm0IQmSBGbGgtYIPYGtZhfWuSIl6
 d0ohNqLAJe6uNGlPoxlCFnqeAXUYqm7hHtHTp/XGBdOBmNBuFAH22Zq7BeKAN13u+1
 mhRM9Dba44N0Ih+zx/bwD4M3epNZP3FFvmAu3Mjpviuf5k1TVZmZ+bg+qXJjSIUnHo
 nKZOBZdLZemDw==
Date: Fri, 6 Aug 2021 17:29:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: mediatek: tphy: add support
 hardware version 3
Message-ID: <YQ0kO7ZWO3y0Xmne@matsya>
References: <1627028562-23584-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627028562-23584-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_050001_819175_C21BAA52 
X-CRM114-Status: UNSURE (   9.10  )
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

On 23-07-21, 16:22, Chunfeng Yun wrote:
> The PHYA architecture is updated, and doesn't support slew rate
> calibration anymore on 7nm or advanced process, add a new version
> number to support it.
> Due to the FreqMeter bank is not used but reserved, it's backward
> with v2 until now.
> For mt8195, no function changes when use generic v2 or v3 compatible,
> but prefer to use v3's compatible, it will not waste the time to
> calibrate the slew rate, and also correspond with hardware version.

Applied all, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
