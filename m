Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E86C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 10:20:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C3EB206F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 10:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UrgkCub3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Cow9P2Hf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C3EB206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+6fFeq5t879EFr/nnK5nm5g9x0N2zPA6wMoQyHQj6dY=; b=UrgkCub35Zpwd8CanIM37E318y
	v6Em28vxoF30nIYu+6kywiIJVo0109j/qNAZAevzcqLl7oGx6BqEV7nZeufeE8AKhGSKakuW6tD8+
	kylarM0zt7pACdihIOgfSuPPZAJc9biw7bGKTCCyTfMYYyE9FYuJfjE8SQoWw+x0S4mhH9e8EBCa9
	DnT4/4Ktc7Z+zKZMzptKLX/25W54O1D2Oik/RIGYD5t9j21Eo58DuLxUvlOo+M9wDA7MYi8luuXDV
	y74kF463GV/NXaxC7sCq9nPN+EoB6tyypzh6XIpwPD+8ok+cdKFHLmFZt/xARIgnEt1VYcMrQilWp
	vuafc14g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtq8O-0002rZ-Gy; Fri, 10 Jul 2020 10:20:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtq8H-0002oC-4A; Fri, 10 Jul 2020 10:19:54 +0000
X-UUID: 8266a0ebdbc74c018f7844123cd39422-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CqFYCV4H7t0aImWcS2mYr0/XneJOwb8BbgC6yqbQIlM=; 
 b=Cow9P2Hfqh8FBFlc43D21u3PJDFRr5q3nqoM5OCyH8TJoVYMyEYphklqYRKvHHA8FdzPvyr6DsKoLO1mwr45hLMWd2kZU9bfJGpWc8VKR1JK71lqzCZo3j68YftsVje+Ck4TtIa+v9As6nQwKXb0i8XppGh5E+ZHhfAbo/xA6F0=;
X-UUID: 8266a0ebdbc74c018f7844123cd39422-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1894597618; Fri, 10 Jul 2020 02:19:43 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 03:19:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 18:19:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 18:19:33 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [PATCH v13 0/2] media: i2c: Add support for OV02A10 sensor
Date: Fri, 10 Jul 2020 18:18:48 +0800
Message-ID: <20200710101850.4604-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_061953_445977_E4BCDAC6 
X-CRM114-Status: GOOD (  11.98  )
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
 louis.kuo@mediatek.com, matrix.zhu@aliyun.com, 1095088256@qq.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

This series adds YAML DT binding and V4L2 sub-device driver for Omnivision's
OV02A10 2-megapixel 10-bit RAW CMOS 1/5" sensor, which has a single MIPI lane
interface and uses the I2C bus for control and the CSI-2 bus for data.

The driver is implemented with V4L2 framework.
 - Async registered as a V4L2 sub-device.
 - As the first component of camera system including Seninf, ISP pipeline.
 - A media entity that provides one source pad in common and two for dual-cam.
 - Used in camera features on CrOS application.

Also this driver supports following features:
 - manual exposure and analog gain control support
 - vertical blanking control support
 - test pattern support
 - media controller support
 - runtime PM support
 - support resolution: 1600x1200 at 30FPS
 
Previous versions of this patch-set can be found here:
 v12: https://lore.kernel.org/linux-media/20200702115223.21507-1-dongchun.zhu@mediatek.com/
 v11: https://lore.kernel.org/linux-media/20200630024942.20891-1-dongchun.zhu@mediatek.com/
 v10: https://lore.kernel.org/linux-media/20200615122937.18965-3-dongchun.zhu@mediatek.com/
 v09: https://lore.kernel.org/linux-media/20200523084103.31276-1-dongchun.zhu@mediatek.com/
 v08: https://lore.kernel.org/linux-media/20200509080627.23222-1-dongchun.zhu@mediatek.com/
 v07: https://lore.kernel.org/linux-media/20200430080924.1140-1-dongchun.zhu@mediatek.com/
 v06: https://lore.kernel.org/linux-media/20191211112849.16705-1-dongchun.zhu@mediatek.com/
 v05: https://lore.kernel.org/linux-media/20191104105713.24311-1-dongchun.zhu@mediatek.com/
 v04: https://lore.kernel.org/linux-media/20190907092728.23897-1-dongchun.zhu@mediatek.com/
 v03: https://lore.kernel.org/linux-media/20190819034331.13098-1-dongchun.zhu@mediatek.com/
 v02: https://lore.kernel.org/linux-media/20190704084651.3105-1-dongchun.zhu@mediatek.com/
 v01: https://lore.kernel.org/linux-media/20190523102204.24112-1-dongchun.zhu@mediatek.com/

Changes of v13 mainly address comments from Rob.
Compared to v12:
 - Add reviewed-by for sensor driver
 - Fix a build-warning and the warning when applying the patch with git am

Please review.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Document OV02A10 bindings
  media: i2c: Add OV02A10 image sensor driver

 .../bindings/media/i2c/ovti,ov02a10.yaml           |  172 ++++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1050 ++++++++++++++++++++
 5 files changed, 1244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
