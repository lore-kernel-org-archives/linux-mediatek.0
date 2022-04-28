Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IauYOoWnL8+PsLvEDwyqrJIV75SwNqMowZa6HVyJQZc=; b=JHqH5VZyoHhKib
	zClK5+cF5kWfaFX5v0P4CMrIrJnk0q+kuYeGz9nQQbHMcoBfYSqiQUK+ERDlXAhswxUJ4839SaT8p
	iSxgOYyXyfyAzaF3J/EAp0Eoof5gc8ZYSCJEcSdlYHShzAZes3tQKcxm92kDiAIvdfMicyB++DyAv
	1h7guha63o9zAfUlpURSGo3UUI9KJVjJkClfXWFjT+qzO3DtzT56Quu7tDbOLB9ujCV5V63zsRpsW
	eYn4uBbkEJbt3GTgW4J/jiUryQmgWd93VjVQTKCTESIH8w8Jb0tIRFHX0Mo3k5VUf+9BMmh/4VMLh
	mbhxw2o/5linzhePWvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4d1-007FGN-6i; Thu, 28 Apr 2022 13:56:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4QJ-0079Z1-FW; Thu, 28 Apr 2022 13:43:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1FBCA1F4516F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651153390;
 bh=jtU+WO0fmgPPR6L7wrSaeI4hXJDXg/PCMWOcmgAp16Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=luzJRjNH0Ru6qWc5wZ7acZPBOtwq3KjC0YAq7TnrkmLPOW+0QB7E1CPDkGUyYTkhu
 LPqdvgOsn5RmvpdGMOiRFlm/m4Wq0RRFvYvoXgMFW55I6EpQfY4yEWNQXHbKzJo2/S
 1rPxjg0j2ThfK8UI+a3Q1/Dcl4NSOOPe5fgxERSKZ9ctNuDZQo0FwiJE7hoWibkxiI
 Yk+vpeIt5pW3wZidIZh+ALZTrf+fB8ovhzQ+FGvC8ON+Kx/2u6WIgl3W61JdGRt9/x
 /745LKZghT22ah/a62x36yFKkE0JRqdOtNrKPEahvNJxfmJkneHDokwsc+dz+zDalI
 9Wajofo8lLDaQ==
Message-ID: <d39d3dd9-cfe8-0a59-6616-a4cd4e393582@collabora.com>
Date: Thu, 28 Apr 2022 15:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 15/16] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
 <20220428115620.13512-16-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428115620.13512-16-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_064311_754490_1C589BB7 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/04/22 13:56, Rex-BC Chen ha scritto:
> To support reset of infra, we add property of #reset-cells.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
