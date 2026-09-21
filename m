Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA76C982DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdNN8wBCfzSMXGzJJEelWBMvPVsck9Owmas8/0jO7+Q=; b=JwF7NwwNcPdbb1
	jxyCblGxrQ78XdwdTuVmTOR3ygWTINmCUYltQwqwIDXdQ2Z+HZFrIp+M9D6KbpgTx4Ex2gX4LIXgd
	lox+yaUtM+KlDLRsTbK9fVksqzkU5CzjRXMNQGsbYptYIxkdWS9OtIQ0y0+aPjXmNwcKx5h/c3BBv
	ZToKbmht5z4UKjHk8fH3HesdebcV5J16CeI/1S4ZF7sFArF2DBrVEFJK78xPaeBiIHUo3cHO8JBOk
	38LNBgaUghytNQY6ld9xXqMxjsRXtrRiTnqXzDr8AVhCOh/UPgNeFuEgnWIN119pEG4dvv1JXuGY/
	V6YDiuXiMM3LWErtL2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bAQ-00000001fwp-0MTq;
	Mon, 21 Sep 2026 10:22:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bAN-00000001fvo-3POE;
	Mon, 21 Sep 2026 10:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789986149;
	bh=2zzAiPlCMlsKvglShMlQV7ph8zJ/L+voqaBQavdm2YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N5UOaGREaW4M8VNJGJXTyB1093FUv/1VEXDlrgZLzoEyAGVWo24TyGZHS/XZtFQFU
	 gRk1eE9RNUUdRFYN5J4SA73arYUfTZzBToEMEfxo1VaGDxp/ZDovL0vGgxQtvPu9Gg
	 pKTO402q5C+vEarlWIj6hCArDorCe70Fw+/Bky+Wqwcac9V3hfGIB7bzPcLCj35nGH
	 erlWHSpco2lVv37v817Ls+imGrHt4Q8Hm8fQKH2yLsSolDp3a/cerTROPerTFfIiVG
	 LfvF9QbDz34U7glJP3cdRIJHD49adFlg1AJDRQHohtvagHuts/R4eJTB69vnYyE03Z
	 Sww6ZQvMmjEHQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2120817E03B6;
	Mon, 21 Sep 2026 12:22:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20260918143846.30458-1-linux@fw-web.de>
References: <20260918143846.30458-1-linux@fw-web.de>
Subject: Re: [PATCH 0/2] Add gpio labels for R4Pro
Message-Id: <178998614908.21581.16111635463377491991.b4-ty@b4>
Date: Mon, 21 Sep 2026 12:22:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032232_008558_D743B6E2 
X-CRM114-Status: UNSURE (   7.38  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 18 Sep 2026 16:38:41 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This Series adds line-names for i2c-gpio adapter and pcie hogs
> for easier debugging via /sys/kernel/debug/gpio.
> 
> Frank Wunderlich (2):
>   arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio
>     chip
>   arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio chip
      commit: ee3f4a1785bd73a865a4aa5e1974c6079f96b2bc
[2/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
      commit: bf89276b2db391cbb25d1a0e898280fe85b16fb5

Cheers,
Angelo



