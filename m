Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E57C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 02:46:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AAAC610CA
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 02:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AAAC610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zEd18DXtzoG2crRY3Hxb+z9NggOtahZOu6BA9NHHU8U=; b=ZlzaIc3LELu6NMf+6Gs7SNvbS
	VGV7p6itnKhIvLZuNhlzct5hcyTx+g926LJUTLoweL1NaEuzDU7093ApLOaKzUabsfiQNJFVTY1Ue
	6mOnEmSF3XJF3zFCrgN9Uh1oFLlbwJxcacEhY51njP7orG4e2Wcwb/aaYx8G/dtX27JmoQ7u5RUpp
	bt3GSFSpv16/yezo18vpPGjFVNZJPDJ4VX8cUUc6o3qzW0MrHhyMJAuFlyvoh1UvLTjGJGBtTj0o+
	spvT/kMBFcxKDtiZETqSWWZhBLlaDUGm4a5iltfXOROU3kXXvqSjIwZcolKTNB/PIGcGg+s4Jt3Sp
	P4+1eh2SQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUh9z-009kjD-RL; Fri, 09 Apr 2021 02:46:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUh9c-009kd0-PA; Fri, 09 Apr 2021 02:45:58 +0000
X-UUID: 8d136f2c243d4c5b9d98a925ee7dd6b3-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8T4E01kxeJRJGPw3gtkiLtJJA6A36FPUJNhqK297rMY=; 
 b=tMG5NX2WGYibQZEjbLW5lXAOz/3X36inEQjL7AxEskoMMg4ji91PmzNaYG5GC0PAYLUzsjaO1iGQvHy1bV3ghojofPW20Ux3JQDryj9vq9Jqg7k7+tanPhdm9gGnkc6gRJML0Nm0nlOCws2N+ThLLsfTNJI8Ub5btoI9P3LxYFs=;
X-UUID: 8d136f2c243d4c5b9d98a925ee7dd6b3-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 29085004; Thu, 08 Apr 2021 19:45:47 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 19:36:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 10:36:50 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 10:36:49 +0800
Message-ID: <1617935237.16711.6.camel@mbjsdccf07>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: add MT6779 spi master dts node
From: Mason Zhang <mason.zhang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hanks.chen@mediatek.com>,
 <wsd_upstream@mediatek.com>
Date: Fri, 9 Apr 2021 10:27:17 +0800
In-Reply-To: <4e39785a-06a6-4ec5-5930-8a5bf53e4f7b@gmail.com>
References: <20210226105918.3057-1-Mason.Zhang@mediatek.com>
 <4e39785a-06a6-4ec5-5930-8a5bf53e4f7b@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_034553_622362_D40E2A86 
X-CRM114-Status: GOOD (  10.80  )
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

On Wed, 2021-04-07 at 13:17 +0200, Matthias Brugger wrote:
> 
> From the binding description:
> - #address-cells: should be 1.
> 
> - #size-cells: should be 0.
> 
> We are missing both here. Please fix that.
> 
> Apart the binding description is naming PLL, clock mux and clock gate IDs which
> do not correspond to the ones used here. It seems that this binding was tailored
> for a specific SoC family but never made generic. If you want, please do so and
> convert it to yaml.


Dear Matthias:

	I have update patch v2:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210409015651.11474-1-Mason.Zhang@mediatek.com/

	Please gentle ping on this patch. Thanks~
	
Thanks
Mason

				       		








_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
