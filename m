Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D39CF649D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSroe1EFDiIlCmZj99/BzadYxrWPSDFbW592VXyRRNg=; b=Ln2xaOKC2kYiSQnCXY6QznpzOo
	SfzUvHl8B2LfqJCGo0t0c/T4gSjHwTRI1K6+1ZcJb+rKpVfeatHHX37WsX92bLe6Q5x5JzRn+DYeH
	3K3tODZkik2uNhnP7KOlOqZq32WgoRnv4bjGK6832CwOPsFM/hCdYVaFsGtQj8wBWybV1QG/oIO6Q
	YxYSTKy+f+Vfvb65T/0qCy4OuxehFlWU9p+TX9DzX3uJF67XR1H5fRFeL5OaxBDQkIUuYYpGg2wtR
	hUiU1v2jdJ4DG+0sRoq5tKs1FiHAt1OOV0gK8AFN06EZqAJ/gfvdojFnsRPHzopTMvaaKL3yUd7sY
	rrGfzwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCEV-0000000GPxY-1gSb;
	Mon, 30 Sep 2024 08:58:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCDG-0000000GPel-3MMQ;
	Mon, 30 Sep 2024 08:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727686621;
	bh=1Wz1b+aWVRLx1CDCw9KifBrN59wS+Rx3ztAM1uWIgvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NwvMWhBKgOhb2wTuDuLJhlE4paPhhxKWACA+v+Cid6YECRLIJlhBlpF7m6YryRsxS
	 FHRy0VmMs5bvpenWE3gf0k4buEaA1WRmqOOiYKBVUWmam6ROs0j1xB/K4rl9LoWfZO
	 vOCI4sXRPcapSLY7BnPygOtdatFDSr0X/vT8w8CZAg/8GST/o+mMexGIjM7J7/TDvf
	 9ygaDTU+2BtuWlYVxiP1+imn4XI73J/vxVxTXnvou9QjfvSpuat+YlCmO+wzt+nvXD
	 7UsPQaON2MeHhOoTf+y4L3IyWeAjNY9fztGhvrHaCr3soaGQ0kBccrfFxgeJ1NKeGf
	 EXiGAp/vpu4Dw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9319117E0EB3;
	Mon, 30 Sep 2024 10:57:00 +0200 (CEST)
Message-ID: <70779c00-7f2a-4038-9241-b8bb2004948f@collabora.com>
Date: Mon, 30 Sep 2024 10:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] regulator: Add devres version of
 of_regulator_get_optional()
To: Chen-Yu Tsai <wenst@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20240930044525.2043884-1-wenst@chromium.org>
 <20240930044525.2043884-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240930044525.2043884-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_015703_021438_93686C4E 
X-CRM114-Status: GOOD (  12.28  )
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

Il 30/09/24 06:45, Chen-Yu Tsai ha scritto:
> There are existing uses for a devres version of of_regulator_get_optional()
> in power domain drivers. On MediaTek platforms, power domains may have
> regulator supplies tied to them. The driver currently tries to use
> devm_regulator_get() to not have to manage the lifecycle, but ends up
> doing it in a very hacky way by replacing the device node of the power
> domain controller device to the device node of the power domain that is
> currently being registered, getting the supply, and reverting the device
> node.
> 
> Provide a better API so that the hack can be replaced.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



