Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE633C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 05:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFfs0orbN5y3bQTlAEEE7QQO+hZJLVfovULcq9xsK0I=; b=ZYWMBomQ/dbX+JU861pKuhlzu/
	CHXDbo6/1SSxhMU4KHgbbx7gJRWUbqrUcarjKPw/fQbkWOT32PAgNwUGTXny7ZyNj/gBJBTNop3jb
	IH3ve3suw8Ai8IOxYI7/zY5ikIXD+P9j+ED7JOPvRhclc8mGe7UpNZeERIwWuSoIvH9+QTkID/OsB
	i0AwM1FPPwd8M5HWbRbOAdoao0TCMe8acYpiuGMkECY1IpCsytWtMRUf2zhR+Y+iWamE3syMzVoc0
	PXVz8otgB8bZNzRV1lSEiUFjtP+tIUWnZhZtlwQYIgwZ2f9hSJBid0fDUi25FphDRyvPuNzISi0UM
	KwhlXV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdPSX-004Cvi-1X;
	Sat, 18 Mar 2023 05:50:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdPSS-004CtX-1E;
	Sat, 18 Mar 2023 05:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 92FE9B82795;
	Sat, 18 Mar 2023 05:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AE0BC4339B;
	Sat, 18 Mar 2023 05:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679118621;
	bh=X9jLTCOj/QrhXJoewqZu3CTZ44CLvQuS3K66vUbZFv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uV0TU/xThuEgCMUeDSs4ydAC88Ludz25HMWjJyB+/549XIuT4qSdKih/5mhlyU3r5
	 pxP+mAvntE8uES1EW5jqfL5jpQlN2tfFmlNKGOMGuX4LbNQHqvVbz306XMcMJZ6hLK
	 25JBdXquercnJNoG6rIlB04ffB3YhUm2vD0HMoxZcx2/iaPX6fbCSHU1X9jBKP9ERs
	 YopQDc3BaLLdd0YhL0gRS251ibCn+S67ENX7kFYCazUh22cU+Uh886dI3ZNHDzfrqw
	 gThS6bWZ2syqU5FxjOP95UcwWtnZM3yB988CQis5TnqcsutlMHoMMDXraB36BAYkiM
	 ZlD8xNivrP2xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1984CE2A03A;
	Sat, 18 Mar 2023 05:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8] wwan: core: Support slicing in port TX flow of
 WWAN subsystem
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167911862110.13068.1126672029561988812.git-patchwork-notify@kernel.org>
Date: Sat, 18 Mar 2023 05:50:21 +0000
References: <20230316095826.181904-1-haozhe.chang@mediatek.com>
In-Reply-To: <20230316095826.181904-1-haozhe.chang@mediatek.com>
To: =?utf-8?b?SGFvemhlIENoYW5nICjluLjmtanlk7IpIDxoYW96aGUuY2hhbmdAbWVkaWF0ZWsu?=@ci.codeaurora.org,
	=?utf-8?b?Y29tPg==?=@ci.codeaurora.org
Cc: m.chetan.kumar@intel.com, linuxwwan@intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, stephan@gerhold.net,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, ricardo.martinez@linux.intel.com,
 gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, oneukum@suse.com,
 shangxiaojing@huawei.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lambert.wang@mediatek.com,
 xiayu.zhang@mediatek.com, hua.yang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_225024_582173_422BD076 
X-CRM114-Status: GOOD (  10.01  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 Mar 2023 17:58:20 +0800 you wrote:
> From: haozhe chang <haozhe.chang@mediatek.com>
> 
> wwan_port_fops_write inputs the SKB parameter to the TX callback of
> the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> have an MTU less than the size of SKB, causing the TX buffer to be
> sliced and copied once more in the WWAN device driver.
> 
> [...]

Here is the summary with links:
  - [net-next,v8] wwan: core: Support slicing in port TX flow of WWAN subsystem
    https://git.kernel.org/netdev/net-next/c/36bd28c1cb0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



