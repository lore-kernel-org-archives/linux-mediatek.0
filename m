Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFDFCAC59A
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Sep 2025 18:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=628/bCaqz6mQk7KC/EDxAwYEyuvGT6galZBj/iVU6TE=; b=ufxkBr8kvqlw+fTSGEkcsJxcpm
	bJY0NUqrJZPYr1zy1D6z/j/sTAS2Orhptrcd+a7n8Fq9slu+nZyk9Wdi2kTRneA8HegFr9wOjLphE
	lgmbufT3MoA7pfzCZ4QxeFyjF0OC0Xlx1BlKaWr6NsNetxLUOAk9wTs/xIHpsR30gsTpWWWelpn6T
	l2XiBXBIBVAl4xgXzC1Q81/q/LIY7JbujSvI+l7Ky4BcHt8N9Ch/cvUdCF4trLTzb24Sgrhr8OdDA
	U9evLp/beW7Wmy+w4u3G2fFUSNAuojPGk1GFKuZ7F1XJTouLDBS18Cs/oSFxcsZ86c5/mV5uCRXLx
	ktMrU7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfgs-00000003kLt-3AKw;
	Fri, 19 Sep 2025 18:18:38 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfgq-00000003kLW-3tmo
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Sep 2025 18:18:38 +0000
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A1DA8342053;
	Fri, 19 Sep 2025 18:18:24 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linux-mediatek@lists.infradead.org
Cc: xiangzhedev@gmail.com, linux-firmware@kernel.org
Subject: Regression in linux-firmware-20250917 for mt7921e driver
Organization: Gentoo
User-Agent: mu4e 1.12.12; emacs 31.0.50
Date: Fri, 19 Sep 2025 19:18:21 +0100
Message-ID: <87bjn6fgr6.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_111836_989891_33280768 
X-CRM114-Status: UNSURE (   4.90  )
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

Hi,

I'm forwarding a downstream report in Gentoo from
https://bugs.gentoo.org/963106 which also came up in Arch at
https://gitlab.archlinux.org/archlinux/packaging/packages/linux-firmware/-/issues/29
and on the linux-firmware gitlab at
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/684.

The user describes it on the Arch bug as:
"""
core/linux-firmware-mediatek@20250917-1 causes network to fail startup
and dramatically slows down basically every operation in the kernel.

symptoms are a pegged kworker thread at 100% cpu util, shutdown being
prevented, extremely slow commands like sudo, filesystem access. I
suspect a interrupt storm of some sort.
"""

And another mentions that removing the module w/ modprobe -r mt7921e hangs.

thanks,
sam

