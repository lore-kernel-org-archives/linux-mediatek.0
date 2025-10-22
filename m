Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD60CCD195
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rU8H/rU2g3WfGccOFtwT7WjZ5YfIx7nNgO5laRekGY=; b=F6wsw3nPqiIf5HXa7dyIJSMXsL
	yWCYc67hE5j5JmVYbmg0qX7Ja7xdS0w/Sd5BeKbdBKUdi7bnmEOBFQC9hccLg/LpFExb9Fj8CkQ/A
	7jI0oQ0w6cNyTHy4wDI1cAIbbX/mu5ZEb3vc/1lexqyyNtAHvqYs57tcmrlOTIS2uzQOwtUqej/fx
	cyCqhKozvUPLBVnuRTuaBuXDzmzmpg+Mnvs4oVx7JF1bDaTkwSbsYcerUKYN5vSycoQZ2Qx5uSBrR
	sdXiz2vNwbVodFYr3TOW1aqaF5qWK5XDn06M2s9VNi37ihaUBiEbweK5+aur/l9/r7scCibPYWnzO
	irHId1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTIo-00000001tL3-2dFm;
	Wed, 22 Oct 2025 07:30:34 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTIm-00000001tJW-0QvD;
	Wed, 22 Oct 2025 07:30:32 +0000
Date: Wed, 22 Oct 2025 00:30:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: xion.wang@mediatek.com
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, huadian.liu@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/1] selinux: export current_sid API for use in other
 kernel modules
Message-ID: <aPiIGG1Zw5hJ2O3k@infradead.org>
References: <20251022072729.14820-1-xion.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022072729.14820-1-xion.wang@mediatek.com>
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

On Wed, Oct 22, 2025 at 03:27:17PM +0800, xion.wang@mediatek.com wrote:
> From: Xion Wang <xion.wang@mediatek.com>
> 
> We have a kernel driver designed to monitor the status of the Android
> userspace watchdog.

That module is not included in the patch series, making the export
directly unacceptable.


