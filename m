Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B0CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMFP0Qh0UNXei9PjTaXEfX0hjLkcSnnELk7yPU6xj80=; b=i8K8IKIjVX/HzMuDpIVdN+mOCn
	Pt5+fOIRVSDt5Qs+MWJ4PM7rlDCGp4bCd1W4euMtuS5SLWJJU8Vj8LfCSIEpkL0e8GxaFU39cxSh7
	+42Vmu/mvv5KT/e3BRNK0JONCipwmdUo1pBWM9KNbPv3M9ZgIxaiIZTzkrn/Gt4uF9GlS5cCz+f0b
	v1Hkptf7D8L2kZrEwPf0hgXvJwlPgNt4U7WZckif2EmVwqy/Gd9QzMVdbd1mF8uthxA/2GJbN7CXD
	YuKJyssx/KqUX31dcKcARmXK6Jxd/hmj2rMz/F5dTI3lEoXuHpSVCdsGt9KrS0RKUY1hXEHCo+Kq0
	ydMkdGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5knA-008SNT-DR; Thu, 15 Dec 2022 09:44:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5kmx-008SE8-WF; Thu, 15 Dec 2022 09:44:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B09161D2A;
	Thu, 15 Dec 2022 09:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DB6C433EF;
	Thu, 15 Dec 2022 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671097465;
	bh=MMFP0Qh0UNXei9PjTaXEfX0hjLkcSnnELk7yPU6xj80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2MRkv18dLS+pz4h2ZcqRd7gbL4s3Qq2E/6onXSNqcEvIfbywVQlo1BrI/FyJToqp
	 /AsYkGFblxSLiYBTmeHrLrGLWozT7UNCPRB2/f+yRqgQm8m+Ke1k0gE8ZKuDCkCEQ2
	 tSUEoMghBAhRWTPVm60CkcJJDyxGELe+n5o1t9As=
Date: Thu, 15 Dec 2022 10:44:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: cy_huang <u0084500@gmail.com>
Cc: linux@roeck-us.net, heikki.krogerus@linux.intel.com,
	matthias.bgg@gmail.com, tommyyl.chen@mediatek.com,
	macpaul.lin@mediatek.com, gene_chen@richtek.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ChiYuan Huang <cy_huang@richtek.com>, stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Fix altmode re-registration causes
 sysfs create fail
Message-ID: <Y5rsdo/SGHJM4UKG@kroah.com>
References: <1671096096-20307-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1671096096-20307-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_014428_109345_D67397A3 
X-CRM114-Status: UNSURE (   8.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 15, 2022 at 05:21:36PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>

Why not send directly from this address so we can validate that this is
the correct email address of yours?

thanks,

greg k-h

