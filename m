Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1318DC04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 05:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6twXrEB0Vdva4fCzdxSjqjjQXquzAo1OuX7/Xfmbnco=; b=VnIiTXq1AZBsgPjWXF32ZJyxYt
	f5rfZUQh+AL0ZMk4xQz+iNK46WHYcDanuaAPodL14t1QtO7y2mCeSjnvm5apZhIpSxSIEnhXMhbCh
	zR6Tqve6pbcd02OsbiY7fNY9Qk2i2SdIPmgcRvQLRKexWFwh26WzFGkSz2uNBV89HsTBhd1cTnBZZ
	KabPYaBtqWCqXP1eBFUmJwdF1ko6HdBugaO9lbImRC2k/ZWWvR81XKXo1cIeYrF1UPh26+/lwBp2S
	UNQQNpZhP7qObtCiw6/bdGV+rhOjzS0keZtmyqRVHD9Q1lgjr8qowU2pWq791ePzapV4qblcZD521
	iHMJfTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odmK4-001HuP-K9; Thu, 29 Sep 2022 05:43:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odmJt-001HsO-GF; Thu, 29 Sep 2022 05:42:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B708A6200E;
	Thu, 29 Sep 2022 05:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C275C433C1;
	Thu, 29 Sep 2022 05:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664430168;
	bh=XRQ0ZT6by2IEfqjlnDT8C81loJRJw1R9oKY3xLPIZ0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gN28UEngYEo3QIOIgL9EcNFHR13jpHw3BoMyuzK0a0Qek275Zab/D+l0zlb63ayVK
	 yUrNU1ux7aivkA4JdvZC+jsi7iuv0ThTPfYmtCggmM79N228kBauZmMnnOrd+SHC55
	 ug2NuMv1TEUx6j1sYaUWDHDdLG8Qz0sRkwtCbSKoZkIEyCH1ksVJKELFqdZtIJbtep
	 Kj3+8DLCvYL9dQUkeL1hT3p0o8mDSm/uDciykeEwExw2MQOIOMDEed0iKxQMUItArA
	 CLZ9OOVpa9q7e41N5eozQ4wPztKXNHC1apbIb5GhINPM6aWdDZ/WnVtFRSifOEIHp8
	 dGPqmZOua+QMQ==
Date: Thu, 29 Sep 2022 11:12:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH next v2] phy: mediatek: fix build warning of FIELD_PREP()
Message-ID: <YzUwUwgDZaRejf6Y@matsya>
References: <20220928070746.5393-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928070746.5393-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_224249_593367_4FBB5B85 
X-CRM114-Status: UNSURE (   8.37  )
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

On 28-09-22, 15:07, Chunfeng Yun wrote:
> Change the inline function mtk_phy_update_field() into a macro to
> avoid check warning of FIELD_PREP() with compiler parameter
> -Wtautological-constant-out-of-range-compare
> 
> the warning is caused by mask check:
> "BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \"

Applied, thanks

-- 
~Vinod

