Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C98C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzNJQGa/otQMgZaLcPIknM31Zzvex4DdhVamhPuU8GU=; b=R/bmMFZ4lAcsrGGQPKSx8gGtq2
	YG6AcZ/ei89aH75XN8PUnWqeowU9UCdh1EZuT4LmSOeEeijNNlnZ6yCElZBzykS1lXsyXOMEcR58K
	A6zoKKCkOml/W6/ygL4ZIDOb91yy9kqmIRNoVMMcfBYdKuAjeMyrTeb4ZdsXeKo84XbAFVI6aCRHw
	nf9gyOAC6QNxPDpvHKWB/lHd/D8oD0xedaw3upQveRugMdvpWKxwSruF1n2GN4ZOv4xcplc2bFOLt
	I+d8B+RT6GtSDoVpYK9lyIqq+wU1TYd8RWrQ4ZD7eddzd/G4jXJw30ReEIh4uYsrT6Ohpnck3fn22
	xsbpzFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuem-005uCQ-1D;
	Tue, 16 May 2023 13:24:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuej-005uAo-17;
	Tue, 16 May 2023 13:23:58 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B97536603232;
	Tue, 16 May 2023 14:23:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684243435;
	bh=foW1kt1JaJSONbMV/WAPg236KARkkf+HweAeVo7iH3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fx2dxpK6g4uEwDVMTqdP1RirESsHS5dLWG1M9Cnmjks7UjrIugcMNC+bof40Zar8L
	 GuS1lxWx4mSF59WVNnaWk315b8G5+a1p0sltV7TnE0vQEBFfBVZsMSZyN7QilnV1E5
	 ukf8yX9w+wRoLeRGogBV8uFBNloM5rVu/r4aLX2yxj6uVAIdRUme1Du4Hubu5hMviq
	 WyqFClCkEyJ3WZrgrkTEUR3yTIIVkvyTJeMC+1MhrYYF2Sbyc+/wvcx4CcINFEEnBG
	 PH1ARNUUT8P62hXZ/1gHTf4O4h8uIrWiwjdWDcn1NXe89lbJ4FWRH0TanNjwpPikMZ
	 pFTe8dju68oMQ==
Message-ID: <3cc683e7-28aa-7b6e-1499-3aca953294cc@collabora.com>
Date: Tue, 16 May 2023 15:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek
 devices w/ firmware issues
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, wenst@chromium.org,
 yidilin@chromium.org, Tinghan Shen <tinghan.shen@mediatek.com>,
 jwerner@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 linux-kernel@vger.kernel.org
References: <20230515131353.v2.cover@dianders>
 <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_062357_515389_06F5D7A6 
X-CRM114-Status: GOOD (  22.22  )
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

Il 15/05/23 22:13, Douglas Anderson ha scritto:
> Some Chromebooks with Mediatek SoCs have a problem where the firmware
> doesn't properly save/restore certain GICR registers. Newer
> Chromebooks should fix this issue and we may be able to do firmware
> updates for old Chromebooks. At the moment, the only known issue with
> these Chromebooks is that we can't enable "pseudo NMIs" since the
> priority register can be lost. Enabling "pseudo NMIs" on Chromebooks
> with the problematic firmware causes crashes and freezes.
> 
> Let's detect devices with this problem and then disable "pseudo NMIs"
> on them. We'll detect the problem by looking for the presence of the
> "mediatek,broken-save-restore-fw" property in the GIC device tree
> node. Any devices with fixed firmware will not have this property.
> 
> Our detection plan works because we never bake a Chromebook's device
> tree into firmware. Instead, device trees are always bundled with the
> kernel. We'll update the device trees of all affected Chromebooks and
> then we'll never enable "pseudo NMI" on a kernel that is bundled with
> old device trees. When a firmware update is shipped that fixes this
> issue it will know to patch the device tree to remove the property.
> 
> In order to make this work, the quick detection mechanism of the GICv3
> code is extended to be able to look for properties in addition to
> looking at "compatible".
> 
> Reviewed-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I don't like firmware removing properties from my devicetrees and I'd like this
issue to get addressed in another way (use a scratch register? and check it in
Linux drivers to determine if the issue is not present: if scratch contains BIT(x),
do not parse the quirk) but that's a different discussion which is a bit out of
context for this patch, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


