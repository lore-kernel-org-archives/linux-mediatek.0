Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39231D6DDF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2024 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bjk60j8JgfPJ9Kqu8EUeIPF/ifeNVAEm8DnqEc7lNis=; b=dqxtpAHYwE0NFaRDiXw4DCG6CT
	2s3FRP1zyDB8v5K5mNiUbasqHkGLmYYbUD4WksXzhypUeVplzLfbhoKySPVJSUondvvUbxjZJM3fi
	esQRF0bugG6CphE+07B/djQUKz4L8d3/csxn6yy3xQhBqxgc9ijKY/cGhJUKQi3jruFBUAHKqD1x4
	rletUOe2nlp7eTibwHD+zpX6pU/q7L7FL+8uQ5K1CdRbM8JtbpBubiRxyR4RQQGigSzgDw3kprhfX
	NQT8iW+j/zx593y8xpp3ceJzG/eBCcr8ME1I0vROjVfBsdwYvbgawnM3tV4tSgCJgK2mrfHnMaBqj
	VRb8nsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvcx-00000008ZaY-1ZgO;
	Mon, 18 Nov 2024 06:52:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvZM-00000008Ysz-3Fni;
	Mon, 18 Nov 2024 06:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912547;
	bh=zAyH4l+W0XzT3+JqlBBg5UyJnzilg1n4gn9fyjQmO1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oV1KzgsKIo6AaQqvLsV3ismvKgoR0s72ZCDc4W2O7S/fxkX6b12mY6f6pfGZKehJH
	 xwhYkz1BmOf1kB2MS0epf7TF2WpJx8un5VfAsY1FWmwc9WSimiugI3PZ7Ph4ImVMXO
	 bRwUzUNdsIb0Ibn8BJ04gJVqJkUTCHMxHY84MT1pWAWJv6+fi7n0SVG+bPYnlCZsYV
	 5wZ/GNubAcTjrGVOx3HKl8gi0A0AEFxQ3Wr9cunUQcSCz56MDOPB8kyS95sMSeDwqg
	 Hq8dPp0yIFe/CcfgOcUdfiF4r63m7i9KINSJ3vjLizAEP7H2mvI8KHvX1yGm8Fc24X
	 yoDTP2okjTkgQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0AC117E1250;
	Mon, 18 Nov 2024 07:49:06 +0100 (CET)
Message-ID: <f7d69dca-1af6-43f0-b764-38be32aaecd7@collabora.com>
Date: Mon, 18 Nov 2024 07:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] PCI: mediatek-gen3: Add missing
 reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
 <20241116-pcie-en7581-fixes-v3-1-f7add3afc27e@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241116-pcie-en7581-fixes-v3-1-f7add3afc27e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_224908_996769_9AA6E1FC 
X-CRM114-Status: UNSURE (   7.30  )
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

Il 16/11/24 09:18, Lorenzo Bianconi ha scritto:
> Even if this is not a real issue since Airoha EN7581 SoC does not require
> the mac reset line, add missing reset_control_deassert() for mac reset
> line in mtk_pcie_en7581_power_up() callback.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



