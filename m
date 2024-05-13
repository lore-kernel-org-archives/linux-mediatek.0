Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A044C25B10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUEm2yA5QWTQ0N7GwKDENzD1O7bUJDClAT9F61hq+ZM=; b=SmQDvhwGGMgXJg
	Rbbn6XQWmzgvq2bVOIzckFoKDV7GHSy18wN9+8Oms7NfwBSbbp8WPNeA5ES+MMuO54Q24HDCZ9eB8
	TMlBlqM5nYTp8hVGwblDTDZRDk2vvhq78CfH+Vsxy4s6CKe7d3x9QLgBCBz2Wuk1O2NT7rCxs9zwk
	RPZPUT5YN3B4rWuFB6Xso69KtO4GnOQPM3aJN10O9mEMqw2RaNpiCpoCVSsNbqfcV8zDOWp8Z9bYE
	NhbN3rMJErdBcru8UtfZyOfIGtmZU9miKt741IFQJrUhlPc7EXLFF4hZunhLGFyvepg1Nx8TLcY6S
	zrGesuJNrqz8YHXZREUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VO8-0000000CvkK-28T3;
	Mon, 13 May 2024 13:06:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VO5-0000000Cvig-1sDc;
	Mon, 13 May 2024 13:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715605596;
	bh=/Eyn9bkH5uoTKww4e9w5tijFhp5wmymIjSTpXFGepHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RH/1CAKa1enDROjodfX18vOgP9pZ7PFlTktwN5ISlQGt93tgVOI3O6SLI9OJqh46y
	 QsrPDKVwoyf9ZhqG3HEOTWaqO2KLDYrrmHLZnjyGbHoMUKR/NMtG+LzW1NZNNpSKVr
	 5DJl7o8Yruis5fCyVYZ4LicMK51zs2YpZAn+quzWarB31aXV5dqCSeGQm6kRUSXRiU
	 AwAVby/LufM0XWqtm4fr5EmVxWnYsuQ3C4M3M5+pz1G3s8QXhPccW+J65xTLvtoqW7
	 r/EHIqlF+nYjbhXu/ZcOFea9GeyiPVTkfeoBSavfbwMoPwNSA9dbgkn7LyrR9eruc6
	 kYD/jn0+NzIUg==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 91EC53782139;
	Mon, 13 May 2024 13:06:33 +0000 (UTC)
Message-ID: <a7a20d35-f566-4c3c-aef1-cb7a0f349cf6@collabora.com>
Date: Mon, 13 May 2024 15:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add BananaPi R3 Mini
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20240510095707.6895-1-linux@fw-web.de>
 <20240510095707.6895-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510095707.6895-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_060641_708127_5D0C43A2 
X-CRM114-Status: UNSURE (   5.05  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/05/24 11:57, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add MT7988A based BananaPi R3 Mini.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



