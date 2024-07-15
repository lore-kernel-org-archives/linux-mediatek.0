Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141A2C3DA49
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 01:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZSN0vqUOGjHOn9Bnp0DoWhHGPm8nrrg7YBOC1MSANM=; b=WRYMn4MjIpL1SmX/mVfWIPbW20
	kdJYZzez+EedfduuS6MRXPbHPSbi4QurQtWF2JV564UVFy53f4qprYBYrhgPsH1YmfErhYls3ci1a
	Av1F1oFS+LYDBnd7Culib8KiKWbxCv9QukLHaUotFdziLFrHVFUTy5GwMLRZKS5tAVVw3Z8LV6aQD
	FLq18Uwpw+aUi2AdF++4DyPRgVuvs/qYV4vKFUpU1Kk54igPOJJy5LzaedhnP+wcahFcfBvOSXjN2
	zMgQOA+WrR7udxAfZn+RPVs4bOCUQRiJKZ5qWgMqdExIHP3xluuyYcePC4eM7Ali2a085ekLcoSJ7
	tfkjCdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTAXy-00000005Xlu-3s9h;
	Mon, 15 Jul 2024 01:30:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTAXv-00000005XlB-3UEQ
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jul 2024 01:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AA6C60BBD;
	Mon, 15 Jul 2024 01:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 184E7C4AF0A;
	Mon, 15 Jul 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721007029;
	bh=3J8FPMqzJIfW3Jf7Y2r8LOIK9hZQF2BFPJ51MsnHNzk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OZft6c1+fNN8JDzJgXEQ4mHk9h9nk5vtr/SMNWdkZaEoO++uiE229d7OQ7UtwQFGG
	 DJ/TGt3xVE90iJR+t3CD2g2wXAC6D1PAxYtLigb+p/XDKzKbvjdAqutWIbv+WW5q/V
	 w5fB3+KX1pJ6XbJ+QoJIxJj1URSp4zKXTA+2LRj4X9eSw60Jq1UhcAYrVyRqK4OGtE
	 3GMIIo15HPwimlNffPhItaP0h76H45IJn3Nr95IqJRieQo+K5RWuuPlaMS68XvCTDz
	 UNdgl21McR6PeRLpGgCbgU5IGofz9wXOPi+JXQeY7eoP7bpQRPhkMUo+6i1wQdnGpJ
	 MQAC+mHl1Hp0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 07530C43612;
	Mon, 15 Jul 2024 01:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bluetooth-next] Bluetooth: btmtk: Mark all stub functions
 as inline
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172100702902.7085.5923916959571954245.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jul 2024 01:30:29 +0000
References: <20240710-btmtk-add-missing-inline-to-stubs-v1-1-ba33143ee148@kernel.org>
In-Reply-To: <20240710-btmtk-add-missing-inline-to-stubs-v1-1-ba33143ee148@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, sean.wang@mediatek.com,
 chris.lu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_183031_947479_8F65696B 
X-CRM114-Status: UNSURE (   9.37  )
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

On Wed, 10 Jul 2024 10:56:24 -0700 you wrote:
> Several recent patches added static stubs to btmtk.h without the inline
> keyword, which causes instances of -Wunused-function when those stubs
> are not used anywhere in a file that includes the header:
> 
>   In file included from drivers/bluetooth/btusb.c:28:
>   drivers/bluetooth/btmtk.h:254:13: warning: 'btmtk_fw_get_filename' defined but not used [-Wunused-function]
>     254 | static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
>         |             ^~~~~~~~~~~~~~~~~~~~~
>   drivers/bluetooth/btmtk.h:249:12: warning: 'btmtk_process_coredump' defined but not used [-Wunused-function]
>     249 | static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
>         |            ^~~~~~~~~~~~~~~~~~~~~~
>   drivers/bluetooth/btmtk.h:243:12: warning: 'btmtk_register_coredump' defined but not used [-Wunused-function]
>     243 | static int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
>         |            ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/bluetooth/btmtk.h:233:12: warning: 'btmtk_setup_firmware' defined but not used [-Wunused-function]
>     233 | static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
>         |            ^~~~~~~~~~~~~~~~~~~~
>   drivers/bluetooth/btmtk.h:227:12: warning: 'btmtk_setup_firmware_79xx' defined but not used [-Wunused-function]
>     227 | static int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
>         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [bluetooth-next] Bluetooth: btmtk: Mark all stub functions as inline
    https://git.kernel.org/bluetooth/bluetooth-next/c/cebba8aa58ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



