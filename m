Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A724C3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9PndIEc+H3qWSUy3aMPbHnvu7bnqYk9Y6GGxKSnR8M=; b=hA2Oh9p3buJwTfCOgAkghxByJ+
	CuRQUeHruG1P+NEuIYWF1VS3i91/8qG33+NF+/eCO7p64p4RPPBxAfk9FzL3lP9lHCZxJhzW4U41c
	oxhc0Oosi9OdmpuKX1ggYVRTGow2Vd7w6PAZBoHcX5/srgBhzVzwzvipWddU5LX60r8a2aBHbL76K
	Vw4anNqFbgjiA3Uzm4GOp0/T/jYs4N4a6u3WKI6GjUz91Ek6+no85Z37MdhNWUcd1flCgQYaWakHk
	wcL3vtkQMAm+/+M/wIUOThLrcNoxHhTqTpuYRBI6tomz5/B0yNfEjN/LcUEjbdkVVj4pFLeUHruBR
	ujUjF8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj13-0000000EU5B-0TBe;
	Tue, 30 Jul 2024 09:19:33 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj0C-0000000ETpf-18pO;
	Tue, 30 Jul 2024 09:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722331119;
	bh=K++cy+QQYYiPZPo6DWmmBwlEs0caJQ/eUx5pta9W1jU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wka0bnrBABJEJcOvB4V/pfaNdBBdQNeL/CDuf5nkONQc6+d7ik9H8n/H3FVsh0+bh
	 HIqs9huLWBd0EPXrSr0o0zaSiemOnn81eg/xjkPu8ga5S26gjhu7ggcm8p3Do4rzEH
	 fxjUmfmXaoeZS7jkqSJMl9pnoq1LxsoA+NHs1li/0Qs7nTy8H6o01KMjX9b73NGzfr
	 UVDE5W/cAf0ZyylrUC7qO47Fahu2Ghv+iQCMStaSRStnAG38Mt5+ttishxOsYId24d
	 cX37LN3dfrtda4Bp5WrOMW+ejmnIcwSbWnmMcCR70cjhUZKiF3CrK6Oybq6XvzkZiH
	 A3Dvl92/GEP7A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5170B3782190;
	Tue, 30 Jul 2024 09:18:38 +0000 (UTC)
Message-ID: <b5b4c23b-e5d5-4266-9df1-28bc731c469e@collabora.com>
Date: Tue, 30 Jul 2024 11:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt7986: add missing UART1
 CTS/RTS pins in BPI-R3
To: Leith Bade <leith@bade.nz>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, frank-w@public-files.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, didi.debian@cknow.org
References: <20240627075856.2314804-1-leith@bade.nz>
 <20240627075856.2314804-5-leith@bade.nz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240627075856.2314804-5-leith@bade.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_021840_473761_7605D2EF 
X-CRM114-Status: GOOD (  10.53  )
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

Il 27/06/24 09:58, Leith Bade ha scritto:
> The current definition of the uart1_pins pin group does not include the
> CTS and RTS pins that are available on header CON1.
> 
> In the public schematic for the BPI-R3 (titled "BPI-R3-MT7986A",
> revision "V1.1", sheet 4), the UART1_RTS and UART1_CTS pins are connected
> via nets to the connector CON1 (sheet 14) UART0-RTS and UART0-CTS pins.
> The datasheet does not show these nets as connected to anything else.
> 
> These pins can be configured for either UART1 or as a GPIO, with no other
> alternate usage listed in the pinctrl driver. By changing the pin group
> definition from uart1_rx_tx to uart1 the additional RTS and CTS pins are
> included.
> 
> Signed-off-by: Leith Bade <leith@bade.nz>

Fixes tag please, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo



