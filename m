Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA8FC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:45:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28FB4207FC
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SBKFgPwd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="WZt3TyXD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28FB4207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fg+ONrRVi3JVTUeMtV3XkWpJ+lQ5Mjg/5eql9k6rpuM=; b=SBKFgPwdk0J4chxqwgc94/wXq
	q16IBa5uENN1GcNmteBFDlskz/KvJTMMjABBj6LsXP11EBMHWT6clEHkrMYXu6hP1dA+QvMZGdrHy
	NEafJpSlOL+6uNnWrvLRD4f59iCSvq/sNV57YU3/MFL8Z6Lkz86XZY1qOqVICzHmC1ozliRhJ2y/S
	DNoC8ZDWn64gfrFy9zFQD0NAt1tlk4Ylx4rJvoc/q1hg2YO0qaptjWaUyTGCUi054LJx1ynlLODLU
	t8K9lKUxIFcC5t+XIhxCv53sFJUpR4EevfRebnNQV9fbVa0lIfVwLtvI9xr0fUBcCwQFbXhdV5ogP
	NQjcTbuRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2z8D-0000ly-0K; Tue, 04 Aug 2020 15:45:37 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2z88-0000l2-Ha; Tue, 04 Aug 2020 15:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596555926;
 bh=KVIdFu4snYkr3f0Fmfu+cjnV5+Wi4qwOh8QwNS/ed8c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WZt3TyXDmJfaXYCT6attgxObkAwESD0q7LyuEsKFOsGPUCtLUEi+AZc2Tvjmvnzux
 s9LW8mzv1gS3o+HzU0aOgQM2uYvgSWWnRwZfrLHV0UH8KkRlq8WJuOVbQHFv0HxELm
 7ntmp//QFxU+n5xUvyCrr2WopZ7Q1BdlBeh5SZio=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 17:38:43 +0200
MIME-Version: 1.0
Message-ID: <trinity-387bb173-6a50-4227-bf3c-90401dbf77ad-1596555523067@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v3 5/5] arm: dts: mt7623: add display subsystem
 related device nodes
Date: Tue, 4 Aug 2020 17:38:43 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_9aDqz3muo6ynqX9r0VjW7tD5vvZOiQyR8UZOTUct8oVA@mail.gmail.com>
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-6-linux@fw-web.de>
 <CAAOTY_9aDqz3muo6ynqX9r0VjW7tD5vvZOiQyR8UZOTUct8oVA@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:AvRFvL6vHuGUQ5uZliiJaNJd4wt1NtazV/Qat3cVkfRNTmtJqvMDQKW9h9oDuBiDwO8Mn
 oi3RObTfOlRtNEXAyVHW2NweYjhXsSP30UIi6LJCUn5BjQhsIpG3/cN1ZFAPV/FIubTZT6SplmHU
 s5QEmlh5MhkmKG49LRBwwoJgH12ukqlazYcHIs1zvj13WAoYvMCm/GSEsMWaZMCh94kxHAz2BVP8
 /h4qsIzRszFNz6hkqNQqwICaX/HiDvg+sv31O06HNk842CYF8Gi5tNkKzwy+IUPgZWohVHLA/fS+
 z4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:3athUF74o4A=:mr/4RCpfrqOCjW+M7KGbfA
 xT+vwntVAiScZeGkFKdhvqE4NjqFpmiDaHCBr37uHKbl9x3VE2uS84SAwU5JYkAfuKm5CJ7Iw
 kJMXOQqkrgH3jRUqdLTGCMCENTQc4DtyGDGIg/GKO4/eSnDKFMBk3rtR1IaOCyYoiO1ES83kx
 ClYcDYGenraj3mBrZhhBuA8Mm8/yihtDfDQQ22qL+m8zQmAS611MXr/imXqTT7Dsrm5QVkEzc
 M5sN2vmxYkOn43vw1hsmw+AOwKxb1g8GyeN1+JS1iq35gZjfKt4ZSOUug0oMBhTJ/TkKAB1jV
 BGHpKPVX7/CzMvp83ODi7TFRli1t8cbizlknclgK6XoNoQZ/yw1MH0xj2scsBUNvufswrck5V
 Ewhfq1wlOwOSWWDeXDMxkdxBudKKAkDzsqFlblo1CVqMq332IcXQ4fjpWH4kxO/sMT9So2k1d
 SE5X0hhUw5gwN28FboMEqitVLpqbJGoK119So4EqxMe1v6lkHyQC+BWXyEXLj5giqZIc/osH4
 6h5s84xmz/C9YYT+JOT0fUGKTdZYIry2imN5xUVSaKAH2tFIbyGKnctCyfyKK13SKW5UrxvD9
 sU5WC+dSHkI84e1MRmlBehTNBt4q96yZ80KNMqjwGaizsJkunaP3ogZvdGZdsRQSNVmPdycU/
 hpiZAzVxjaPB+1cWeQ1vcGnVd4AoZ5VR7rusDtEZTYYyoftEh+c1+7reEE1vDpOVx8Eg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_114532_792175_A0730131 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Frank Wunderlich <linux@fw-web.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Dienstag, 04. August 2020 um 17:00 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> > +       display_components: dispsys@14000000 {
> > +               compatible = "mediatek,mt7623-mmsys",
> > +                            "mediatek,mt2701-mmsys";
>
> In mediatek,mmsys.txt [3], this should be:
>
> mmsys: syscon@14000000 {
>         compatible = "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
>
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Cmmsys.txt

oh i see i can drop this because there is already a mmsys-node with the compatibles from documentation.
only powerdomain is missing, but this seems not be needed (hdmi works without this "display_components" node)...

    mmsys: syscon@14000000 {
        compatible = "mediatek,mt7623-mmsys",
                 "mediatek,mt2701-mmsys",
                 "syscon";
        reg = <0 0x14000000 0 0x1000>;
        #clock-cells = <1>;
    };

    display_components: dispsys@14000000 {
        compatible = "mediatek,mt7623-mmsys",
                 "mediatek,mt2701-mmsys";
        reg = <0 0x14000000 0 0x1000>;
        power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
