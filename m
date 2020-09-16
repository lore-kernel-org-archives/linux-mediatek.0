Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E87C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 09:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B672822210
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 09:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ort09lYu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="U1cz8VM0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B672822210
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0qlHtchugM/YxL6JW3nrLf2/OocDwANVKMqRGpFgi8U=; b=ort09lYuqmGeqX7Uf3WhQK7Nx
	bMjalKucIactf+XG8LhPxhdvEOFYjzin6VwOvd0Bm76ObU+POiulACu2cbSzDp85JoazEOlo1Z+FA
	K6clmJp1QIbPAgznNou4OD626Q59sf3xjIgpHAnjZRs7vBsOKWDA1l6g94j8dkLW0bZe8kOfEZHlO
	a+M+X1rxuutzdIua6BelfYLm9ZFC+jIY0hWrdD3iyQYceM/HAt1aKR+crBUaIhfuY5HXjUUy74JYL
	38U06O/2SvOuntuU7XZgqb7ZQ6QxHMM5XJy0cRgey9PQs1m1LOwdAhPc0zm23n4Q+yAXODNX6KTQD
	4gr4StWmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kITl4-0000fY-VN; Wed, 16 Sep 2020 09:29:47 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kITl1-0000eP-8x
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 09:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1600248552;
 bh=qUGJBV+LmwxwcbrLgtQC3FmqOE9MHn2vtmTA4RuY3Ys=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U1cz8VM0uS5s6ucIGVHbJehmWY6HZBNoIE58j0GJUCbdts6kKuupEvrcAl4ECSq2j
 TAS1eoH5/yhHpTv1rVUijGqsqX2Qup/n+3kx8cDpXnquLogxFvs5w2bt5oxsNDBRnV
 MWfw4OydIwPBOnSAKtVAGSumau6j+loWLIgProps=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.159.245] ([217.61.159.245]) by web-mail.gmx.net
 (3c-app-gmx-bap11.server.lan [172.19.172.81]) (via HTTP); Wed, 16 Sep 2020
 11:29:11 +0200
MIME-Version: 1.0
Message-ID: <trinity-ae5f43d2-c2e3-46eb-84c7-d96843beb7de-1600248551915@3c-app-gmx-bap11>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Aw: [PATCH] arm: dts: mt7623: add missing pause for switchport
Date: Wed, 16 Sep 2020 11:29:11 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200907070517.51715-1-linux@fw-web.de>
References: <20200907070517.51715-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:TC01A2xr8RkXbGgsLFqV/VbN+AQWwQnYA29J/gOoyTQTIr8jw2P4VTWWxuwr9MrAtMe6U
 uzP6I/mCnUJpUbaPsvJHZzg7U+63MfHeqcKzLQ4PHx48//3Ftii+5hGc97AKyZeiUGBVu8b53bqb
 UsV8RZZS1vslD17/qzt4n0p/+sB6x5XxE5jJoiLFJ7LoyoaWWM1oDs4igtcYPsRddltjzZ7H/kQ4
 NPP0VsOmDPrWc91W0xoXyIxg5yqiqLHKrTpFdhA2BD90X5LVXXbVZ3AaXuTUszI2FixJyaaxw1lT
 io=
X-UI-Out-Filterresults: notjunk:1;V03:K0:sqErrydygD4=:evonUZdnNfjkzK5DzG4aaM
 usCFiwJmZLrRLKL0CDSIY2jUA64Co9RBWXVZAPuli/1LI7qzhg8mRuGc+xufAiDLbioLmwPmt
 riQPSD9BPMGyJ3iqGv/4DFw6NcX+DhaRgLr2priRBqHBZyLFAuwjsA1gxQ8MCxAPOiYQC2EQ6
 RE1CqkORT9ReeumjCaGZTYWyiyGIu7b+Y0gJ6370Cr9L/V90R/UggTWgIGD6a+nscgUh9JNb/
 NW03Uph/yvz0I10wotR3Ws9xuFHuc4OWDlcL7Uv75cb6l24gykk85ZEiy3J4+mLUKgnzlABFh
 tKYP4akwZaMeivNq0HDs2DuhHgZf6PPF3bUKN2XgYLdZZfgEFhGhIX9ZxymKOMX/hyiaxoAWR
 jDPr/FCviuP5QqX+m8Oxr38iAvX4uIGB1NfsZqNwtFOkUgsMCcfIvLUlWyn6zIq/FG7lX+GxE
 GhYTg1KO9vJEM6ZMV9ToVPBIyBQP3OPyqny6pXr3V5+SgJWWToEMxPTE7kf8/rfTFScifnLoV
 lXlaqjwyD1NE2lXGRl6/IAAyUnsGBS83Wp8nakQgolDn1kHR4QZTRmd1enisnle6vPUCs5WIv
 rhZMGzYGE9Ico2lE5zSZpr2wCfzBtO6IYRDmdlAeWQMrcuAk0FmFO7/fFOjjDzMaiLbyx8Bx1
 1JHv1ZS4j7fXim8TefcpdAYwU+K6sfcHlXgaN3If+WrEWMOS1zQElrViMTDSxBV07FAY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_052943_571105_363355FC 
X-CRM114-Status: UNSURE (   7.27  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <landen.chao@mediatek.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Qingfang DENG <dqfext@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

just a gentle ping

regards Frank


> Gesendet: Montag, 07. September 2020 um 09:05 Uhr

> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -192,6 +192,7 @@ port@6 {
>  					fixed-link {
>  						speed = <1000>;
>  						full-duplex;
> +						pause;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
