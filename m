Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B95FC4332E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 12:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3082078A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 12:17:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T7Q8hF7s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aC57KzAo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D3082078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CxWEDk4PIvOswQMiy9ciDCrQK3gAdo1+M2ffKlzYCms=; b=T7Q8hF7sWww2+N
	5AtEBRyA3Wejcp1Z7A/BwvPwZ4ViZ1btlepBa0gZQ//BPCbADkjpgkHxmvra0sdLysdUshbYSOBJI
	n6jZtaV+EA0R5RPUEia+TRHeiI0c+bbp2W3Q2ZGzxdWIgrVh77R7gKC6t4+or7bGvgk0rtLIfjtqE
	rJ1rW3ZQU7rLEUbjUY3dVsQyPey/rELpFu9X7i8Zt973D9uhHuQY/W6bHcFsipnnTrr1c3WzkDiwh
	STdgKS+qMAXWyOh9aAF6xtLoHar5kCw67h+Dq1kTd8xqbuIvuEV/anjt8xT5C0w4TiDXNXXXCZkzr
	Js73YrvJuea6p+AS1HLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGM1C-0008Tn-MW; Mon, 23 Mar 2020 12:17:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGLzi-0006oU-Tm; Mon, 23 Mar 2020 12:15:52 +0000
X-UUID: 609ad3716f6447f6bc39c5361f35804b-20200323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+agh3Es7dP6XolQ0jlcE57kFr9lWPqGfX2DPzkcDR8M=; 
 b=aC57KzAo+3q95D82mtkf4SpJT2214zJmYbLyyds7UUtRiCIfFK+sJ6ZnYHcY2N9Wx35bMHsAlaKSvC6fqIqbj8rEsTgfFACbFqhU/ihJW2332y8k5A+aTkXHNq0k7lYekx6crCu5CgFo54Y/cbnYeeE6Mdww5UpK8noWCV4tD3U=;
X-UUID: 609ad3716f6447f6bc39c5361f35804b-20200323
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1560738857; Mon, 23 Mar 2020 04:15:42 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 05:15:39 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Mar 2020 20:14:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 23 Mar 2020 20:15:37 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui
 <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <michael.kao@mediatek.com>
Subject: [v4,0/7] Add Mediatek thermal dirver and dtsi
Date: Mon, 23 Mar 2020 20:15:30 +0800
Message-ID: <20200323121537.22697-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_051550_993132_78E7F26E 
X-CRM114-Status: UNSURE (   7.47  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset supports for MT8183 chip to mtk_thermal.c.
Add thermal zone of all the thermal sensor in SoC for
another get temperatrue. They don't need to thermal throttle.
And we bind coolers for thermal zone nodes of cpu_thermal.

Rebase to kernel-5.6-rc1.

Update content:

[1/7]
    - Squash thermal zone settings in the dtsi from [v3,5/8]
      arm64: dts: mt8183: Increase polling frequency for CPU thermal zone

    - Remove the property of interrupts and mediatek,hw-reset-temp

[2/7]
    - Correct commit message

[4/7]
    - Change the target temperature to the 80C and change the commit message

[6/7]
    - Adjust newline alignment

    - Fix the judgement on the return value of registering thermal zone

This patch series base on these patches [1].

[v7,3/3] PM / AVS: SVS: Introduce SVS engine (https://patchwork.kernel.org/patch/11439829/)

Matthias Kaehlcke (1):
  arm64: dts: mt8183: Configure CPU cooling

Michael Kao (6):
  arm64: dts: mt8183: add thermal zone node
  arm64: dts: mt8183: add dynamic power coefficients
  arm64: dts: mt8183: Add #cooling-cells to CPU nodes
  thermal: mediatek: mt8183: fix bank number settings
  thermal: mediatek: add another get_temp ops for thermal sensors
  thermal: mediatek: use spinlock to protect PTPCORESEL

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 156 +++++++++++++++++++++++
 drivers/thermal/mtk_thermal.c            |  88 +++++++++++--
 2 files changed, 231 insertions(+), 13 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
