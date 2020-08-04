Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94B3C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:44:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E2C02075D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 14:44:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZpwPVJEu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="dYrylRTK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E2C02075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CFjw7vK5/M8JtMaO6ZLNRlKqdF7vihBEeuLtO4Tgab8=; b=ZpwPVJEu6Qx0M0yezv7qqw8VL
	QIbobNFeOc19q6BaB3+2nZOMNvIKHmMsEizmfOYxBUamvBbIddrfshaU+taxemROwwsqyglb6lz8A
	LDUVqg07wfFNUA28FPb9gn3sP3fSooRA+T9O7KetPDYPWJuiMa5bacWEaz9xKFyjKuo9YAdHUIODT
	u0NLMRH02DmpR22VYmCtVW7p2hJhj90TAbdwXD+Tmulba0uY3XqjROmF/yib36Wub626LPnmuDuod
	zvIOK9wDqDtmES30e7TImnjuOzxHwxAhThpt95xlo9Lfh+TBvyyXKEfIHHbaD4Otiv4lEbB6yzOdG
	Ktgxke1XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2yBA-0000C3-Nb; Tue, 04 Aug 2020 14:44:37 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2yB8-0000BS-6m; Tue, 04 Aug 2020 14:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596552262;
 bh=M74RPzCRuh0utMrP2KavnbtPD979HoMyUkUEHnxdnJs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dYrylRTKVRIaRg43Q7R8dFGXyUIuT65S2ps9pSJ4yruv+Jj3pkeAH4uh7lQ3AiF5J
 RZY5f5j8oZLknIonBki5iU8pX8szlaQZHqJrh0eoZf430MnNzgt2PevIm7M8B2Z/rk
 kucm7ikTNfyF7pyzfBBdHb7KJrw9fpXiacUOMQXw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 16:44:22 +0200
MIME-Version: 1.0
Message-ID: <trinity-5e5aa82a-c026-4138-9f33-d3776710eb47-1596552262328@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v3 1/5] drm: mediatek: add ddp routing for mt7623
Date: Tue, 4 Aug 2020 16:44:22 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-2-linux@fw-web.de>
 <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:K4vr5xLllernAPYxqzkou0b7G3SwErhkjcivj32wkp1hhhjwRwbRXU4j/Bnwcf5k5o44V
 fsU3r3SIxaDuuJpR4PyfEoLEzHoXnaAyzRA8Tu+cILYk7+t+UiHnn0KvLmJdN6igayqfcQE6XJTg
 JwRCXhLqPRdkwKLIo/RcogO0U3xXRKiMhCJZ7afFIIgokPJ9TUrZZJyZBPiFjdk6ZCcnHunNUSip
 kLsOMsNzIukx5LMmkNfHryQwKkcp9Ed/Pe4ioIs36Vjxj2zSdUfHqI3Qbdnni1PJrvnD2OLCMI3r
 KE=
X-UI-Out-Filterresults: notjunk:1;V03:K0:49jcVtSXYUo=:DnAfsV9jgGCpqHD/1MAphF
 hYDUK8odWLBafkI6/tiA/6/C/AOvtCBjZPxJ8SwaQDLBoUjTDioKsGr8dykcCu1vfJh5uPoz1
 JQxyOT9C+JlN4cdP4EyjbG+Mk9CSDBNNJZe0wFI66xx/TotpXuYXgjdoZL/gCb+7vOOZhsOs3
 C0TsuGjF6oz6UVbpWQ0b6ht4H5cc+redjzkrzA/IQF+ZAE991FUb1NWvu1Dqdg4gNUNK4TJxg
 l1oJ7KXNSWzg/syEbOiF18opnTiuIdbSZM5Mj5TwOTw++8V6Rp6swHdRtBnBVuFbMzUnEmI/G
 9aZrLD0oeJsOt/GDancoHAJkzptPKlAUsSjCRdgrZBGbNW/GZB8zNp1P9Q6+SKbjEiujlQpIK
 8VqiJSUXmuVcKjDa381e27es8qbxEh4iTDKT58m5Y0zRZtk6+6eiuSeZJLcpMQOaOv0esbK2p
 MJqvwYhbwrB464E8dJmf3xFJFmBQe0aOg50D2shEcJ57UVUmCDnD/p2z4vCZEJPtmZMnKCgNo
 UnNI3xIvdjp/vmKHUpDPzWMrqdxIBoAhsaJH1jPmr7QnCEoiES2Ku0vCyjvULGkhNb/cTd3vn
 ECawz2iJJJzz12wPpGAEz0S4Iytm1dgiYFDEtfKC7oYrNOX7fu2argrmV1tzDOLN7UcinTaHV
 oIL7Iy8c9qOb/YpbBfCo0DC0C/eTMNxYZsjLy0AOg14NRCRyi42ZIOrJi4VSrodip04Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_104434_462656_0EA1FEA2 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

> Gesendet: Dienstag, 04. August 2020 um 16:34 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> > -static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
> > +static enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
>
> Why do you remove 'const'?

was removed by previous patch and not re-added (revert failed), sorry. will fix in next version, if all other is ok.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
