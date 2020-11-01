Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D346DC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 11:20:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 417862084C
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 11:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s43bGHTZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mdwMMSvB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XcEKVBjx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hR48/JUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 417862084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZV9qk5JSh5UKsQpNAZBIjGrNvGmwOFI6O8u/boeAVBA=; b=s43bGHTZXGwWQDl+rqoNnlo5I
	7BzmTsd5zDD/CeuXpSLYoIBn1hzm3nxQDTcrlssYOwOD8Q0e78nLzrd1hiDmKwmgtqqifuAZ6oFAk
	Mn/0vfgtt/KrYtzowh7Ns6KQj8+ogNPC4h9v6ktnjNGVfg1o5sPYLGIkuJIPqSyQGWlwO2ez8XRnK
	Hc8BSQbGGlIMvXcakbL7Ip5o8rksG0Kv0roXenKdAkgEQX6Ah5gYI86RsJQ6NFawXRpFtwBr8iB1n
	93zKSG2wToErx1QU/EEi+ZJKyvZajuLqSB8LAvDCnyE0B0PwQIQlxzsTE2CBYzuTvNH56hrraXHFC
	N7fdvvdNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZBOw-000661-AE; Sun, 01 Nov 2020 11:19:58 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZBOu-00065o-9V
 for linux-mediatek@merlin.infradead.org; Sun, 01 Nov 2020 11:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Krt6T563zJwnx7DxUOm/kUcEp/J3bUFP7nrYHXCOXd0=; b=mdwMMSvBqn6Sf5ZdLLgsgFOqny
 6grRSUX/P5sfNoBAb6oZRJe3NN5vpZDACchhdrIjVOVxdgJqrmqKECjtIdggu6ll/z0y427Hedm1j
 3hQSJO+Cv7osWsovqf+ZkSGlFINmQLGmaVgr5leO1w2a2MMez+XHm/r2K0b/h2qBjSSCgwe0diOkt
 0XB15wqz0pe5RQC60cgNBbU/LdqwiFdj+vb0VEPrBPqZ+vx2FM9Wck2LDJzZJwSycHE1Gwh8/VROa
 U2Q/vXOsJMbfAuUpDa26QGZmn8BILbvCYkst3fsGJxDlh3Kz+ImLPS1NF81qQLT+Ag9aD1HvU2pEM
 cLJ31LZQ==;
Received: from galois.linutronix.de ([193.142.43.55])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZBMk-0003lX-Ua
 for linux-mediatek@lists.infradead.org; Sun, 01 Nov 2020 11:17:46 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604229428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Krt6T563zJwnx7DxUOm/kUcEp/J3bUFP7nrYHXCOXd0=;
 b=XcEKVBjxXl0SEldDFHI0QsDBfa1MasLOx1JA+FAlyFQaf5+wRgC3TWvGFaa3eyC5b0Tuwp
 JvB1evcozCgR7TezCNLGNHitoUQPYT9SDs+OBbUa2XA1nVbAGT7zaHvh7pTwOI3bHQZExF
 V4nJv2sI5YsEFnddXD2GghwK/Q0wOocZQdWHfQQzOmYhIryE6dFtZclIAJwtmTw5MakPmo
 bMNyaVkrd+vJFywJyz/Qpb9g2xVqvr4EvUXNFeG292VDy+zW3fH+3+ZdpkfOYwWPw1iUQJ
 Q8C99zhUEIgvd3u9io5q+dhkBCUTNv3sa5ZDPTogpy4ytTwE9POWVPdiRlvP3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604229428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Krt6T563zJwnx7DxUOm/kUcEp/J3bUFP7nrYHXCOXd0=;
 b=hR48/JUdYqfu6FBuA6Z6JWnzxr5tXeCygZMkUG6YXwTjqcH0225c9X9IyYpkIeArbvQYYt
 ATuF7axR/bylv1Cg==
To: frank-w@public-files.de, linux-mediatek@lists.infradead.org,
 Frank Wunderlich <linux@fw-web.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pci: mediatek: fix warning in msi.h
In-Reply-To: <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
Date: Sun, 01 Nov 2020 12:17:08 +0100
Message-ID: <871rhd9vij.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_111743_644397_D44B746A 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Nov 01 2020 at 10:25, Frank Wunderlich wrote:
> Am 31. Oktober 2020 22:49:14 MEZ schrieb Thomas Gleixner <tglx@linutronix.de>:
>
>>So it needs to be figured out why the domain association is not there.
>
> It looks like for mt7623 there is no msi domain setup (done via
> mtk_pcie_setup_irq callback + mtk_pcie_init_irq_domain) in mtk pcie
> driver.

Hrm. No idea how that is supposed to work. I defer that to the mt
wizards then.

Thanks,

        tglx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
