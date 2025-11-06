Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F22CCFA03
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wX3wSpLeAzO697fsplyurLl9Lt48ZtuYBwgscS8Zd4Y=; b=bZB9TR8/w1eVWH
	CTvDqOvEA+otwMJ3Dg4VwYZq2RBi88zpuHg01OlVJxo5x5YwRNPX1pyQnMUMpbfyx37asBgEBjWcn
	brx3N04Q5XIXvQzMyBh8AXrg41jumwpdWj/2/d4ZC6wbG4MEEpSyBfMDKedDeMffJCv65BnJnQ6PY
	2I9yBG0UqA7aK+ioZa1xQDMh7ivAVpJkzGnMxm/O0MWfvnsE4358+6v4cNh5DgwqSKa/L5AF7gbx1
	dtb8PrTElytgDCN4WHHrIcd9Kgx9hxt4Z9d5Ywt33Rs+4nEtZGQnmnwzg7K+yNLLEk/7SHPXH3632
	dceZL67nNwsQ6srl+0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvwS-0000000F7eS-0RkL;
	Thu, 06 Nov 2025 09:06:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvwO-0000000F7dH-3P1u;
	Thu, 06 Nov 2025 09:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762419957;
	bh=eD0rL65tW8KTbO/83c/0IXmvaTMOrDt+ULFQsqK82B0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z/7D3Ge/ggB5syz3wmbUdcRsuAECjEbwHTdaGWylKj2ZdK23tZU2DB6vIiqSZqcAQ
	 UsjphWouQUYKqrAjPmMCywqjWQkxSINNBgXd1dafQ9Mr7eLhIwulM0AVQkXUl8ZCUf
	 6wkTsaVhy+BqsG+RtQRIXsCwoVCfGCzk1l6CfwBdq807RfSsODFjYh9p6Yq15lJeov
	 W2ZW1JmI9Hr22qzLb9Qc+KMAY9HWq3m1/BYg8VEv6AfhbiAOtLoa3dWgKWjCGh65Ew
	 iHWJ77co8exGRwGYfLc7t1IUot4WHv+uhayC8uKMYBqlamMU5QKlPYd3P/zKVeVGi7
	 Tu/rEkrz8OSCQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2EB617E1396;
	Thu,  6 Nov 2025 10:05:56 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20251105195007.199229-1-linux@fw-web.de>
References: <20251105195007.199229-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v2 0/5] Add Bananapi R4 Pro support
Message-Id: <176241995673.33143.16010766516310474191.b4-ty@collabora.com>
Date: Thu, 06 Nov 2025 10:05:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_010601_455120_FE13887A 
X-CRM114-Status: UNSURE (   7.59  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 05 Nov 2025 20:50:00 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> BananaPi R4 Pro is a MT7988A based board which exists in 2 different
> hardware versions:
> 
> - 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
> - 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[2/5] arm64: dts: mediatek: mt7988: Disable 2.5G phy and enable at board layer
      commit: 0e5d9e529383688deccce632c713692e53b31cf6
[3/5] arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro
      commit: f397471a6a8c2b621e1fd06430fc528ab3925422
[4/5] arm64: dts: mediatek: mt7988a-bpi-r4-pro: Add PCIe overlays
      commit: dec929e61a42ed5d6717d3ec2b6a7734c2ab825b
[5/5] arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays
      commit: a58c368067417f3d89b92ccc18fa0bb610b34349

Cheers,
Angelo



