Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770D3C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 08:56:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F3D2078E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 08:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ccTULCqQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Ch8svcrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F3D2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8aTnG2DX3W/UL0bWk7ys39pCJNLALUaExXFQ+hBenZE=; b=ccTULCqQHv0Y9L/1kYroZ5NZU
	iPrH2Z8f3SydruHUx1gOXzMRbdwG76o63OKeqbtthToJ/L2BGxqG/NvQAjOU1MZeDwtSMJsAhaKeL
	2lAEEDgQZBXIjGcfHGN93Dr1lBeMGp583zBrPU3ofkWP8H9tbzUH1Ms489joiI6M6wWpjsaB+829R
	jc+Rn9/9l4sflRIMLq6rQU1e4Mjwdznzn1GEIm7Kh0mpF+k+1ON8IXicXLcqqNbbam5hWzF2WShbe
	dSORuGXrMvmJaJyIWhZP6AwCa8QoukhzrhtHOWfpOHPxBCoKcxp8hFDSFUi4vDG14I0e6oKbm0IxR
	MkYHC2V5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCwf-0007ao-Mj; Mon, 07 Sep 2020 08:56:13 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCwa-0007ZH-IY; Mon, 07 Sep 2020 08:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599468964;
 bh=yIFXqy7te6Dvn3pYvMyPkuWrR4YLQ/+MWx//ZLlZYaY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ch8svcrDAY16aHiorDCkHbfh0loilVAUgZmfsd0krvX+mm1S2bSbt+hIiW80XMLh6
 fXOWU0r7tFHmZIFc/SZs6OqrKlCDEgmzK2IZ+KNnx18HrPq++bNRNw5tboAdmAbttX
 A/uxrvv8CRssjb8TmoCYI5fnMeEDVoheenu4NpxA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.104] ([185.76.97.104]) by web-mail.gmx.net
 (3c-app-gmx-bs77.server.lan [172.19.170.225]) (via HTTP); Mon, 7 Sep 2020
 10:49:59 +0200
MIME-Version: 1.0
Message-ID: <trinity-b698e161-35b7-44f9-bcec-836d9e5d0fb4-1599468599322@3c-app-gmx-bs77>
From: Frank Wunderlich <frank-w@public-files.de>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Aw: [PATCH net-next v3 0/6] net-next: dsa: mt7530: add support for
 MT7531
Date: Mon, 7 Sep 2020 10:49:59 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-03089c68-65a5-4572-95c3-c75b9f7e330a-1599295554893@3c-app-gmx-bap15>
References: <cover.1599228079.git.landen.chao@mediatek.com>
 <trinity-03089c68-65a5-4572-95c3-c75b9f7e330a-1599295554893@3c-app-gmx-bap15>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:5M30BJ8gJxoqt26/8TkrNWB7b+NM0kRlZhPhhBoI5O2cy17TFMaA3mzeqE2Si0IMOtAEq
 Yz28gdLhQIT/CnxJADDM7S3yER2A3ls5lzRhGXPDMMPUB4kwiXD7YqdE71sMTNHrvCtsCH4pKzse
 gc4k9Z6AFc2NuKA8yAN0jUeoZOINsxiEm2H6OtwllW2QNYVcLa7nmyfM00yYUU1lnH0qDj5VkPRi
 H3o0M+b+uHBZXEGActBnRvDg6GCh9zhj6JQaP1xD3yjQ5oI1CQ/714bUH8j9cNau9TO+Y4ErKuqF
 z8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:zH//Yst0bho=:u4pO3/REf1ng+s8c2cNyL9
 Ny2qlW7Sq84L+l1APfcC9LIBk0jsNx1tempWijupYtoEqHHh0UhA4O5nzseh4aKR1cvcsULHn
 dSV3YZpEqHjdZHA9J6I0BQrH8SzJ8ZzzQzfONVoAnz2weSiG7kzP5B+OB6xtS1O4lZC3vCB0x
 BGpiwzlfekNWhJ+Z4qIMM891HcdVZGR5zIiixBF75hX/xFoSaoIR6wbDDCZUb1D9kE/APEPQx
 j7D3G75gKgnHY1b2a8SDrf6jNXXnOPUUe0Y5NTvfjVEMcGWG9SxEDKRAa/9fFhoLgPOgi5aj3
 Fjru5C/1k/Yi3qLcDZQPRfKR/7gqW8b6oC/FDsM2vNwgFfJ3CR2Cn8KI79UxFT/wir3ChPFu4
 2h9l6+ULOZuDbchlfxRlJPBUhzqo8dohuSBOQHnEjdFKm3LnA/7acHAhddiZTMOWuH9FJhylh
 +ciidz6fLveah5xivQIHALwULC1FbPENC2IjwKcs/JbjQChizFczAm7AgBAB44puI5XLcLnNL
 q5/uRRIQGfsi0uZlBMX2TqBHFVoKgYGrQxYFAJp8SjoM+rjyic5x3WDQMukHvM4FbcbAZWQtu
 kzazXEAy1FHS3oQE/DyrYoNjSZNMSYaX6ZLxxccjBNZuIUErCDkmrVr2PRLJRGu8M70oHLpFf
 WBbhpOMKh9vfLrv7IXmdBCVA3gZ5YWz2dQePDcMMEHu/+XTa7hzEagdO7kRQt0szsGNM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_045608_809721_D711D8E3 
X-CRM114-Status: UNSURE (   9.28  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Frank Wunderlich <frank-w@public-files.de>,
 Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Vivien Didelot <vivien.didelot@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dqfext@gmail.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, opensource@vdorst.com,
 Jakub Kicinski <kuba@kernel.org>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

> Gesendet: Samstag, 05. September 2020 um 10:45 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> similar to bananapi-r2 (mt7530)
...
> reverse-mode:
>
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.01  sec  1.05 GBytes   905 Mbits/sec  14533             sender <<<<<<<<<<<
> [  5]   0.00-10.00  sec  1.05 GBytes   905 Mbits/sec                  receiver

these retransmitts are caused by missing pause-statement in devicetree of bananapi-r2. I got them with mainline driver too.

After fixing it [1], i got the expected results with these mt7531-Patches:

iperf3-client on r2

normal mode:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.10 GBytes   943 Mbits/sec    0             sender
[  5]   0.00-10.00  sec  1.10 GBytes   941 Mbits/sec                  receiver

reverse mode:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec    0             sender
[  5]   0.00-10.00  sec  1.09 GBytes   937 Mbits/sec                  receiver

Tested-By: Frank Wunderlich <frank-w@public-files.de>

[1] https://patchwork.kernel.org/patch/11760003/

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
