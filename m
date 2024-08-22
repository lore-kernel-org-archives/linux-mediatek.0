Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F1EC5320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6bTHirNf9CFD/Kz2CCOlz6K7mshiDJucIS06ffScgr4=; b=eZqF7hQXBA0BHe
	A03VRZvbWqH2G+c4WO+onSumfmEQh9WaETY2vdkiNPAEbY//MJMfuv8HVNCUfeuJBjcjoXAHTdOqf
	rOfTfPefRg+o7M0DULEWtjmzrn43qoHO8mTVhdtAc6ANDErGvCYajggRo9PnQXUwDKFxYBM3u8pvi
	FJ8W6noDSyDT9ZcK87eV3j5ccmS7MYlTEUQim2dzRDMMb3r20ya6NfZVTaKIYh1A+Ceb/IgumASfI
	PS4XFYJKGZ+JogJ35QRo7bs+EvxgV10MZWM3ASJtM07WaWLT88P/X4A6LePD5AaXH8B2dPrM5hOKS
	oLo57K/eWYKNOlgwdTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh4Ld-0000000CIKO-0RWR;
	Thu, 22 Aug 2024 09:43:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh4Jv-0000000CHk4-04Cz;
	Thu, 22 Aug 2024 09:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7C84A400F2;
	Thu, 22 Aug 2024 09:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7884C4AF0C;
	Thu, 22 Aug 2024 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724319689;
	bh=SKjq0zl1AD3TiA8BotE+oEROoOlk7o+58wKeW4muaVs=;
	h=From:Subject:Date:To:Cc:From;
	b=O3RqG3FiLdw4loGbbg6kIvjj+HdMDMbo1sO+h9qRYZmvP5TM0M76yFWQ+IU0/30Uz
	 qTGzMmA+ivNjje949iZWk62Grxw7+JZd4mZr3f8cq1bmulxpl5Je4cn+GFI3Kxqw/t
	 SugcmBQUVi7Fy68BFEibo6PX2LCZG65F626BL7W1up9DX2DlmQtTZQnfiKvQ+P38pm
	 G8HcHYEdaeEnhVKNKbFZMVXASv9DT+ng0eUzy+C7Wchl1O1hxFbFB3mp3QFZX60DVl
	 XtnQvf4Z87DhPsbucHEZczveADHhzXh8AzfwpxCc0iXlO5aQ4mEMAJUUzLuyT2TQFM
	 RS4RA9UotANcQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 0/2] Add pinctrl support to EN7581 SoC
Date: Thu, 22 Aug 2024 11:40:51 +0200
Message-Id: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMHx2YC/0WPwW7DIBBEfyXiXCxYLwZy6n9UORi8OKguuGs3i
 hLl30vTSj2+w8y8uYuNONMmjoe7YLrkLdfSAF4OIp7HMpPMU2MBClA57SQVa5yWay5x50XqkDQ
 obTCQEi20MqV8fRa+nRonrh9yPzONzxo1md6Sc2FAhzZEJPTWDAHQB6A0xYTOBw+dttD3HhCxm
 /PeLZWp3OrrO3Ghpas8/40xfX416f138d+5XfgxtsrIVFkOUmsZ1iTHHj2lqNyU3PEC4vR4fAM
 0H0o4BAEAAA==
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_024131_166708_6EBF94C3 
X-CRM114-Status: GOOD (  10.58  )
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

Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
supports the following functionalities:
- pin multiplexing
- pin pull-up, pull-down, open-drain, current strength,
  {input,output}_enable, output_{low,high}
- gpio controller
- irq controller

---
Changes in v2:
- Fix compilation errors
- Collapse some register mappings for gpio and irq controllers
- update dt-bindings according to new register mapping
- fix some dt-bindings errors
- Link to v1: https://lore.kernel.org/all/cover.1723392444.git.lorenzo@kernel.org/

---
Lorenzo Bianconi (2):
      dt-bindings: pinctrl: airoha: Add EN7581 pinctrl controller
      pinctrl: airoha: Add support for EN7581 SoC

 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    |  454 +++
 MAINTAINERS                                        |    7 +
 drivers/pinctrl/mediatek/Kconfig                   |   16 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 3031 ++++++++++++++++++++
 5 files changed, 3508 insertions(+), 1 deletion(-)
---
base-commit: defaf1a2113a22b00dfa1abc0fd2014820eaf065
change-id: 20240818-en7581-pinctrl-1bf120154be0
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


