Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2388FC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 22:35:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFC120791
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 22:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmqWqB9b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ov7NuiLE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="F+xf+vUv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFC120791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gg1kbhwzU+18ud0hsTcKf0ICGbcQFvQyHNknsiqfx+4=; b=YmqWqB9bcPlIJ43fTluIOhhhjd
	GfqmqDGL/7aqxwBjacDeA8ejWb8OWH27Nl1dBAvLaAdtLsyNgkopoj9mPh+4V2R9yvvCuXYx72Bvp
	HTX/95SokCkGjHpAHKOFsxeYMk8ANBNJFx/UUtpnuPdRl2Q6M/jCjrljIdyCjIfBFrNUV05M6vaaZ
	crSgymdlB43VOLyqY3L0DtFOTYKAfoJBhl/2TKg9+IeFwKSBgkJ8OmlquWm9Q19NGa5Me0jk75w6P
	g+7qEDReGjz6+fiQ0wxDMKSUxkRLyxIh2ffhLEK+6/ZMXvCc4xhGi4AQGK50czuJ6rIuWEo0O11N+
	KivVSw2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB40w-0006mh-SA; Wed, 26 Aug 2020 22:35:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB40t-0006m4-M7; Wed, 26 Aug 2020 22:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=+JphGhQ16chTTvbMEA1xhpe7rQOqyDaFJ04Zi4/sdT8=; b=Ov7NuiLEyb4aXkT2pRyeRxXaYz
 3/jgvzap5qey7RcTjSqHBELK8lnVaxp523li9e8tw52x0ky1cHK06xDGBwHiFcTS6BHH+5PSvUPok
 04b1NlEgic6ooCwE7pmgaSDS8pf2fnSu92de5r3Y3whJwWGLQ5gdqTVS3MCEn1kbCgn+ORx0m4p03
 cMsaE7NuadPjWOOdJ/eHQc9UIHgHBXpOvuv6n1NC3Ze1OTcEZl/gDi7QDJ+GcUfn8wiIMiPEUDjwr
 UF23RyZHNCHf4NfhDH0mk2WBAQ3QwRhUdfHngxftCZZqFdtoeAygNIXPuqHmmXcEm2YHU22JK5Xc2
 r2luBbzA==;
Received: from mout.gmx.net ([212.227.15.15])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB40p-0005sr-EW; Wed, 26 Aug 2020 22:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598481312;
 bh=+JphGhQ16chTTvbMEA1xhpe7rQOqyDaFJ04Zi4/sdT8=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=F+xf+vUvWtA+gT8iXmGs7BmnwTm6CGEOJzUN1oriw4TeVuqBeui5ayoxBkWaVsW1v
 EpBw1Ew5Z/PK7ocA0nbAzb6nZB4PYBy77NesAiI62qLO848tbxXNZG6MTdhU/O74x5
 MS3I3/S9dLWr/c7KDjFwQwoNosb4GjSjzKl0ejdU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([37.60.0.235]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqb1W-1kxH1Z0ivo-00mcf3; Wed, 26
 Aug 2020 17:52:29 +0200
Date: Wed, 26 Aug 2020 17:52:22 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20200819081752.4805-1-linux@fw-web.de>
References: <20200819081752.4805-1-linux@fw-web.de>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/7] make hdmi work on bananapi-r2
To: linux-mediatek@lists.infradead.org,Frank Wunderlich <linux@fw-web.de>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <17DF940C-7DE6-4B7A-B9ED-147370E4FED4@public-files.de>
X-Provags-ID: V03:K1:pJbAVylxOIPePMiP/ytzA4bysO6TQ/QaLoZqXRwxsIfHpp9zBur
 UC8ZWYEyUAPbBJETUJ6OwkZze+eErrhZsLBSl9oSAarWSUD9zihuDn+r1guNuaua0q67KO+
 1wy3HJ8763S6gLylE6bGtelRlWRS3jxwGWaz6ANdT5n7rtixuvXCklxu1b8MPGzKmFrVNZq
 DVlqjOVqd52zlCjK84mNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZUIx4Q2o1Go=:T16maB7GWzgm5Pf+/b42zO
 vYmaFiVG9yXvLEIE4vZsE8U8xmseqZgnD+3fWulylMFb9fHVC7PGEmkQuyI5D+HkuBpkMbrnw
 ldFdf8z0zpTlA1rWCiIyvtq5WCO37vVBBZ5CEht59uw/MJ/p82f9/yuHbsht4+6c2XXqJW3xt
 x7GdkM+Mvrk6VtzM2DuJ+YDWdItq84Ly1JHbU3chkc/b1HjZvBnlmi+J02bpbiTSjM7cD8sHm
 qFvxzqIA1go7DXINNjl0GgTv1qYPGTwIE0pGEDO6UUAw4h3Kd/IBtPjFxuPyy5rkRDN88DzCA
 RRy9nLI/qVc7nxMnFB+t+KGmlMcuDsY29OJiPxGsN/vBmz/8wJhHcadXkOQ7YxEyOgcs5GY4O
 GSLjeCFtP9s1ZUrWAthAI3GjYBlfc8b9d84c82fp4+ZhEWwn4W5QbTGn3WugtLNz2eQk/NiIs
 6CsQX6AJxiyEGTr5YO9gsmDFpX8KPoDVRY+mc4NIIsLRuMnprqPlufuZvUwX7zt8puIsDFXMJ
 J13eC2fup2rSdtPTPYnU578SgL+emqLsC4g5003nqRaxFo725bvnz6LTEjydAaf7QQSl1IWqD
 Lf8eTotyWt/6hq30BXbLuDTw5ftDBNXDEagKEJOZCZvrHj7zyErbwhE4XtNQAN8hj9AOO2SwV
 Mbd3lbB0eHjGzGaEjREOVEDbxO2Dvx6r2qxwkuKZDqESK/M1HtdP5zAjqNElgBBiA2D4JeBPi
 PKucXUMnNK3vF9KhI7Jgsg++zSolHJJvJeQP+mcuegktM12kezpID6cB0pAtzyfFGZ0+8RaJZ
 vEh1zUWkEQM0qnCacPxsviur+nMNFKmEfJ0ltM1pB3E/cxxYlFH3epPyPCHuMTIODsxFbIjrA
 LqTFDSSZ4X7khKGdrfuYI0560/lWuRzNsz3gtn4GwXXFuJufjpG9mpxlFEmZfKPO3sjH9X9ax
 qsQAZKMVjkho7rSsm1k5jgf5QGwV4LJn+7XCQ3PB+n/a/kjpTXuWCds3D/gqdww3PjqrRTi6s
 cKb36KwOwPr8MQMvO5cNyxzhdQMF4BRfj194X4PsWEuMbT6+4wvlwjQan/chMvw26N85UwA2Q
 pggXJDP5oP6AsEugOGTNH+sVHN2tgL7Jc+Qh6hWEfbvsr2MxriAB7XhUrRqjdIghttr2Jt324
 nunGYfXb+keh3pX2/txJmMRkYSxvHVri7Zs1FGpV80M8FnkWqfI0bp231eL4CSRlwwRAhOhxI
 Wumo+JkotLM8OhnoQLBRfsUqqC7nZCONE5PtF9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_233523_657810_6EA4EA3A 
X-CRM114-Status: UNSURE (   4.57  )
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
Reply-To: frank-w@public-files.de
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Just a gentle ping...any opinions?
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
