Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DA8C021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWIF7Tdtz13BJYibnMHXd3Ag4UsXt/rboAobtOqCRXY=; b=J4t87tmkypaDd8AU0QDFvhlNz7
	LSsevv3Iw0l+9XBqZ7RrDhaYSTUdxAZ0wChnu6KPNd+uABXdkZ1agYAunEh3M/OpDn0V5Cg4fAPzi
	jyfOu4GOevj8sP7Yyhl7W1v7ZsM/BLq6g49FI5k7meuMrfYEnJl3WwwoXdHRUeqnIudXOgOeC+10W
	BleVA/yGMdi0hBI7grWDoZ/LYm5HZgEwBfp9Ajv0gp6R91Vel2Hl7vv8DNo95YYZYBqzwc0YqCM7l
	onLW4qBIw1Y6ee8g0CzbVCv/4nZsEcxwj99He8zov1bKkf1xiUJw7p8FljXA8MsTGBfMfmAdaSEbm
	3FOP+s4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2Rm-0000000HVLe-1yoX;
	Thu, 20 Feb 2025 09:02:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2Pb-0000000HUsD-437p;
	Thu, 20 Feb 2025 09:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740042001;
	bh=5A0WJvrt3x58g4nbFzK9ZSfFmD/sJiUvrzE2dXSE80E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o5RK3r4Rk9WuvoZOwJfe9Bu4c2+bFvpTfB8Lp7FMchF966NYGq3kXX8uZRvTpAI/q
	 Dwfe6h34fU5aOjsijyu0VYbWRO0FUSr7H49ARLQyUa0TjBKJtBo2Zt/uITT8SJMzRn
	 WjryCNBtusogoc+S67rQF/PN6pnd8zi+Ksto9eIxPrfFibUssDiT7SlEw1sX/t833+
	 8Y7C/G/6SMRN6vVliSe1hO1382MY9OBR9LYXeqOoUDQZK1X6RMlVC2hWSYDNyNBm5I
	 1YXRY/8LRBaoj2/Vf08lBbSH4QZfhsksmA/OISb8ROElksWNnSPow/RXgRijH53bwR
	 /AbUPWxZD2SHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D2A417E1560;
	Thu, 20 Feb 2025 10:00:00 +0100 (CET)
Message-ID: <71767679-057b-4d4b-be3f-3c21bb9877b6@collabora.com>
Date: Thu, 20 Feb 2025 09:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] arm64: dts: mediatek: mt8183: Switch to Elan
 touchscreen driver
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250120-post-reset-v3-1-8f394bb25c8f@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250120-post-reset-v3-1-8f394bb25c8f@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_010004_190307_B8A4881F 
X-CRM114-Status: UNSURE (   8.39  )
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

Il 20/01/25 04:35, Hsin-Te Yuan ha scritto:
> After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
> i2c-hid-of"), the i2c-hid-of driver used by some mt8183 devices resets
> the touchscreen without having enough post-reset delay. This makes those
> touchscreen fail to get probed.
> 
> Switch to Elan touchscreen driver, which has enough post-reset delay.
> 
> Fixes: 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Applied after fixing a merge issue.

Thanks!

Regards,
Angelo


