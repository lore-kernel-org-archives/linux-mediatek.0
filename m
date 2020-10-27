Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609F7C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 16:19:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A08021556
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 16:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hV+bYPze";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0J2GqkK8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A08021556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQIbEySatcv5y9Hk685rlFwQNeSI5lCi81XtHsIZ6lk=; b=hV+bYPzeL0Nk4cefBeuQmFDY04
	XLMieiel3/vhLXgn7IHeAWaZHuqhk7DbZu1gMRaJbiXK7Gf2MPh2pUz06MHZ4r6j/f8qvqsr1YbZ8
	vMR1kAiYKO0b49RLtkmpJF8xQpe5Ju90x5AQ6lrhxCSIOpP2LNXzi2wZqjZNnJAgggL7Kf0J6067/
	bUB6k647hiJPvse3onG0TOkpiXOGSEMNBKZOyJ8SrFLacBeJb88lzD2p4PNaoD5QdD0sWNz5pDfM7
	30JCwHC1KWZMsflF1tQNhDFZlyBqwleETuMjHEqu4U0l6qhi6fzsBb1cLdqxV9xcuOwHYrG1zToyO
	QliPNFuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXRgs-0001dO-34; Tue, 27 Oct 2020 16:19:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXRgo-0001cG-IO
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 16:19:15 +0000
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CBEA621655;
 Tue, 27 Oct 2020 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603815553;
 bh=0fTBCio73cytSnYXLa/MVltGcLwDRh17/0JCNzpy7VI=;
 h=Date:From:To:Cc:Subject:From;
 b=0J2GqkK8zWPOQ1ccfjgikTys/kYzDZmB5O8/GmTeZqKCvntJv4ZtoSwexd6V0tbGD
 c5TwBSHpbXySh2Zuegg6mr5Kh06z/IUSoBmpRn3p1xZR7wdSe6eDfFDy0iOZAjYP3e
 qg/O+lGInBA46OZmBqSCHTPCrWTZsTiEXiKl0sjI=
Date: Tue, 27 Oct 2020 11:19:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: pcie-mediatek.c coverity issue #1437218
Message-ID: <20201027161911.GA182976@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_121914_712164_7EEC6530 
X-CRM114-Status: UNSURE (   7.22  )
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
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ryder,

Please take a look at this issue reported by Coverity:

 760 static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
 761 {
 762        struct mtk_pcie *pcie = port->pcie;

CID 1437218 (#1 of 1): Wrong operator used
(CONSTANT_EXPRESSION_RESULT) operator_confusion: (port->slot << 3) & 7
is always 0 regardless of the values of its operands. This occurs as
an initializer.

    	Did you intend to use right-shift (>>) in port->slot << 3?

 763        u32 func = PCI_FUNC(port->slot << 3);
 764        u32 slot = PCI_SLOT(port->slot << 3);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
