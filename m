Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333DCC25B06
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 23:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmr+N56xrpZAP+m/mtb7B5SGqq0RwShP5MDfQZV5GEI=; b=vvvJF1NOyku/A3Lxus2F23Kify
	DH1hbF4nKBUM5Ce3w7z5u3tROHU7qfeSEATsPMUjug/JceZ2ocJExkdEv7Vq9pU+l7LpZ+0ZKUd7V
	XUrw7DWxohVWm+72XXueLEeoZ68N55dLJ8xjyKGZttuUX0lM5FGom5F3N7vBc3Hz6XtS3y+evP8Be
	M2M6YvE5V2pR2vKTx9IssJybsw+vai2ndKx2TzyaFg+eF38iR1/Oo0Z4F3HajrNjYVRfkhld76JEn
	uszSSt9H/2RaaWRC/EUGX8x8n+XHHYuNTgdd3JGRj/r3VINRwjj7BURH5aRK3elMitPzebQGrY825
	QkGEwYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJjxa-009v7f-3P; Thu, 04 Aug 2022 23:08:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJjws-009up5-N4; Thu, 04 Aug 2022 23:08:16 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3439D6601AD1;
	Fri,  5 Aug 2022 00:08:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659654493;
	bh=nIKTHC5TpgtGoaGyFnf60f6v8daqV5/eetp2cNnFVUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDAVqgo9BlaaUvUiY0XCyNeS5W2pL0k+O29BBFHN9HicuIWjF6sdwHYlooS+j43iM
	 k/TXrsfNw0kJMqG0KMCb3V5aYvit/JHFSoZxhN2Oz6IRmBbQJeSo4hdsOwN5xO5vfw
	 C01y5PCmF+qsJbSymkjI4KZcHD/yHmDaouQBl/+VP1EmTa9sqnRV5yQ9H4mNNs9A/N
	 BauwjogF+iteUngwO70XiR9CWVf8ReeHjPn36bVaOoX0aksJXkeOd+hCd2zHj/tKkK
	 CgK2Y5df73Td3JWwb++1bZ/0pm9fQ4jDrmAP6y0vFWtJXxoiqGvECdOYcF6HL7CaFj
	 pDyA3eei9q08w==
Date: Thu, 4 Aug 2022 19:08:08 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8.1, 0/7] Add LVTS architecture thermal
Message-ID: <20220804230808.vackudl2vymysakw@notapiano>
References: <20220804130912.676043-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804130912.676043-1-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_160814_917434_1BE8AD0D 
X-CRM114-Status: GOOD (  11.98  )
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

On Thu, Aug 04, 2022 at 03:09:05PM +0200, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> This series moves thermal files related to MediaTek to the mediatek folder.
> And introduce the new architecture LVTS (low voltage thermal sensor) driver to report
> the highest temperature in the SoC and record the highest temperature sensor,
> each sensor as a hot zone.
> The LVTS body is divided into two parts, the LVTS controller and the LVTS device.
> The LVTS controller can connect up to 4 LVTS devices, and each LVTS device
> can connect up to 7 TSMCUs.
> 
> The architecture will be the first to be used on mt8192 and mt8195.
> 
> Changelog:
> Changes in v8.1 :

Please use whole numbers, no need to make this more confusing, v9 would've been
just fine :-).

Thanks,
Nícolas

