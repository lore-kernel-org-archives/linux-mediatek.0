Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB85FC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 14:18:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A00F206D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 14:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQ3uaz91";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ha8mQjRq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A00F206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xHOAS2lFtnD4hOg17omRuj20rvZTHBkFfrTtdePyzdA=; b=BQ3uaz91ioaRJnvqbRkwe6JApA
	G+wh9yD3YBwhNc3s0fb5GEG3acOKiDaD3KUOteNiNMBjS9Z2XyuR0fpX6iaebLxjtAARWaZPsaALy
	aIC+Eg8hToREml0MnmuUxiMgUHGSBAHlC/0o+4cwu2ET4AeR6VZXOZsa1srWjH7WrpVubMSim91Kj
	1lYN+w4O2uQ4W9ko+jDc7AYmSsqojkdYSt3G6Cxv2D3uwE2FQpdSqLdxU7rjoUEK1mStfRowF/eFu
	7Tj7q4h3KMY+l849a2xh4IKmBDwDfu+utw3HvJZCbLh9wGZZy6o3foSDrd2/YB/1tccS//Mdz4Zy2
	DXt/iskw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khvch-0003ZB-2C; Wed, 25 Nov 2020 14:18:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khvcY-0003Ts-Nq; Wed, 25 Nov 2020 14:18:16 +0000
X-UUID: f0d7711f23fa41889b312ed2f9ea6724-20201125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lTACrO+6C6nQDtbDPv0E+110SaL1HZAA/xc09JUTzIU=; 
 b=ha8mQjRqahMWZh4WJ/TDQ1skTQzMkhgWwgvXaK+AtC00bV8wFXKRBo+5MDwBFLG7ai8qeUUcBbwQRdCA1kh4QqbLhrLPsQaWEkgwqBK6g9losSjZ0mgVVzwdmI/KEKG5sZKEZb3nu8Q8RU+Q1CSAKYgMvLCESlsAo+UD/f9G5ws=;
X-UUID: f0d7711f23fa41889b312ed2f9ea6724-20201125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1306620827; Wed, 25 Nov 2020 06:18:03 -0800
Received: from MTKMBS09N2.mediatek.inc (172.21.101.94) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 06:17:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 22:17:56 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Nov 2020 22:17:56 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [PATCH v16 0/2] media: i2c: add support for OV02A10 sensor
Date: Wed, 25 Nov 2020 22:17:54 +0800
Message-ID: <20201125141756.13770-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_091810_956349_F2135568 
X-CRM114-Status: GOOD (  12.13  )
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

OminiVision OV02A10 is a 2-megapixel 10-bit RAW CMOS 1/5" sensor which has
a single MIPI lane interface. This is a camera sensor using the I2C bus
for control and the CSI-2 bus for data. 

The driver is implemented with V4L2 framework.
 - Async registered as a V4L2 sub-device.
 - As the first component of camera system including ISP processing pipeline.
 - A media entity providing one source pad in common and two for dual camera.

Also this driver supports the following features:
 - Manual exposure and analog gain control support
 - Vertical blanking control support
 - Test pattern support
 - Media controller support
 - Runtime PM support
 - Support resolution: 1600x1200 at 30FPS

Changes of v16 mainly address comments from Andy, Rob, Tomasz and Sakari.
Compared to v15:
 - Move the property 'ovti,mipi-clock-voltage' under the endpoint node
 - Update the hardcoded masks with the GENMASK macro.
 - Replace fwnode_property_read_*() with device property API.
 - Fix other review comments to improve readability.

Please review.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: document OV02A10 DT bindings
  media: i2c: add OV02A10 image sensor driver

 .../bindings/media/i2c/ovti,ov02a10.yaml           |  159 +++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1013 ++++++++++++++++++++
 5 files changed, 1194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
