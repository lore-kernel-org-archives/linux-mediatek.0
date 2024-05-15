Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3507C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 05:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR7f9V/iTgv7DH3sO+x6YsdmBLjEDNqeJUzrhK30ZYU=; b=mq6Ry726RvgHvhO/98kxynaA7w
	FujDtihdhDx+OVLIiTUNukL/HERfwh5XrZX0FEghmnGyhYpBtDp7xvnr7Lq90+YGaVz5OIRtXBAYH
	gZ/f9IyvzPfSzhC7i4UMmJOKeK5Onmqo8q2iR443GDdY/wSg5SosOzX7TozfYHxlPSNb2mM9x3mIG
	OOUePy5xBKe/JW2NR0AQBfjVcRKShI+zr4Jqxevvd9oK081BuM82s18Ds7wRg5Yz/o47Yc6qA/rX/
	3fP5lj3Q/dCKEDUs42I6KdmmmvMoJV7HuHDjaAgBp3qy0i+kJmDeFt1aJzoy5httgOQrX/b2JtYaX
	wECxnAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7725-00000000V4a-0ItQ;
	Wed, 15 May 2024 05:18:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7721-00000000V3g-0kuI;
	Wed, 15 May 2024 05:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6164BCE12E4;
	Wed, 15 May 2024 05:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FC3C116B1;
	Wed, 15 May 2024 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715750301;
	bh=pfGH+jZh96pLnw4AOvxaMZ9eBTglQ+T1HiwE848Yk3E=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V2eiE7ruo0tGAGMwLasu7rmCOrV00BqN3Zt98BuZfOuqBuyWInZt0/vKTst7Ib/ft
	 QnFFDt3al5+S1xF7UgnabhgchQsko+cMMErRtvGUbYmuKmfx8fCI9uqlMlur3cE0I0
	 H1nuno4m9bYoM2RUwqhmsGTLhgi6Nsok1S28dnfUKLeIahig+qACKWtuzAB1MVYeQE
	 px+ASAGpyJ/gCnLu2FNElh4NmdmWlGn85yOIRrVXNgly7Sie+7dIMLwSewx+Lk9ZgJ
	 92qBxuc6LX/bT1rW0IbrB2REq3c2SZiuLMBpaSavGVJ5E56Nb/pF4K1NnUvai41dUU
	 A2WWhovzEawbA==
From: Kalle Valo <kvalo@kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-kernel@vger.kernel.org,  linux-wireless@vger.kernel.org,  "Linux
 regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
  linux-mediatek@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Felix Fietkau <nbd@nbd.name>,
  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean
 Wang <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Peter Chiu <chui-hao.chiu@mediatek.com>,  StanleyYP Wang
 <StanleyYP.Wang@mediatek.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
References: <6061263.lOV4Wx5bFT@natalenko.name>
Date: Wed, 15 May 2024 08:18:16 +0300
In-Reply-To: <6061263.lOV4Wx5bFT@natalenko.name> (Oleksandr Natalenko's
	message of "Wed, 15 May 2024 00:43:40 +0200")
Message-ID: <87le4birfr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_221825_904381_2ABE1325 
X-CRM114-Status: GOOD (  11.83  )
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

Oleksandr Natalenko <oleksandr@natalenko.name> writes:

> Hello Felix, Lorenzo et al.
>
> With v6.9 kernel the following card:
>
> 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E 802.11ax
> PCI Express Wireless Network Adapter [14c3:7915]
>
> doesn't work any more. Upon mt7915e module insertion the following splat happens:
>
> mt7915e 0000:01:00.0: enabling device (0000 -> 0002)
> WARNING: CPU: 3 PID: 1648 at net/mac80211/main.c:794
> ieee80211_alloc_hw_nm+0x9a3/0x9f0 [mac80211]
> Call Trace:
>  <TASK>
>  mt76_alloc_device+0x24/0x290 [mt76 46e2c4f11be089903469a4d6045c71cb7842b4cd]
>  mt7915_mmio_probe+0x33/0x1d0 [mt7915e 9657e1926e619568545a08636674805d5e665c85]
>  mt7915_pci_probe+0xe1/0x3a0 [mt7915e 9657e1926e619568545a08636674805d5e665c85]
>  pci_device_probe+0xf0/0x2d0
>  really_probe+0xde/0x3b0
>  __driver_probe_device+0x78/0x110
>  driver_probe_device+0x1f/0x130
>  __driver_attach+0x91/0x1e0
>  bus_for_each_dev+0x105/0x160
>  bus_add_driver+0x137/0x270
>  driver_register+0x72/0xd0
>  mt7915_init+0x44/0xff0 [mt7915e 9657e1926e619568545a08636674805d5e665c85]
>  do_one_initcall+0x5b/0x310
>  do_init_module+0x60/0x220
>  init_module_from_file+0x89/0xe0
>  idempotent_init_module+0x121/0x2b0
>  __x64_sys_finit_module+0x5e/0xb0
>  do_syscall_64+0x82/0x160
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> mt7915e 0000:01:00.0: probe with driver mt7915e failed with error -12
>
> and the card stays non-functional. Re-inserting the module triggers
> the same behaviour.
>
> The following condition is triggered:
>
>  794                 if (WARN_ON(!ops->add_chanctx ||
>  795                             !ops->remove_chanctx ||
>  796                             !ops->change_chanctx ||
>  797                             !ops->assign_vif_chanctx ||
>  798                             !ops->unassign_vif_chanctx))
>  799                         return NULL;
>
> This worked with v6.8 and earlier just fine.

Thanks for the report. I'll add this to regzbot for easier tracking:

#regzbot introduced: v6.8..v6.9 ^

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

