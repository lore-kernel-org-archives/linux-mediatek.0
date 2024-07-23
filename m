Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC16C3DA63
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 06:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCiy+NB1GbmN3r8eKCNNv8sp5hMifkiLR85B7rkVxjE=; b=LwKGL2YEIi4ex3r9lW7NTDR+2Z
	v/qnud2WQSUbR2hL01DFT/Cz6joXM1flTFmqX/CYMnQzZaK1qc07+dVmeAS4vnefSvem0lbIohzTk
	oAvEgMtV1GlwwixaHl0YmGVSV0Su/UIhUzWp2edznjZQtGL0DCY++ZTY3QaznoQGy/cQ4YL9G0QGu
	JUbN3GmMgrEce4DZzn3ewFnUdsOF4c+WXV0SQOKZPLAJ3s1HqPMjsGOkwa3hyX3JlrALdJbvzqD91
	xtL27Da2LDp5uHHACxlqv+JI6jB9XlpAqZPZttODhSDKQfjETUbXXsAIydoPujt0Yd0MFt1nD/wyI
	BlADaQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW8rf-0000000BSbV-0NFW;
	Tue, 23 Jul 2024 06:19:11 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW8rG-0000000BSWg-1SbN;
	Tue, 23 Jul 2024 06:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721715522;
	bh=QE4dg2+Rl4ZejmUZbofrCMODSEG0DXtYj15bYB8fnsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wkA35Y1+tzm5M3coifo1WOfsDxD2ADn3Xzl8ob0gx+ru0ApUHPpIiDYJ2IBp5tfQG
	 iFxffGj2kkwUiELJbKcOm2FgU+k1Jp/TXKhHmhv7Lqgegw2+0Gge0ew6xoctIK3QuU
	 nMq0uO9AAB5nJtVn8dMJUQjbOY5Zh/PjcnVZwxcqeLe1XNbGHcrWR0+Cvz2BTbn1GK
	 CVZNUVRn2x1AX9FNzxBKiuSH4K8nsvhRm0oGTyCJSzAr8Cc+rTtst3DVNcUr3tirWI
	 /X1du7VXHdD1Ysj/tI0CBeB+mPqWP+NmeCFiBqbA38PH7Nu6vhbMy7hQK8cO+1Yc8w
	 09v4Rrjf68teg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 94862378001E;
	Tue, 23 Jul 2024 06:18:41 +0000 (UTC)
Message-ID: <89cac5d3-4ea9-4674-b8de-5fe2e5534bc0@collabora.com>
Date: Tue, 23 Jul 2024 08:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add missing clock for xhci1
 controller
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_231847_357980_F4FF5029 
X-CRM114-Status: GOOD (  11.21  )
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

Il 22/07/24 17:26, Nícolas F. R. A. Prado ha scritto:
> Currently if the xhci1 controller happens to probe before the pcie1
> controller then it fails with the following errors:
> 
> xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
> xhci-mtk 11290000.usb: can't setup: -110
> xhci-mtk: probe of 11290000.usb failed with error -110
> 
> The issue has been tracked down to the CLK_INFRA_AO_PCIE_P1_TL_96M
> clock, although exactly why this pcie clock is needed for the usb
> controller is still unknown. Add the clock to the xhci1 controller so it
> always probes successfully and use a placeholder clock name for it.
> 
> Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
> Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



