Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C490C54798
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eEhd2jcy0fg3XKpI9KXqboI4CWB6NvEwSsbr1PairQ=; b=agRoq1ifbEmn7RPOiq1Os2Xeem
	2XW5tTOt7ilM8vG8MW3M7pqUAjKLaCAhZR9WdaSH799+km+wsB8OSAadoJz0Y9dN0SWNIiD8Si9A9
	dzwmhARXwzSUjvtJi/S+zwLQuzxQ8q+KA8wGRiTCFHlNvoIgpAHRm5neH/FdygjN3AIn1rN90rujY
	thKzW/t7rdzlPDXTHCPRCiUasig5LNxZk/whw+Y3dEdk95S7BiJSbsvOappPyJJh7Szi5Y6XaXIil
	j1k+tz8n6HzcVVtCcpgeDzHrXqHvrsV3O8/EeDh+4m6TSOyRVpcDL/ZCwxmlRFlvXiHleBe5y+/Xg
	AmBYCL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdUTN-00000009Htb-3qiQ;
	Fri, 23 Feb 2024 12:16:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdUTI-00000009HrP-0xBz;
	Fri, 23 Feb 2024 12:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F0886176E;
	Fri, 23 Feb 2024 12:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02934C433C7;
	Fri, 23 Feb 2024 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708690563;
	bh=JCFDC8egWyXQb7HABdNFJAfvo0AUNIyjCWnepDQI21c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=iwAAV5G0xRLinAtkNwS/UDub21NcNA/YD1kSoIhSJS+aJCIHz/rumU3D1Lenn5wnk
	 HkGxD26tSsFekC+CXQG5DAxyM5Nzw7ypVnkoX0qMWTFo45T7vyZh1ulJdmcw6I6vSI
	 UJ6q6aPRVM14waxuS1UmjG5fRjGbU95J8syQO6PWLp28QwLU5RigoqYeGbzTnehotR
	 OZnD6ewlC3ECto1MNL2V+wyAZ3smxhQ8ivngTmijPejLtLKy0AU+B7T3E2jt7ju1IV
	 UjCjpAXG60xgL49D4fBUMAYJ90iueYRNijtk1m0BQrN7+M/KilrjgPT1EIM/oblm0X
	 /pGqEA5bFmyQw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
Message-Id: <170869055762.530534.10335046810476136989.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 17:45:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_041608_413408_3B6E69A3 
X-CRM114-Status: UNSURE (   5.34  )
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


On Sat, 17 Feb 2024 10:39:37 +0100, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
> 
> 

Applied, thanks!

[1/1] phy: constify of_phandle_args in xlate
      commit: 00ca8a15dafa990d391abc37f2b8256ddf909b35

Best regards,
-- 
~Vinod



