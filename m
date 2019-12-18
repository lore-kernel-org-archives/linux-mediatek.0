Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95356C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 18:52:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650152176D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 18:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4l/B9iE";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="CMhLBedD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 650152176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/lc5QjBBvGOTR+GbxM+4c6JaJlPVXWcKRxUq4osKV8=; b=M4l/B9iEbbINQ2
	MK7mGTScZa4gCLXO/ioD+akNrmjPrtqKCvDzqd5GmUdnwGi0VVr3DWbZLJolQDHYG1gA4xZLeq9O4
	8juULPX5f+ZyMim7uzsclBvUYeb06qJQARBubbJHGTIkBFlyQ1gGJD+L7uhGk0bC0Z7og7wrtJWIR
	LWnqL5Jmxa0Zx3D+C3H2cslifuNpHnzlr9/gscjBgtSwnxReT4aUgxIHCqI1eRWQioyvr4Sv5yBKY
	07+9e7j2tNp6aUJfJi9LsJvDLViRghXS8iJ4zp4pCuWG7UyceTdAqeJ3XHWuchV0GlvRQHxRvO+4K
	8JyaoDjvAXDEzoAhGz7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iheQR-0000t2-Ay; Wed, 18 Dec 2019 18:51:59 +0000
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iheQO-0000sg-7N
 for linux-mediatek@lists.infradead.org; Wed, 18 Dec 2019 18:51:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576695115; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=PVtbnDwUenhfbm4f2fSogQ42wTWIVeF28Wl2Ndp7ZAk=;
 b=CMhLBedDucwzdvX4H0cs4HX4TA5XHZjaUugScuoa+55g9ktK9eLevDLu79ZcKCT9Lr6HZ/p6
 gueLSc5YEnA4OMuM6EZJ9ZxiEWdCe8nQRgbIrqd9QL5yiUk1e1wmme6kkNGfksJfj+/cC35t
 Cx/JNSr/MFOk4XnlchQELw3arWw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa754a.7f0461220ce0-smtp-out-n03;
 Wed, 18 Dec 2019 18:51:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 95451C4479D; Wed, 18 Dec 2019 18:51:54 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 270E0C43383;
 Wed, 18 Dec 2019 18:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 270E0C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20191218185154.95451C4479D@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 18:51:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_105156_330210_FF0E3CFD 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-wireless@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The sband->bitrates[] array has "sband->n_bitrates" elements so this
> check needs to be >= instead of > or we could read beyond the end of the
> array.
> 
> These values come from when we call mt76_register_device():
> 
> 	ret = mt76_register_device(&dev->mt76, true, mt7603_rates,
> 				   ARRAY_SIZE(mt7603_rates));
> 
> Here sband->bitrates[] is mt7603_rates[] and ->n_bitrates is the
> ARRAY_SIZE()
> 
> Fixes: 5ce09c1a7907 ("mt76: track rx airtime for airtime fairness and survey")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers.git, thanks.

b43e36d75e87 mt76: Off by one in mt76_calc_rx_airtime()

-- 
https://patchwork.kernel.org/patch/11261391/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
