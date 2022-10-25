Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B3AC38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 22:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OACRRRj3HbVjZB5DHJ6NkbeA5SO5xCg5TOCz0N9BAw4=; b=TNlYxzcwF71/13Ry4sDDh1a7IR
	5eScDCNebILRQ67sKFlQb+KkPDidtt90rUoxstUgoEc4/M7ZMeYh64Xe6bnMs6cqG9/4DyORAIgl3
	isyfwVH9aZoc/si30dCF6Un+esxbeWq0I+G6tTziUDvoK06wuyz+YAPS9dVLgkZN+ON9XqBFfUH0T
	+SFNpq3S+6REwjTZH5ftm6+98pwhqFPgBAq2e/WgsJWyj1IgDNP/SorlRMJ1ud53xX+DRZg5RGFJJ
	Y7/UaPzbkIJ6j/Y8/gjK11XbBDrLutyYLr4ZQdzRqp0p3FmIQWX7JG7q4Ql8LzeZlK+Mcl+/e5wfp
	81yT/Glg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onSca-007RIG-F9; Tue, 25 Oct 2022 22:42:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onScM-007REQ-UV; Tue, 25 Oct 2022 22:41:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4922CB81F5D;
	Tue, 25 Oct 2022 22:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708D9C433D6;
	Tue, 25 Oct 2022 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666737711;
	bh=3ReAlpbuxb1p9jUT1Tt05lQ1bFQXcNMX2FBhJvCl64U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CHENs7+Jm2JhwnGqKVG6LBdPWTr/zoY37HBmpX5axP8gH4//7lYRP+SI07XpMe+Ca
	 D+C2b5iwFp3jS6wY9M7rNui0VaCv79pxRRSE1Rm51kMzFUJuvUcQfXsSF841ZP7lpu
	 ys88kwX5Dn80rrnzny+sciuwoa9xxwFWymnQhvJ2s8bsH2UH6ZS/uWF2ffOy8rxhMg
	 uJ+dXnvYzzgkN+UA1k5mPdKPPoONNgo8MMI4SsB/9jnTLlN4op6rN4GANBGakjbQZ5
	 ybr0sZXx/kuN6dfeRXD/w4TpWBuY4CNTBobf5u92SrIEZWC0kPkQdB9MD5mG3ut2gh
	 e5+V9qhiJrpPw==
Date: Tue, 25 Oct 2022 15:41:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <lkp@intel.com>, Doug Berger <opendmb@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 89bf6e28373beef9577fa71f996a5f73a569617c
Message-ID: <20221025154150.729bbbd0@kernel.org>
In-Reply-To: <63581a3c.U6bx8B6mFoRe2pWN%lkp@intel.com>
References: <63581a3c.U6bx8B6mFoRe2pWN%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_154155_149403_7B50D4BC 
X-CRM114-Status: UNSURE (   7.26  )
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

On Wed, 26 Oct 2022 01:17:48 +0800 kernel test robot wrote:
> drivers/net/ethernet/broadcom/genet/bcmgenet.c:1497:5-13: ERROR: invalid reference to the index variable of the iterator on line 1475

CC Doug 

