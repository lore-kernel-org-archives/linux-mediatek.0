Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCE5C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtYEL+cNF7JBOxTUOl920ZwaVms6oMpqn+5use50Dtc=; b=VTF85Ld2gkVWJfqMYQ7zWaS67J
	b6vrqA9NxABS+1z1aOurg7JzKIT4Os8hQ+iLlujJqsJrb4Tg+i3SJL4DCnXezOdEWCMYxsnDDIurj
	MPHtWT+dVpHVGrsD5z1lGI+Jnpz5eGGlFW/ChsRcMnmKJDI+7b7N+ZuznyRhPWpeLIIhJ6dlRnM0V
	vJm6MPE/kS+F4VIVkt5kZiLothESoelUE1HQH8uXTddwwXZP5besW9DZa078Jci2n3W0NhoHiZG1f
	fj74N5Nmn7Ska90afCXrXvq0Kf0CUtXa0S7sk+9I/HNPk0BlVnHGcklQJykpsZjwVtbZtF+ZqisYI
	aHKssU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDZs-0095B9-0K;
	Wed, 17 May 2023 09:36:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDZp-0095AA-1E;
	Wed, 17 May 2023 09:36:09 +0000
Date: Wed, 17 May 2023 02:36:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Xiaoming Ding <xiaoming.ding@mediatek.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com,
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Subject: Re: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
Message-ID: <ZGSgCZrg+RjAbGO1@infradead.org>
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org>
 <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org>
 <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
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

On Wed, May 17, 2023 at 02:56:13PM +0530, Sumit Garg wrote:
> Do you mean a pinned user-space page can be paged out automatically?

No, pinned pages can't be paged out.

But a short term pin implies it will be release after a short delay,
and it is feasible for wait for the pin to go away.

For a long term pin waiting is not an option, and anyone wanting to
do something with the pinned page that requires it to not be pinned
must simply give up.

> Just FYI, the underlying use-case for TEE registered shared memory is
> that the references to pinned pages are provided to TEE implementation
> to operate upon. This can happen over multiple syscalls and we want
> the pinned pages to be always in RAM as otherwise the physical
> addresses may change if they are paged out in between.

That's a very use clear case for a long term pin.

