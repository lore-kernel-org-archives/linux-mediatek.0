Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45313C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 11:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHKWKWDXbs5sIT/BcUYAi5VncG8hexrU+ElMZbQhB0o=; b=bUxAobliXkMA/Yuyuo4oy/8Q8E
	zCPkDP9KI1UxkPVJYS6/1g5Db+7LXEeEqCG96VN2AW0ZVgCUIQVhnftZwh7R31gvRYr6aWuIi4B6/
	jK4gkkgQ/Lrme1IlenVHgVm5O+TxIQcMCqhvY+5MNhgtmW+UZ6W1IenmfudQCJ8r0a1EhKXP4+B6D
	WX1fwNaUvkTwMMXkiz6qWtGXfgL68oEmzysoaNQODqW4o4JbQeu1f3aQC3m7xRAd0iVajkwf2kEuo
	JyLmCUEuHW9XYlqwOWfpWI0jo4EULmp3iTky/sabyoBw9WsuuthJk+Dbd3OJKdhlXBl8cvUVM9+aX
	FJWyajVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p53RO-00GNBK-9d; Tue, 13 Dec 2022 11:27:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p53Pv-00GMMX-DM; Tue, 13 Dec 2022 11:25:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7CCD16600366;
	Tue, 13 Dec 2022 11:25:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670930746;
	bh=2TEj5SaEn0pTfzeBUpf176G0jY0ZFbEcyQCg6PuRPf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UHB6+bnW0TWi26ZLYfsRbvbUTWL+Rda3tMhLuozZR9asIX+NlgU2MSvKrv5msWMwL
	 aIDTGsUpjWF4AbBN8fgGXX8Xak9pu4cP9EV2B5yFxvxCb4yuARWWe5zOfBoNyXGS+u
	 hypIDpS2nJrjnP+xluhcCGF22hFOBQ6qR2jzBI6DMDcpS6al80nhnIPpY/7nFU4zHQ
	 Ll/F6mikKv6f8AnWSuPhgFVEAKl6XuSKH0DUQkfefz2OVZ+RFSe6w3nZyN3KqMPzjV
	 FyuTqRxdalH2SrIXWOdHMRkOSCZlp0KSvu4mogu5l4RlWY99tsmcgDcoFNH+jxMjWw
	 iwvtTJlIXMyrA==
Message-ID: <6db5f451-9ea0-cab1-0992-d87487e2c760@collabora.com>
Date: Tue, 13 Dec 2022 12:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8186: Fix systimer 13 MHz
 clock description
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
References: <20221201084229.3464449-1-wenst@chromium.org>
 <20221201084229.3464449-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221201084229.3464449-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_032547_626165_CBA3D422 
X-CRM114-Status: UNSURE (   8.51  )
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

Il 01/12/22 09:42, Chen-Yu Tsai ha scritto:
> The systimer block derives its 13 MHz clock by dividing the main 26 MHz
> oscillator clock by 2 internally. The 13 MHz clock is not a separate
> oscillator.
> 
> Fix this by making the 13 MHz clock a divide-by-2 fixed factor clock,
> taking its input from the main 26 MHz oscillator.
> 
> Fixes: 2e78620b1350 ("arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



