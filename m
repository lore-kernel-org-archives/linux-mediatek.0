Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F005C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279AB61440
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279AB61440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oyu9enSuvCgkvXfwBNXsOOcwbJggmeIG2Hphu/cCEaU=; b=weTwykhvQ+oT/K
	Pgh6cCGxX0N06NOthMgN3/1Z0lnR9Z3MGxr5m+WrfssUh3VJbdTfb1ndLDjdvtRsyMssRzxXoaClP
	3MvwEAoo82I+5T5wZR3IadCZfBxjcQlC1cBhRvBwzYCljFZ48MA1dSE0Y/lbWp0ArlEFETRbcoh2U
	rFcGrjPflqjYghfd7pnMVrRu3mEVwp3Ym1hlPu4sl+wtAEQt5wpBM2srhFmmhMTbFirLcerCSgYj/
	YRXRRxyAJbbbGpBeCuBPduDgEpKkXekeWPf1zu9dVhHkVGbOoZULJtP5qutDfB62hSaCZGDVNlcSo
	Y+iIcHaUKUcQBwiC8LvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwj41-000xcF-DU; Fri, 25 Jun 2021 10:27:57 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwiP6-000k72-98; Fri, 25 Jun 2021 09:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624614335;
 bh=c4s3npKDwZv6b/q1SzXsWsCp8/0lbD8GagzJKn9ZWB4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iPEEPlnvPed41zKB4ZoCFP/gyoEQvttJt07YoM3TmbtZztCOiPk5upkD1Q9O0u7Gk
 ybIKw6/+oPZaKRo4z8wpn1D7lRNN7ErZhd6qD22WLrWbFo44sPKC0bB3CquRhGMue6
 tFTBs7JlZbF4+cHwXhWDC/GgVcjctVDETyXspo/Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.157.219] ([217.61.157.219]) by web-mail.gmx.net
 (3c-app-gmx-bs66.server.lan [172.19.170.210]) (via HTTP); Fri, 25 Jun 2021
 11:31:59 +0200
MIME-Version: 1.0
Message-ID: <trinity-1a7ab0b7-d895-49ab-b3b9-3bf426889418-1624613519415@3c-app-gmx-bs66>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Eric Woudstra <ericwouds@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: Aw: Re: Re: [PATCH] Fix mt7622.dtsi thermal cpu
Date: Fri, 25 Jun 2021 11:31:59 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YNWgVxvNbwNcT3B8@makrotopia.org>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
 <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
 <173e6bab-9d21-eb28-9b91-a5f80c01fd03@linaro.org>
 <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
 <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
 <YNWgVxvNbwNcT3B8@makrotopia.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:mcYdBRprVpY4oUEHthoriHz4c4RGuCLxPwnDUj20+/cU9hXfLJoDGmTsQV0KVrHHFk4ID
 C5CwhbBPk5KASUTVJHxlhkXeN+je2H/pvbhAmWT2sXrioONmmA17anzdDXldW2eliP+N6rsx2FIx
 rb+I4G+X7R/eSqGFlbgkrSdUsCVVlcAEW/Sv4S9PXkFMmJEdvO4c0pnMyMD2U+b4woh9X1omkDMb
 vKKAT7NZ3Y5mMDXNp2nT5ol/N0T2kwK3QJXHa1777joWA27j1fUteAR4HHYvI8zzpsmH/6e6UmK7
 LI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:LWjFdqAD/BY=:0GJfDlzThD4tnBB/MDVkZR
 73ZkupMXVDKpmEtNCMXvQNq3MOHebZtgDiusLUe0qUoJ1XNhuUKQ71XOEwvF5hKTzjAZ9FRyY
 3m9FMyzw7o7DLhO8pso3ddXsWSuQbTe6YJt1xcMG6wALWDpMWBwFPVq3/TuycPVqCnJsm6Jrf
 iHCRgxCcq6gMfMPvvpEWnxTpob5HWM/x6J6gROfbOOrngTP6MrRd1ZUHlXpyYczBlZ/NaCivd
 XFOCtzfn4z9hvbCaV/gR7GJMd9gHmCVYLmYdAMwus4VdjkyDK7pBmNPjTZ2MLDRL15D9+JYC5
 xjDrlJ/a3tf2tPUvwUY2YTRDLPHLIMnbVykFC3OrXqbOf3nysgWoroBLF5g0ylZKVCl/FYry/
 PACZYwHd1wleSHnv/JzgDzFCS3KeXbDv4TJfsrlBpTIIPOTfkgCOe3d3rEpfWGSw0E1sTSEPu
 2fvYX9Nh07XjQP3Hw+9Cxrw4t5sN/lv6YQ9j+24eUmrUIVF0zC6NqJBeEiEmiS3sOZpNClhtx
 mrk3Xjs0++wSYMt5I3h9NxAMtBpb3YB+Ek9lCLOioCjJtvB8H+eUxyg1NgH8LPk3xZZD7YIKR
 C2wpw5pR7fON2TxBPO7/aVAPopcjNPwh1p6t9czpRE210WXi58pDSKvZObgirchw59zy7zIui
 8+Et30LbRfPqqQvx7i+nTuVIx/tZ23uyQColKWq8oMF9C8RyUcozP00fkg/OQcoJ5kVWwWTA6
 TjwoCAjdBFqAbSQiB7b4JK1r8ygltQeg9jYXkGf7vsPTJevszO9xke3aRSl1IzRI9ywegTZ2V
 NU3miE+P+j2kbuyImXjwAFK8geV9kXx+rBsTkAlhr+nH+QoHPE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_024540_689983_B5ED973A 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Freitag, 25. Juni 2021 um 11:22 Uhr
> Von: "Daniel Golle" <daniel@makrotopia.org>

> On Fri, Jun 25, 2021 at 10:16:43AM +0200, Frank Wunderlich wrote:
> > Daniel from openwrt have some other mt7622 Boards maybe he can test the Fan approach below
>
> I got Linksys E8450 aka. Belkin RT3200 ( https://fcc.io/K7S-03571 ) as
> well as Ubiquiti UniFi 6 LR ( https://fcc.io/SWX-U6LR ). Both got quite
> massive customized heatsinks (see internal photos on FCC submission),
> which results in much better heat dissipation than just having the
> naked chip like on the BPi-R64.
> Hence I also can't test the fan approach on boards other than the R64.

Do your both mt7622 boards miss the fan-socket or is it not connected to pwm3? then we need to move the fan-parts to mt7622-bananapi-r64.dts instead of mt7622.dtsi

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
