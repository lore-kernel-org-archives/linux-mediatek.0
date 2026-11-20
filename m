Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2341A606A326
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jt6D6BVR;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=L/emeiig
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iQd0szpodWCkedCEQ6y+wHscJHQCmXAqsdXrKfYkri4=; b=jt6D6BVRxh6fR1WaPMXZZ+UhSj
	CCIQF7tiOEKg4fVQTr2lav6N7/ir0B9MRWV8za2smRkjKrbnrldJCH75CImlG4bMI195ZKHsnXAID
	ad4lZ0zNYpl9BEzwzet+Y/iYDpM1PaRWJgAkftP9qbRVT5xpebokOUTFtDt3lGknVtVY8jrQhCdnH
	lhD14fwUphtOkEnW2QcHW1IlwHrt1UrzWilfGX+dgzP6SbBgERFJRYFvYCgFgN5sJZSkcyOWvC0Ba
	MiJ3J5DMPhipyB04TtwKJFHRfGCinVqgkOkB2e/c0vsuNa4ycxySzz5Hre87FaRXpWmAD6UmWgXjd
	/ize6onw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIfK-0000000ECVD-1Lhi;
	Fri, 20 Nov 2026 07:04:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIfH-0000000ECUq-3J73
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 07:04:08 +0000
X-UUID: 8c52ea76e4b011f1afed4741b24580c9-20261120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=iQd0szpodWCkedCEQ6y+wHscJHQCmXAqsdXrKfYkri4=;
	b=L/emeiigxAoj+4EhZZagBCq/pLrb5vXDCa6wdSs+0qxytjfLcGy2+hErnIjaNdOKZnoH/kdzirt/CAb5bYqx/eTeQ7UAUbjW1saaDZwzgRVzBc/9YnKfap2VzMXv4LK95+l4hsh1vuRi/n5xdhwnNjAugiTOgPpBAVIK4BHhpyc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2581b4f5-0b9d-49b9-b1ab-dfdfdae12ffb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:4e4819f7-eb8c-45c4-ab5e-2cec3871e65a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|836|865|888|898,TC:-5,Content:0|1
	5|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8c52ea76e4b011f1afed4741b24580c9-20261120
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1097702766; Fri, 20 Nov 2026 00:03:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Fri, 20 Nov 2026 15:03:52 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Fri, 20 Nov 2026 15:03:52 +0800
Date: Fri, 20 Nov 2026 15:03:52 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
CC: <linusw@kernel.org>, <lorenzo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <brgl@kernel.org>,
	<naseefkm@gmail.com>, <benjamin.larsson@genexis.eu>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<lei.dong@airoha.com>, <ansuelsmth@gmail.com>
Subject: Re: [PATCH 04/12] pinctrl: airoha: an7581: fix PHY LED GPIO group
 assignments
Message-ID: <av_w2OD7cYYWNYRS@mediatek.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-5-zhengping.zhang@airoha.com>
 <5e681d92-9772-42e3-aae8-47faacf6d850@iopsys.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5e681d92-9772-42e3-aae8-47faacf6d850@iopsys.eu>
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_230407_859799_8C745549 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mikhail,

Thanks for checking this. Could you please share the version of the
7581 datasheet (sometimes also referred to as the Programming Guide)
you are referring to, and the relevant pin-function table? It appears
to differ from the pinctrl info available to me.

The GPIO lists the eight pads as follows. The key point is the mapping
between the mux bits and the GPIO pins.

GPIO    Function           IOMUX control signal    SCU register
------  -----------------  ---------------------  ----------------
GPIO33  LAN0 LED1           RG_GPIO_LAN0_LED1_MODE  0x1fa20214[4]
GPIO34  LAN1 LED1           RG_GPIO_LAN1_LED1_MODE  0x1fa20214[6]
GPIO35  LAN2 LED1           RG_GPIO_LAN2_LED1_MODE  0x1fa20214[8]
GPIO42  LAN3 LED1           RG_GPIO_LAN3_LED1_MODE  0x1fa20214[10]
GPIO43  LAN0 LED0           RG_GPIO_LAN0_LED0_MODE  0x1fa20214[3]
GPIO44  LAN1 LED0           RG_GPIO_LAN1_LED0_MODE  0x1fa20214[5]
GPIO45  LAN2 LED0           RG_GPIO_LAN2_LED0_MODE  0x1fa20214[7]
GPIO46  LAN3 LED0           RG_GPIO_LAN3_LED0_MODE  0x1fa20214[9]

On the AN7581 EVB, I tested the configuration assigning lan0_led0
through lan3_led0 to GPIO 43 to 46, respectively, and observed
working hardware-controlled LAN LEDS. Register readback during testing
showed:

  SCU 0x214: 0x000042a8
  SCU 0x22c: 0x00000000
  SCU 0x27c: 0x00043210

The LED-related bits set in 0x214 are bits 3, 5, 7 and 9, consistent
with the GPIO overview above.

Could this be a naming difference between the documents? the key
relationship is the GPIO pad controlled by each SCU mux bit,
together with its LED mapping register and PHY LED channel. The patch
aims to correct that relationship, rather than rename LED0 and LED1.

I would like to reconcile the documentation before deciding wheter
to retain or drop this patch.

Best Regards,
Zhengping

On Sun, Nov 15, 2026 at 05:02:12PM +0300, Mikhail Kshevetskiy wrote:
> according to an7581 datasheet
> * LED0 uses GPIO33-35 and GPIO42 * LED1 uses GPIO43-46 so patch is not
> needed
> 

