Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E66BEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 19:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxL2maDFQPfAszPeVzAOX8ST+D8vTz7jS0a7DVylMgw=; b=tJwDuScleLpV2rLK/ACTwd9d7H
	rTKfiGULtvPE6FoL4bq91kPP9sgrY3UZ7FROPa6HBlTfzjylDGfcDBh62u385OUHpbiZL3hPCBhVQ
	/ffPZ/O3ZiSTOxY+SRpiqYbDHr6q1WzFMFm7Gr73ZyjYSOBZIi5oMHdZWXPPHCEUdalKlGSTwQN+E
	0h+r5TaYSHJfU28GC7DQLBjRWLIMRc+utrs3ltRIWhnr1tM9cgGTMv8KxJNP4Hnhnj9ki4iaW+Ih0
	TfjXs3Sy+ZmF8Et151IYbEGmE2elJqu9+d/GrXMC9qtAezvpe6BvMBwm0Miu3GdlpAlrSNeLQzT1m
	598HgVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qExG8-001wMf-1n;
	Thu, 29 Jun 2023 19:24:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qExG2-001wJS-1C
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jun 2023 19:24:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7268661628;
	Thu, 29 Jun 2023 19:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7B88C433CC;
	Thu, 29 Jun 2023 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688066683;
	bh=jN2tbwzFtwBzzn/Qy+P5/edqsoBeZ3fi508iKgvEF3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ilAzRNspCBmZ3LQIqSOoB+gXOhPg4f2vrOVtgJabshCcF+xo48dPhsyI3kZMJjDqt
	 q9pPHccW1gf/K07W4/oJPE6+YY+hpuPNCrAolTmCT071FD4WmF6xq+XEhUsh2OfY7+
	 eTGiwoXO241vDnhb4ZxZwynoE3iNI970zXQ06P22ycOe4WNPPFwlqItklbExDb4HOF
	 dVZ0rDa5T6AXtXrpJDYF8lJyiJNrXGoyTAJOF0O7QORxfB/5sKRaxWkzJfca52jHG5
	 BYe7ebPQKZdu7nk1yGXQUO8pmk1uKbRAFhv+aDKpRQZpwK5os3z4G7hFnpCPBo7SRY
	 huu0Xm6TmHvFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6FAAC6445A;
	Thu, 29 Jun 2023 19:24:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 1/3] Bluetooth: btusb: mediatek: use readx_poll_timeout
 instead of open coding
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <168806668374.29593.18057977717235081592.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jun 2023 19:24:43 +0000
References: <2d7bef70b876e4cbd447c5109956f716bad5bc2d.1687565769.git.objelf@gmail.com>
In-Reply-To: <2d7bef70b876e4cbd447c5109956f716bad5bc2d.1687565769.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 chris.lu@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, jenhao.yang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, abhishekpandit@chromium.org, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_122447_346951_8AF16D07 
X-CRM114-Status: UNSURE (   8.82  )
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jun 2023 04:41:37 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Use readx_poll_timeout instead of open coding to poll the hardware reset
> status until it is done.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [v7,1/3] Bluetooth: btusb: mediatek: use readx_poll_timeout instead of open coding
    https://git.kernel.org/bluetooth/bluetooth-next/c/c56e5f834e13
  - [v7,2/3] Bluetooth: btmtk: introduce btmtk reset work
    (no matching commit)
  - [v7,3/3] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



