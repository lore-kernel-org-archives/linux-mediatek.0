Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE6DCEACD5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l7HyL4pz+v/ZXpYXBLhXa5AV88rREG3pS/xZkYxMak=; b=DOla1p2HPEBSCPpMufzKvfeEY4
	5lozYqNS5YRvjr2s3lCJLZaoMC264ezmcwuXPyycbiR8gGB3AOj/6Q8moELYeUdl/Dxn4OZuc/UT4
	DcacHizVnijcGzt1n1v2PYj+G6LPb50eRz3azr/VvsRFt+hLRVsei8ZEKgu9R5HY5BPxzNYMHLhm5
	tNsZpjtgaAxXCLR7XWIoNb5NSpUwAnXtmzCBeFGVq+wu9elig/0mTqZ3IZUMt77X1NGSEkh+V9Yv3
	KeBzQZsPldmEFlmRKSN0tJfftGJh1g/kzKaJY9877TVzPBbsLBCkYpjKEA2wnYTKPhENS++lPY9oY
	DEnBgf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svehL-00000003JYb-3XAk;
	Tue, 01 Oct 2024 15:21:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svefw-00000003JKl-30Eo;
	Tue, 01 Oct 2024 15:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A77DE5C1002;
	Tue,  1 Oct 2024 15:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAD3C4CEC7;
	Tue,  1 Oct 2024 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727796031;
	bh=6N1tRxX8RZ2vhrq7MpVJGZcbKR3JqwsEu+rl5uddPWU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mnSDJ7deY7WgSx0gAnPssQH9SwvXc0u74ZMfGK1R2ra30KnHJdukGiipmmVFvqskl
	 ptlmnGChHauBggOn2Vv7uMWJ+CgPKoiz2BLyAvDxtLEJdkLZRyOyqqTutEr2JRuW7B
	 2dF1bfDirQRdzF4D+z79XaWNd0qnxg7OIpHJdb6oru/kBLS5tassd4mXt8GnTdZeD9
	 s+cjK8b7VRQMzzr6B4hLemNw6a6hBulwcSoRDeensAEHD6XsnhCt+IX3IcbhZ/mE1E
	 tISpH1v83TMTz4u+xl4lDvHo3IT9bTJ2X0Rgf4/ZXQQk4gtZO+N78JI9dv3kmKCoA+
	 5nWhLxgR4HEww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDB9380DBF7;
	Tue,  1 Oct 2024 15:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] bluetooth: Fix typos in the comments
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172779603451.424883.16063021833718946577.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 15:20:34 +0000
References: <20240929085727.523732-1-yanzhen@vivo.com>
In-Reply-To: <20240929085727.523732-1-yanzhen@vivo.com>
To: Yan Zhen <yanzhen@vivo.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 opensource.kernel@vivo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_082032_835364_DCB5A636 
X-CRM114-Status: UNSURE (   8.21  )
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

On Sun, 29 Sep 2024 16:57:27 +0800 you wrote:
> Correctly spelled comments make it easier for the reader to understand
> the code.
> 
> Fix typos:
> 'fragement' ==> 'fragment',
> 'genration' ==> 'generation',
> 'funciton' ==> 'function',
> 'Explitly' ==> 'Explicitly',
> 'explaination' ==> 'explanation',
> 'Tranlate' ==> 'Translate',
> 'immediatelly' ==> 'immediately',
> 'isntance' ==> 'instance',
> 'transmittion' ==> 'transmission',
> 'recevie' ==> 'receive',
> 'outselves' ==> 'ourselves',
> 'conrol' ==> 'control'.
> 
> [...]

Here is the summary with links:
  - [v1] bluetooth: Fix typos in the comments
    https://git.kernel.org/bluetooth/bluetooth-next/c/89f69afc2c4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



