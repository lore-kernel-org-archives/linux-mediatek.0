Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB4FC38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 21:57:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BD821655
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 21:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kFuZ+SSG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BD821655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLrbaspoKeImtO4mZBUhZdiGGXcIt/cQBZEAjzp3srE=; b=kFuZ+SSGksVRj0
	V+ibJVxi4sSpkKoJAn3qGjb0H9WZx3FWTTbNPdM52PFiEsnIL5uB3cHUC47Bvx6tKx4bcIVcHZzJ3
	66sEUTMIW22kuIWW0kvCYyMmAtkBMEi7467yAbAkW62dZqy6XyMAZV+urYXp7bXkpzkGcXa5ZyEOk
	PtsnUvi0PlmcSQ+bTJLkbfoQun9l4YPFwhNIMDAb9q3VbQOzSACiNxdUU66j5KiqWMxdmAzvSuMwk
	tnSLTXfaiQCXsuce5HGpwEt1kbc0ldS71kVlEZsQRY4a8PHfw3RUTrKkbL53b0ax6qgfPtlNPnsMM
	hmDQXWhLfa5jyt4joRNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXB09-0002Vo-VC; Fri, 08 May 2020 21:57:49 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXB07-0002Ug-GS
 for linux-mediatek@lists.infradead.org; Fri, 08 May 2020 21:57:49 +0000
X-IronPort-AV: E=Sophos;i="5.73,369,1583190000"; d="scan'208";a="448862514"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2020 23:57:17 +0200
Date: Fri, 8 May 2020 23:57:17 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com
Subject: question about drivers/dma/mediatek/mtk-cqdma.c
Message-ID: <alpine.DEB.2.21.2005082352340.6525@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_145747_821460_51626020 
X-CRM114-Status: UNSURE (   5.02  )
X-CRM114-Notice: Please train this message.
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
Cc: dmaengine@vger.kernel.org, Nic Volanschi <eugene.volanschi@inria.fr>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

The function mtk_cqdma_find_active_desc contains the following code:

        struct virt_dma_desc *vd;
        unsigned long flags;

        spin_lock_irqsave(&cvc->pc->lock, flags);
        list_for_each_entry(vd, &cvc->pc->queue, node)
                if (vd->tx.cookie == cookie) {
                        spin_unlock_irqrestore(&cvc->pc->lock, flags);
                        return vd;
                }

That is, from a &cvc->pc->queue there is an iteration over elements of
type virt_dma_desc.  But other uses of &cvc->pc->queue, such as in
mtk_cqdma_is_vchan_active, seem to indicate that the elements of this list
have type mtk_cqdma_vdesc.  It is not clear to me how the body of the loop
should be updated to account for this.

thanks,
julia

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
