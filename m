Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09A0C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 17:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2t1WEHSv/Xobd4JFvIWEfFa5FRwPCsm+v8kpN8OtL4=; b=D3t+YWYFN92i6hPvSqLY/SctrU
	5S8JYEF3giFk2Fl14Z5fW7GSs9NKIlGCCrqwFj6xyIEnqplVwnrGmgkW4BwOGbXR+P+DWA722Xy2y
	apWZTIT5oQDSMVpZo8U9yE2kZzzquPuUNxQSqiZU1uHOc4z7HO2xDNvicSl4eTFmLCO+3ZIPu1FbO
	7JkwxSGK/jD4wi4j5O5XC6u5CjpRuPVxnU4PZTdCVYVLR5hGb8yAymi3wCCf+VFFYyY+Ve0pdvEte
	NADpj+zvGLHaiwCFFWikuAlTZdLHuGaVSB6bjVARV5ELy4gIwFadYOIk0aCx2OywTWr6e3F6E6nBc
	bEEGs/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAxy-007SUi-PZ; Thu, 10 Nov 2022 17:03:50 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAxt-007SKX-GQ; Thu, 10 Nov 2022 17:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1668099812;
	bh=x2t1WEHSv/Xobd4JFvIWEfFa5FRwPCsm+v8kpN8OtL4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qbQJb8LsfyFmehWDtMO3aS428gTw8gO+ub3zsckAX0LZpPX4f29zVXvCbI6svFrtG
	 m/fVu6hF3CvPJXllPP0f1E3j8IRCHy8PolvTDLRJ52nMM59l948+36TjORgeDMvhZA
	 rVp/wLJz8HOFiikqJh9qAye8dg/oUDtQrZBoNnEpI49QAhUs6Oit9muRBmPfz0sxpe
	 IYxb0rVZn/Nxwp4ON1MZnYbaizbP69DqUrv6ZzIwaBTeXHgsqh3FDpkbheXPyjXAV+
	 qLtM6SxkZDFeMM8MmMWyBbKOmFmlLTZ7RS9ADqXnfCciKgIxTpRsuPaDpu4xMJ1Rn1
	 Uc8GAVPPQmOwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.79.199] ([80.245.79.199]) by web-mail.gmx.net
 (3c-app-gmx-bs29.server.lan [172.19.170.81]) (via HTTP); Thu, 10 Nov 2022
 18:03:32 +0100
MIME-Version: 1.0
Message-ID: <trinity-e9c6aa94-6656-4d9c-9d9b-90ede6c8e6fc-1668099812662@3c-app-gmx-bs29>
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Wunderlich
 <linux@fw-web.de>
Subject: Aw: [RFC v3 00/11] Add BananaPi R3
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 18:03:32 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221106085034.12582-1-linux@fw-web.de>
References: <20221106085034.12582-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:VQN4MP4prAKaeyQLdo2F1bcNtu4aIBSNXUEd5DaVlqlo7iiDfD3e/MRde1CxmvKyslJ01
 irslpCjv+U51lb0D6pDTYdwkEr9/Vi0BMF+t21Y+02yh83JcDo+32werxADltPtMgbeZV/J/ymQO
 lcvuVTh3t2XadeBpqIsfdCSrZ+sqsWmiLgSk6JhLfcUX6a2iNIcblbRMNynXCNQa2zRdgtphq876
 FC+xZJlSQVAdlVY/jZ7QDMa+soZRCtQWFHm6ZEdXCpgtzXXBTWyrzVYeReiQQAqpm9AFETsGq9hS
 L8=
UI-OutboundReport: notjunk:1;M01:P0:d/Krjwy8YxE=;BwTpPoAIASDm2UbdYKTFs+Zjp6R
 H9PD04o8pce8Sm0YsxBjQBLgwa9Y3sorQIw+8Zi75ZiWntaG24sLVoH8HA7bbotlgFVs3jtbI
 lm5+fbMVAKYVgXVxg+q3WM6+sS4ZBuoD1P7Hh36cW3Ey9kQ/FLVxCE+EEesTcTt5kHGskdhkM
 GVg6Ys1LfcRGpXw6RegvoAiSvBezHlTI9wi2lejCG9jeGhGRVOuSje/tBQIzns9WlMwkYN6gB
 Tq6YTOH9VM9iuy1tMAVF/q2Yb2iCGr4vvbKk+W5+6sGpr8amSuVfY9ZyoGTr72gybnqmTr0qI
 cDKJwX2mRE2cnfqYBj9oIKO9CUu6ZrBO7p/Ap/16LpTHM53v2YDn2kjKZB+oYhTqyWQLL96zj
 kwoNTA3P4s2ehnDfQYdsCQ4pVS3tP7Z6OV87b8V12k3EpoboCK3Kr68xW+/SQDv7RhOoyj+kS
 TaV5b58TkeGUZkjQ0jbVmxUzRhAcPyuWyvMV6YxUA9h+jhFZlIIt2O/lXaUb6e54asJsEOtYQ
 m2RtVqIPqWWsHbfjPqQapzAhrgREZ9lQrTZWggF1qSOULrVbJpnXKFWdiEsRhkcCNM8XUF2Ak
 s0R9g3ycbbigNtx9pQsFDflI0lm9M7674Vv1ALmGVmsQDdLYMm/TkrJL4RPmGQD7RlTXg+l/G
 2hUH9MrnscaIgGer3JyOkYQxAUV/GDomqQpnArQPDlDIxCbpieDHi8uoe1pwsHkTiepTq2a2Y
 7oCc8zlLKIFNLdq8fwvyKiCjE+uf6d+5I6GnOCH3q6hwnqlsqLeftP9qJr81nOCbIMJ0jVJBn
 lfBG7EVBlRZOJi147aR6osCXt9SGxqsJ3YcGwuEBmMCxk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_090345_970027_5B44C9E0 
X-CRM114-Status: UNSURE (   6.72  )
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

Hi Rob,

can you please take Patches 1+3 of v1 into your tree?
due to reordering in my tree i missed them in this version

https://patchwork.kernel.org/project/linux-mediatek/list/?series=685798

pcie-bindings are here:

https://patchwork.kernel.org/project/linux-mediatek/list/?series=690172

i found 1 error in bpi-r3 dts (properties from sfp1 not plural) which i will fix in next version and will drop
the compile comment in dt overlays.

also i've found this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=363547d2191cbc32ca954ba75d72908712398ff2

so maybe i need to rename my overlay dts files to dtso?

maybe the others can be applied (at least the mt7986 nodes)?

regards Frank

