Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65205C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99HykxLgM645Ky9iWy53Cx4gvJnt6UjlNW+frpV58xI=; b=ebG2X8n9HtfdOdJ3QBTakHTzst
	6Q4hFpWMynBt0vxtyqwXzrDhTMmn2WF4ApW4nEtVeNermH4mWebiHke50X00Qj0KaTzuiuLn4ZGpR
	tTgM3fwApLHInXdqI6AXsA6HZR7yBzyVR0i+fz39/fvfardr+KYhuCz+KrFyAkxNCYp7MmbDeLJGw
	G1wl/OJYdU3nHAi1reXBFwhoYJe09pw4mG99Loo0SEH6yc3kFfAtfvo44E7v8YYqMz+gwe3TDDMdx
	Tj4EFLqTV6YLcHeVzxMFs6auVwdOsJbUbTY0w5pdRP9KvFIC9759EvT5AP/s9SI/9+shbaL5/H4tJ
	3OJe57xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p298g-001K2O-5A; Mon, 05 Dec 2022 10:55:58 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p298V-001Jxr-RM; Mon, 05 Dec 2022 10:55:49 +0000
Received: from 8bytes.org (p200300c27724780086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7724:7800:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A5EE42202AB;
	Mon,  5 Dec 2022 11:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1670237746;
	bh=UVOyFFaGYlpHJfm3mAMdFZ8zDZRV5tP+GuufCO475L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=50ZzaDPqm6zSg1911499wI12ZJg8Zfh0ZeU4ptABj61knUN9uman1W/Zj3OEYkx5o
	 DT9ag6YE8z9ZTFTyx8NXeKVyX07AjJ5Y6upV3L3aXZ/D460VDVWyQafxz15zOjjp4S
	 FgdSVQjAe6xWxLCc2OH6AjuG6WHUyTjlxiuvxDq5rQ2/mXrNf4qAAR1Pe5N1Y/pvFQ
	 Yhj/72n4bxUlGQer/1yKN42pLQMYn0kWFsXltRhMpwfVCMAT6640YBKA6YihbyoJeU
	 NGKhXkJLpH1XQucxnBVkOjqWKoVoQneM7GOQ/2JkWO+TE92+yU4RW13aCKBdVkF2a2
	 Tb0yRdJ7AuqDA==
Date: Mon, 5 Dec 2022 11:55:45 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/mediatek: Fix crash on isr after kexec()
Message-ID: <Y43OMbwJUTv0dmOt@8bytes.org>
References: <20221125-mtk-iommu-v2-0-e168dff7d43e@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125-mtk-iommu-v2-0-e168dff7d43e@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_025548_057445_C2EEF733 
X-CRM114-Status: UNSURE (   9.19  )
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

On Mon, Nov 28, 2022 at 11:16:48PM +0100, Ricardo Ribalda wrote:
> If the system is rebooted via isr(), the IRQ handler might be triggerd
> before the domain is initialized. Resulting on an invalid memory access
> error.
> 
> Fix:
> [    0.500930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000070
> [    0.501166] Call trace:
> [    0.501174]  report_iommu_fault+0x28/0xfc
> [    0.501180]  mtk_iommu_isr+0x10c/0x1c0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Applied with commit-message spelling fix.


