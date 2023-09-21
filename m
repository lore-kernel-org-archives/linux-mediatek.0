Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B540EE706FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99tYXj4KuX05E3vE2BknbECD3ZEYvzaWZ5XAwPrGRgg=; b=UQD29N+aHAHMGtImuTSxmMz/1J
	+UCwj5IcZStHuWtvJN3NrH5VedBMsUfGR9MlhUqncwkJ3Fhu71Yu0aSHa60GsFTeuOWs2EC382Nss
	UIrqRKYtyDYqcwPAjFZ13HqpYiEvofYHBVSOkqtiu0d3TsvA/KLqJQ5y0AjZSKnJEf6Q2yoFbOkat
	7bWQ7DjdrDTVXKmjXVle6frfvdqu9gz2WMlCr9wxtkJgUGZfiq1sSneaI1D3hVIog/G3sOg/Acdli
	d6vJpnnIuyjDLb91IDqsN/TdxzbQMExILq39xqLFd+qQXlUWxFwNPkOVr+HYJb8AnZWg7qc2hqV6J
	fW7ztrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjG3u-005bRt-20;
	Thu, 21 Sep 2023 09:33:30 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjG3r-005bQH-1C;
	Thu, 21 Sep 2023 09:33:28 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rrqvj0M5wz4xPc;
	Thu, 21 Sep 2023 19:33:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: alsa-devel@alsa-project.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 00/11] add missing of_node_put
Message-Id: <169528860030.876432.17353767421208248949.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:30:00 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_023327_551156_E89F38BF 
X-CRM114-Status: UNSURE (   5.61  )
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

On Thu, 07 Sep 2023 11:55:10 +0200, Julia Lawall wrote:
> Add of_node_put on a break out of an of_node loop.
> 

Patches 3 and 6 applied to powerpc/next.

[03/11] powerpc/powermac: add missing of_node_put
        https://git.kernel.org/powerpc/c/a59e9eb25216eb1dc99e14fc31b76aa648d79540
[06/11] powerpc/kexec_file: add missing of_node_put
        https://git.kernel.org/powerpc/c/06b627c1236216ac1239c5e1afcc75359af3fb72

cheers

