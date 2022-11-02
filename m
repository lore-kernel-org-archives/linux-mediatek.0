Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DFEC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 20:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JW2VHSWsPMvVZdIpd7hq6jIkLCzuwrZYFBywihLees=; b=UpV6lokmmK3V0JuUMk/Jx7qP0G
	NT/kwAPPYqUpJ2Ro7K6f6cEiPIiUQ1c6xABhma08XEmDY7iXyvfsvX4iyvkGh4PpdfioUXjF2yu/7
	DUmCqJmepTU5Q+6CrUiY0Z7zPHAjmLlYXTYzUDDsDEasgZOTyxvlwkcmyRb1znJhKKv2h+W/G7Bjs
	y56zPSYwHsVX8341IwIRfwmLtDxl4nFmwnUh1shMkjhfFuPp6gQ24Nev/m1NAoYanCC6G8gMOxPNy
	tqOMNHba2fKNpge3nq+g9bA+tc6tIyos49Y2IAobOTAN+uwsfsGaOu4bF5/EcHqrCyCH3pHQWKdOt
	0dlrglKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKCE-00EC50-DW; Wed, 02 Nov 2022 20:18:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKBu-00EBpT-7R; Wed, 02 Nov 2022 20:18:27 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 308CA66028C5;
	Wed,  2 Nov 2022 20:18:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667420303;
	bh=JdbKgDdELIBavWerdVOX0pBGxx2QY5SQAwA+QgICUHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHT+RT3HjJoqviC5fqcTsC6bZi2WoNV8XG3020vqF+U7MNDRqRAzJrP0atyxvqtPE
	 DormQ7ZK4bx6JCTZah6VfmPbXWLmhRdljXU52mIvbiVKHFbNStmolth36fHDi9+Emx
	 Nhl0wCbZhwkWJlQpOEcfTFOsGH9wnru68NsySBa3dvaUp+NXF1f89nQZ3DzGxvEgct
	 2mTl6vQYUxEVorgELL3dfjhhGZNaP79A6Zwzag0vOUWCwA8PF+4aB+Voxdr7flfhF8
	 50yvGsPhmdThR8S7OalVPWuNQ2kGPlQYxstlqWBkWBq4vTBxovu5AAV/ANh3s6AP+X
	 6IxCYXgSUpn0A==
Date: Wed, 2 Nov 2022 16:18:18 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/7] arm64: dts: mediatek: mt8186: Fix watchdog
 compatible
Message-ID: <20221102201818.i4nad7xoq2gzq66t@notapiano>
References: <20221101090116.27130-1-allen-kh.cheng@mediatek.com>
 <20221101090116.27130-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101090116.27130-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_131826_506921_223AAF8B 
X-CRM114-Status: UNSURE (   9.99  )
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

On Tue, Nov 01, 2022 at 05:01:10PM +0800, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> MT8186's watchdog embeds a reset controller and needs only the
> mediatek,mt8186-wdt compatible string as the MT6589 one is there
> for watchdogs that don't have any reset controller capability.
> 
> Fixes: 2e78620b1350 ("arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

