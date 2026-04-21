Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2661F327D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKrFvpe9cMWWIzvNzGGk0ZJtry+Q6yT9WwP8XE2EM6Q=; b=ddb9y7ap22u4NT8bfoWJRb5J8K
	U+l1JPl2q+W2ov607wrsEKrIwpr4PQ5BtGoXcv2hdB2Yotw0eHTt4FAcSHqoeFoUhP/IFdR5FkAOC
	YKVyaN/p67kIcAPbQTxXmfW6YbBZVXbYUJGxGoEwslwmkVxMCkGncGCZuF8wAl4Uwh5oPkz+LfM26
	XNXCd2MVeihFmkWJvyT+SMeW1w/f+PeXDH8Cco7yY9acpiE4/TVAvwMA5wx6aBPXwikY2QLIdZaWO
	ZQdrmC/OGLsP2AqPX/P2vRl/RnqIuHtv/cATORBM0ra/u1MEuXvc+Nh3LpYfHOWYhaucRncKou4fr
	A/b44gow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFF5c-00000008yw3-17gL;
	Tue, 21 Apr 2026 17:40:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFF5Z-00000008yvA-3EJc
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 17:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A63444014;
	Tue, 21 Apr 2026 17:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA17C2BCB0;
	Tue, 21 Apr 2026 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776793244;
	bh=9fNB/J0Q/DfdEmhtekKZrAUhlEBm1e4+GeehOrO87RA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AzygYIIS8Nbn3H5iNbPSOEa2LWEOkd4Rxykv7RB52e81y8qX0XWMcSw1tnUPgWlGz
	 A89c3kz1tvlvWBynl2+CJLXQJqLX9u1K4C7GlNBvUkQjOQHVhaDRaQg8UHKv9OaONk
	 ZDBY7FME1CoNcvOCNq4fCSk/fc27uUD/wYrpKCflnG1pNbQdBIioEOVwTZhBvpXaEr
	 iVtOU7n70zmpZKfFFwmX4FUL/SwOmjHo0UWuMpq0DoKpeXZJKR7hezQ3yf0i6MBPTW
	 rKmuMNWO3LMBgZudGJAfFmI7F70rRuq7g2HYI4EltIZAWyDWvYhbuEODaZ1X38f9We
	 qEca8hz/yQK9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9DF539301B9;
	Tue, 21 Apr 2026 17:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] Bluetooth: btmtk: validate WMT event SKB length before
 struct access
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177679320754.2928707.14796411684619815619.git-patchwork-notify@kernel.org>
Date: Tue, 21 Apr 2026 17:40:07 +0000
References: <20260421111454.3403059-1-tristmd@gmail.com>
In-Reply-To: <20260421111454.3403059-1-tristmd@gmail.com>
To: Tristan Madani <tristmd@gmail.com>
Cc: luiz.dentz@gmail.com, marcel@holtmann.org, sean.wang@mediatek.com,
 mark-yw.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 tristan@talencesecurity.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_104045_850945_6603C377 
X-CRM114-Status: UNSURE (   6.97  )
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 21 Apr 2026 11:14:54 +0000 you wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> btmtk_usb_hci_wmt_sync() casts the WMT event response SKB data to
> struct btmtk_hci_wmt_evt (7 bytes) and struct btmtk_hci_wmt_evt_funcc
> (9 bytes) without first checking that the SKB contains enough data.
> A short firmware response causes out-of-bounds reads from SKB tailroom.
> 
> [...]

Here is the summary with links:
  - [v4] Bluetooth: btmtk: validate WMT event SKB length before struct access
    https://git.kernel.org/bluetooth/bluetooth-next/c/006b9943b982

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



