Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF95BC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 06:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97182084D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 06:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K5vA+IFx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QZjmnx6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A97182084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GInIzCDjHI0J+GOixJW1YZSZqhaIzSnEo2FyW2kUwG8=; b=K5vA+IFxa5Wk+M
	xV/yPBXnUUfbpuHchjTFljdJ2mX4vCZuZCEIfEWAqbZOCOQwn/3ret0cSED3ShJrSv/H3RgzmI0zu
	EUfIQaAFnD2XdQ24obGguZWPLRAV6Y0/ydPBmxyaYQJkjdQ2RE6kjr14+Y+putB2Y01UPArL9N3yj
	0degolync5Zn6Pif18eIAdEUW3kUbxpZi6k05SHtYWdA4p3OB4XqunG00QfvH95YGYtoH4JPIFGcw
	+XEU2WlxjSH6fdD5oag7zkD178ZyylEQvN+r0lkzUsMFkhL/MI6DLDNHdI8kk8crK7JBkQqsyVrfz
	K6qonJIbpM4Kf6ZQKj4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inGja-0007A1-Ct; Fri, 03 Jan 2020 06:46:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inGjX-00077c-MR; Fri, 03 Jan 2020 06:46:57 +0000
X-UUID: 28f561b3c62d44109143704f564a42d3-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ih+VIQfKXduOjptVm6qmEZ+ILG81EfY3C/tspmpMToM=; 
 b=QZjmnx6+7vSaqjC7GGJ5CaY5BVyCt0Kl7Tx5BKUUG9WYwzSK3AJCkZpB9VRClHNHnFD3fbWK7ITN5VO3X9qB+plVtgX1Vdk+PBUwuy7bNYkTzvj5KIJNZmqlKWYnmDkD8vAcQIqgrilsiN2t3wt6QtcuroisWKwNcctOwIYHAjo=;
X-UUID: 28f561b3c62d44109143704f564a42d3-20200102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 954939942; Thu, 02 Jan 2020 22:46:50 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 22:44:34 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 14:43:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 3 Jan 2020 14:44:08 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v3,0/8] Add Mediatek thermal dirver and dtsi 
Date: Fri, 3 Jan 2020 14:43:59 +0800
Message-ID: <20200103064407.19861-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_224655_741504_52AB73AB 
X-CRM114-Status: UNSURE (   6.65  )
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

Rebase to kernel-5.5-rc1.

Update content:

[1/8]
Update sustainable power of cpu, tzts1~5 and tztsABB.

[7/8]
Bypass the failure that non cpu_thermal sensor is not find in thermal-zones
in dts, which is normal for mt8173, so prompt a warning here instead of
failing.

Return -EAGAIN instead of -EACCESS on the first read of sensor that
often are bogus values. This can avoid following warning on boot:

  thermal thermal_zone6: failed to read out thermal zone (-13)


This patch series base on these patches [1][2][3][4].

[1]support for reading chip ID and efuse (https://patchwork.kernel.org/patch/10902131/)
[2]arm64: dts: mt8183: Add reset-cells in infracfg (https://patchwork.kernel.org/patch/10908653/)
[3]clk: reset: Modify reset-controller driver (https://patchwork.kernel.org/patch/10908657/)
[4]PM / AVS: SVS: Introduce SVS engine (https://patchwork.kernel.org/patch/10923289/)

Matthias Kaehlcke (2):
  arm64: dts: mt8183: Configure CPU cooling
  arm64: dts: mt8183: Increase polling frequency for CPU thermal zone

Michael Kao (6):
  arm64: dts: mt8183: add thermal zone node
  arm64: dts: mt8183: add/update dynamic power coefficients
  arm64: dts: mt8183: Add #cooling-cells to CPU nodes
  thermal: mediatek: mt8183: fix bank number settings
  thermal: mediatek: add another get_temp ops for thermal sensors
  thermal: mediatek: use spinlock to protect PTPCORESEL

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 157 +++++++++++++++++++++++
 drivers/thermal/mtk_thermal.c            |  88 +++++++++++--
 2 files changed, 231 insertions(+), 14 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
