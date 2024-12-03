Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA61D4979A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 09:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjL+wUw7hL0RG+BXF5E+XRb8YCsjE4H8d6jz6dkyZZE=; b=XtzZ61MpAt54gq
	VFSw3EkAGUKnMq/xUsbdy96V+5/GNETJneaYQr1jiXG8cHNKAXeZnBcdk7V4xSturR/oruUQF4dvV
	ZAui/Vq/ZQpxMp5yKCuPoaZ6ULhQcmm1Y7jL3nJEUXaymJ5unFGYsB7GCUblbdMjwAwUHIc6ifN9C
	SPfc1skPR3cQOJ6O/DhwuMBHyJ4Cj2pOW36COGG6XlNFM5jl5P7beeoXNFy1TAv0Nr0WVdbKf8IJM
	hTV/8NSWI7anBUFc9JIrLWTqPIang6DnlfHU7acJg+PaP4ZTnu2KAcZ0cToakdOJA31CXszrzHkvd
	rJW4tuTnx1JV1PKXfM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPf9-00000008znJ-2u38;
	Tue, 03 Dec 2024 09:57:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOn-00000008w3K-3w5w;
	Tue, 03 Dec 2024 09:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218852;
	bh=mJpbSkjVzoHDfQLFDtLkm1khRxur/qCmaVkWOzpjQj0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DDfKz/ftG3q0zPxT9Pwp45e55YQawjSxbDh8DQyGMvzYrLP0ckkkLQXWKfMePcaFu
	 Kyf5bvB4Rba3s482SVvbuSjzq4k3TzyF+n/cui+HYk48O6KhxNwOHRbkk6GoNqwIpq
	 ebfdc/vxtuz6fPXP7pPCgPihKUY8hgtETQ59joKtDyUzYLQIO/ozF5uWlkE3vrdg6e
	 Sy14QvGMd+jn/09h9YYN7gKRKNynu+KdT0JAi56qBd/dzaWtRs143R/T9CJgtIASCK
	 ZoRPxklWgaKsdmKtU+aWGsZsHuaBnL+G0H3QEE+LsmP2AYw13XHqnjrgL2pHn4dlPC
	 IE4HvQrDfBRnA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0683517E35D0;
	Tue,  3 Dec 2024 10:40:51 +0100 (CET)
Message-ID: <fbda4aee-7b9d-4a13-848f-165097032df8@collabora.com>
Date: Tue, 3 Dec 2024 10:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] arm64: dts: mediatek: mt7988: enable watchdog on
 bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014054_146709_7D0E9C1C 
X-CRM114-Status: UNSURE (   6.25  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Enable the watchdog on Bananapi R4 board.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


