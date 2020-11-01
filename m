Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4663CC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 15:59:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E23206A1
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 15:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJ+r36w9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jHzEBXdf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Uc2TWbp6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E23206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jC99rd6FLPIaJDF049Tf6SSluDOUt6wgRe16LbHmmUQ=; b=uJ+r36w9v9AkmrrhGusfaapjU
	85mmKZ+33VJ6q42m01KsSYJq8TiEt7ARPLmERxkTOPvpXlJ3oh5+XMqiIuwUesI8Lqdee8gIT/y14
	X3SZA3tcdDouP97uNuqKFEIIfeUkehnzqwDfxniOow0nDc7CZ03pL/MGN5Rtwd7dnMJ9TDqr0tjol
	BCrjWQZtmNppTBfePFR1XeNO7Dwcg4bTyL/6k94OsVHcuPgLazSXnGYsDApjQ6Uoq/WQByDgyGC5p
	QX5ml74B/hMXZp96Etfa/ouZE/mVXZeJyD/olvoR+iH8tlggybrPCvf3pnshOqBNEWlDz39NnojdK
	F+Splz92Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZFkv-0006GK-Qn; Sun, 01 Nov 2020 15:58:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZFkv-0006GD-1y
 for linux-mediatek@merlin.infradead.org; Sun, 01 Nov 2020 15:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=qb6DRVxYaxT7D4MmCdO0NYQmm6IC0TrMSMy8foIKKz0=; b=jHzEBXdfdCe4WU3cW76Nb57b5b
 H/IFl10/ESp2fyXzyZUUFpbgmfs6kPLoeNy3cFVaqUA4aLLkIyb90VFQs3EH1PyucLW9Quh0T709w
 piRLmyO7OewKllFcLgnUGecF0jWfRwZNJmTmAFg+j2S5+AA+BrUJGvzZihSRzSBXXFNCTbHfvU7PB
 ladmEvnY5DZFUwg4vTmN3sVnwdIymOB6kVpbRG9DwhLcwZXb4YoHOQ22Bla+l2EyDfXrzpeNPSS+B
 sVQVQ+Vl0pO5zU2wgO/fR55AL4YE9nNfbNtaIXlTQSWB36fKbfSGeUKNCa/VIi34z/NlJjKP6At6u
 QsvqgSww==;
Received: from mout.gmx.net ([212.227.17.22])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZFkr-0002Kl-Av
 for linux-mediatek@lists.infradead.org; Sun, 01 Nov 2020 15:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604246306;
 bh=qb6DRVxYaxT7D4MmCdO0NYQmm6IC0TrMSMy8foIKKz0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Uc2TWbp6pOWSJGk3I47l6u4tZf8IVzf6v74UF3D3SpaLZ+bkcUPdCtcESIFs5bcB2
 CKTR6loty4pdA16Wb2uAhDEXisqK4tHsP2Px/oNB2qQToH/Z9oKf478YGzznJPvjkQ
 OvXeHCikZw2P2Btm7BElVTtJxSkHTtncCeqRrtxg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.204] ([217.61.144.204]) by web-mail.gmx.net
 (3c-app-gmx-bap08.server.lan [172.19.172.78]) (via HTTP); Sun, 1 Nov 2020
 16:58:26 +0100
MIME-Version: 1.0
Message-ID: <trinity-65ad7212-0f00-45e4-b6ba-2ebf0d6ce496-1604246306570@3c-app-gmx-bap08>
From: Frank Wunderlich <frank-w@public-files.de>
To: Marc Zyngier <maz@kernel.org>
Subject: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
Date: Sun, 1 Nov 2020 16:58:26 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <87lfflti8q.wl-maz@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:fbRV6bMiFGC9Eh/64YsgpkDbiklowxEALlWU9GGzW2SwZpZ8kneSa0Kl2hTJSv1SAQvXa
 FR4pnUQiPjlnGGbQB1tbYrWkap2Cqje5PN0OmAPG4gjW3odE8PlRx85wGk1QLpPCSu/j/7+3AbLG
 4hRfQgicKbwHEheG+Bu6lnrCjVbqc6RwfJBVY3PutnyOtdobHcbzQsPBggrZUoCF7oiEOZUbsAsR
 6Yp16ARMbyWVrQNoE63B+n494PzUhCHnLJ34R3tm77xDb1M5avjXApZvPwvnNfnUg9JPfOPc1Zkw
 +U=
X-UI-Out-Filterresults: notjunk:1;V03:K0:wywrOI65TLA=:OFTVISoufMGo1LNb6XlInw
 ErkrM60zMQQXwQcdNqWqUQJp1Z3DgDZHs1AtV6g7Gv91akpmHUNJuib3RqOF4lMV4RYD81uY6
 yYL0Q854EqDT4z74JFxbDkx7/X6MWAuUNfsoPqFUGPRoc2DmV8uj5mmKCKD/vw+fev2tBHvKP
 8aOf9Y04uLTn23Az4RP112HtpqAtyRm74ViZd2w4fFYJ9EGT4ex4fqxuEcZxE32G5RtWYTPwX
 N71M4CgP47D/+ChshFjAuT/b67b02TzzK1tOdF0WyeIXBmQ+6MuX1u0WzpIKm2wDyFTLsUtER
 dofNY613JQ23d/Jp4LBN4T1/2O++whlbnrR+18V7EI/uZUWj83TVkyrx3fmd8kjR6AMAwhTWJ
 RuRjjAEJXhIXzf6VJSeQGzht1OLsbfv9XYcIADMHU6d2mvwJb1YuN7e3KlGOyMy3LBdCK5URs
 P9NVNhBRzBfMNoZoFMu+OnubyHNeZOmqoPsDiy3NFc60lVJraa5InIiYATj7r0Fe2/gPzWfvi
 WUq0QvVLv7xZG0WEUktvidhJogX5ozxv0axHo9lo5Dnv2wXU0NHwr7gWfL8PiI7+VgGniYi4n
 3hR3Tm4Zm2ukM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_155853_674008_B70BD95E 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, chuanjia.liu@mediatek.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


> Gesendet: Sonntag, 01. November 2020 um 12:43 Uhr
> Von: "Marc Zyngier" <maz@kernel.org>

> On Sun, 01 Nov 2020 09:25:04 +0000,
> Frank Wunderlich <frank-w@public-files.de> wrote:

> > It looks like for mt7623 there is no msi domain setup (done via
> > mtk_pcie_setup_irq callback + mtk_pcie_init_irq_domain) in mtk pcie
> > driver.
>
> Does this mean that this SoC never handled MSIs the first place? Which
> would explain the warning, as there is no MSI domain registered for
> the device, and we end-up falling back to arch_setup_msi_irqs().

i tried 5.10-rc1 (without my patch of course) on bananapi-r64 to check if driver
on mt7622 works better (this does setup a msi-domain in pcie-driver)....and i got no warning.
so mt7623 needs to create an msi-domain or handle it in the correct way e.g.
by returning -ENOSPC like in your code.

> If this system truly is unable to handle MSIs, one potential
> workaround would be to register a PCI-MSI domain that would always
> fail its allocation with -ENOSPC. It is really ugly, but would keep
> the horror localised. See the patchlet below, which I can't test.
>
> If this situation is more common than we expect, we may need something
> in core code instead.

thanks for your code-example, here we need a response from MTK (CC'd Chuanjia Liu)

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
