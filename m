Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E0FCD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93RszbSWbSqA/KPJZO2RJNoOH7tB//BH0QqgO8HEj/o=; b=SA/TcdDXvkKoGtiUlEJbWyXeJh
	QhKFCEBxkfWME9mjXwNMcDWN3LrC8QAiO8PoBdqgKl3S8Xyc0XvzSGcFHf80gfM9fjoLoS8Q1jmwh
	DK91WkHsvNBtiXcxJv+jQCj3I0xF4WgoTx6YIyVvJWOwuNkiBbtBGX/orN72jmcEXSgO2lnun8IdJ
	rCDFDfHd1tz8QXbZ64WpzDMJc1FCzkn4G8x7QLI+O0041l7eq0NiRXiqv9cGhYEDrVdrvJgUcCrfU
	tMOFBWHPhQmrvlTqpANZDcG/umX5sY6woO3oQug9N8oeRPSlF8TF9/ETxm5t/i/wViZ28zoRI9g1k
	XR/g3tdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoYo-0000000FboQ-0wIc;
	Mon, 08 Apr 2024 12:57:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoYj-0000000FbjR-13FM;
	Mon, 08 Apr 2024 12:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712581022;
	bh=NX8c/VEzlABel+cb+UVbVM0M8txNezi7QBogQFWuPcg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cJHGSwof0rF7TySUFssqZe/IaEXByAiXZhM5qNHVmzo4lyYZD25Y+Ls+0RxmE/FEn
	 IvTnlX7Z4MBLQvE6if/WaZCoSmV1Lgy9RJ6AEnVh+yZ1xvtyC235eNPc1UQZ98E0nQ
	 2lotIsRMG6G0eIvvsL/wiiPEM8oDQeB2NwLw3P5f1OsHkFT8MQirKPX6txq9yAylDr
	 G7ch2ULxwrxfq40dL3Gx8wMtamM9Gyvqd/Az76luDxrgx/asI26usymfpyDQ35P2Ek
	 hgP1GN7pK2kgLRrZ/9v0IVqVaQHQj1M8TxSwatehHFsNKHwtsS6uc31jYbn3VWGT8F
	 S0sQt7NpLHK7Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D1E783780016;
	Mon,  8 Apr 2024 12:57:01 +0000 (UTC)
Message-ID: <1486bf40-a797-4651-816e-85bbfe22a809@collabora.com>
Date: Mon, 8 Apr 2024 14:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: select CONFIG_SOC_BUS
To: Arnd Bergmann <arnd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, William-tw Lin <william-tw.lin@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240408125506.1594257-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240408125506.1594257-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_055713_846231_9EFE46D0 
X-CRM114-Status: UNSURE (   6.35  )
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

Il 08/04/24 14:55, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is needed to avoid a link failure:
> 
> ERROR: modpost: "soc_device_register" [drivers/soc/mediatek/mtk-socinfo.ko] undefined!
> ERROR: modpost: "soc_device_unregister" [drivers/soc/mediatek/mtk-socinfo.ko] undefined!
> 
> Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



