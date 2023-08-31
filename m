Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA19C83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 14:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6Udv99X0OKznK65U+kCijFLwrQucl3E++TwmIGf3ak=; b=TLFurR5reznZu8+pV9r0AC0Z5+
	IfwHeZ92K7LX98vvSs8V0Mi97+h4wmqZtsL2vpVRTbWSfhF99nIDavS3+NaI7JODIbEPDnIFdfhdH
	TuJvsqQJ8W3xEvAOC828KhvMEtyQRZn5N3+WSmKb4sdc95i7+yCuEoxzBsooBAuqaV9t8+TNK1x23
	kr4MYoZiWS0uVztkVEoE+B+nHYurKBjudXW+x0lqoKQ3ijnRbDsjD4t+KiXrwrRbGqM82ty/R/nhJ
	FSkNFIvRZ1+kLUbPnuNQp3fYrjf591E1Gi5wjS4ajjyyk0gmZQmLP0wANRar1jRwL2rNtWUYiZqIF
	XzZ5SE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbiVD-00FQhb-3D;
	Thu, 31 Aug 2023 14:18:32 +0000
Received: from [2001:4d48:ad52:32c8:5054:ff:fe00:142] (helo=pandora.armlinux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbiV9-00FQgU-0m;
	Thu, 31 Aug 2023 14:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P6Udv99X0OKznK65U+kCijFLwrQucl3E++TwmIGf3ak=; b=Ytk8frNCKnmkAIO/waddPtge/H
	y6xhhJECQpo/BdQWUM28GMulqXXi4dEcTJUhdd/Ov1+mqvrDfP+P0k9iILpx4KKZ+dSRNxRDRMlC9
	/wMwNxBFN4L1QsSt9pp8JmphnkRcQt/7N3Oc8PF6YXNhKr/P29S9eMyVcy4sLMSDPV/cOns7Hn0Mv
	+GlHuU1pClyvS8x1BbRLBwqoY5JZjXGS9ajabp8OKjLVhVA2EuA9Nxt0SBB1qHr9yfgB8bS7W+MVL
	QFyRholiZpYNICzgoAM5dAlQciBr94dj1WO/3/eUaS64pd5u/I56bY6rMrHcIzMs06mZeGlREttXa
	7yYqtzHQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51164)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qbiUY-0002vk-2j;
	Thu, 31 Aug 2023 15:17:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qbiUS-0006rU-Q0; Thu, 31 Aug 2023 15:17:44 +0100
Date: Thu, 31 Aug 2023 15:17:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: gregory.greenman@intel.com, kvalo@kernel.org, briannorris@chromium.org,
	nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	avraham.stern@intel.com, johannes.berg@intel.com,
	emmanuel.grumbach@intel.com, trix@redhat.com, dmantipov@yandex.ru,
	christophe.jaillet@wanadoo.fr, yangyang@marvell.com,
	linville@tuxdriver.com, rramesh@marvell.com, akarwar@marvell.com,
	nishants@marvell.com, linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 0/3] wifi: Fix the NULL vs IS_ERR() bugs for
 debugfs_create_dir()
Message-ID: <ZPChCNLPMQiRrVU5@shell.armlinux.org.uk>
References: <20230831141347.3166988-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831141347.3166988-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_071827_560892_1F51E1EF 
X-CRM114-Status: UNSURE (   7.63  )
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

On Thu, Aug 31, 2023 at 10:13:44PM +0800, Jinjie Ruan wrote:
> Since debugfs_create_dir() returns ERR_PTR and never return NULL, So use
> IS_ERR() to check it instead of checking NULL.

It is preferred that the return value from debugfs functions is _not_
checked.

See for example:

https://lore.kernel.org/linux-arm-kernel/20180601111004.1670-3-gregkh@linuxfoundation.org/T/

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

