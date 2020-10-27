Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731C5C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:35:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDCD122263
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T4TCt/q6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="li0Ufj2b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDCD122263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DA8IbhSewt25ZNuI59PS/wgDUIetR+piAO4p53cAih4=; b=T4TCt/q6QoLPwYr85Oo9ViHjx8
	HiBAYo4EFh9TDdXb/R4BK4PatrKNEi/2jButecOi5/U6OWx9Ji9dx4XAmOzchlA2qLaOuZGGIKDtG
	cn40305dhWhq6JV9o2Q7n/NxtgVV0i2/M2cXT+yQJ/Oh1Orb6Oq6/8Lv9+Er35Icu1eBe/Njs3tSQ
	F5DfgOq9rwOHgEiuyy1Zo40OQDk2vLJXa/04PM4wSwrFZPHg59sKfnvckkVwPVASyfyiwMWDK2L4t
	nggNR8UVfUcvjThrDsdRk1PfTXNTct2pGqzkoOQuqK8qe7D5grU22rUUc0+/zulTElcEaKSMM/Gnv
	35ZVrcgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXMKA-0007GP-NW; Tue, 27 Oct 2020 10:35:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXMK7-0007Dg-Bx; Tue, 27 Oct 2020 10:35:28 +0000
X-UUID: 23fd8290d44742d1b1bb4d686cad115b-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:To:From;
 bh=/b/gCQSV6Qz2dGVgfETzaXVIvurYItjdyLbamEocLz8=; 
 b=li0Ufj2brudnK36zI5WlhbbbQ5AwOFZw9rqwKKm4G+ks9nx6jcob7I95/9YmsNJSxtscev43kJ3bewjcZ/mlYqYyCaHC493HJnJkRTAfZK5iIToDJc+JjryOUse+orTQUbWNnz90aLtgaT0SWusS8gJY51RqHLHv6NlKU343iOM=;
X-UUID: 23fd8290d44742d1b1bb4d686cad115b-20201027
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1650199494; Tue, 27 Oct 2020 02:27:03 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 03:27:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 18:26:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 27 Oct 2020 18:26:59 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v5 0/1] Add basic node support for Mediatek MT8192 SoC 
Date: Tue, 27 Oct 2020 18:26:51 +0800
Message-ID: <20201027102652.12806-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_063527_642887_D3DB6662 
X-CRM114-Status: GOOD (  13.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


MT8192 is a SoC based on 64bit ARMv8 architecture.
It contains 4 CA55 and 4 CA76 cores.
MT8192 share many HW IP with MT65xx series.
This patchset was tested on MT8192 evaluation board to shell.

Based on v5.10-rc1

Change in v5:
1. Remove watchdog and all syscon nodes
2. Use clk26m as uart clock source
3. Remove all dependency lists

Change in v4:
1. Remove scpsys, spmi and apu nodes
2. Add i2c nodes
3. Update watchdog binding
4. Update dependency list

Change in v3:
Fix typo in binding document of timer

Change in v2:
1. Remove mt8192-power.h from mt8192.dtsi which is not used yet
2. Add timer binding document and device tree node in mt8192.dtsi
3. Remove watchdog driver modification

Seiya Wang (1):
  arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and
    Makefile

 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |  29 ++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 513 ++++++++++++++++++++++++++++
 3 files changed, 543 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi

--
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
