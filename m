Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49206C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJFcVmT0A6ku9BwxUJ+axOJLJsqd2oD5QuHm3zqRaWs=; b=Z3zZS3BrlIzlV3fzVEjdDquDMV
	QgG3r0ZNZviGTdGp7Q3vDVq1HprzPSK1n9ixm2RUFo4DgmB86FpjMRRNYMl305VPoHmANRwdCSBUx
	TiiJ8UxsVkFsnl0NjVO2B34LxV52RTnmlxbc+coeVAWIQ3AjT0x/syrXogna/eJuuQ2xywGpr3fVQ
	JbRIM+0m9l7Y181c46z3vCcxWs0z8Mg/5aD0iNh2vjT25K0SYemycbLwxOEMT52nEJGPq8TVvLNC9
	VkA9XoeQirm24MwvBTu4ktS/7WB0ptF86ZN09HhEweP+xC8DI9BStqgs0oRbENnWSVPRUNIdjY9HJ
	AXfI4Esw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPw7-002EsL-3k; Thu, 06 Oct 2022 12:25:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPvi-002EeZ-Tq; Thu, 06 Oct 2022 12:24:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36EC166022F9;
	Thu,  6 Oct 2022 13:24:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665059081;
	bh=BuajQsmdky1pSKHSsbY4UXSTa/ucDnsntUDGuRTR5Dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NW+OCQ/VMKeFUq6aNI6w1YFB06kED9jdPOT2bcWZI9OeL9mUJErbD4BzStCnAkfpu
	 idj3em16pahptosz4k448Q+sGqtLTlRwV+k7O8X+jNcQBG9ue2uYlcm9sLgNGgJGFu
	 +NGIQGuDpt0CB3hHPothcvaVK4kOB86wPaneekFzqJsIRGoBTulZiMeYMnwo7tyP/V
	 TmGwN1mE6Oqkz+ItcP07PSJF04MXaP8B+OAh4HrbtUsKU/Vo8MVmJQlI4YQV6OvDF6
	 AYw9ZSMp2APKSfL/C4Hnn3TQbiead9GCci/PJWTtGMui5jeNxTYs2CIL2zrJBj5SzU
	 2r9Id2o1y5VIQ==
Message-ID: <ef96bf71-7bce-7874-2e0e-f4ff6ab8f792@collabora.com>
Date: Thu, 6 Oct 2022 14:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/8] arm64: dts: mediatek: mt7986: Fix watchdog compatible
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
 <20221006120715.24815-4-allen-kh.cheng@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006120715.24815-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_052447_136800_4CD6304C 
X-CRM114-Status: UNSURE (   8.19  )
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

Il 06/10/22 14:07, Allen-KH Cheng ha scritto:
> MT7986's watchdog embeds a reset controller and needs only the
> mediatek,mt7986-wdt compatible string as the MT6589 one is there
> for watchdogs that don't have any reset controller capability.
> 
> Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



