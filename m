Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00199C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 10:49:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD1092076C
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 10:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XV6gPphQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="hIHQ8+Qs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD1092076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+WWKxzp7vFKwEW20l3uMl2/PgJEbS1tP3W04dSARsuI=; b=XV6gPphQ7FtP4woQ9CTbwlcgx
	1MIWCyzwzmLz6nFsJ0zqfrmbOSmWmVFDGV/SvDDl5L3X9XShi+vxSZx+dAJdqs/91kiWO9UjV82lh
	UFHQ6Lwy5AqCEzTmfM0tDZwwC2cX5QRvFaJU1X0W0Kdpg3IcToaXSusY/UY9QQllQCIFdBNeLF3j3
	s7zaLdbWdABZQGq4VdBk55fKcYkqFJHCTbKtx3l2Vf7eBp1meWGCL8hx/6MfL5CSTLeD/+UClmyLc
	wDxfNFFgnp1XJxYoPQIkWKxEG1oU+tbttWZBtQ5PRW+5tpKeMgFJt2VtZOHjiJXrPG4HtY6TmY0XN
	RkjUBWMVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Y1T-0002Ix-BH; Mon, 03 Aug 2020 10:48:51 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Y1P-0002ID-4s; Mon, 03 Aug 2020 10:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596451723;
 bh=6ZdvDRYWWS7W/6/oWpKYAUXrrNsMjE9GC1lFAPjaEbw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hIHQ8+Qs2NJlrCGDvcnfAr5T1LY4I00SRmgeLvNP3TdzjaFI+IFwV2f8Jjim7QHe/
 K0dshqdtfx2Zps9Z+II5VOjSw/nibC5mXcKra2r+aZBHskdI1VMyNXRaPY2hVC86nW
 bO6yHI0hYE4+Yw3PnDIKqUQh5gmEVbb5ctt3BnDc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.148.26] ([217.61.148.26]) by web-mail.gmx.net
 (3c-app-gmx-bap36.server.lan [172.19.172.106]) (via HTTP); Mon, 3 Aug 2020
 12:42:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-b0ca2ee2-259a-4a1e-86ee-63b093202060-1596451368067@3c-app-gmx-bap36>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: Re: [PATCH v2 1/5] drm/mediatek: config component output by
 device node port
Date: Mon, 3 Aug 2020 12:42:48 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
 <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
 <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:9vlPvrNuItAQckw+6Ztr8lZ2c93kbfFS161DRt6sRjSdDULNAQlBMNQB3GV/A6BxYIa+v
 0wTqKAVV/0jzVQPBNcW0QKpI8hY0RaP73QzX4DpYLEFzxg5do1dVhrUZZMRaGDDUMWIueRHUlTU8
 I8kQ69OzYmW5ViqJ8J2jSM+k1Q+z19cHIrSuC9bR2diMxNvC4nhekLn41fYjAnG1kO5EkmLO6zLR
 RHumKNb7xPc8lspeBR96Xz/qavYqtpJBM6ZjIZLoFxpmtqsRtVau9sZbJT7FTbu+AgKwRU9KZvCM
 64=
X-UI-Out-Filterresults: notjunk:1;V03:K0:XYiLlJdQo+U=:QpydamNJ2YfdPgLzPaApCc
 yLjJx3F+FOtjSm/ZYo2N1c0+Mlc1mZ2QMSOxQAzTRplJA5p2FX0jFfcd15lIZIFEsZabwbGRA
 N7Sqbq/fXzJcuMQvhTwzWCmXZuozO8PXb5md2Tr6pQk0WPtFfIzurj/4vDhUb1Ce0nEzklkF7
 QeSPReap8Fpmlti63E1lhrMEGlYRGwL/dZZOzZLPxUN6MrkOF03SkPE9VOugfxd8OJ3FUp5ny
 L6VgB3aJ+kg/WaG2oGmfy9BV21oLSgvn1oEVbzJlNbdlJBRNkbJF96lfoI+drTxcmBG0qFE9X
 xlwN6NvCwJ3Oo7ILljznfdugmo6jF26u7AuPNmdky7GtaD2lBm0qkB+mNa7HLjvzbKIBAMroy
 GXxY4Ly8SICVqzarT6qdaVZ4sA0h+nOSCW2l2AuvWpRSxcKIow7+0wXgLBo2tBRmAtvYXOqzx
 lqamFOpAt1ndQUjLEkadjyELOCWhLtqyfR6hY+jwilkRKq5AEkVRN8o8X+J/UAJr2meU2IcOH
 fwv2a4a33VAFdpqkZUVgudny/v90v6BMr1mMVCGFknsqwRN1O5JM5QX0EVZkhuSViSa8c0tr4
 Z8JnbncxOZLbT+I6KnRLZ/ToIIwnQ+WHzm/klzVPxHQzG96T32m8ZYU9EpZxe1ihRvJZmQOME
 r3OdcYSAJOGNIaYQu7ysKIOOLrIOoK/TDvCQQ7mM6ZMj+grQEQD88w8x7swA1giPFfOk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_064847_425104_97413C89 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi
> Gesendet: Montag, 03. August 2020 um 01:47 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> Now I just care about the bls to dpi. So in mediatek,disp.txt, you
> just need to add a Optional properties - port (input and output), and
> modify mediatek,dpi.txt for its input port.

you mean something like this is enough:

Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt

   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.

+Optional properties:
+- port (input and output) see ../../media/video-interfaces.txt
+
 Examples:

Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt:

 Optional properties:
 - pinctrl-names: Contain "default" and "sleep".
+- port: Input port node with endpoint definition, this can be connected to <chipid>-disp-pwm

 Example:

should i link to pwm/pwm-mtk-disp.txt in doc?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
