Return-Path: <SRS0=PvK4=BS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB799C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 12:41:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1CF020759
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 12:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9DfVuxu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="JTJcUnTt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1CF020759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0NvSivYqX67sppok2OzGxqBxTAV81E8HUYEywBxyzmE=; b=N9DfVuxuPERAtmzdCILGAIH8h
	iPklYiJ2zyUwMhrhTASKC3OFMwCTa5LfgiqQmExcYuF3UrEnVillA2FgD5trg89xnRI0mdPG7+pcy
	GF6vLNEOIUlXIdIAsh06wsVYJwpfYolbHau9c8ohzFrjdhNoNKCcFNSIKLOaUr3+EL++qZGSYIkmq
	HvY7ckRzt7QwEzYTBignw0W79HbB4f+uubMlPVRJyy5lwfbPQ9bdI528DX1tux2biUAll6r0I3dln
	D5LbxpKIKsl6/Z4u+S4uZsM7fgeVAUS66SSl2HyeIgU3jukICDiMi8UacKMozeBBjWf5P6BRz6Xi5
	jYIFySO6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4OA2-0005YS-Us; Sat, 08 Aug 2020 12:41:19 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4O9y-0005Xb-OE; Sat, 08 Aug 2020 12:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596890469;
 bh=YRbpvjuQuUd9oUTYdd74s47n04KsNZ+0RJ4NNZHvrW4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=JTJcUnTt6Xm1XM6QulPit5eo+c7qE/YrQPhY3i/eSTyx0YnEBjsbkfwwji3Pw0V1o
 uTkCpeprztQZ0fmUa4+mmx6YtMUDW40ZnwJR7vDwfIrqOz6aRkF4XM0zEcBLRd2YJo
 ulYVpQ2kchD0dBkDM9c39AoJlwzTbC3JvhUaoj20=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.39] ([217.61.152.39]) by web-mail.gmx.net
 (3c-app-gmx-bap69.server.lan [172.19.172.69]) (via HTTP); Sat, 8 Aug 2020
 14:27:31 +0200
MIME-Version: 1.0
Message-ID: <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Aw: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes
 to mt7623n.dtsi
Date: Sat, 8 Aug 2020 14:27:31 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200807082754.6790-2-linux@fw-web.de>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ti0yCfi31/teh3YG5W8qHJKm0SNcwMUtl+Gh3qRvfzdI39vY36mhVNFwgmQlANRwWuXRO
 Z6odYE+tNXJDzG2hhPWYLSJ+LehW097tyrdY4ZWCvmtw8QM1KOlsE3tWRUy+HszSnAJqLjymHU02
 70wAG2aV5CCLsxL8NCvVtNO0I6sHMK1kargEMcNlAOiz4XKtns3T+ioAUTclxBHnpHw/E/TUB+0k
 uQb3Y1YlrpjhAwgYqCwuhQBImUKCyIjjZ+jglLM8Y2BjVAcb76w78MOuy9YNpMkqLSrP8J8NXR4L
 wA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:+4w25NFyASk=:3SmmaLGj7FOpQzufwM7MdP
 vQf/21DYN5jKxSZhcE83mYxkBjURh0dPcMjrmQgpiH9IeUos/2xnGLu20Pg/Ru1mEQ/YqWcSt
 FhPuupflOQm8/Df+S0a4x8beh6KImcwHMWRqPFr1My00pwOiXN8FPGWAV9rYxrG3OEmKq9d+Q
 O4FyrVfecAT4em40Gyt/eFptq21a/hpTRlHDSjFVNPR2juWj7DmkcdY8bU/Pr8o8XLUhaY17j
 VdWda6WYdBXBfOfku7NaQnl4FqWgBvUKpbkJg4Uxi3xxCncpO/DHEOD+LCUWci8IUG6EqwzHz
 6pOH8EtDnR/U2223KhvEtu4yangmoPTW7wIvzmWbrzhnKjxi7himaI7c/YfoVj9jAzY0MbpRn
 RmihkDvE/G5qo6xqystn6wIebOarCZgOMfefmD/+YJxc4x2w2WBtH3D2wr0B516BBccH4F44p
 +Q17G6gJSGlGJpfD1JnIIzyZ9b7fNWIpdWbYnjbdDLOORiE4teGCjlBPX+hLH/R5d8WVqUoyN
 tMe0yiBGdxEO8l559s93Vn00ECvohGWJCKpVOhGhMDqERW5YfB8JWHk15rdy9D+P+hLLaqN9L
 5d9WHm1TcJwmX70TIDfA4JEJ6G8KavOKBdp84H1BtC3HHt4noZMYGUkvG0AoKcP5feAW18ppD
 kzRGeO1jHgYH0DsrqUpKX5G+CQZI88nl2dvoFGopUasDd910yOV6rUPNUayAlv10uCUc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_084115_007237_14709A81 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 chunkuang Hu <chunkuang.hu@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

as i made a mistake in cover-letter, it is not assigned to the series.

to show its content, i send it here as comment (instead of resending the whole series):

based on series from David Woodhouse [1]
i moved more display-nodes out of mt7623.dtsi to new mt7623n.dtsi
and changed last part from my series [2] to add these nodes to this new dtsi

the depency of dtsi-dtsi-dts is already done for mt7623a, so i guess it's a good
way to use it for mt7623n too.

this first set is an RFC if all nodes are in right order and if it is wanted to move
them out as i have no technical document about mt7623a/n which describes which parts
are available on both or only on one of them

added MTK DRM Maintainer CK Hu, Ryder Lee and Sean Wang, maybe they can give me some advice
how to proceed further here

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=329209
[2] https://patchwork.kernel.org/patch/11700699/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
