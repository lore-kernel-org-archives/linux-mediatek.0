Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B00C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWi6eFTIMwFJN8s5WClRqV7Vg9A5uvEJrjGOqj81A00=; b=dEeNRM/Ood43K/
	ncm/wHzL8KzS+211qlfRlMjhzFgj5Bl+eljnEEGqZca6/F1OFfxbK4MZ3FaO+GdIwEjZvAECq8+fN
	Lz/yKl3afvBEaEwXb3KOhfZHzVeTiKttfADPqAtk5OP1Ap/zAoms+0IQeZ3F4oe+4AHb2w/A/HdWd
	oNWAIOqhn3KRWIfwB0aVMks0sMsGIpoj28lC6eAhFtRaOHpIWegruslEwzvbo9/aha/4V4cLv+At4
	+ovd7v4bttRxLjQEHSKf5laV+q09+DLtPpm45pnDc3WYDgaUBYuDWThVsrCwiwkOQO+rmBu8+TNlR
	9VHcEU0zGB2L4244bVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4PS-009LSU-5O; Fri, 04 Mar 2022 09:39:38 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ47A-009FqL-Aw; Fri, 04 Mar 2022 09:20:46 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 25A449BF; Fri,  4 Mar 2022 10:20:38 +0100 (CET)
Date: Fri, 4 Mar 2022 10:20:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, libo.kang@mediatek.com, chengci.xu@mediatek.com
Subject: Re: [PATCH v5 00/34] MT8195 IOMMU SUPPORT
Message-ID: <YiHZ4lq2QClkdyxS@8bytes.org>
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <YhzBSsn/zUlGg5JE@8bytes.org>
 <7ba0ee87-c193-9834-d0b4-ff3e06ced82b@collabora.com>
 <5ed9278fa0b72b993512cff2316218ab88cafe50.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ed9278fa0b72b993512cff2316218ab88cafe50.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_012044_577684_051AB7B5 
X-CRM114-Status: GOOD (  10.95  )
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

On Tue, Mar 01, 2022 at 03:49:18PM +0800, Yong Wu wrote:
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=592275

Okay, thanks for the clarification. So I can't include linux-next in my
tree, so I think the best option is to wait until v5.18-rc1 (or rather
-rc3, which is where I start merging new stuff) is out and merge it
then.
Another option would be if there is a branch which only contains the
dependencies of this patch-set, which I could pull into my tree, but it
is already pretty late in the cycle.
So please re-send when the next -rc1 is out and I will pick it up then.

Regards,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
