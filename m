Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA37CC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fgoqr7zM/LoMqMaxauICeu9TAFzJZ5c43NcttkyCA3o=; b=u9XvNbzNy+GCv1DbDVOSnnfg+S
	RMkqvdX19fkxObEZRd7dadOsJrq5+HKMd+f7QDbDnsFZQgUlkLtindsiKvdV2Wd87ChmlMrKak3wZ
	uHGCLTlP5ZOYUvjDGL+m9QnRyMokfDZ6Rje+uT2uBqfcJIFzjm5VFGCZ0th3GM1zLnuPIqyFmPIl2
	kU0NF7FYgJu5svUqR/xGUG0h8maxhoEOcb5YA1B30SJsGD2vmjYka2EBNjHlZ4G84Z0C1uYDAgjkO
	18QnMPx5COedWULMC8Ne8gC6vSauUi2MHzS5AEEYdYsg6Z+zBwla1y6Y3ZgSLAI/38xHPaJIY/m9I
	t5737w0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4H7G-00Gbcy-24;
	Wed, 31 May 2023 08:23:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4H7D-00Gbc2-1L;
	Wed, 31 May 2023 08:23:32 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6EE4A6605840;
	Wed, 31 May 2023 09:23:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685521409;
	bh=QJJfRgbF1c9dgsjXGl4uw2rELU2wPtTiuT9g7crBEQ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KticNSratfrZh1EW/aI6qGYOize5LrGr7VLm10c2Gg7HPksNXOIKrYk99nXtlc8uL
	 FKISYjA3PdQ/YJAzsfpzJagMzTH/SpeDtERqcEIxdCpm/jYse3TuXuTyv5RjpYS3B9
	 DGUoUQxPl4OdyrYXcb9dD+ImXeYHYEQjTVyyrs4dTq23P4BeONPne/L8VuTAYds8In
	 dF34hzB1YeuHaLALzFTUNPYjuJ+a4FnpibxL8wc9sexhjwfmkzeQX4NUhHbjOj2QvU
	 /R3qy8KOpWUFQPVbrxX7prNipHKYdWtuk8BlKkx6VrUOBRCbt2nxY4gBkNmFV+jau9
	 qTgn4fgWTXH7Q==
Message-ID: <3c2e384b-a6a0-25b6-5ea0-78ad24377bd6@collabora.com>
Date: Wed, 31 May 2023 10:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH stable 6.3] arm64: dts: mediatek: mt8183: kukui: Add scp
 firmware-name
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230531074421.888652-1-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230531074421.888652-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_012331_587796_DC078322 
X-CRM114-Status: UNSURE (   8.13  )
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

Il 31/05/23 09:42, Hsin-Yi Wang ha scritto:
> The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.img
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Since I have suggested to backport this patch to relevant kernel versions,
and seen that this patch was already picked for -next:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but you haven't Cc'ed the stable list, please resend with

Cc: stable@vger.kernel.org

Thanks,
Angelo

