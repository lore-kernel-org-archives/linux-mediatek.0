Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89296ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 10:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9lQcZq11G+6BCIkhzxBPg9BXJwWt4czuGElALgxGmQ=; b=blMjAXfGwjzcG2ZJMsFvJquqtD
	uXxM7+GTv8xya9+x6z2ZbmeRQ1o2GNHeLY6UsXdRPla6Aiq8B8FPJij8yqnU6sWTidho1HmWcNKc7
	YmVEjJT8YsIaTSP+Wfsi1ss9bhWvIz0qJupaTMi7UAfsdurL+QtMdMxavGSPHDbEl3fK5DF6CTJbn
	uKOn4qRwPxpWBXx4Fmroelm5HdCq8llCG3jB7Em0tta4XL6y3sxHH1e3vzYpYf1jMDlilJ7mDpcCk
	0lFlZGVo4CieI3Y4Qv7Leo2s4dbIT4dExv2DGnXR9e/HHt9UiN0x3bqxPxZVZWWLrdXIUG5NVrZur
	NaKW5WBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfdg-003aF3-68; Fri, 23 Sep 2022 10:10:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfdU-003aCO-4W; Fri, 23 Sep 2022 10:10:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC1786137C;
	Fri, 23 Sep 2022 10:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E955C433C1;
	Fri, 23 Sep 2022 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663927818;
	bh=aWyTyrzD9f+ZjxoPJJ7uCgUj/UaCAcPqHlu2o62AqU4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=frnZTK+1gkRUEzgP+1Gq7DRigaSoqF4c52MkufVHXziIFFMDVjqFVo2k6mIWMC/+5
	 GSgAXcUqzEQ4xxiNgonrHwNeQtS9sib6g6APk058bza1i+XCXo52CoKS3Av+UGiBEw
	 E0E7AdCFvr+Es9k+ytiu488VDwoYf/mOrnDPWG+fz3VDTqzt2BMqC34mQUNQx28S57
	 Koj+gH+vv0zDSaMYFSDsc9WBCG6Bq9AbdT4b1TShHNea3j8DQbVKMKqeMpcdPbj8Na
	 wSjaXp3IDj2td6KhXd+htRTmbriARp+7qsj/h9a8kjYWCOTLBzgEj3uiUGusaXdxkF
	 yV6YxiUaV5P8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18F8FE4D03A;
	Fri, 23 Sep 2022 10:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next 00/10] dt-bindings and mt7621 devicetree changes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166392781809.11802.14314301597128820257.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 10:10:18 +0000
References: <20220920172556.16557-1-arinc.unal@arinc9.com>
In-Reply-To: <20220920172556.16557-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPg==?=@ci.codeaurora.org
Cc: krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
 sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sergio.paracuellos@gmail.com, erkin.bozoglu@xeront.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_031020_275956_B7603B14 
X-CRM114-Status: GOOD (  10.63  )
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

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 20 Sep 2022 20:25:46 +0300 you wrote:
> Hello there!
> 
> This patch series removes old MediaTek bindings, improves mediatek,mt7530
> and mt7621 memory controller bindings and improves mt7621 DTs.
> 
> v4:
> - Keep memory-controller node name.
> - Change syscon to memory-controller on mt7621.dtsi.
> 
> [...]

Here is the summary with links:
  - [v4,net-next,01/10] dt-bindings: net: drop old mediatek bindings
    https://git.kernel.org/netdev/net-next/c/e8619b05870d
  - [v4,net-next,02/10] dt-bindings: net: dsa: mediatek,mt7530: change mt7530 switch address
    https://git.kernel.org/netdev/net-next/c/3737c6aaf22d
  - [v4,net-next,03/10] dt-bindings: net: dsa: mediatek,mt7530: expand gpio-controller description
    https://git.kernel.org/netdev/net-next/c/0fbca84eea37
  - [v4,net-next,04/10] dt-bindings: memory: mt7621: add syscon as compatible string
    https://git.kernel.org/netdev/net-next/c/862b19b7d4a1
  - [v4,net-next,05/10] mips: dts: ralink: mt7621: fix some dtc warnings
    https://git.kernel.org/netdev/net-next/c/5ae75a1ae5c9
  - [v4,net-next,06/10] mips: dts: ralink: mt7621: remove interrupt-parent from switch node
    https://git.kernel.org/netdev/net-next/c/08b9eaf454ee
  - [v4,net-next,07/10] mips: dts: ralink: mt7621: change phy-mode of gmac1 to rgmii
    https://git.kernel.org/netdev/net-next/c/97721e84f546
  - [v4,net-next,08/10] mips: dts: ralink: mt7621: change mt7530 switch address
    https://git.kernel.org/netdev/net-next/c/2b653a373b41
  - [v4,net-next,09/10] mips: dts: ralink: mt7621: fix external phy on GB-PC2
    https://git.kernel.org/netdev/net-next/c/247825f991b3
  - [v4,net-next,10/10] mips: dts: ralink: mt7621: add GB-PC2 LEDs
    https://git.kernel.org/netdev/net-next/c/394c3032fe0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



