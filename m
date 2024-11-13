Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C26D41C0D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2024 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usZdrUe9l5lRUfaFRoa5yLjiKiQu5Kr5WtMNelD/sSY=; b=jec4WHYhlGgMX3jJdy8iLS4hrO
	/HDDWMpV/OIb6GtLJ24AuTvmga394KpLusj7L+1rIhUDsuSQ+0PV2uMFivVONjioL6xU12SwcTBYH
	WeKn2YiDEDnMUMGC0hWRqSdZURWh4qUyGe9iVaLdzWZp+viRBoZwFhoOV+OP2lwBlzA5QlHuBqdLl
	PgSK4Re8uGqB9ViqRgKFj3MAPRNq8P2VbqxBhgEygKr2cToWtEVPJdLniLI57n7bA90515jdHYGIz
	nwhtELSbmjpCA+HG+9aB/KnzCUTqdw845Xo5fNh7BHUv3GOzEWgeeHs06o32wftZKDk3NBs0imhb+
	keCxy6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7UV-00000005xaA-0LRE;
	Wed, 13 Nov 2024 07:08:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7Sg-00000005xTH-3SMr;
	Wed, 13 Nov 2024 07:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDA855C107D;
	Wed, 13 Nov 2024 07:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699BFC4CECD;
	Wed, 13 Nov 2024 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1731481605;
	bh=M5qxvfjeX8zm3X4cnPusqZs4KtLcO+3neliyehKO66o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dQY03K/a5ff4CVtAJY4jZ2nFifaVnecEcbnac7qZpUq/arw0+yhJKRk33TnhALB2q
	 xww3Gpgy4fWJ0UlorAx1gjLm/QNetaiySqGjN7JBAIPZNdury1Bjd++S74Jo1OUksp
	 Z8QQCpKaB889fkknSLWZ/+PbJZfTR9VicESk9wwE=
Date: Tue, 12 Nov 2024 23:06:44 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, Kent Overstreet <kent.overstreet@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <catalin.marinas@arm.com>, Casper Li
 <casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>, Elena Yu <elena.yu@mediatek.com>,
 <wsd_upstream@mediatek.com>
Subject: Re: [PATCH] sched/task_stack: Fix object_is_on_stack() for KASAN
 tagged pointers
Message-Id: <20241112230644.cfe24aa5e863112de04b16c0@linux-foundation.org>
In-Reply-To: <20241113042544.19095-1-qun-wei.lin@mediatek.com>
References: <20241113042544.19095-1-qun-wei.lin@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_230646_938473_1310421E 
X-CRM114-Status: GOOD (  10.90  )
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

On Wed, 13 Nov 2024 12:25:43 +0800 Qun-Wei Lin <qun-wei.lin@mediatek.com> wrote:

> When CONFIG_KASAN_SW_TAGS and CONFIG_KASAN_STACK are enabled, the
> object_is_on_stack() function may produce incorrect results due to the
> presence of tags in the obj pointer, while the stack pointer does not
> have tags. This discrepancy can lead to incorrect stack object detection
> and subsequently trigger warnings if CONFIG_DEBUG_OBJECTS is also
> enabled.
> 
> Example of the warning:

Thanks.

Are we able to identify when this started happening?  ie, a suitable
Fixes: taret?


