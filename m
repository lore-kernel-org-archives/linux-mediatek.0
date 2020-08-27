Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D14C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 14:28:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6B82177B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 14:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BGmHrVUC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cmlBkgq0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="TcgGqOU7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC6B82177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1X/8PQysOstlXJYW4QT70zs6ihOuYh1XV3G8jxIVExU=; b=BGmHrVUC8SXIYNQPTuFNxk1FO
	vASntMiPrroWUolbZpWEdwEL+tBNdt0cWSmLmiNcuV++QYPGXfwkLwI6LUol89XqRNErxWoKn1m3o
	j5+I9Y1oeU5FfPVsJMsCzZa6B7WlAlulIYWqBJUGt5BimAiaQxT5XFTaNcVeOi/KDj7YjgntkNE7X
	9p0GvQ8FOozRqb37LIg+V8oRM3vASBG7zdptqhZfh71uqSrebU049XiPBIL+lUY8bzYf9W5crrTd/
	nLCtEe9RJS3vx8v2N9+ALGDSm71jcGmbP8/O3NUyAJXTFeG1toCS/d2uHVj34s5AngxzZZFx4jqWm
	R+WxX53DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBIse-0001VJ-FJ; Thu, 27 Aug 2020 14:27:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBIsd-0001V5-P0; Thu, 27 Aug 2020 14:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4quNDffXBr7xu+P8AYTF5B4Q4KC4iGb6IlNPmZ7OG44=; b=cmlBkgq0rEmatgMR0kKzGUtQUM
 /MCy8wLtqynNo266XpHK4iAJ/7sfWbLdpEWdDsMLqKAYDyzHkCiNArwqsHmgOhatjpIQ0jVkCDf1z
 xu5mVS5tl+ahGU4Cjg6fyOYsx124X6ogDl9Jzdfyv1F7BXsNbCZyXiqYeuKPFL7PorNk7HtVURQRK
 AYft2b8XGmO27GZE995ON5R8GQc8uwJhS0KrmNkuhNn5ktfoF4wLUMLge0zE0wnmeoM/OGmvdt1Vp
 3XEiy6c5aE4QKouzICo9G3AQ3ZyHrRXX3DbaQpW1Ubk35diC+Ao8sXyhmB4x1qXaHK8wcDURwSE7V
 qNES3EMA==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBIsZ-00018a-Fj; Thu, 27 Aug 2020 14:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598538464;
 bh=4quNDffXBr7xu+P8AYTF5B4Q4KC4iGb6IlNPmZ7OG44=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TcgGqOU7PN0BStPg83HSu/Bl0mAQshoXntsH6my9PXuH7YxVltp4uhcb8lVegzNo2
 1R89w98L3U9XrdPGnjlEFdqRMBc4Fz7+4BYVwbwBLoeV3QWa4opPHzHNqt17SRiP+N
 29aVlCa++ARvIdvmYJTpyk2Y2nnFxaiTaIFJFa3s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.146.7] ([217.61.146.7]) by web-mail.gmx.net
 (3c-app-gmx-bap26.server.lan [172.19.172.96]) (via HTTP); Thu, 27 Aug 2020
 15:41:50 +0200
MIME-Version: 1.0
Message-ID: <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Aw: Re:  [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
Date: Thu, 27 Aug 2020 15:41:50 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Qlp+wHkbak6pBZ5/7qykL04OknqT6U+WwH+B4u5tOtj3VmxF1XWSKrFYv2a1JnOA+i2Lc
 Hg2GwIs2jHrdNRuqRMAtCHBi/k4/RlQ99TTbKd3kElatLj3MdORZA1tUpyXWgo3l49SbXwC4yj/M
 LsWL+SJ4s2B+GEGWo+MoSBMhBUk04FIzI+8sYIdftad7aGEgMaAF9ze5jPqQLlRJbnQ6v66K2SKI
 ifet6FKzp2K62Ov2c3YltC4L6NbYXmQEMDhBvjZC7ybq//eKEAcT1eE6cw+WoWDwtZpst8hVn6oW
 UI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:TSO3t12lKZc=:0gissZwwgFyz4fspPFUK8F
 mQWcm2+jiTxfRLMzNA2qrrpe60lRxbaA2PehJudBC1TJYwIX6x17CRhEbSdcoWrffnC+czHG4
 2TXZw+V3VJssaH8/cirW2KXnqTG9g8lyHKZBVAsyYW+GacMuXyr+/UmsKbvscXtl8T5rq0zGv
 f70lgzYf9JckJw0oDztmgAJRMteVumpA6qNZWnJESOvtYBSBrp/BFjYSwgdES+zlTS0DyjCkf
 z6gR6LcyqeBletjwBnGoEcMaiJJbNDij5PufKXQxuoetcaoG9nkBdaUOL6UrX0CIAsherm6zI
 9+MSDbZuOj5CuynbPGiTGisWURm87A5qkQC7woL96zsilNyEZCkNnUNrHc8RkEk99AcQQrMe5
 UdTzKcXWROy3mQhNhl+JSnj7nsk0tt+6aMs49iniiVTRseafGjD++dsgFno2xB6JFdRtBPiUV
 2lxo2RTmx9bB2GKa/oPRscUhgatsEyNUvg2oBbTV0TX0clo24zuROtHKs3DsY8EzqibKhG1s2
 ryS2yimMz+GlHjm5qWFflakr41QVMKaYXLZbskMxUECi9u19WpM+PEJzd92Gudpu+neL73EHr
 RDacEEdzQnYkq9OG2l3dbS5i5Adeb0EkNk7mW1jVo/lUUcoWhSWRIBY7EozJ/yjSp2ZdKKZhs
 gZKutxjqpP4z6L+xrTlJQhgymRwazyRV/bcwsI17c/3nnsyd+ymZwYarxke8NCk/zY24=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_152751_697110_B2800C49 
X-CRM114-Status: UNSURE (   6.91  )
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

any opinions about the dts-changes?

maybe series except the tmds-Patch get merged...so i add it only to my own repo till we find a better way?
currently mainline does not support hdmi at all for the board. the tmds-patch is only a fix for specific resolutions which have a "flickering" without this Patch.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
