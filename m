Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA41AC3DA45
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 23:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXrjFyYxd4Tu+brriQ1SzWXao9acMM64LvxCvdhJKGA=; b=zrXQTyvJ3yZ4GSo/qftJiT9eHD
	ZVr3/J5b5CCnOi63zLRG69ZhAhm0FSdBmbtjQC9vwjNKjcs9fstQz6caMpwATq7gQQzFdvqWnD3jU
	FiP/6gFf51SsbxatgOmjFL8XdVz3GxXEhGkVnrmFH9u/3l7vAMd1oMtYKDVGwu33epeey0SBo545g
	/WxZuaSvckUB4HbRFHGPgg8P7BRQD8WzJ2/M1JuoAAiy7qisNtjVHo56fgV+3S2FiVhMeBCu+o84W
	AzHkVyv4ufL5NBfiR8jgJrpyuHQoiSJuf1PFnuczQN2FkjeiinVuBUwJKGPL9jHfwAsN9GI7klFYJ
	3MBQRWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQxfu-00000005JgT-0sWP;
	Mon, 08 Jul 2024 23:21:38 +0000
Received: from 2.mo575.mail-out.ovh.net ([46.105.52.162])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQxfe-00000005Jdr-3qKv
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jul 2024 23:21:24 +0000
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.25.15])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4WJ0VY0Y5cz1S13
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jul 2024 23:21:09 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-fbwl6 (unknown [10.110.178.25])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2C4031FE5F;
	Mon,  8 Jul 2024 23:21:08 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-6684bf9d7b-fbwl6 with ESMTPSA
	id v0iVB2R0jGYVsisAHYCkqg
	(envelope-from <andi@etezian.org>); Mon, 08 Jul 2024 23:21:08 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S0035fe8f6db-bea6-4c7c-a49e-c89911f6a490,
                    40F6E8AA96701D23211BDC6B6B1471709A091AEC) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 194.230.248.195
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: sr@denx.de, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 lorenzo.bianconi83@gmail.com, upstream@airoha.com, 
 benjamin.larsson@genexis.eu
In-Reply-To: <b5a0ec6530b76f1e89b699355b946437a2fca5b2.1720478370.git.lorenzo@kernel.org>
References: <b5a0ec6530b76f1e89b699355b946437a2fca5b2.1720478370.git.lorenzo@kernel.org>
Subject: Re: [PATCH v2] i2c: mt7621: Add Airoha EN7581 i2c support
Message-Id: <172048086546.1716602.14236090278283785693.b4-ty@kernel.org>
Date: Tue, 09 Jul 2024 01:21:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 8387109884405615248
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudelgedrvdeftddrvdegkedrudelhedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_162123_113967_9E3AF3CF 
X-CRM114-Status: UNSURE (   5.80  )
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

Hi

On Tue, 09 Jul 2024 00:42:38 +0200, Lorenzo Bianconi wrote:
> Introduce i2c support to Airoha EN7581 SoC through the i2c-mt7621
> driver.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: mt7621: Add Airoha EN7581 i2c support
      commit: fd6acb0d21b8683fd8804129beeb4fe629488aff


