Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C15C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WXC6vWKWUCnuucj/USqdlCJpHn2jApVCuD1TyMWVM0=; b=rBxTL2/RHUJaOJ
	ByofYXTMoKeIunFupKoP6QNQvKC21Ge4amqa58PpPXi9tg1y1IFWJ8Dfn0I421ebxR9eWtgbO6RsJ
	VTgcF8pTji0ZQLEPfs4Q+1wfpWCQf//u7WxP+tSUXBTH4LqlJQCZJwtBd1Z3gk6BaG8ZDiQJ2jR5h
	Yq0r5/H9vaKF5LKGCVVC+M225L8O0CYREC/WY6BW2RZfzQZmVgdlH58dvxEtPAB9IkkJpsGtcIPxb
	S0ZX+kuAXn29Qz1NVhFryINcSVKU6h/sKpCCLcYtqHYaM5/7xfcqzwL04S1rP3UsOlganeZEqN1yv
	/+ZFZsr3+S/U+1L0Mv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4k9-007IwJ-Ft; Thu, 28 Apr 2022 14:03:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4X2-007CQK-II; Thu, 28 Apr 2022 13:50:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 970DB1F458D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651153806;
 bh=p0LBmr6xOjfSOkbGUyCZlDHkH8yMb/71DA4vGV6dvEw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jhsMveSLZaTMEHHdlGv9JbUiTX7LDVQY+nY1zfuAUduJr/1UjuHlhzonCQ5foGjAb
 zcDz0BexZoraX/sFx/HgChOxrXaNt9xsESe2zSVB2XcJg+ZfzTFTsQRcJD2R7efzYW
 zvPPqQ2mLSHnl5QM5R5tdTxDGkc8sv4UEYzSTPvuRsF0FBo/t40kKj73JF3AkD1n63
 8Qqv7UMj02XGUJ2bYTDkCfsCA8YLSxLXLfbyZ12UcPtbZHvNNJbJUTVxqYKv9R4v5S
 scB/ftayVxqQ5E7g7QXgh35AUC058K8VR+gbo6/sZOi7IkV8nvp6S8MXveGdxwdRYU
 m9g5LTmWVEo+A==
Message-ID: <3ae5b1ea-4721-3e61-9b5f-505ab2d5f037@collabora.com>
Date: Thu, 28 Apr 2022 15:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-pumpkin: fix bad thermistor
 node name
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220426164755.435372-1-fparent@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220426164755.435372-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_065008_844497_CF684277 
X-CRM114-Status: UNSURE (   7.02  )
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

Il 26/04/22 18:47, Fabien Parent ha scritto:
> Fix the following dtbs_check error by using the correct node name:
> /home/fabo/build/linux/mt8183-pumpkin/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: ntc: $nodename:0: 'ntc' does not match '^thermistor(.*)?$'
> 	From schema: /home/fabo/devel/baylibre/linux-mainline/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
