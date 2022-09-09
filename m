Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F59ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwpMb1Nu7FWWnOS2lL681MUFuWeZgg0Gu0PiwnVNrtY=; b=TqpgKgEovevWXH8KB1WqWLjTa2
	dNl3wevGo4WO8kO/ICSIb86HeaBaq1Vk5xd+oLfvhseFX87RkW3Va0BVs6OZJyHloFU4VnL8qoew4
	oyXoXK5SsdyiEQ9B6UoUzpBDEqYGukQi527MZ9zF3tpAGTqzkRaG2rkDyJFiRl4i7yJUzD3yTzMTy
	T32fychHdKyrC0JCIGqhwY8IcsD+PWXv1gGbXek85pxeTYnZHpoH6fcASKhAlKBIGL5oVwMUxGy/X
	25q7w3es6nYdpnJMh9zG6z+ixqu6OSap/Xht6YJxJyhgdO4vWvioK/x9AQVWEsxk5sd73n4aXu0fL
	IoQEkSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZVv-00Egik-3q; Fri, 09 Sep 2022 08:37:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZVc-00EgYa-Ib; Fri, 09 Sep 2022 08:37:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9DC9A6601FB7;
	Fri,  9 Sep 2022 09:37:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662712627;
	bh=t6gpOu9lmxJkdxd+/BURDuIYWhpRDTn0JYr4MfbX9Aw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D+fZybsMXoT1eb8mVsc4W//5YXPsgV3SxhBIbwz5tkrsSC5xthRgoGomiYV/w1wNP
	 F/wigj9OkqqifBmkdbzUVlDULsIhFGzgk1Iqh6/2z8GdBZYKoLh8MCUIoYqhfb1Gsq
	 11x1fsNs2otUgjvCVUKPfqhjJPfpq4XKnsppb+IJz78QSIXSCyxq53p1HGG6KK0nzg
	 psGIZfCilfYwO0UKUZNZNGz+YCn2F8XvGRDkKxBd63RsFXziYjgqDm5EQdmNwRoJkt
	 KS8M1PP2KcyLxPE1ACRjgtNaSS3gT4BbgBPaOLJGiAZQYjQe2+fX40t0NQtyMCJMGk
	 p9zkinhT22DUQ==
Message-ID: <c69007d4-848f-5511-b831-aff29da0d6b3@collabora.com>
Date: Fri, 9 Sep 2022 10:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>, matthias.bgg@gmail.com
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com,
 Michael Kao <michael.kao@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220909073609.32337-1-aouledameur@baylibre.com>
 <20220909073609.32337-5-aouledameur@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220909073609.32337-5-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_013708_776824_20F2092F 
X-CRM114-Status: UNSURE (   9.56  )
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

Il 09/09/22 09:36, Amjad Ouled-Ameur ha scritto:
> Provide thermal zone to read thermal sensor in the SoC. We can read all the
> thermal sensors value in the SoC by the node /sys/class/thermal/
> 
> In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> on the first read of sensor that often are bogus values.
> This can avoid following warning on boot:
> 
>    thermal thermal_zone6: failed to read out thermal zone (-13)
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



