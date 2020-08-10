Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D0EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 05:45:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D74F520734
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 05:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T6Rg+Esg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="HEKVH8m5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D74F520734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77HBV7PMSVqSSw3KaWIq711V1qvEhchtEoWwT6baokM=; b=T6Rg+EsgKaAOBKptOS9E5IzZnS
	M1W2rvpAs7GU4JzMrCbDug0+lbu7jXRyvEbxJZ5Ej/ZkioHZ/47xI+K116014I8OEgtXT4r1UKsVx
	E45x5kMrZfwr9piy6RkMLA6xA7V24NzRf5YH84sc2+50VslmVrTp5C3QXzUrrQLuPCRSBFOwj52Wa
	6codRdbhUr4wG7/M6vnT4QpiMgmKDjs8p2KiDfsLOS515YeSx7VpRXrbC7gvPvVMzVkMR4DlCHfOc
	CAwF5oC+LvvEPoFMaIQvsNNW/3AugNJ5kQmE+P97/1zr/mdd+LVbyEqJfw7cAFbAQn1TXXCeGF5vy
	jRnNJ8YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k50cz-0003ZC-At; Mon, 10 Aug 2020 05:45:45 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k50cv-0003OH-PF
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 05:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597038319;
 bh=pLncW+jsTSqwL2/XFxBd7F5/jdIdJnDnczpYfxUFrHM=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=HEKVH8m5mf5Mq50g0FXUdFWDs+R14m+lNrj1nAAQmKwJ2hLX852r4yG5lVq7oqBxB
 nt/c8aDrIBoSYktOPBDEoloYuZEOnfKRSZ6iSZrQFmGCcLtfyhhoJLH5ukQYy0iNuL
 AwvgWdQ+3WbPYqDc86fHcDiQ9io20PFW/XkBD6f4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([37.60.4.172]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbW0-1jvfGw3I0E-00H73E; Mon, 10
 Aug 2020 07:39:36 +0200
Date: Mon, 10 Aug 2020 07:39:32 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY_-DYsbAWkdKfiGeJOwmPUOO1T+6WmOmhDQEUbzoRh+KPw@mail.gmail.com>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <81DFA743-B455-498F-B2F2-161DD9D51F57@public-files.de>
 <CAAOTY_-DYsbAWkdKfiGeJOwmPUOO1T+6WmOmhDQEUbzoRh+KPw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to
 mt7623n.dtsi
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <F446502F-E898-465C-9273-813CD032B40F@public-files.de>
X-Provags-ID: V03:K1:5IVYYxOkmECFWiGF+n4+3P6wuzhQjm/Mwi6B6QcyROBdlqK+Xyv
 qGLxbENEomX3fdARW2G1IrCKDsKVoGwag9vcdwl3A8L3DxlC6sYMe9XWdIrshdkxig+a2MS
 N+7JBeLAvN88QJ8AkyL+qo9SRo2hFT28DWerRjlLrf4Edny8i86CVHt7HDWGvWCB8pTbCwX
 q7CNSqs/0jSGwHCIcI39A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bD8Gqi2dqFw=:RJxG4snddAxTEJ387YhkfC
 bni9mhLjs5XGVdHkhiDGUKop9OETmbQisRQglFzoQBfVO1gXxonNxHtZAHDw7fp5TaT8C9mE+
 J8s2xmqNXZy6tSd/UXGFLdhyUgqT1QUMa2+6Uu1QiuxDWhND3ERr/HvkgEHUXX7V2ewgJkDjE
 82bPO/ebVwDRi/pNDaQpyWRtO34RENl5A9XZBmCcMqVkDSkv2sdsX0TZ7IwMndpRWENXrxTvb
 V41VBT+1lzt9KDJrjhdMxXky1dHCmf0sCSRTPan3mhPw2QdJFQVbTmK6gWw0vzUHsvRQ90Nge
 KfRNKPsTB63c3TCsEibXD9swYq1YVblqXcOrDZ+Pyh4fm1p/BkNIBWiMKfDyXlWnUhqwT4tK2
 NO3pt/FkUYZJsR3GAl53akQqSFKD3HjHk2dlqeRsqL66Pirnk0b3s6MLLInMU2XcZN2dJ98jU
 I0Xi3Xn9jmCswHwPJkDIYBJfPITiRWhz5T76M7Qf4wGmlTe14zygSNpGMPxfdn3wgHyYLn2M1
 X5SBjSekKGubd93bogUdkIq1mV1xhp7ur107fKZJeN03zxyE3qNEgTWgLKbFMwlWrMNV0mE67
 oin3kSpOaPE4Kh52nZMEb6qyjv2b0QvbG0CI6OvQWrrGfFUqwiCVHQxZ93Xj9+YWfy0BkEJxj
 gXAlfzIZll2mbWnH9cW4610y58rI4EGWyGxqFhzZrr0r0fY3P5v5U2XjwMlrKbeQH0T8hE7TR
 x6/pLeCMUx2kPfVOZ0NleIzfVSFl+vjADzNaFsz9jm2U841LiuRTmBuilX2zDC7HWZ3dXpS1B
 vMN9jfkEhzTb9PMnMTfh64XrW3PAjIOzc8JziJ5+X84vaZxWrtVTP1KxMrrxN0MlKrAsj66Id
 WP3Q6KfmyaRMQE4BLmXYC+XbuVarUp+sAUoGSXQbnqt4vjd7gfxGUuAN6syZEK868wh95+oAq
 0crmYoDLrsijgPG4BTZJ7v7IN9a6bpBJaB9z2L/rSb7iZB7/ifi8q7bc0CKd+OOpZBKDfhKpV
 89ByC0peT/1/Z+ISmqjy0SircFRKeGxyWGBuNooeNsOO3eqkmo4sCW9TfaO/3/UyPtA36ygvd
 vYTLIwKg5Xkq8ZZ9BzRxK3xAkVE+FtbmQbVCpwQrQ/bo+7uz/uBwE2sZ2z4L8rYOf26/VgUR1
 Yq6h2DExsipkq/wWBlpferzLundkNxUvmZvmO/gbQXl9FSCVTBE0aSOd7G7WQ/qZwDUownckE
 dOHVaVR/vBaJ/Xxdu47Ie1/Tr6SpXpwJJ+7JKvQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_014542_127224_C449CFD5 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Am 10. August 2020 02:06:27 MESZ schrieb Chun-Kuang Hu <chunkuang.hu@kernel.org>:

>Alphabetical order is better.
In dts there is alphabetical order but not yet in dtsi...i try to fix this.

>> Is the tmds Patch ok? (because review missing)
>https://patchwork.kernel.org/patch/11700679/
>
>That patch looks really like a hack patch. I would wait for a long
>time to see whether any one has comment for this. Or you could have a
>better explain for it.
As i have documentation for mt7623 and there were no further comments on old series (https://patchwork.kernel.org/patch/10903303/) i guess i cannot fix this. I only know it is needed to get clear image on my 1280x1024 display with this Patch

I adressed Ryder and Bibby directly maybe they can help here

>I could apply other patches first.

I guess i need to fix order in dtsi first...afair any hdmi node creates an serial device moved the others +1. So maybe nodes need to be added after uartx (or at least the one if i found out which).
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
