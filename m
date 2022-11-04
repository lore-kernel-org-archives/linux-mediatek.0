Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F38C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9bxV+OCEXftWrTSONy9JJ3mm1QIs1dym/YT3cWSpDM=; b=2IoqKIw+vXfhwLor+S7y38v3Ea
	j+fnqCiEhhd9xJedqOJ0txK04XwqU01A2Cdf3ykhrEtJIOKkyrnHkX6eexM46aaF8GM6lLMY68j8b
	VYEIWK6CabvB7rP/OIlVbuQU5Rxd/pDBtL5kiAOW8DOvQ0xDI0jb1z0MTUIAD6+MTS0yqrmezhHAn
	qVjYyovmvHcmKbK13hgelH9jFlsIEWUYpoErCSUUhHIQDO+cRKHCrsreScAAMOLbsdWWV1fBWCJCA
	t5spz8vq+7WK1vj4dOIwmjh3XQTMkejjvLyaIiqyULRjTsTguJQqolvm5aNX/MrzD0Apan65DfJrw
	cyYjJTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzBG-004OV5-B1; Fri, 04 Nov 2022 16:04:30 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzBD-004OTc-QE; Fri, 04 Nov 2022 16:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667577856;
	bh=HaDXsj5DAmUozxmuMTfo9ex+N6s+nv1T65q4Xi8hgFE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZM2nwxB2r33PzRiQCbOUAeIkRnw2n9KjRUooAhRZVI9FX5xWWX4UWs1MZdn2iJS+F
	 DWw5BS4v8Jnvr9XtlBMz3T9NOVl2wGVwoY6N3nwXNjBEhsV+Dv6NN6zqc4N8WCs8Cm
	 Wa7veXULp3mR9NTq7H0N6DHXJibfQDALqqGUKtdkqQ5M4JAtSPGCQHwoMP4adChuoL
	 0lKpbFDuN3NR8wlpvQwKrfO6ot4c0ThUdXII1H6Vk4auLgDsdN88eA3fFYftYDciUg
	 hDG0gzOSaS80ZkoAsjTsiizwU2afLqcd+Ru8+pr6JHMuGs7YqTALqohyx6/tazW/Po
	 bnsNJoZx5VbNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.77.26] ([80.245.77.26]) by web-mail.gmx.net
 (3c-app-gmx-bs24.server.lan [172.19.170.76]) (via HTTP); Fri, 4 Nov 2022
 17:04:16 +0100
MIME-Version: 1.0
Message-ID: <trinity-889b4468-8a50-4eae-80a1-6bd9ffbeaaf2-1667577856206@3c-app-gmx-bs24>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH v2] dt-bindings: pinctrl: update uart/mmc bindings
 for MT7986 SoC
Content-Type: text/plain; charset=UTF-8
Date: Fri, 4 Nov 2022 17:04:16 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <e7192d9b-df86-a860-d5cb-8b4b9184e5bc@linaro.org>
References: <20221025070255.14407-1-linux@fw-web.de>
 <e7192d9b-df86-a860-d5cb-8b4b9184e5bc@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:2X1CafeoZLi1maobab4XpgEBgVUV/xQr84vHR6gjBAuOAY+JVVgANmAm4TcRb/l8nDxS2
 TnKDSNrjO66TVkQ5Xv4tr22SQACFwC8dyQ5Ll1ovrg6NFnaVVla9fQWFTGVG3ydGBt4eY/4/7vU8
 BOJEfNFxM3uM2fdID/4ZsxJovvlK1CDWDoVbs+QRvVF175YDPu+J5S564bNkOGoh11auRi/vnZss
 jHYbLCQ7bKanEf80Q/YE26Kq+rO1TwJuNmmvMxFtfFWsv5EV0YohuUNEs5XDlMS5neXaVDZAYIYw
 +g=
UI-OutboundReport: notjunk:1;M01:P0:uc0fEXlhH1I=;v14gmGUwfv0+qhv+chsSKxKrs5P
 pwVmYK1Z+eFI4681MyQNBz/llzYKerv1128HaHFkR43erPzjWWPnk/BxJfoUhH3LmmWPkGsWG
 Sk8JuO1KSz5VdbakOSaL3Ql+Q7VPd4OGrLYhSBz8dfwaawb4C3pSOYpTnkgmMjCmqQgFXmrfq
 b9kGjG+G5j8n2iuiXVsv/L6nFTFnolCkwcPKeFysjsSbGZ7M0lGV+kaRIrPmezJVEnMSFiL9D
 pYy2VsMd7Dk17hgP81q7yhcsCA5vXFceeYISenxgZfBiXQSJV6mNKSFiGp0Ttql8Jyr1O/3ZV
 VyfLpd7PRJMmzap8TtKeBdgp6R9xVMsX/IaaKtXXfij97OGpAGCOJqs5hCE4Oz3DMP+F7QY0f
 WIN527EHyL47okLwszSdFNatf6uh9rc9oCMqHSMHq2l4P5g0//mfjV8G6O80rYd/RXfinSKGQ
 7PPQRA0vJckPPSWEr9IRQpH2he3G8/22AzEqEBjDvZ6xAkTTz+iiUCN5zYA4mTT+lBmT1IJtf
 h09a8G8k4edta9sAq9qiMoGgS59X1Se7+ounLhHeWFFVZSVrgWNGdy4sBjD4vvgAb+/78C1gd
 oKf9no7c1eIuJa6bFL0s8Rwwya4yeVFr6M0ihtwsNdwU00a2L+3SLcHVvkwzhJ48p1WF5kNKE
 4KXjT9FbecheJRm35FwNbIfhbmCrFR//HA7gt/o5x3FgnaeLupaIbf6BboNfWbDFrRcQ1aTLt
 5zPRw4LOtLFUnk4KjIWnSF/+GgkaQn834lSdZe5OsIaQRJWuCnkC7VL73hMGHATNrap6UOuzr
 IDQZmto+wcE9Idj3Tx1bfR8NAo9OQlPqjlgFTRtTW3H7c=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_090428_252234_9B82076A 
X-CRM114-Status: GOOD (  11.49  )
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

Hi

> Gesendet: Dienstag, 25. Oktober 2022 um 20:35 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> Betreff: Re: [PATCH v2] dt-bindings: pinctrl: update uart/mmc bindings f=
or MT7986 SoC
>
> On 25/10/2022 03:02, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add new splitted uart pins and emmc_51
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

after talking with MTK for the emmc pinctrl settings (custom pull-up) they=
 suggested me to change
binding to fix other emmc-values and allow multiple (2) uart-items

so on top of this patch

             then:
               properties:
                 groups:
-                  enum: [emmc, emmc_rst, emmc_51]
+                  enum: [emmc_45, emmc_51]
           - if:
               properties:
                 function:
@@ -231,10 +231,12 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1,
-                         uart1_2_rx_tx, uart1_2_cts_rts, uart1_3_rx_tx,
-                         uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rts,
-                         uart2_1, uart0, uart1, uart2]
+                  items:
+                    enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1,
+                           uart1_2_rx_tx, uart1_2_cts_rts, uart1_3_rx_tx,
+                           uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rt=
s,
+                           uart2_1, uart0, uart1, uart2]
+                  maxItems: 2

i would squash these changes and send as v3 or should i send an extra-patc=
h?

regards Frank

