Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F4AC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RMss+VdAPGBBmKowZJosSHm3MS0ZjTNdbFrfBm/BWw=; b=FCdEoCyxGsGuoD2ZtXUE02EYmA
	4MvKJ7WSAlkJE1/GLfS6dEQr3r7dJlxYMAWOi1Bf6wNe0eTcxGxTPoPN6gRF5nExyIH3gRpEE04OL
	+XX/mzCCJVc56vS5Q78qeS5GgzYry0h1dM5/+VUHAJkJV8Lwgls2Zi1F/QuQN6UliICpgWmSykkue
	TwKTUCRZx+NWU+0Vi/FuvYXo4CVlAp81yxc715uA9UBCDLOA3OSiCU/gx2qVPtzxnnTHh7c/Lm8G1
	wzokI9N42TndAg+fkGOPsZkvuFvlFv6MyH5n2UFjnt3sQJxjJ7hQETkR3W55xG2fyA6ZJMk91dLu5
	oPUQ1JXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXwt-000X2u-7h; Mon, 14 Nov 2022 11:48:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXuo-000VBi-56; Mon, 14 Nov 2022 11:46:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A56B8660231A;
	Mon, 14 Nov 2022 11:46:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668426372;
	bh=cxFh7qe3DRbfD8h/14NTncqtRXbLZFLZJv4ihDVzbSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CU+lQGStnui0/5eva3vNQRx111R67wmazQ03e6Q+2+xgR9xRTtOqq1dYYMiLVCH+o
	 ZeSgxBg243ZHITubQq3NuuJnw06pq9z3jFVOq35LhRK2+hWYGZlyoRowiB470EZ+or
	 TwQ0vnM+7pW6Jrd4OLgjcUsE6nBHMty5d2lk5kINmtl+XseY7nugUn9LeFuVvSc8u1
	 8fgMEFQdIopfFzOyFBb+KmFCjwOabiQhN0ie6LFDuluML5CcdD2MalUMPut58R/6Yv
	 d5Y35/9JmaoJkwqJfOAFd7aNQCiBqXBj0hKfdbemKHUHZNZH1TDGBymyJOzI7wsjpw
	 lOh9OAQis6dQQ==
Message-ID: <16de98da-4042-457c-9430-a0b17ec83d1c@collabora.com>
Date: Mon, 14 Nov 2022 12:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 01/11] arm64: dts: mt7986: move wed_pcie node
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20221112091518.7846-1-linux@fw-web.de>
 <20221112091518.7846-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112091518.7846-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_034614_376786_E6924483 
X-CRM114-Status: UNSURE (   7.52  )
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

Il 12/11/22 10:15, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Move the wed_pcie node to have node aligned by address.
> 
> Fixes: 00b9903996b3 ("arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



