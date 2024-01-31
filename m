Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0579DC47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzMqeLtqkQuIKq+nF+/Jj+j4DWhmbSqrKJfNuY9Wl0E=; b=sSkQCQdgaLO1GVPoJK2sbvlaLf
	QVmWdG0Tn51NTe7dmWk+HHCFf4dIiyigt+9wSz/W49IqMTpvgmSnxoP/tnaFr71U+qKhE7J92zgi6
	YDECJ5oUvt9Yy8WcfDOcxyD4nilqe8ozzpoTU2d1zPV4SkCa+Zk4N9yIobe2A/y1rAmt5pjWjpxnT
	OtTqwl/j504XSpiTSj2Wy3YKAobJX0ys5DB/pXaFA6WxW/iTnKZz3Gwa5gRVOAFPWp0jLs1Zm9X3l
	OYQfSD6Pmcu4hM18DuMR3DLYCDFkWefJ0hNyZqHzp2s0WKARbdTt0x52LK5M9muMU75aAlD53p4Hx
	xkToo91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8oj-000000036vO-1dcW;
	Wed, 31 Jan 2024 11:31:45 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6fh-00000002NVi-1KGh;
	Wed, 31 Jan 2024 09:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706692455;
	bh=2PwMDPC8NQUUg2/errtkejxFs7bUsyCxqaGHwtreq5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=5BOpaePEXnLgEs0w1foP+e3f5pZOcnJ/DghUTUze1p1o71HWeTKA5x7Knkrkzhpl9
	 MTDjRqvSW7UD4oGEHttevqzOPREsJ6FTScbMIimoU3wBnG1UNuPG4Xix//3H+JQhpn
	 UcLadPJrzrpSzOpdEUNp68OdCwc5nyul6ZfVu3jdXPrmo4BHrDwgobfxXiFe7ojp3N
	 M1J+onqRju+S5rjQ/5qSHs+Eu/p9MLOwgPpFwzKPFqfWnZQkfmJWubwuoGiTW+7gVn
	 ua/aOanAG2AV5hBE4LE/mUxYg5sBrqVIGMeQFmrS9pK+uxqjJzcQwJuJ81hg6UvN+v
	 6b0e0QyDlh5xw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3942D37803EE;
	Wed, 31 Jan 2024 09:14:15 +0000 (UTC)
Message-ID: <6f2e1340-4fd8-48ce-91a1-f94486732abb@collabora.com>
Date: Wed, 31 Jan 2024 10:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-pico6: Fix wake-on-X event
 node names
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240131084043.3970576-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240131084043.3970576-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_011417_534219_EF0AC714 
X-CRM114-Status: UNSURE (   9.87  )
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

Il 31/01/24 09:40, Chen-Yu Tsai ha scritto:
> The wake-on-bt and wake-on-wlan nodes don't have a button- or event-
> prefix that the gpio-keys binding requires.
> 
> Fix up the node names to satisfy the binding. While at it, also fix up
> the GPIO overriding structure for the wake-on-wlan node. Instead of
> referencing the gpio-keys node and then open coding the node, add a
> label for the event node, and use that to reference and override the
> GPIO settings.
> 
> Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



