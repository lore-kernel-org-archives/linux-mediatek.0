Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A10C388F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 11:52:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDE620756
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 11:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a88zPFB5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EDE620756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hg6xSVnpnjQiIh4CrRdLOJ019rQjFkNQ4mQRRCCu3kA=; b=a88zPFB5rvU2b7B6f7m/MrbQs
	g5Lswo4gBZVuZcJbnwdCtgbbulILxgkI8XIKIeAyk5bmV55r7F8CtrWI6ktoY0EH5HaGUaCMnOAnk
	jBlBqcfe5y06JMRADqZDaxi5F4y+Q8CO3xs0qilwX9Lx3ghMFF4mYHmgG7FHsHydeiaTKWBqXieUH
	v0I3sH5Gp6TkuoOfD/8bfaQ05UJUSIRbeixpvMytldCRgyqu8gcTGHreyzidRJFcovP2pNdgGBQ5+
	kjxWHmbGwyRMxaZhd4shKBdLRk9OaRXKm1a7V7Y+rkHDBzkynBir2IOY03xspbHe6wVzsOw6PfJhO
	bg1fMQyQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khAO0-0004mF-Hm; Mon, 23 Nov 2020 11:52:00 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khANv-0004kc-3P; Mon, 23 Nov 2020 11:51:56 +0000
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
 by mail.holtmann.org (Postfix) with ESMTPSA id 02097CECCF;
 Mon, 23 Nov 2020 12:58:59 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH] Bluetooth: btmtksdio: Add the missed release_firmware()
 in mtk_setup_firmware()
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201117024332.165771-1-jingxiangfeng@huawei.com>
Date: Mon, 23 Nov 2020 12:51:48 +0100
Message-Id: <9917F51E-C0C5-45AA-903A-DA3C10398F95@holtmann.org>
References: <20201117024332.165771-1-jingxiangfeng@huawei.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_065155_252099_9355FE00 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Mark-YW.Chen@mediatek.com,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jing,

> mtk_setup_firmware() misses to call release_firmware() in an error
> path. Jump to free_fw to fix it.
> 
> Fixes: 737cd06072a7 ("Bluetooth: btmtksdio: fix up firmware download sequence")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
> drivers/bluetooth/btmtksdio.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
