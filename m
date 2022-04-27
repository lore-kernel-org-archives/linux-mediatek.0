Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3030BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKJEQTI0QMTh7SXgdvAv8UkcHs9IakPUrs5OTeOSFbQ=; b=MGOW6XB+HBwt2z
	YYUndWnkwWJI2UWPF7pliW61+nsiVtNDlZh1og1I0xPjSkh2A6Ag2GADww3pKs3hz4yhEavbgVeeG
	6GxFhv40tdOFsRNRffQgnefbiZxzD0njdewSIIH/F3UmvQGc24yLSorxNZrYHgH0S8EsAPzZgAdxQ
	Aunob5eKLZQKFPq0z6uC1ea+GFt7Rn4PiGAq5Yp1zfQBZYI64+WW3yCezj7AbetFCFr+aEmhRHkWs
	jb0v1kAwslQcWp5zh7HkfVR7OR+32/L+JEU5BYwjjQw3e5vlbTXxlrg10UqzLWaxWFu7QKCjVCkSq
	bwRHO6tMWBuZkErXKKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njmtj-003Cin-UF; Wed, 27 Apr 2022 19:00:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njmtZ-003Caj-Cl
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 19:00:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 752C46122F;
 Wed, 27 Apr 2022 19:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAEE3C385AF;
 Wed, 27 Apr 2022 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651086011;
 bh=BR8Nx5V0ctF4VhQqy59tGJCpM99Usfg6y5bXRmiMcUE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=APZkRWMJTnxGEVNnIEjEvi5wwO1L7qm5TyI6nzt+XU16+Aw7GgQT/QLtiFlH/Nv2s
 RjGxhZserePOc/zKKHOy84W+8RNvzIAc2knWKXi4Mz1yvRxVAng+t7Q3as4rhB7vBS
 drqSEtJnHAV7hiaci/EjLSLccGZ8QqM2/VLnlBj7q4rnOoTrKKJPt0ozZCBzGnBppx
 Q9zheUXwtzFVE3KJis8O6MQ3L+rm8yJ4dD76sOJOAkGI7qVImHQ8cZLSKY4YjvBN2y
 d3FuRw8GDKlZrpdoRvSz8WITMbjokXEdrfHqR1b0z3Ual4Ox7rqd95HQNqJB2J+df3
 N4SsZQ6C8njJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BB4FAEAC09C; Wed, 27 Apr 2022 19:00:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Bluetooth: btusb: Add a new PID/VID 0489/e0c8 for MT7921
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <165108601175.12854.4715052613865968017.git-patchwork-notify@kernel.org>
Date: Wed, 27 Apr 2022 19:00:11 +0000
References: <1b7d9428ba0c6d572d7da1da166240833350786e.1651082524.git.objelf@gmail.com>
In-Reply-To: <1b7d9428ba0c6d572d7da1da166240833350786e.1651082524.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_120013_495944_8B59327C 
X-CRM114-Status: UNSURE (   8.88  )
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

On Thu, 28 Apr 2022 02:38:39 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add VID 0489 & PID e0c8 for MediaTek MT7921 USB Bluetooth chip.
> 
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add a new PID/VID 0489/e0c8 for MT7921
    https://git.kernel.org/bluetooth/bluetooth-next/c/48b57999e387

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
