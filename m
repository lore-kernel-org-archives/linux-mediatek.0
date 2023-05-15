Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98014C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLUP5u1sYFrQ1MKWGeNS+FRmN66CJpmFL5Dzo9w/Hzo=; b=0sgaChVYfrVuB6e3YA25QjdNif
	d2kK9IpvqtBZ9yrZLgj2zlb17HotIBUud0monHf7kos3tl/FFkvnAk7EXtGhRh6btDkETE9auCH4K
	kRNRs02TBD/xJkZb9QkPGOJNdKlkp4nrlAhIa9ldq3lrTpjsJDQ/hCGlDEzNWLy99VmWi/r0ucXSG
	ssO/I88qLQgJ6Lciu+set/v4fv2TQAvNxxP4WDKpGod31ImXTVrbDFwrNF03ipdpj4vCHXSazFfYX
	YNTwF7ytM+eq0RBoLgIBq1lr2kXh9tV53A8UMOH25hhPURN68052IVAR+xfvErWnfH53ng1+K6zPe
	n6PLoztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWUV-001zfJ-1m;
	Mon, 15 May 2023 11:35:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWUR-001zeT-2y;
	Mon, 15 May 2023 11:35:45 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C232A66058D2;
	Mon, 15 May 2023 12:35:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684150542;
	bh=CoVmOGnZnhGZ+HBuANfDBQiUGvmHxOM62UqpRM52qwE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lq0llcnh5lVf9KC+UPEru9iK3dGpTBhV++7MnW3w8b7NsKdoUuyzMFVbLtGGA6CcL
	 NYqeTVX69lKHwuSfLBY0PMZOwtrL0l/pDT3llUG6JMw41mW0X/sNBUQhE9nyh7pw8I
	 BW6eR5SrDAbEqy86VcRmpeIvkvLb/GJXgpPSsQXMq9xSMZWrBpO6sHtpynt5XV9zsk
	 fWO51+Dlw2VFS9ajWkCIN3DjwZO8G2MG4CayJD8vhNibhrQmKIGlkvdDvB35GB/0MD
	 rk4e8I+cC6UsKIysgpAJ2Muzsp/3lG205Wmi/9qnvdjuTjm+uhE+NfvgvGKUQHidtP
	 fppBV8d4sIxCA==
Message-ID: <5b972568-133c-b5b7-c87e-06f3e8b0432f@collabora.com>
Date: Mon, 15 May 2023 13:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 02/11] arm64: defconfig: enable Mediatek PMIC key
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
 <20230203-evk-board-support-v7-2-98cbdfac656e@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v7-2-98cbdfac656e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_043544_087918_3E363003 
X-CRM114-Status: UNSURE (   8.53  )
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

Il 11/05/23 18:29, Alexandre Mergnat ha scritto:
> Some Mediatek PMIC devices can manage Power and Home keys (buttons).
> This patch enable the driver which handle the 2 keys managed by the
> Mediatek PMIC.
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Having this at least as a module helps CIs, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


