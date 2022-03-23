Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1298EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTAbN0VH9F7gko5rvyQoSowJv2LGxdNfDXyqvf0nyYM=; b=rifZhGLbVse/X8
	tJ743cJEmUZ/O3TNls9U5ed4UDAJxESi84GVD6wus7Pm/3kYJWshwVmVJKs+i4M3gzjfKavS3Cvbl
	kvHH6ZvY68Hdz2di5L110dzxNhufolHEjo5EZ7FqSU3ZMLCwPWN/aNspHDG7LYMHF4Ft/uOCHklfS
	lmKQqab8R+5MDO1zXTzhxTUWnBC4rM6InyJ6JiR8W6/6CSK1FPBQ+TC0yY3XZXMo2OLMQ9CdGnZME
	Nik8yy5BWPES60tulIlFju1s83aNRYx7ikk35t2B1PmIUGSr64B50L7rGrgPa96lZklX0guL9j2pf
	2DlAEl1a6IpeDogMZ4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWyZF-00DN5W-LU; Wed, 23 Mar 2022 10:50:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWyZC-00DN4U-VT
 for linux-mediatek@lists.infradead.org; Wed, 23 Mar 2022 10:50:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4013B81E5A;
 Wed, 23 Mar 2022 10:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB96FC340E9;
 Wed, 23 Mar 2022 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648032611;
 bh=kjeZ9alUc2aWCvK8F3N4ELOWHGXAyCN/wyWHw77ecyM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=m+R/v48GTVq6Nw0Y2NiGubmq/CXboOdaZKUJrWodtdkNCuBT+/GorN9ibMklBvltu
 7Ezlzpktyx54ZJTf04yYbhGSJsJEp0GHcQ1Ipoc/cPAquzAgYzAFNhkuGYtp0wMRmQ
 d/6IkwdClmOh8meJc2Alq13p0cgLEg+NTYjsFXFIE8M688F+itd8VcQ0g8yB9+IuaU
 EjmgNw1NRWVWlYKM8AaCf89jQlGTpgcOHquCjWAqPNP+JQHU/Eq8gTN5EfPAjJiKgb
 fj3cX79WIMmL+h1MdHfwYynzL4++93tTxT/YeZPVoAb05pDlkuqXB9aTBlAwQ6OY95
 QlWXbVptvxJSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 85DF4EAC096; Wed, 23 Mar 2022 10:50:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Bluetooth: mt7921s: Fix the incorrect pointer check
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <164803261154.27387.6013475934933962209.git-patchwork-notify@kernel.org>
Date: Wed, 23 Mar 2022 10:50:11 +0000
References: <5d56b2a23e6e793c64ed98890329ce1beb010ce0.1647991506.git.objelf@gmail.com>
In-Reply-To: <5d56b2a23e6e793c64ed98890329ce1beb010ce0.1647991506.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 yake.yang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_035015_210085_025838A9 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Marcel Holtmann <marcel@holtmann.org>:

On Wed, 23 Mar 2022 07:30:40 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Fix the incorrect pointer check on ven_data.
> 
> Fixes: f41b91fa1783 ("Bluetooth: mt7921s: Add .btmtk_get_codec_config_data")
> Co-developed-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> 
> [...]

Here is the summary with links:
  - Bluetooth: mt7921s: Fix the incorrect pointer check
    https://git.kernel.org/bluetooth/bluetooth-next/c/864cc8a234cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
