Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D372C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 18:28:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DE3207DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 18:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SLPdmX57";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="LPgUucfc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DE3207DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVaJu7KmjwG5yaZbQCiKr6+GOS9A4JnMqrlFQXkwEjE=; b=SLPdmX57ISbpauY954jt761SSo
	5TKpJM8XY+acZHgSr40/EcYoZ9xRjNdCMQmJZSyUTK2lf9/yBkfC0HXV8OuutC/+8tzaMDjKHzFxR
	FU+Tb0XzVoey9ATetFhRnX4kWVD2+E3P/s9Nqegu2N4KW4zbn+t7dd9b7KTEjiGtdbrpgquRLL3kC
	GR93tioclpGIfFBL9FDoTqYHOXX7ygagQWaGLPdgFj0Jgslg17Fr9oOT1JPzyavIgkVnhjSqUQtMH
	FZjR3dFhqi0eRk1W52SovQ+slX51L04/R51ps7Uh2XyB6bBsheDztYHKvEaX/RHNjTkTjFaPWp0qT
	wK4IkPiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2fCK-0006uD-6y; Mon, 03 Aug 2020 18:28:32 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2fCI-0006tk-8v; Mon, 03 Aug 2020 18:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596479305;
 bh=BBa3NSjXaC3TQAHSDrvm2A0DeRZLmH0CWpxHTLdlYjs=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=LPgUucfc0TSDaB1IxNq3At4agkikN3I83acYP71hBNUFLF7edC9B19nqjzftNV6KR
 O9bkLVaYQ1LaCl6gChv14MYzsrIwPwXOX4Co4kSDFq4Whc4NpK37dW4IWe3TorAdV+
 raVafbWRx7mwYCXtnwWCyH3t12HcrPx+eHGbqK+I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.148.26]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlXK-1kUsso2yBS-00juVp; Mon, 03
 Aug 2020 20:02:48 +0200
Date: Mon, 03 Aug 2020 20:02:38 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY_-H3L=uJNJRF1VedbwXNwY2N-q4F6A-NsdNwbQswG0D-Q@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
 <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
 <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
 <trinity-b0ca2ee2-259a-4a1e-86ee-63b093202060-1596451368067@3c-app-gmx-bap36>
 <CAAOTY_-H3L=uJNJRF1VedbwXNwY2N-q4F6A-NsdNwbQswG0D-Q@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Re: Re: [PATCH v2 1/5] drm/mediatek: config component output by
 device node port
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 ryder.lee@mediatek.com
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <D0A969BC-1BB3-4EBB-8D03-DAA610E62EBE@public-files.de>
X-Provags-ID: V03:K1:WAQfzGVjSkS/16yz9r7IpNOuSlMl2BMKsoaMRRAoP3sVBH84qNq
 wD261Oq8/ov+9nxyiq1n/yjiI8bous5siv81EUe0lDdC9apZwvIfi//d2RQVhmg/5lFA683
 eKifWM6puhV8WX6izdjWHwl8PERQlm8PXD7uwIsSjbGuzFloLAdV9Z2Zd1l8AbB9pcv2dZN
 6qiuH0R+YQg36uqjHpCsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:znBmmQyUSVs=:x6HeP1WDx643eVSddF5bsR
 honOvjlzk2NZP+3gMoNI999qQNORCiBHlPsfp1E99S8Qf+T3JLqsURe0gQbK6vplVy8hQI8hU
 ir8Hs0j0J5xjq1nBpyAOzETCmslPdZQP3quYfKoj9pU2yLP2b++568nvnWH8nQYkJ7OWJfoJ9
 rrGCZDKurdvAum8bdtAb38vPRi7YV1WH2386TiEgrKcLy+4ubooPjHmZRPChtdF3xbTnpKyMA
 HUGyZIdkNNRfg5uZfzbdNsczVugJeqDoCIcNRCovWzseavRoaXI82sKRVbjhZSLGBYC8kGLS1
 O5kzLDgZZQeT6tS7u8qFTT7KzWwpmMNtvL1S1zuuVL8YNiS6laKqd1rmiUz6PMZhSLKiAl12q
 ZWMNZHugx0DXARN1SlEVhgjEIC+tkleFw+3cyeIblD//isICQZnyfmG/2RrWSU8uNSzUCc49K
 nQFdzlDL1IiU5ivt4I0en2aWJDtQ3K2f8ho6vNIvjPy704R2mlad5QqyecIkP3zFAu7oL4mCK
 UD3fvVs8yRt6qVJFOcFX5wYTEjbpZAiVAW1tR4vvVmbMagKHq++fKksclGnW05f6c2xpaM3tx
 1Reu+wppNDT29LlvvhP27YfvVjRgYOJHy1QCnNnDmBJEQmmLZoes74ivd4HvYgrNeXYF/IM+o
 NNmr6xuwugPyPYZMI11r7Ev7nkyOCzmfXYttL0gJAUOKk7MawJaE2rKPBgmqnwhdhl6Io6CZl
 noLqTxPXYMx/nYEHRQBU/F5gChwhxXG4Fo/wADoqSY/3hLBttfT2+PPoU4wYmxuEMwhZXQ2jp
 TFyjKwN8FWswl51zcozNV/vUkhJx1n2KUGL6kbO/rkmWBW1ksOxI/BLXsgywA2gB7C3BHILND
 0/JlZHKVa6fT6gyCv14qqESZCSRb5EJODaA+6xWRaEm20UAduVTicg6hqyc1FTJrTLw5IkHEp
 ZOPg9D1VsAsVXsVxUOyihuUAiKFEl11b2Sse5Sv9qfPpYvO7RVVg4VS5f+igy2J9yBs23tlKP
 vfrwe33pWoIriSC/xySsi+KI9xGuNPE2Kd9h4tmsDq5/0e7HDS29Wx3PEkan7LVDAW1z2CBn8
 Q1oy2n/kpuaPYukaQr0TkeUS5igvUhnSBNIF9+1H5FbezoMF23TYz7EiASvXxJffz2NfvEoJv
 isx6m5R54Sv6ivW/u2J5/1RrETzxFianuuuGBCjWRS4boOSQ3j9wdOgTdBOCH7uMcZjw7RqO2
 3tDHv3jWwz3PSd9B5nB8HcFdPXdoEFF6sn51l9A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_142830_546988_1F7F7ABD 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Am 3. August 2020 18:27:02 MESZ schrieb Chun-Kuang Hu <chunkuang.hu@kernel.org>:

>But now I have a solution that you need not to modify binding document.
>Because now mt7623 has a different routing than mt2701, and this
>patch's approach is to use different port setting in each device tree.
>My solution is that these two SoC has different compatible string:
>"mediatek,mt7623-mmsys" and "mediatek,mt2701-mmsys". For now,
>"mediatek,mt2701-mmsys" has its data as
>
>static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>.main_path = mt2701_mtk_ddp_main,
>.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
>.ext_path = mt2701_mtk_ddp_ext,
>.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
>.shadow_register = true,
>};
>
>I think you could create a data for "mediatek,mt7623-mmsys" which has
>a different routing.

The paths are defined as this:

static enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {	DDP_COMPONENT_OVL0,	DDP_COMPONENT_RDMA0,	DDP_COMPONENT_COLOR0,	DDP_COMPONENT_BLS,	DDP_COMPONENT_DSI0,};

static enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {	DDP_COMPONENT_RDMA1,	DDP_COMPONENT_DPI0,};

First thing i notice is that main=dsi and ext=dpi (hdmi). I guess dpi should be main,right? And bls is actually routed to dpi...how about the other components?

The 2 loops are not really clear to me (except 1st overwrites mt2701 main-path and second ext_path based on ports/endpoints) but this only applies from bls-dpi-hdmi-connector,not xdma/color or similar.
Or should be main-path (or external) only bls and dpi? It looks like it only swappes dpi and dsi in my case.

@Ryder Lee can you explain it?
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
