Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C394FC46CA3
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJtHUGEcDKuR7kkTtUpsX6LOgT04JYgA5I0TLNGZLd4=; b=4jLMl65LRAhEt+FHDGKhssKTWE
	4vwIRu1bngNTGDgo+aEBPpXZq4e5pSDdcLwyKSdy7tJF2Aljx86vcXn0g5TZgFARcmOR9DGvv++u1
	1/I6Jb/SWBREhN7ewE1/XssiYC4ZWK4mwoMBfAjUU7G3eCIjYwQEU6NnSijnM9WOUpZGWXAwsD/91
	fVessTXMVfDaVxQB9Wvh7wSSijuYWX/pnGcjP345gXFERftXiX61B0CLT7xsB8ZHfRNJlIVgfNCVa
	Uwdbl0r6N0Xwtn5SOY67Mepo+F3iDV+N4vhe/CJYuwzhwh7pzQcK5oNVKhX7XSfCKgX7Hz/CnApxw
	1C5dOz1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vO-004lTB-1K;
	Mon, 04 Dec 2023 14:27:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vK-004lR0-2J;
	Mon, 04 Dec 2023 14:27:52 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DCDF16602F41;
	Mon,  4 Dec 2023 14:27:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701700067;
	bh=V9x5XsnAYvTRabg/WvQRDL3w7N8rufl/OG+QWOqronQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hir36KpxRDGhkVeELLiLNB9qCCq2/X7ZoUG6lyCWRfccnF6rhMDrBYZH2QQAXgV/J
	 79sw1Slt214xnYDOGqS/AOLHx3+Nf9ZYZ+er3XX01IUWqczOp7ASEaOxASa9lBhyqh
	 EUDo2Tcl+O/uxc04HqwDYK5Adehm76h6zw3Yczm95VVhKlU6geoDku+tJLh/Pk+gyF
	 VDlBXJGGwhZ7PXnGH8OjZgp1GUF3j+7MtLspBjDff6nOLPPiRHGK+P14HpcYopxtej
	 3FCeKN0L9fUoGh1LRaGhbU4PIw/DM5OPSCY8eBGg0nz5PTiM0fidwWNA26nWGGiHHI
	 tGmL71pD8OWIg==
Message-ID: <e68dddc4-7175-4457-9882-6403b09a1e8b@collabora.com>
Date: Mon, 4 Dec 2023 15:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] arm64: dts: mediatek: Add MT8186 Magneton
 Chromebooks
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231204084012.2281292-1-wenst@chromium.org>
 <20231204084012.2281292-10-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204084012.2281292-10-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_062750_877790_EED56367 
X-CRM114-Status: UNSURE (   9.43  )
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

Il 04/12/23 09:40, Chen-Yu Tsai ha scritto:
> Add entries for the MT8186 based Chromebooks, also collectively known
> as the Lenovo IdeaPad Slim 3 Chromebook (14M868). It is also based on
> the "Steelix" design. Being a laptop instead of a convertible device,
> there is no stylus, which is similar to Rusty. However Magneton does
> not have ports on the right side of the device.
> 
> Three variants are listed separately. These use different touchscreen
> controllers, or lack a touchscreen altogether.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


