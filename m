Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C1EE3F0C
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7KWhfo8OBaNOW8X3b9I/JcBUkLihCO2HD+5dG9CeLk=; b=pfKKg8UW53julyBdtOfKU2+L2u
	DAsSKAsHsvQLtl2u2WLkiD+Ronz94lT667Bd83TmpS8PdKvGGlXL7zcBcC8OxpCy06ev+mO1tyLhO
	SrLQAdvJLhjZi9VoeleXCOSXUaz+d9fL1EtUIoin5BoKZkXUC/dknC1GoaSvgZpPED71mwxdqdvgH
	oBccQYweKWuRIduFP8nJAtJh9JOvKCsB6O1ZOPHwLascjXKCmDykI0Ok3oRchgWMsH20y6w/v/Noy
	0tuh50gH/3FBzqT9BdaohIjJuRJsxqVUnirLivDAEckAUyrmqV+z+heHXZuT65a80KXT8vQ4TAST1
	6UFxjC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg8kL-0041mT-1w;
	Tue, 12 Sep 2023 19:08:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg8kG-0041lS-1Z;
	Tue, 12 Sep 2023 19:08:23 +0000
Received: from mercury (unknown [185.254.75.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD9D666072FE;
	Tue, 12 Sep 2023 20:08:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694545699;
	bh=k9DYozT5l7PivHowQJYTVyRYgjWYHwkHa0RiNqpwDd0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Uiwls1/86E0lOt4lSEP9i8YtiFuKm9FXhbauZSBK0VeKhAeDUtPKnXehozGMg2ea0
	 RPTbvnAQPbDvixbKO/KzOnvKkX9JzSCAfvk9vxKiD4gNMLXBUpRdFPjB42u8m48qdy
	 5s58yFWLmvB2C+hctYNVT3D8IXwvWmOS3zh3xYHvaGBcomRpiyWDZiqASYnNV9ptH8
	 Lfr4Rg65x9xy/lfoo1jqjZsn1L2c91f6+6YXPQ81lTeNN3+IReewO1jjJdqDvSkKwR
	 /dk8R+xhfdaoBo9BcrZMx1pUUNFttL7xMWYaXbd3yidJTLuhr5iCjDYpaYwHyWdJzx
	 lrjEC91lXimgQ==
Received: by mercury (Postfix, from userid 1000)
	id 56D6C106098A; Tue, 12 Sep 2023 21:08:13 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: sre@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, agross@kernel.org, 
 andersson@kernel.org, konrad.dybcio@linaro.org, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230727113550.2599335-1-ruanjinjie@huawei.com>
References: <20230727113550.2599335-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next v2] power: supply: Remove redundant
 dev_err_probe() for platform_get_irq_byname()
Message-Id: <169454569333.510054.8343708350305953046.b4-ty@collabora.com>
Date: Tue, 12 Sep 2023 21:08:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_120820_656257_E9EF8AB1 
X-CRM114-Status: UNSURE (   9.11  )
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


On Thu, 27 Jul 2023 19:35:50 +0800, Ruan Jinjie wrote:
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq_byname()
> function as it is going to display an appropriate error message
> in case of a failure.
> 
> 

Applied, thanks!

[1/1] power: supply: Remove redundant dev_err_probe() for platform_get_irq_byname()
      commit: 389405146ca11d24f85b3277121a58f98a926a28

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


