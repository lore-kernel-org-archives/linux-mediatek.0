Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E47C4167B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCE+BGeclT24eVgMUwbYaLcbiXIEWePzCW1+Vav2X7w=; b=s0XR1mMX42zQm+c0l0T9ntji7M
	M6ohdwmwSBO96JzAkFvCFUqZJPNvP5FbafTlEaxVRu2gVkTNCAFg8fNgaF7mcTsHsKVLCbv3z6rCG
	V7hRi/Do29jSyGTgRKPaaz1tKdI2ivgXUykTB7ZHBmdoh0hLEFJaH6uGODoK2BRGlaXfq2qBD2zNA
	4EHHG1EE4Hui9vSb7ksPMhSyWfu5pyr7VhHgLzTy/Zswyeoi/nQqGZ0Gk0WmfVcetX7XZVEPYY3u+
	mjHTgw03q4wiRObSeqtAo5GBzfMxHdEEbOScB7C3X67XscAaTFOxnia8bq2RrrHZBvtLwoAXFgkR1
	wyCCHtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7NaL-00G7Ux-2M;
	Sun, 26 Nov 2023 22:26:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7NaI-00G7RD-1I;
	Sun, 26 Nov 2023 22:26:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 945A660F6E;
	Sun, 26 Nov 2023 22:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3C8C433C8;
	Sun, 26 Nov 2023 22:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701037596;
	bh=WYWHeUOvyvzljTzqy0dHZNjOtP4h9rbjEwP36PpU3qI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UFVwuBD+/k7MMP+f0hM6mEmyn9+uXqakr0oLim/czrNpsPLNUal1bRwVX2Mn/KB/L
	 S/5DhaEjz3X7iZQ7T6AUaFFbjjkDQbHHnpqPp+bx7td/3ZiKhDxiMxJtvh1z7mG5FW
	 q9SnfiTB0L5mk1pZDvufkehsnuQdmGsO2KpaQKJRCCPj4tVOP4WYxrEpMFeTTOCSJ5
	 FtIQ1dwZHh/0uKJASBMEPW0GHK1whKjiHYSz3pt6GX11CUpD2I6xPECpu/p2Jr9bOJ
	 +vv9oIZYguLSUQvBQ9sj1ylaQvC1mDNk/CtbXxXH3xek7ZhiWlT72I/fmPxiL7nMsm
	 dastMCp0EamLQ==
Date: Sun, 26 Nov 2023 14:26:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: "kvalo@kernel.org" <kvalo@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [BUG] wireless: mt7601u: probe failed with error -110
Message-ID: <20231126142634.3a100e2c@kernel.org>
In-Reply-To: <Bnwq2et4CBU1_MS8X3rFeejMDmKf2dr_BNq60IzBcGKbjTxHG1CjJ0zB_wZjn8_iLJsi7fCx6_Eh01ozYBqPA-cEZXMZE_X98E0b7yotXCg=@protonmail.com>
References: <Bnwq2et4CBU1_MS8X3rFeejMDmKf2dr_BNq60IzBcGKbjTxHG1CjJ0zB_wZjn8_iLJsi7fCx6_Eh01ozYBqPA-cEZXMZE_X98E0b7yotXCg=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_142638_512076_A71A1806 
X-CRM114-Status: GOOD (  13.45  )
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

On Sat, 25 Nov 2023 13:03:45 +0000 cristian_ci wrote:
> I'm not the only one to have experienced this bug. I've been
> suggested to report that to kernel mailing list by linux support
> channels.
> 
> I've tested this bug against upstream 6.6.2 kernel tarball from the
> latest stable branch [1].
> 
> To solve this issue. I've also tried to patch mt7601u driver
> disabling mcu calibration. Which doesn't seem a wise idea because
> apparently it fixes probing but also hangs completely the machine
> after some seconds (so, it needs a hard/forced shutdown).

Does it work with the vendor driver? The upstream driver is just 
a rewrite of the vendor driver, I don't know much about the device
internals.

Maybe Lorenzo or Felix have some ideas.

