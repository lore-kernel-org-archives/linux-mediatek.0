Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA91DE77194
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duaHqo4rcr5/cdSqxA2bYcLqZbw37z1X4yp1VCW0WC0=; b=NqWE6C+um/igs23m9gjstBnUtB
	T0vCTkCqCaA4gRT7lQxU2uNDsYKBzpDin1e3ovrIf2tZv9/LuUYgCu6/uxu7ORhrcy+V1caRp9FuD
	BWNSnHXdrGl7ygspCY5QpeVrOvPSb9iOMJxCowIEBWCUPaY8CVDhhnsnjUNgpVWAEnnpNIRTBTDS7
	sSbch7lMyeF/5h9w9Sjs0i/czePDX/bMLuPzCaWvlIDXKBTh2CUw2RjpeL1VU33B0X/0B+4WebKgk
	u4APXGFy3EO2lPL11wHOWgRcv7u79BZdl7IvtVPnIil2yeEeyNXSISBJ110ZJf4apR5n0TMZ8U0BF
	Kecx/dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKUM-0000000AMiI-3jCS;
	Thu, 02 Jan 2025 12:39:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKTC-0000000AMdC-3qMl;
	Thu, 02 Jan 2025 12:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735821513;
	bh=qN3wx4iRobhYPryY9mzAir8xmXEV8TBbYXBnM1/XkGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p7f5xAhdjEvLiZhepWhLcOjuM8QEZRArtvMO74WLJ0Tf7hxtTQIvB9poHaCNhhXT2
	 DlHsJrxsqcQtkFKI/lxVONFCBG8Quho/3BqIALE+Ab7De3AFnt/PvON5cFxmIBgD1E
	 5TigcKZ60oCP4eoRboN0o81dfjXWVePU+rCgb2CjEkjwcfEttehP65U55ecRQxqDBI
	 rRLHt4Ks/KJ3WDy+DBI98yUl92IEmnlufag2dyZeVYyvug95kk8O/gOfxCTRBLCw0r
	 k/VADRUJUFUkoIZfdrSYSRyUduaQOCgQ0VAz02DiFQF5zhh0onF6Ui66CMINjs4a6h
	 2GpHZUehZF1hQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93B9917E156C;
	Thu,  2 Jan 2025 13:38:32 +0100 (CET)
Message-ID: <3d6cf760-28df-42b6-8500-bda6597cfb2e@collabora.com>
Date: Thu, 2 Jan 2025 13:38:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: Use (of|device)_property_present() for non-boolean
 properties
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20241231163121.241543-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241231163121.241543-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_043835_187061_8C0FA8FA 
X-CRM114-Status: UNSURE (   6.65  )
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

Il 31/12/24 17:31, Rob Herring (Arm) ha scritto:
> The use of (of|device)_property_read_bool() for non-boolean properties
> is deprecated in favor of (of|device)_property_present() when testing
> for property presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


