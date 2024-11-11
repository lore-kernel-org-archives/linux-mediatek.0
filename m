Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74751D3ABF0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 19:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzVPifvp+iOa3Bg8cKfqMmkzoZgJjO8HG4nRsmMmkk8=; b=xE/VrPme2fugsQAxVX5UzzG+3V
	244wJJ0xhBk7QL3GUvywxqZSPukO2bIajsaLsNRAaYmeqJnj+12ZX/+EaAp09BiIjSABZAqQcXcbp
	07U2B4xxf+oliVyBB6lfhiFyNYNRVDRzGgMPcoWQJptmz56pbNRCl7RY05jntFNRieB6KkQKwT3CB
	Z7BLAOwywb97Z0bGPylPAvuqNGEeheXtD9sM6ye3Eklda1rk3gykMcQRLdYW69ceTXb0ew98/z0Oc
	PWi1QAveu9l7FK+ddsfvOQMzCKyQt5z+AxJZo5d2Ar5FruDo0q2Iv24fu+JcwXgmuL/gHDyVmj7xp
	y5WHqvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZi5-00000000zxO-1a3m;
	Mon, 11 Nov 2024 19:04:25 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZeZ-00000000zH0-0I3G;
	Mon, 11 Nov 2024 19:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1731351635; x=1731956435; i=frank-w@public-files.de;
	bh=KzVPifvp+iOa3Bg8cKfqMmkzoZgJjO8HG4nRsmMmkk8=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MKcVCczT0LrVOyHtFxP6kLVEyg9Rr1DOfg6dN97+eLgdVgfXSbbOnfGXL1iKXBZ0
	 rHAaRovRfKpQNZGMSya3G3Dv5TxiU+75oDJFhacN/Rxg2cEl0HXP/GYix8bKjWJ4M
	 6gdr2JSpVTgy5Dr2pBKRgdfOPBZmg5D18sn3t9RH1xp/RH1VRplnf0051FoPN5jXf
	 PnhewIyAfYQDpXChudBkazHUfPhknM7/2B6Qs0ylrCskhmoi7GKCa8gMj7vj+GNaz
	 WHJhAINo5m0iF/ECPlrbAnzZCX4DOScoSfkV3UHEE+qj1eY5Qo9aYq3Xw4Kb5EadF
	 s+i/HtgRthArqrIJsg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.144.196] ([217.61.144.196]) by
 trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-qxw8q (via HTTP); Mon, 11 Nov 2024
 19:00:35 +0000
MIME-Version: 1.0
Message-ID: <trinity-090addc5-80b8-4d9f-8f01-ed2c519e0d3d-1731351635476@trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-qxw8q>
From: Frank Wunderlich <frank-w@public-files.de>
To: ot_cathy.xu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
 linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 guodong.liu@mediatek.corp-partner.google.com, guodong.liu@mediatek.com
Subject: Aw: [PATCH] pinctrl: mediatek: Add pinctrl driver
Content-Type: text/plain; charset=UTF-8
Importance: normal
Date: Mon, 11 Nov 2024 19:00:35 +0000
Sensitivity: Normal
In-Reply-To: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
References: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:Ozjf8sg7sz1HlEchb8Y+cG4HP+g7ZDiilByq1d+03bVEVcgQ9K0XMDkll7rll0qLgITIE
 ZRXCP79R5bR4FbrOFYRZFZV24agGu9MeLINTAn+IiWWWtWN7bdcpMLeou+bBIyEIf18xDIMpdrSV
 G3dap+gsWMuJOy6FmOc0oMSmNYmRTOUPBZAysz2YfIMAr96RStSuZ1aDYZ2pRlu8hQIUsjxFRQrb
 35pp50DzueMKPBgbh3ePBTnmVlvS3E+h9tq0NieKZMB7PhJ9imgyFutu1wujwBvHLr1RblmMq5ad
 TjxYsWottylZQLn3jZljR2jUTMsb7Lcs1Ihwkv+dnMn/TcO/611KbYA3CrJ7SS8BGg=
UI-OutboundReport: notjunk:1;M01:P0:Cxp8uh7T7Lo=;8fe5xqojxII002tLFune4TqJJoC
 gZkvtiBWOB2zgESItk/7vPr7m3XzF2906z9pRMI+TK6cyBsvNgiOqrCW5kD2Bz1ayu4yTC77a
 wjDpBWy4/v3bnRX0CgV2KB63aa2VhoN7l8NY8IMwAoA/gX/7GDUDivS5eICyGpV08NU6amwCK
 zCC/UGQoY+JloFmJn07M6MU94UyI3Yec2h1+47MzTMQdDlCi4QxOB7JEUgKeYXAQhJXPC42N2
 pcsGbAE/RuOPh+s5UgI5gdibRK/2DID+Z5Mm78BDJY8R46SZnFV+ru6524RtJ6hL4lAZTwTjI
 qtyYKz3RxzSzdQ1QdwqIKmPDXWDhlM1z3YWArCqZ59C9Y56C0hkclxjWOHV3YyXYS8jz9IQMd
 N7Kj69kG9VIiN93AuUr0pgh0anLqchRMW4oTs0NClgJCJHD5VnApKmq905mHYLt8r6wG5NCda
 u4xK4y/MyzX5YvQTAXF8wbqz/HprgVVVgurjCPAXGEnuWlY1zhmb3swsjTzmwU1zbZIMe1e5V
 m8k8wPJW8hnif912XQ8QEnPsvmgI9Y/Gw6c5zSRpPsZif3byyilT9TU3qc/BtC7cWcc8JPaYk
 kLv8uCNffBBxhnD3YWdhDYLfuWB1rFpbbP+9+zY6J0rPjsz945B2wDzenafTxjIQj+OFIvdN6
 oACatyGTpNh3R0vFBa4q230qNfQiy2PLyGbywWq41w==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_110047_426648_4BA015FD 
X-CRM114-Status: UNSURE (   4.15  )
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

&gt; Gesendet: Montag, 11. November 2024 um 08:40
&gt; Von: ot907280 <ot_cathy.xu@mediatek.com>
&gt; Betreff: [PATCH] pinctrl: mediatek: Add pinctrl driver
&gt;
&gt; From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
&gt;
&gt; Add pinctrl driver for mt8196

Hi

you should add your SoC to commit-/patch-title too.

regards Frank
</guodong.liu@mediatek.corp-partner.google.com></ot_cathy.xu@mediatek.com>

