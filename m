Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0C0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kF+++VTL/fFzIyO5ccQoiIDnd3GXvpLpPr9CM15BVo=; b=ohlM7CpYpTB07q
	fR3qN6lIzmv+WcQJ5HgeUakBvbEi4fp/wXycmuvC5HgmnlsZ3ZQVhbh6xozoOyubEEi0rdFW20gWt
	a3UuRO+0yd1bQI3qIMODZOdRX26JiwBM4fDoWFgPjJAvbpEhObWLN5fK9zfTKdJpD0oSRfufYFeWI
	o2dhzxQlbhYTPbokt+0/2IUFXxNk0X3KLyQFFttIXWBkUFRAo97K6l49D5gWQc1NSsFbDp5RNfy1l
	sxNbGN79YwGJyvwefvWXhh0pVq1Vno97G4sS0s7rQgFw4PA4oGJEgdRjlOJrP8aEncVB/ENqOKdRv
	k3zz9tj+1dYFXOaJUDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npTMm-00Fkob-OZ; Fri, 13 May 2022 11:21:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npTMb-00Fkj3-Ef
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 11:21:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 517DC61D80;
 Fri, 13 May 2022 11:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58001C36AE5;
 Fri, 13 May 2022 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652440899;
 bh=EZO7tGXSGLsb5zNo/W7IbNfUPBSeYkjiCkhDxaB4HhE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MCvuwzYTu73MXXZHHNhOAng50Akf0jVW7X8XQXTC2v8HfzpgSznchWtGFdSD2B6xq
 uO+7h+5uOUNPk6LsDFGDMx0D5+7gOxXml/4pBKoczvOpYJvJkiklJAWfPcx9SWIVcW
 A4+9nb6isX0m4txKiSNouF7e2Bf5XtSxkYIe1KtsBbXQqeuUXGQt152TASehB+QZjR
 GKyVNxwBpzy9AmJkXxqI1CWV4ZOhH2GhSy0bFfbY7pOtDLdqLirij3NII7WkwoE+T8
 /xIgQV8/Ea1HeTLG3R/Q2Va6ZJtfysnNCpepqWaRv13DBZoaO9LJm/80M2JEgicko4
 7+c0NS56ukEYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3760BF03937; Fri, 13 May 2022 11:21:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] Bluetooth: btmtksdio: fix the reset takes too long
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <165244089922.8477.369060827203985339.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 11:21:39 +0000
References: <e26167a3fcefdeae1151162e8676c9a467a8100d.1652390894.git.objelf@gmail.com>
In-Reply-To: <e26167a3fcefdeae1151162e8676c9a467a8100d.1652390894.git.objelf@gmail.com>
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
X-CRM114-CacheID: sfid-20220513_042141_562608_12C75F9A 
X-CRM114-Status: UNSURE (   9.26  )
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Marcel Holtmann <marcel@holtmann.org>:

On Fri, 13 May 2022 05:38:11 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Sending WMT command during the reset in progress is invalid and would get
> no response from firmware until the reset is complete, so we ignore the WMT
> command here to resolve the issue which causes the whole reset process
> taking too long.
> 
> [...]

Here is the summary with links:
  - [1/2] Bluetooth: btmtksdio: fix the reset takes too long
    https://git.kernel.org/bluetooth/bluetooth-next/c/baabb7f530e8
  - [2/2] Bluetooth: btmtksdio: fix possible FW initialization failure
    https://git.kernel.org/bluetooth/bluetooth-next/c/7469720563e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
