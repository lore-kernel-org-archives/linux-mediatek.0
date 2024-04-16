Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053DAC04FF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9HbwGR6YI32yP6tx6e+ngTNUud42C2QQ2LjaHBmIq4=; b=oUqhzPDNVwOayBYpfcgmJOSxjs
	2rL5DIuQ4XphNAJSf5Y8gg1iBmIJ/P2jB4pztXYRe+Hz2hivAzFUGqojfD+nwH91vGnW7MrXQayHI
	dPc5bWdZ7J3wm/C9aUVYe2LeknWDmoxYozTWhcA/j05vtb7QrXzJw02EPLaAw/qzauBWKyBQzfoiu
	ruzOP3FnbUmLhdyh6jMwSK+jFfRKnldDAO3Rd3j/vwxdS/o3iIYN6DfBxx58TcjXat0cDUJLRN05R
	L/5ynrWTTiMb7mY+GRyeg64rI15ZOyuK2zzyGKqdp9PhW4RbkUfU62a6g7IcP+gupmDWeTPgIGQ7P
	mdq38amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdQe-0000000BJdB-2vFd;
	Tue, 16 Apr 2024 07:40:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdQb-0000000BJcK-16Cy;
	Tue, 16 Apr 2024 07:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713253227;
	bh=FoIbanP3UpVckOe8AjCzCFkDAEl2hpy2mVru5y5z+Zk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yA1lYQgNRdORbdwPBABZZ9bTqZwbM3E9mwwzwx8xH+P17s9nEL1B8cT2nYkhfPKs9
	 TPO9KsTg5dlFxNMv2T8rXsD28iduuNPuqLUm1czYHgj2+e/WfVwrRr92U4mV8lEP04
	 GN3DbTq8rHspHmKBX+lDQFju/NThawX0GiUY3kuCxIAhWvU/Bb29ALvsuZK4mx0wYB
	 QWI6p7xkrvCq+QZUKgN15bEy7LSO0NI+qM/ibkOxLnrmFFbqs4QtRPa8n5ULW1e/hH
	 AGE4I8cpLem3nf76FaS1LUN2ogBE6n1q6HW2TEHhULEilRJT0Sdu4SiDnABJrNC4vg
	 nk4tkRu7i7b4w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A5D5F378210B;
	Tue, 16 Apr 2024 07:40:26 +0000 (UTC)
Message-ID: <e3710200-d780-4e76-b630-db720cf01c21@collabora.com>
Date: Tue, 16 Apr 2024 09:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] thermal/drivers/mediatek/lvts_thermal: Add
 coeff for mt8192
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240416-lvts_thermal-v2-1-f8a36882cc53@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240416-lvts_thermal-v2-1-f8a36882cc53@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_004029_512274_CAFFB7CF 
X-CRM114-Status: UNSURE (   5.44  )
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

Il 16/04/24 09:35, Hsin-Te Yuan ha scritto:
> In order for lvts_raw_to_temp to function properly on mt8192,
> temperature coefficients for mt8192 need to be added.
> 
> Fixes: 288732242db4 ("thermal/drivers/mediatek/lvts_thermal: Add mt8192 support")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



