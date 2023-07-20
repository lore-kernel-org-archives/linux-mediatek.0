Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADBBEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qZJbqFph/xSqMlUOGUU7Zj7Cwpuw0uBoqZeujaq2lXA=; b=RjhCeN0JoBzMbO8c6vDCxQFO6A
	qjGrMAn3LEnxg0wpgyVTcXbsqzjM9YE3Ris8XzeorTysU2I93/nI3oA8n0yjUYiDkDO6DtOMiQQ7U
	W57fcwJT8r9ejidmJ6gKdvZ2Zy1nqeFxlOsbhpQB/H/3bSKTgW7IMONQeBXSFCSGi1uqfJ/E+Bk3P
	cGUaQQf0j02TLdUOWhXCo+FEE9Yl7Hv4RRseQgNSx+/YH7gYxbCfpjLUZzLtwga8/iH9KORy0lMXy
	TbTpYuThnsjZAGVr+FsEYrXJkBoBNSi2nwJYPKLPfe1Wd60pfkAu8e/UR/whRb9OjCxu7lJ5wzman
	Ywfm/NVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPnl-00AUyo-0Y;
	Thu, 20 Jul 2023 09:18:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPnc-00AUvk-2J;
	Thu, 20 Jul 2023 09:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qZJbqFph/xSqMlUOGUU7Zj7Cwpuw0uBoqZeujaq2lXA=; b=kxiyUCKDAtEgoUKqTJBIXr95IT
	UST8nBR/Rt6xH0uEP4Bg/aTV95oznJAA2N+hCNMxQhcbyVy3h/CgQmOcxr6YZM8ysoGgkazRvvtSB
	4hyHONb3a1iXgan0VFA3X2VIPvedyxxc1UGlUGhxs85fiJA8diMyXIm6NGkaEDqwTDCMB7lDDrCv5
	8lw7bqExmckqU6cYc5RS21xLUYhImr5jZWg4ZArIsXf+/t6HrqHc7isP33cq0qNIGbaMDccbOMHNY
	e3JG9A7yqTfU33zkIiBkh3wDTPou0PAPKddFrMeTlho8kv6IpsBD7XF6yCJEF0Fb12qft6Q6kXkw1
	DG/Vei5w==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPlZ-00FSY5-2h;
	Thu, 20 Jul 2023 09:18:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B1A2660707E;
	Thu, 20 Jul 2023 10:16:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689844564;
	bh=VQVHxYOM6hnehsm7LQCNWxsE21hJxKDbC6hCV2WtWBU=;
	h=From:To:Cc:Subject:Date:From;
	b=RhAaqN6XdmcSyWwQMcFmjpM+D8oocH0N+atGU5/kU0zIyNRZXT1kIAVdjI5YAL05I
	 cnbBBswGoAMR8KSZE56+43VpxUr7vkxHRUK0hi931bw9X/TQb6kUU2jkCi8YmwFn4U
	 c2mz2kbc+561elz6OGj342ASa/nrYoq54XOb4z9SFisboXnD3gFScqI8CjNUW5gNCw
	 ED/cUiJFpZ39r+yooLTph6lqXVYTQgJNhUQnoXCErmdUQ/A834Hh6Fnal0vRI6hFep
	 tqy66NCviG/BIbc1Jz42Lc8Q1fc5pHPzxdmu8M3KGdqcCqLCYk4st8GKuEv0dsG4tv
	 BfZ9cS7ujml5g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/3] MT6795 Helio X10 and Xperia M5: Display support
Date: Thu, 20 Jul 2023 11:15:56 +0200
Message-Id: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_101810_206628_566127DF 
X-CRM114-Status: UNSURE (   6.40  )
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

This series adds DSI display support for the MediaTek Helio X10 MT6795
and also adds support for the specific DSI display and its backlight,
found on the Sony Xperia M5 smartphone.

AngeloGioacchino Del Regno (3):
  arm64: dts: mediatek: mt6795: Add support for display blocks and
    DPI/DSI
  arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight support
  arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vregs

 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 101 +++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 252 ++++++++++++++++++
 2 files changed, 353 insertions(+)

-- 
2.40.1


