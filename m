Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8273CCD37B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFECpQ9jKEH4Itr3q01FwsjA0ZPadmH2PlMNGsLCxUk=; b=srxjKVHVJZBkYaHmg7RqZDV7ja
	/FE7n45ArUcmehg2Hd5ymm74sKlZrxvmX4a4RBds9zBBpRPlM5AFagueaN0A9txLlTEUt3f6S+GAY
	L5M74qNpYlkwNGBrAQ5+UpFc8V/EPmth740/wmDyCzutcO1nfICLy+PBlo3/eZ0+A5Yk1o0gcD9Z8
	o/1gunajO8r29YXSvaMUJdH1Iz95cKfdC84PY/jUZ4jHfS6yhX98YwVwsATqZtLAZ1HnHI6ILLX3p
	yq+VPyA96mPRLpx0v1SZZ1Cv8DUTiy43P4YlzEuNV6DA6tUMCnF4NMIRLtq8R6uAf5wC91v3EfLcO
	jc+GiSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNV5-0000000D2yx-236d;
	Mon, 11 May 2026 10:04:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNV3-0000000D2y2-0nNE
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 10:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778493870;
	bh=FL9qLXCgkwmy9iRoqmb4/HL6EbPdhCQ2UUOwkSp4czM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lfds2eRwqrTynogzhQHap5dG0emINO2R8QbEXEMsfEJ7M0NbPF5E1bE/RqIbuCyOV
	 sBG2lY2jVyJGtrsitBBQm5V1cPA6vXfISXmoA1mSl1Yjz0THpkY11vjNEPpfIbgK4q
	 Cxxj4Oz1E96AysjqtxwvHtzePzM845ChDSiD0NFm7JqAqCh2g+FrYss7h2UhLT0Hj/
	 XmwHRFMJdDuJKc9A54la4Ld2Boj7riJGgm8+qhvgG/UtXbBzYTmbeADTDwVDH0S/5+
	 8Fgz6x8U6/A2V5n930WGxlI6RMc/3G3alUbgHl4traia3h+S0xMuIgk2jZDS8PG0TA
	 cDX4bTPwopefw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23FDB17E0F7B;
	Mon, 11 May 2026 12:04:30 +0200 (CEST)
Message-ID: <ae9240ef-b5a7-4d6a-9021-e57cd9959214@collabora.com>
Date: Mon, 11 May 2026 12:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260508063633.3894348-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260508063633.3894348-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_030433_382289_F1AEDE9C 
X-CRM114-Status: UNSURE (   9.33  )
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

On 5/8/26 08:36, Chen-Yu Tsai wrote:
> On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> controller memory access could be limited to a small region by the
> firmware configuring a memory protection unit. This memory region
> must be assigned to the PCIe controller so that the OS knows to
> use that region. Otherwise PCIe devices would not work properly.
> 
> Allow the memory-region property with one item pointing to a
> restricted DMA buffer.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Makes a lot of sense, and actually makes us able to provide a correct hardware
description in the devicetrees.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



