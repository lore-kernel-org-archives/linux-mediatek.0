Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244E6C433E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 19:12:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0FA207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 19:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ozYBQfix";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PZ1jHbRA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="MYGTZ6o7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE0FA207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5O5RSy0p7h74VG2zko5S6uP2UHL14Wfjd6q4KhnYg4=; b=ozYBQfix8+vZI9DEi1Cck/50Yz
	y8SPrM4h0joKcBjOid1KnvXYjm5rWBXy7atMsEtWMMXnipfJpl4jwsOpBkkpPGRTcM6GTcb4EZ1Jq
	z8U9mPqu97KanMcKxVbHxiQnrramdiw1gybvbxuPavO4erknVThMWKnKgpuT225ypaDdNDbAE+CgE
	nH5ubk9vsYsFM8SkmVQ2eackypcLkEtwpWRmWDKhoS/1IsN3cgEnZZ3Fn9svKSgPlKBbzO9/YMfDn
	U32pHUwD350EzUmTNtnGptNDLqiaeJ/m/zOOXI60zCP+PsT6bQk5hOxQdidW9JL16lLcqffquoT+i
	wEtDJe4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8TVE-0003YC-0L; Wed, 19 Aug 2020 19:12:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8TVA-0003XN-L4; Wed, 19 Aug 2020 19:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=ovNaBxbYuzERcRwnFXmf/W5lE2dfM3JaLykQcJudcuE=; b=PZ1jHbRANlvODEQG30JotFTGbh
 ZoWPnOZNyQTtSmcSx3PxbJfS7U0U9L1RA1OkfeG7iLay9stceVxKQy99UAESslwPymQxnGzXPLq2s
 +vm4BXUVP4LZGn4VsUmvh3HDXA2CNYFEWQjkPHFnZm6GCjIE8RD+GfBjMECqXHarmv2IDlSzYXQev
 gf8unzLe9a1ANduI3FEEncDzyahkN+k9kzIh2tQEn4gPBXipCOjgvBDbSyfaE3T1gkU/FPx13feb2
 5c0P38stGSh3WTJBEKYE6USijbZ3YhIy4P/V27sxbGMXP4viethiQVpySzHWR3wEl4tG/cU8JeOUQ
 aOkXorFA==;
Received: from mout.gmx.net ([212.227.15.19])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8TV6-0000HA-Qf; Wed, 19 Aug 2020 19:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597864304;
 bh=ovNaBxbYuzERcRwnFXmf/W5lE2dfM3JaLykQcJudcuE=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=MYGTZ6o7CwB5moYNS/xpsSacNZxfKQUraJUskz7XOZgjLeLcYy82vjfX4MlxHgkbt
 3Jjqtsh0YNqc4cr1ELXbtQm2J42eeETfcpb23j9y9C/ndgVPNCuxLfeLUQLMWKtSQI
 r+SO28JuMjHja0aPu2uVKD5pyEiPJ8/r9D5NKqiE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.76.97.101]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmULr-1kYhLD0Egz-00iQta; Wed, 19
 Aug 2020 21:05:02 +0200
Date: Wed, 19 Aug 2020 21:04:55 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <f68cf4c2-6c79-fe46-b7b4-bcc49e0b6b69@gmail.com>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <f68cf4c2-6c79-fe46-b7b4-bcc49e0b6b69@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <0E911554-482A-47C2-B2C6-136486C5ACB5@public-files.de>
X-Provags-ID: V03:K1:I1SQA8RLE1ho3CZGRQd83x4wiGBSFj41+sUykOdSORmkkaF6OAt
 LPaLS/DxLwr1BK9smzW08UYet6YtujrlLy/ipTjGyg26bR8OGsQswRLSDPc+hIp/4vhJM9/
 eP7n24GYoCV/19w6QRWwlGTAp2W2A/7MpXBFp7OBhIOqWgJw+YlUSuj5RB+fC7Icw5fuBLt
 YSsIWMLrNHtWZkdwk1Tcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GHpggIKUubA=:ToY9tWIt890OIj5iUjEM7Z
 g4T3cq0TgEsm4G/S3HUfPmH25Sa8RvgkOltswQLSNOFlu1tD2YO9vM8vTjkmJldvvkr5lz7HE
 tnwKsY+BVhFHPm+roxDHfrvtfCaGGGov5HZ6o11I4/KCvjPPPWSOWP539AsAmOvweLN9gSt7b
 cNThz0//3USZXRlfKnNhEb+popGRmJToGtbFpr0iltvjU5j8uMLeWphKtzRHqqfbOdW2V21WT
 eIhW9eINAJ7IJmncPgTxW5ge7VHXb7xKeEalJ/bR+rJqiTt8bdZobbZyYEpqOEV9Sra0+hbjp
 KmYRD5oBtHnpzVRLZrtUq8TJ2DAFbj+3Vjzs1F2f8Vg/786JZQsuqx78xVXIeNrywlDzSq/zZ
 ggt+kPYBqYNE0m+9z4eWl2cr1HJbbIBTnMn/aypDllZBljVOQEdwy5kOyK9KIonwDnTQce1fA
 QTFLPBp/MBjcxoTSNFrOirfEzEifbUs+OPMTJ575a8PTM+jP3EhxhcB5QHHMg3/PG7PTht6zo
 NAkKWq4gdarLUGhvKd58aBnBrSgkFQvlbzOXv/xN12+b9/0CHuoLDYcjwMMSjjXHbkclzSX4R
 oRnxh+qsA7oLAyOOLbfmnZdKjCYs8R2m7DnYt9dyeYGVDXZ3iPX6ffspnAaTnp6l7B2Tib6A8
 Hwg08m3Ky0UItf3RVFpniVrXyzcRt4bkf5SnrX6PgaXPn9z6jRxI5RrXbazT/xYCWTvWiPq4P
 qfCW7FuBBc964S0EQMiqxXOCQtGmObHju13m2smbHGhCdjlFxMsf+2ucHM9qYl/HOLAguo2kF
 E7ukdq5wAqwiBNWZxH6zPA4Te9SeXfp/daed3vUW5X/aCHOgfpnDfMkPx8MPiVLiWOLvQ7sqY
 eUQqCihICB3vTQsbRRKOOAbt0wcIrVwYjELTIBct0ABWol8MtlhjgSPaCnJ/dM55ZcvVtRQi6
 TlPa5XWXWfXnYqViM9sJ0+UuzBFOmqdM1pLRsg4BwzvUD+GuAEu8R6YbJExWB8n+q7Ww7oUIH
 Pw1jl+bTWcCrgl0us/eoPSOGdRvn6+wosvpOl/8H6QCHmQ31zuL0mxMZHBXuO/Znwb3FK2XRd
 jM4MRkMGGgLjDUzI3BATRShutaaUgkkVFhfep8iqEdUnmIkW4Nxfk7FHHgjrs6ZwNpS4HzDDa
 JeRQff8RVad6v/UOrpN60DNIPsWLeGs8SVdNtf5RdYTVSl2ffufbvOHkAQQxL3RxrdAeZ7mAU
 EACvwkZR8oejrggIkTluLuXQdPcQloo6KJho1lw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_201157_170163_6ED671F8 
X-CRM114-Status: UNSURE (   6.37  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Am 19. August 2020 19:12:29 MESZ schrieb Matthias Brugger <matthias.bgg@gmail.com>:

>Isn't that worth a Fixes tag?

This could be

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fc721b2968e3cadec520c60d2fc63498d865055 (add support for mt2701/mt7623).

It uses existing framework which calls mtk_hdmi_phy_enable_tmds by default in mtk_hdmi_phy_power_on.

Another way to fix it maybe not enabling it (use the flag in mtk_hdmi_phy_power_on) there instead of disabling after enabling it.

Maybe this is less hacky than current way (as ck hu pointed in v2).
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
