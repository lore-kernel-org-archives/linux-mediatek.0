Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE78C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sNBKAl7OOapdevNUf8Jzx/GBxqHRBQX6rJ48nK4n720=; b=e9NvOPwjBEVLY/pTBMEl+c62hs
	ethSPvcjGdJDGLTvVZLr7yA0Iao+LvXxXSABbHdAUZcduCXG5FKxJ82n364RiSyM37HwAgxxtnODD
	UOuj941dO99vPCdPWp69XF9BE0A/lv9ui02lElOXJTo0tVfc8CIGqrdOmHj5Wm5RF8jpBFwqei/M0
	WwsCOQ0jnfW2ebQOSjl1+OaKnV50Ut6Jr9Xqs5J/x6rxvPUXHFci1jgkcNX55K/R5HFOjPqokoDq3
	RUrhVVHI8SaIsm1lxjQNA7N5Gt45LBFMQRi49TCc2YrMrtop6T1/m388IiESJrXIX+j0M6vIli8uk
	jq6JMq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbdvW-00EwvT-1i;
	Thu, 31 Aug 2023 09:25:22 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbdvT-00Ewv3-0f
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 09:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1693473911; x=1694078711; i=frank-w@public-files.de;
 bh=sNBKAl7OOapdevNUf8Jzx/GBxqHRBQX6rJ48nK4n720=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=hfS08G04dqW7hfdus+6vSBieAIMid0sikGcUKaFEvxTcQgOpG64Jgeh3/eRN9WyDvn+C22K
 tJteN7j9n7DPfQV7P7kTXeaUtNfs/pFU+BsC+SaolKc+M0Jq4oFi9lBohaVqYWaA8UTRwMpTY
 yNTxSUoDmBDOYEDeKjIaYVj4sF/1XeT8yj28y+mm5aBY6BQVSfa9Un+wHbQmsrXiUmvoPkQMe
 EPD1qEoKqAtd+gVffFP/MlVvnYpzmRSn8ZSDKcSn7A96NE0FRUR+lAaawAk6yMw9qpzGm3Koz
 xzKBqRAUJieO0SOTduXD0TWsXW480zZUQIVjksZgujNtjxYMVP8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.102] ([217.61.156.102]) by web-mail.gmx.net
 (3c-app-gmx-bs12.server.lan [172.19.170.63]) (via HTTP); Thu, 31 Aug 2023
 11:25:11 +0200
MIME-Version: 1.0
Message-ID: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
From: Frank Wunderlich <frank-w@public-files.de>
To: Markus Schneider-Pargmann <msp@baylibre.com>, Fabien Parent
 <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alex
 Riabchenko <d3adme4t@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: regression with 33140e668b10 thermal/drivers/mediatek: Control
 buffer enablement tweaks
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Aug 2023 11:25:11 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:R3eilsBxaSYuZUiP7U6vkF0RfEeb0noEWsA6CEAJr70od0u0dalua4leiu4u1uW3DCsTa
 nzE3EdAv7fa5FYtTWg9MhuZREI/GJuQdDmAiZ6dSkdj+h16jVl3GOfl34oRE4tqVHbb6/Owk1t/R
 0uEnukVCojLfQ4inmZqIMoJwliqPukrgvO7gORQlILGziHkufUMKkWKWEtOSL2lwop9o/QyF9DXa
 xtorP5ym4Kx0ZtFLDblmHxUbRX79pY733xBiV5EuJ0VOgsa+zGKVlFalmEaYJXAoaOZ+D6+poSnv
 K4=
UI-OutboundReport: notjunk:1;M01:P0:c/R6z86VHUs=;4PInPeHMuhXaEVxk6mtDONAOTCN
 4q0LHjLgPqIwRU2cGfiTNIcHz30VmauXMIqJAUH5qxNpPu/SigIPcqRAZro5K8W4P554l9lxz
 zjSsdVNX22QAN+Xm1Sf48zgEGHyv0GFWcURnsnSZFihqY32U9ft1UzuSXy4ae7/7271fnf6so
 wGAU4XCUeT+XbWZx0J7DRkVCox0dqJeXAUidcSHiCNBeMu8xsG234TzI6CLKrK9HHEBtxltrx
 aN1K5vLehmzjEO+i7oDZZi+d5WwCIyxNKXIW9fIW0pABkyMAhb2irhL8TmTlJ5L9Zqv/aEf1j
 jgr2oQPjdgP40vke/fcqZ3uzImGw84ot8r5Ub/4QwXYcSovvLfeyw/qDYqcwXvLl74uPXkBAu
 v65GMgLuEQVuS3n54kYVhJfYBPzs2+sVwX+Fb16RXPhkdwYqKWc+T+2mXfsd1aJA6Wy4qamo1
 4RzaabDE8n7cMTZj+Qlys+7329f+pF/XYr6BbdhE+2KzSx/blp+NyeQTgfoCW0H7AF+8ZspzV
 oKpemF8QJ/EduS3Et1wSvvvG7/Ubg9I8ughlrLvhXq0WanbeqMwz+qU9hSdrDnk9wc1N3boAn
 d5vmcHOlR9Zer1G5b5/6guQz9WUaZkNXrEY2/vezn00U/wZk4gu57WjEU6KKdeHe99mr6fVsC
 vlR8nbRkgDEeT+hhQ5TfbsLyzRQNquFrHatfhe6k/hv1HtZcXSRYrldKyrw12juOIhFkQiMq5
 C1hJhV1Zny8IduNbs2kWGBvp19Zxhmee63bPXx9cAJDwpiyTcFxIPyZcPyFlLkWlmS0jZafLA
 kdF8isexpaqraxSlz7zQLVAHu4j+DC4Hlxb4uTmrRn6PM=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_022519_626943_01785670 
X-CRM114-Status: UNSURE (   4.45  )
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

Hi,

The commit 33140e668b10 "thermal/drivers/mediatek: Control buffer enableme=
nt tweaks" is merged between 6.3 and 6.4 and causes a regression where tem=
perature cannot be read correctly at least for mt7986/Bpi-R3.

bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
-274000

after reverting the commit and fixing some build-errors in 6.5-rc7 because=
 new members used in mt8365_thermal_data too, we can read temperature on m=
t7986 again.

i guess reverting the commit is not the right way, so i ask here for a bet=
ter solution

regards Frank


