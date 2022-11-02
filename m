Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09DCC43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 20:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0H7jBpzrAR2REEpN+n1YQHRRGjiOWRtFGXalyjmNdg=; b=HevzMszaf41O2b4y9vW++50XeX
	RN1BNfPkLToAxO9yMKzIDPoV4Al57Xo1vhc5+bfUi//kqgpW5yctNR/ODsqA/9j8OHeO9Yc/iHRYo
	6q6sIghRvc/5xCYthQggL8koE3VNiWdTygPVwjIR/pwngVIZFbPBBvRZwqCWsDfKO7Zf8PljrI5mO
	RGNxeZgFCdIPtqFDhe02Tk69cpt+TyfCnxQYZkVoEUv6gjJyQmHSijNpg/5wG0p7LqsQueqIeVSzk
	h0z3TMQOA1kMr5agDRkTMl1IT+8RlxMmF6TOvAeVJQq1HtHh+yRrfYK+mYcsqdVegdcSUpTH/YtWv
	RJiaQEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKCh-00ECQH-WB; Wed, 02 Nov 2022 20:19:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKCP-00ECBM-HK; Wed, 02 Nov 2022 20:18:58 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA43966028C5;
	Wed,  2 Nov 2022 20:18:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667420335;
	bh=QXG2UGbCO/Vb7bB+f3sbN5iLPV4XgVhI69ZzWdISI7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPvlPgQgmMNdTTg6Zpdc0LL+iDtc8f2gN2Ruk5YkBEZYEJWXF9O57sTUj15ToTgwX
	 TsXflnStGLaDQs6xO9RYaDzXzvH3KsJFpdHuflJqUUohLFQ685aK0ptSZ6A193NGPY
	 Zx9eaF5Vg4Y4tiJ30re2dBlVWbj1V3Lgdjrx/DMZOW2a3Nfuql1aahzYOA7OvqoNzR
	 4GZvJzAGm69eyQdvLQRodTkiZlW3ABlR9uYSKNc+X6Mn3gsH4T7c2zvuZO/AG3txQN
	 ONX9hROW/rNm00B9wB0lftp4f1soNZRWZWetuEau7zXUWRwdzGeshza9Uwsv2B9LWV
	 9PK5Q71bMT2hg==
Date: Wed, 2 Nov 2022 16:18:50 -0400
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
Subject: Re: [PATCH v3 2/7] arm64: dts: mediatek: mt8195: Fix watchdog
 compatible
Message-ID: <20221102201850.67gi3fyvhxu6hhzs@notapiano>
References: <20221101090116.27130-1-allen-kh.cheng@mediatek.com>
 <20221101090116.27130-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101090116.27130-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_131857_732953_4718EBE0 
X-CRM114-Status: UNSURE (   9.69  )
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

On Tue, Nov 01, 2022 at 05:01:11PM +0800, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> MT8195's watchdog embeds a reset controller and needs only the
> mediatek,mt8195-wdt compatible string as the MT6589 one is there
> for watchdogs that don't have any reset controller capability.
> 
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

