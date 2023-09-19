Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8A2CE79A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vSLxNKhZiYx+A7tEPj7ExYILtGKiguua3+dtmL8xf8=; b=D8rp7MvovwuomQb+fKuysaUsPb
	I2rgvKNcgSXHp1TBeanuM2hbAvpOnxFtyjFqvcai4uOZRnfnCOcP4qw2JML4bT3Vp94zLqx/iCMGd
	9W0IGKQkgRHIZ4VMRAAFnzVA4Imejx0sOD9f+wS8rk6wmrkhB3yDO5880YZrYLCezLu0dxOGdIDpI
	o94judSEtSicBg7Onque64GtgBzoTDSx1KwguIpmxRQaC4uZ1VTL4+l8G1svz5Am608FO3FB8XHYi
	Orj5CIr8VpVgdKk7UyNSdh8NMmgebgUA+Vm93/G56dS2auNSyEFQn0062NwLtoApEcdT9iENd84BB
	hRsQDBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qieOo-000vRW-0D;
	Tue, 19 Sep 2023 17:20:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qieOk-000vQS-0n
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 17:20:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6B439B81598;
	Tue, 19 Sep 2023 17:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E75A0C433C9;
	Tue, 19 Sep 2023 17:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695144027;
	bh=R4vqRyHRoQtIzZFJgZHfD0lN9R4xtpTt66srcRemzwk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Dsr9DOH05hMsrKhTamix1dMOYKHukxNIZskrLgSBppCLZymlWg0c6tkhI6u/hIiVI
	 78ZaMUCGZX91kJk8eHmJDFSos2oR7k6GSaModEtgaH6dcjbSfKAqXzHKUZyMoIVBxF
	 1K9T+SZ7CZLCB7xIoc0cEhxc9Dlnt40frst6yKLzBsdcQxBT+mG8AuEYIyRgLseaRj
	 c9t8LOu/eflESPmFltEGm37cMMvxZEjmZ0bpdy9Sjazh1dtL/BsDczuqxMgUlaTLVq
	 4wHJpPpmc+WuyAk/pDHaBb7obKQkeNdm5iGGuBwRXGY6SwTMqTPZPoGf/ULl6YH8Zw
	 AOUXww5usSAog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C99E8E1F670;
	Tue, 19 Sep 2023 17:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next 00/17] Add WED support for MT7988 chipset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169514402682.28201.16892377425355269294.git-patchwork-notify@kernel.org>
Date: Tue, 19 Sep 2023 17:20:26 +0000
References: <cover.1695032290.git.lorenzo@kernel.org>
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 daniel@makrotopia.org, linux-mediatek@lists.infradead.org,
 sujuan.chen@mediatek.com, horms@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_102030_601384_15577F77 
X-CRM114-Status: GOOD (  12.09  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 18 Sep 2023 12:29:02 +0200 you wrote:
> Similar to MT7622 and MT7986, introduce Wireless Ethernet Dispatcher (WED)
> support for MT7988 chipset in order to offload to the hw packet engine traffic
> received from LAN/WAN device to WLAN nic (MT7996E).
> Add WED RX support in order to offload traffic received by WLAN nic to the
> wired interfaces (LAN/WAN).
> 
> Changes since v1:
> - introduce mtk_wed_soc_data data structure to contain per-SoC definitions
> - get rid of buf pointer in mtk_wed_hwrro_buffer_alloc()
> - rebase on top of net-next
> 
> [...]

Here is the summary with links:
  - [v2,net-next,01/17] dt-bindings: soc: mediatek: mt7986-wo-ccif: add binding for MT7988 SoC
    https://git.kernel.org/netdev/net-next/c/4518b25c63d4
  - [v2,net-next,02/17] dt-bindings: arm: mediatek: mt7622-wed: add WED binding for MT7988 SoC
    https://git.kernel.org/netdev/net-next/c/f881f2732448
  - [v2,net-next,03/17] net: ethernet: mtk_wed: introduce versioning utility routines
    https://git.kernel.org/netdev/net-next/c/d274d523c71c
  - [v2,net-next,04/17] net: ethernet: mtk_wed: do not configure rx offload if not supported
    https://git.kernel.org/netdev/net-next/c/7d5a72733b21
  - [v2,net-next,05/17] net: ethernet: mtk_wed: rename mtk_rxbm_desc in mtk_wed_bm_desc
    https://git.kernel.org/netdev/net-next/c/bafd764a8baa
  - [v2,net-next,06/17] net: ethernet: mtk_wed: introduce mtk_wed_buf structure
    https://git.kernel.org/netdev/net-next/c/ff0ea57fa30e
  - [v2,net-next,07/17] net: ethernet: mtk_wed: move mem_region array out of mtk_wed_mcu_load_firmware
    https://git.kernel.org/netdev/net-next/c/c6d961aeaa77
  - [v2,net-next,08/17] net: ethernet: mtk_wed: make memory region optional
    https://git.kernel.org/netdev/net-next/c/71e2135967f4
  - [v2,net-next,09/17] net: ethernet: mtk_wed: fix EXT_INT_STATUS_RX_FBUF definitions for MT7986 SoC
    https://git.kernel.org/netdev/net-next/c/c80471ba74b7
  - [v2,net-next,10/17] net: ethernet: mtk_wed: add mtk_wed_soc_data structure
    https://git.kernel.org/netdev/net-next/c/9ae7eca9f901
  - [v2,net-next,11/17] net: ethernet: mtk_wed: introduce WED support for MT7988
    https://git.kernel.org/netdev/net-next/c/e2f64db13aa1
  - [v2,net-next,12/17] net: ethernet: mtk_wed: refactor mtk_wed_check_wfdma_rx_fill routine
    https://git.kernel.org/netdev/net-next/c/96ddb4d0bf2e
  - [v2,net-next,13/17] net: ethernet: mtk_wed: introduce partial AMSDU offload support for MT7988
    https://git.kernel.org/netdev/net-next/c/b230812b9dda
  - [v2,net-next,14/17] net: ethernet: mtk_wed: introduce hw_rro support for MT7988
    https://git.kernel.org/netdev/net-next/c/6757d345dd7d
  - [v2,net-next,15/17] net: ethernet: mtk_wed: debugfs: move wed_v2 specific regs out of regs array
    https://git.kernel.org/netdev/net-next/c/4b7e02bb6375
  - [v2,net-next,16/17] net: ethernet: mtk_wed: debugfs: add WED 3.0 debugfs entries
    https://git.kernel.org/netdev/net-next/c/3f3de094e834
  - [v2,net-next,17/17] net: ethernet: mtk_wed: add wed 3.0 reset support
    https://git.kernel.org/netdev/net-next/c/1543b8ff02f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



