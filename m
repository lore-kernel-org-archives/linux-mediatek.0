Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5500C47422
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jan 2024 13:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih68nXl+NJDVjXp0XCB8wftpWOAFLCWUJxH9C1lYw0c=; b=Ap/K058C31cKDNnzN7XudZ9nyn
	CPcaaNNzy8/n5ynG2GHYOsXk0Cv6h5CISN4oO4hJb4z1PWcCYNjwKLzJlQuzVe3R8lxHDequniiDV
	bEI6WNFe2LSAX09VxAgH4G1u0XI9GZ2Y0PZ0PckbSB9Gp4eaoTVVe0C6RNxvwYbauhMd3uZF5M1VK
	w9QlD7USy7UkNygIQkJvIMr5R2q9KgPB9INXr3w7hIhRr4HuQdvxtryDMGDBa/N6iHMFk7Nvbk663
	MuBugEpYaZQzjDT+3z9ma+hV+PzCHzG3RKiy8u9JP8uFWW6ydLE9bMyHQh9Dsme8/xhZhqoZCEICj
	8ZpV7CqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQS6s-002o5m-21;
	Thu, 18 Jan 2024 13:07:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQS6p-002o4J-0E;
	Thu, 18 Jan 2024 13:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E52DECE1F9B;
	Thu, 18 Jan 2024 13:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F31C433C7;
	Thu, 18 Jan 2024 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705583217;
	bh=+blTKqSBWpW6r7TfXfyfKT3NZkOLFReG37eRdYqyEEY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=PHYZ9gkKA4rS8bF3MGyeLxdyXC56bcmR/0vHfBT2kFU/bpbj3vEags0ILi6/Vr16u
	 dfOOeTuzPkElUdvi2ev0xpDJf/WaLWL5Smzr1MLE1R1C/zqZPWXPMW3ac9vRUPaT9R
	 3xo5YtqaS7APiuwDrOcKYSUBBT46SncRu/Kc3sHwhrhY1S49tvfDf5pkUK+PHgGqEW
	 8M7lJERpzXmkVAkldArtlWH6WyBgan9B1gh6EYik0q6U5HkUGz9vfpHjLu4eYHAN//
	 zbkrmgK1JcInsBmi9vsVHy+pGfYXRA200nMpXGCykdlrlvNCkvDVoZ1xikFFtRwCcw
	 ZoDP6179LfYPA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [wireless-next,v2,2/3] wifi: mwifiex: debugfs: Drop unnecessary
 error check for debugfs_create_dir()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230903030216.1509013-3-ruanjinjie@huawei.com>
References: <20230903030216.1509013-3-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <gregory.greenman@intel.com>, <briannorris@chromium.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <avraham.stern@intel.com>,
 <johannes.berg@intel.com>, <emmanuel.grumbach@intel.com>, <trix@redhat.com>,
 <dmantipov@yandex.ru>, <christophe.jaillet@wanadoo.fr>,
 <yangyang@marvell.com>, <linville@tuxdriver.com>, <rramesh@marvell.com>,
 <akarwar@marvell.com>, <nishants@marvell.com>,
 <linux-wireless@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Bing Zhao <bzhao@marvell.com>,
 Frank Huang <frankh@marvell.com>, Kiran Divekar <dkiran@marvell.com>,
 <ruanjinjie@huawei.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170558320955.2924528.12751516138860022016.kvalo@kernel.org>
Date: Thu, 18 Jan 2024 13:06:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_050703_284940_9BD996E0 
X-CRM114-Status: UNSURE (   8.58  )
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

Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> debugfs_create_dir() returns ERR_PTR and never return NULL.
> 
> As Russell suggested, this patch removes the error checking for
> debugfs_create_dir(). This is because the DebugFS kernel API is developed
> in a way that the caller can safely ignore the errors that occur during
> the creation of DebugFS nodes. The debugfs APIs have a IS_ERR() judge in
> start_creating() which can handle it gracefully. So these checks are
> unnecessary.
> 
> Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>

Patch applied to wireless-next.git, thanks.

50180c7f8e3d wifi: mwifiex: debugfs: Drop unnecessary error check for debugfs_create_dir()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230903030216.1509013-3-ruanjinjie@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


