Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E52C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyJnKZ/wO4VMH7VgnKOkZpEjzPXaJ59hk4g/9kvmIOU=; b=lvCLVq/WZPK0Cr
	JHIE6AXhv/91lUH+Z+ietVcghHJ7T1a7Fm0AiCYr80m3dQHMDpaUZnPX4P4ZZjrBzIQaqk4tl1GL0
	THmWqccHvnBMep1egNlQBLJMw63lhRrIBYG22D8NS/mcfs6LNJ97UI0iWFmToK6ryNqJ9Z1Qd6MDs
	o8GI8KKFsE4mJiPhjZFJ83u7e9zyWBZbgNdozxCnbjOkBIVV0zpiPKIO+O7MaPgNYpUcTMIwbJ/4q
	3P0VW3ZyjzO1/JPZQViCx751ovEkr3ZHa5u6m/g4FubsVnklzquo/H31JQ7nwIYcq67BHNzxRftG4
	g4YjIXjH1oa6LBvfC5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4eZ-007G1L-6H; Thu, 28 Apr 2022 13:57:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4Rw-007AFf-RD; Thu, 28 Apr 2022 13:44:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 893481F41A71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651153491;
 bh=fB7oaBnDq+Pk5dXIeNanIcPDn8WmB6Fwxu0ws9sHRSw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bjk4ghRjSBpf6pJdMGDZ4L3zRpEu7fxmpsiGi/WkeVIKRmw0oXu9LqxJ+5m3PNbEX
 8OdUYcQS9It+X/1TWAfhbqOXW2GDc74Ho3ORZRDV8q1HXc569ha05VY16TrSure/z5
 QrOnPcgAopTzm0KtdcfihZkCFIP5naB6EPxEDCEnsvO+tCJrwTK2saalGKNwVFZyJO
 7jrc+86cJ8grY3sRo10M2pJhKBWhqnJuyvFsniZonUHg8W2IHXRhPbTF+Lukddg82L
 mfbX2QdmbnjMkNwm+YE0hUClWM38It1b5rz4RM64K1+PFw8l7SNyK9L923C12lz5Bo
 lIhNawWmyMVaA==
Message-ID: <28fcda49-5f4e-508c-26cd-b30dc5837e9e@collabora.com>
Date: Thu, 28 Apr 2022 15:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 16/16] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8195
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
 <20220428115620.13512-17-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428115620.13512-17-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_064453_090027_1033F103 
X-CRM114-Status: UNSURE (   7.19  )
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
> We will use mediatek clock reset as infracfg_ao reset instead of
> ti-syscon. To support this, remove property of ti reset and add
> property of #reset-cells for mediatek clock reset.
> 
> Fixes: 4c78814a1f46ac0 (arm64: dts: Add mediatek SoC mt8195 and evaluation board)
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Please remove the Fixes tag: the reset commits are not going to be backported, so
this commit also shall not be backported.

After the removal:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
