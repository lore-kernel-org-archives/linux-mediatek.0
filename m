Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A47C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 08:20:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C591611C6
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 08:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C591611C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PR//cLIXHSGXrnUvIAcnIEFJIJxvUxdWbBa5pMjC0JU=; b=bF9mQEA5Pak09O
	g9w7f+4hwKp082kfQev2GKW9neljRxHQxU1dhuORXcHf9lyoEEmtheHLOXOHxM0+cCfqf54Z1v1yw
	suDfglFOBxXUmow1LhQx37h/rPzgZ8CIkg6hymun4XInlH5f403QuTKWaqe8h3cch6/Vkg8E7IqwN
	1ARzzRsbtkTKWgPFWP8y1IU0hgM9tGQ5a1ydNgZsh7ys7XVoADqekhFvabYvbn6qWJxdZs63y4TBn
	IBvjavd2U+9kRx1+KxlkYMPcaJ60IrO6vrwsXRBP8VuIL/o2OOPOkpR9WXoZc3rI/DuQ9OVoJDF7S
	/mt0rOV4B6q9fex2+ZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md6pC-003ouy-RJ; Wed, 20 Oct 2021 08:19:50 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md6p9-003ouN-IP
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 08:19:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634717988; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=D8S5MhnZ3N4sT+BKpUxuYDuuO5Lje98JqXz+Bh6vAls=;
 b=RB/3xttP2Mq71cAOeJ5Yz/GcC6b5DRflwVxj8OEVt2f3yfxSVFBzPYG4nUw5bgl+jgGu4dhB
 BaJyHl4NEdzsp40g1mbC7DDVahqH7AU+ZOfW43NIpdS46gHRSZlVu0Qza5SG7TVZkMZUh5lx
 B3x5yFG4Pf5b3chrV8hInngMdKg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 616fd11cc75c436a30c63d9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 08:19:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2039EC43617; Wed, 20 Oct 2021 08:19:40 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 70DCAC4338F;
 Wed, 20 Oct 2021 08:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 70DCAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] MAINTAINERS: mt76: update MTK folks
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <eb888ae0e43a980c2c1aaed372a9b5e8098ea4ef.1634107511.git.ryder.lee@mediatek.com>
References: <eb888ae0e43a980c2c1aaed372a9b5e8098ea4ef.1634107511.git.ryder.lee@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, "Ryder Lee" <ryder.lee@mediatek.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163471797545.1743.4401895196553840749.kvalo@codeaurora.org>
Date: Wed, 20 Oct 2021 08:19:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_011948_475309_344BF14B 
X-CRM114-Status: UNSURE (   6.30  )
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

Ryder Lee <ryder.lee@mediatek.com> wrote:

> Add more MTK folks to actively maintain the wireless chipsets across
> segments. The work is becoming increasingly complicated and various
> and we can provides hardware related perspectives to offload 
> Felix's workload, especially for the 11ax and upcoming 11be devices
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Acked-by: Felix Fietkau <nbd@nbd.name>

Patch applied to wireless-drivers-next.git, thanks.

026e092c2aa9 MAINTAINERS: mt76: update MTK folks

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/eb888ae0e43a980c2c1aaed372a9b5e8098ea4ef.1634107511.git.ryder.lee@mediatek.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
