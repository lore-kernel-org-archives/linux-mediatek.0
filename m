Return-Path: <SRS0=DTTl=YY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D751CA9EC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 09:08:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D898320862
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 09:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ns8ZN6rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D898320862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3aLQN6ulPPDwfeZqqf9W+rzgVs8aHSU3eMfR9gXVcB0=; b=ns8ZN6rbCslHh5
	pGCucMxofA67SRQ5SBuUoEEaojko4p4cNlaA9Vj6fRuDBWI0D90yaDniwBkDYjmRXkoNSOg6u0FqU
	XhO7W81vyd0URpw2J06P5vIZV8+MLSBI3xcl7hHv19izTaYTNSdU4Pqju8CbMMU76uiqdNgKxi3dV
	N6ltqDmqqNwLGph/Giao6sQ5Qeh/HU8/gSF2YpcpiRab2X1BkzlzWC8hKVels2ACnOeASOCeDo2ea
	YKzo2WA6BjRYAkhYStrR07W/H6iEy6gkzoUxZ4/ipjg+xclZpCphASqb/W8+G+qehHOE5rxxnDZKx
	1HmGejuhqpAKPydnKh4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ6RI-0002MY-6K; Thu, 31 Oct 2019 09:08:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ6RG-0002MD-3F; Thu, 31 Oct 2019 09:08:19 +0000
X-UUID: 6e7c61082d654f6e9b9b75a831b20e79-20191031
X-UUID: 6e7c61082d654f6e9b9b75a831b20e79-20191031
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1935837303; Thu, 31 Oct 2019 01:07:06 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 02:02:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 17:02:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 31 Oct 2019 17:02:19 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V3, 0/2] media: ov8856: Add YAML binding and sensor mode support
Date: Thu, 31 Oct 2019 17:02:11 +0800
Message-ID: <20191031090213.27727-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_020818_142681_C31A2647 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 shengnan.wang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

This series adds new DT bindings in YAML and two more sensor modes for users to call.

From the latest ov8856 datasheet, it is proposed to adopt the resolution of 1632*1224 and 3264*2448,
together with Bayer Order of BGGR. Here two more scenario settings are provided.

The hardware revision of ov8856 could be distinguished from one OTP SRAM register R700F.
PLL register R3614 requires to be correspondingly updated.
For instance, 0x20 is suggested for 1B camera module.

Finally, The driver has been validated in camera features on CrOS application.

Changes of V3 mainly address comments from Andy, Tomasz, Sakari, Rob.
 - Convert text documentation to YAML schema.
 - Enable VSYNC singal output
 - Add ov8856_runtime_suspend() which would call __ov8856_power_off()
 - Add ov8856_runtime_resume() which would call __ov8856_power_on()
 - Fix other reviewed issues in V2

Mainly changes of V2 are addressing the comments from Sakari, Tomasz,
including,
 - Add clock-frequency and link-frequencies in DT
 - Re-define some macros like R3614, R3d84, n_shutdn
 - Rename OV8856_MCLK to OV8856_XVCLK per datasheet
 - Refine ov8856_update_otp_reg, ov8856_configure_regulators and ov8856_cal_delay
 - Set the bayer order in the mode struct, and directly links to register R3808, R3809
 - Remove or refine redundant log print
 - Fix other reviewed issues in V1

Dongchun Zhu (2):
  media: dt-bindings: ov8856: Document YAML bindings
  media: i2c: ov8856: Add support for more sensor modes

 .../devicetree/bindings/media/i2c/ov8856.yaml      | 126 ++++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/ov8856.c                         | 661 ++++++++++++++++++++-
 3 files changed, 779 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.9.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
