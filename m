Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D104D4A5EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 03:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/Dkyj6XQc3q9kwRLC+eOQBUTpahy9oV06Yp+kzaqXc=; b=xjS8C6EXLlRbOPIurLNbzHo+w+
	fecLXxNYYEytYLhcIaLmEFBvmXd7BIjdBDARm7YFRBYbnlYbkITR9U3h0EBWVPR1l+ihGphzlJonz
	jPSnygpDRHSPEgOyDgI00bjM26lT7mQZ1mjbV+mgvVMcslNG20EG1HMBsaHLc8JiGNUaApMlqrGJo
	oJI02Jh5iapvFUEl+tsEeXUIsCAx566vtDSfPOjCizT3CuZioZ8bvjcdmCsXRPvlQQOj9jIGofiF2
	TLD2n+CeJDmuK4u5CSOPHCSstNu25EUG9lXjxFSgUqwzJP0Z1LR8NbKlUOSlX/uiWskLTE5aourgj
	1QEBTHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vga9n-0000000DVZb-3hpV;
	Fri, 16 Jan 2026 03:05:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vga9k-0000000DVZ6-3yYh;
	Fri, 16 Jan 2026 03:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E00534338D;
	Fri, 16 Jan 2026 03:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA59C116D0;
	Fri, 16 Jan 2026 03:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768532747;
	bh=U3Aoti0YPoxifwNh7V0YYpw1gTTxaBib3ervHQ0XypE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L1QYiDqKnDOSSq+xNu+85WqFwC8Qoq9llFdwS+6br3L3Q5qGCwSBH4tzlpuO3mq3r
	 vaEOV8686ZZIri8oA4Plxr8THRmQ6eDgQHLdKqOoGFF2BrIk6eOieq1eiChchXjgAE
	 ND1QawHZH0QXhocxN9ghOzjhfneolngOFAQMz6fg0slaJUtuiMZLk7PnFhHoZkJ7Tm
	 3wUSihRl3EyFF5DahJf+HsOKeV7ufvwsJ44HfcS9VcYQYRHdeOm7IR4w+ouPDkIUG4
	 sMH810M6wuXKRoJEovwOxYpa2C3grmqrC5EPFCP2x8zuUc7moPv5lg+OVTZ+vQQ6V+
	 +R/3912fAVxfQ==
Date: Thu, 15 Jan 2026 19:05:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sayantan Nandy <sayantann11@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, sayantan.nandy@airoha.com, bread.hsu@airoha.com,
 kuldeep.malik@airoha.com, aniket.negi@airoha.com, rajeev.kumar@airoha.com
Subject: Re: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo
 frames
Message-ID: <20260115190546.5ede6750@kernel.org>
In-Reply-To: <aWjuM3Ov0e45QyW4@lore-desk>
References: <20260115084837.52307-1-sayantann11@gmail.com>
	<aWjuM3Ov0e45QyW4@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_190549_039497_7670E790 
X-CRM114-Status: GOOD (  12.01  )
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

On Thu, 15 Jan 2026 14:40:03 +0100 Lorenzo Bianconi wrote:
> > The Industry standard for jumbo frame MTU is 9216 bytes. When using DSA
> > sub-system, an extra 4 byte tag is added to each frame. To allow users
> > to set the standard 9216-byte MTU via ifconfig,increase AIROHA_MAX_MTU
> > to 9220 bytes (9216+4).
> > 
> > Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>  
> 
> I think the patch is fine, but here you are missing to specify this is v2
> and this patch targets net-next. Moreover, please wait 24h before reposting
> a new version of the same patch.

FWIW this is a good reminder for Sayantan for the future but it doesn't
merit a repost in itself. net-next is our default tree, and pw bot
guessed correctly.

That said I think Andrews request warrants some extra testing here so:
-- 
pw-bot: cr

