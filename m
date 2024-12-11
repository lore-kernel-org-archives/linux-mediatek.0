Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14100E77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 00:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CjAhm0T8eabtTbWzEl56h8D/MJjBFmQj5LVqz+i6m/0=; b=XaBUmG2BodI2Ts
	PkF3FTACve4bA4I7OA6uAlNfYEgS2zpAvgeb1eX8Do0u9nLU98ubBt2+aT36TVnORZtAWIl9mWZvk
	u5wVmzQKujKe/rukA6oJk3ahZ05jPmygtjRiz/s24nm1zLr8HJxZ5SS/5N0maNzBSksqn4B9vBPWK
	Aaxi5MToiXrTbpcUabERvrPwa31hRU72A/tBUjR/d3mOGT/kAWN13FzuiyGdrB0EVIt0wOgy8nEK7
	6OzlSEXc3C8RX01TtzB864ikhVAuLhFGo0L2QAMcPsdZcXky4aN8DqDpSjdaXMwtfOWkrOfZxPtrR
	Nb7sl1pGOwEViVxtr5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAHz-0000000DEnu-0Ven;
	Wed, 11 Dec 2024 00:09:15 +0000
Received: from pv50p00im-ztdg10011901.me.com ([17.58.6.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLAHv-0000000DElo-43on
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 00:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733875747;
	bh=CjAhm0T8eabtTbWzEl56h8D/MJjBFmQj5LVqz+i6m/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:
	 x-icloud-hme;
	b=TRrI9jgPRZLkzXZqlbksM2a1UEkJXKYRysRTzr18jNqnNAL5LBmjgtrNTVCiQ7zM5
	 Mr2u8dkC+/+V17h+FyPa5mlKV7wUr6+36AfbXqarAGf4pzonKnBDcjtswVv4N9TzEu
	 zj5ECcV9nRkzuNfPL/dDBwg/EWD1j7SiDh8rWulypBf/N3+oAHcNlPloUBghQEHJ29
	 DJ0mavrO6MBTMeMT18Qgv3sJSrvpQYFGODCOv5BBu9X06thbTc4kvlHYnvp8MXSfy0
	 urWDJFk+fFZ3dsoxPSKspmSbHgZvo6d4uCMfCJ/6XfToj0I3LqrZahZBK2tmyKTGkV
	 dkYj7xRMjP9uA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id D49D93A03BB;
	Wed, 11 Dec 2024 00:08:55 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Subject: [PATCH v4 00/11] driver core: Constify API device_find_child()
Date: Wed, 11 Dec 2024 08:08:02 +0800
Message-Id: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOLXWGcC/2XOzWoDIRQF4FcZXNfgHR2jWfU9Sgn+XJu7GE10O
 rSEvHvMBAoly3PgfJwra1gJGzsMV1ZxpUYl96DeBhZOLn8hp9gzG8WoYBTAQ8ltOcYUjrFk5M5
 h2ANK79GxPjpXTPSzgR+fPZ+oLaX+bv4Kj3ajhIEXagUuuI1mQpmsksG/X74pUA67UGb2wFb5B
 /Qv0wsgOwAaIIEy2k/uP3B73qvY20bL8yPzrmGH5pmWwxBilAK9B2+T1DDZqHUSxngNDnHUCrW
 yce86drsD+D+VdzsBAAA=
X-Change-ID: 20241201-const_dfc_done-aaec71e3bbea
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: -alI-XRJ5CvcRnQBKSq5z98wt7DybGq1
X-Proofpoint-GUID: -alI-XRJ5CvcRnQBKSq5z98wt7DybGq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-10_13,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412100174
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_160912_025049_E72F601A 
X-CRM114-Status: GOOD (  11.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series is to constify the following API:
struct device *device_find_child(struct device *dev, void *data,
		int (*match)(struct device *dev, void *data));
To :
struct device *device_find_child(struct device *dev, const void *data,
				 device_match_t match);
typedef int (*device_match_t)(struct device *dev, const void *data);

Why to constify the API?

- Protect caller's match data @*data which is for comparison and lookup
  and the API does not actually need to modify @*data.

- Make the API's parameters (@match)() and @data have the same type as
  all of other device finding APIs (bus|class|driver)_find_device().

- All kinds of existing device matching functions can be directly taken
  as the API's argument, they were exported by driver core.

What to do?

- Patches [1/11, 3/11] prepare for constifying the API.

- Patch 4/11 constifies the API and adapt for its various subsystem usages.

- Remaining do cleanup for several usages with benefits brought above.

---
Changes in v4:
- Correct title and commit messages according to review comments
- Link to v3: https://lore.kernel.org/r/20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com

Changes in v3:
- Solve build broken issue by squashing changes of various subsystem.
- Reduce recipients to try to send out full patch serial.
- Correct tiles and commit messages.
- Link to v2: https://lore.kernel.org/all/20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com

Changes in v2:
- Series v1 have no code review comments and are posted a long time ago, so may ignore differences.
- Link to v1: https://lore.kernel.org/r/20240811-const_dfc_done-v1-0-9d85e3f943cb@quicinc.com
- Motivation link: https://lore.kernel.org/lkml/917359cc-a421-41dd-93f4-d28937fe2325@icloud.com

---
Zijun Hu (11):
      libnvdimm: Replace namespace_match() with device_find_child_by_name()
      slimbus: core: Constify slim_eaddr_equal()
      bus: fsl-mc: Constify fsl_mc_device_match()
      driver core: Constify API device_find_child() then adapt for various usages
      driver core: Simplify API device_find_child_by_name() implementation
      driver core: Remove match_any()
      slimbus: core: Remove of_slim_match_dev()
      gpio: sim: Remove gpio_sim_dev_match_fwnode()
      driver core: Introduce an device matching API device_match_type()
      cxl/pmem: Replace match_nvdimm_bridge() with API device_match_type()
      usb: typec: class: Remove both cable_match() and partner_match()

 arch/sparc/kernel/vio.c                |  6 +++---
 drivers/base/core.c                    | 30 ++++++++++--------------------
 drivers/block/sunvdc.c                 |  6 +++---
 drivers/bus/fsl-mc/dprc-driver.c       |  8 ++++----
 drivers/cxl/core/pci.c                 |  4 ++--
 drivers/cxl/core/pmem.c                |  9 +++------
 drivers/cxl/core/region.c              | 21 ++++++++++++---------
 drivers/firewire/core-device.c         |  4 ++--
 drivers/firmware/arm_scmi/bus.c        |  4 ++--
 drivers/firmware/efi/dev-path-parser.c |  4 ++--
 drivers/gpio/gpio-sim.c                |  7 +------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 +-
 drivers/hwmon/hwmon.c                  |  2 +-
 drivers/media/pci/mgb4/mgb4_core.c     |  4 ++--
 drivers/nvdimm/bus.c                   |  2 +-
 drivers/nvdimm/claim.c                 |  9 +--------
 drivers/pwm/core.c                     |  2 +-
 drivers/rpmsg/rpmsg_core.c             |  4 ++--
 drivers/scsi/qla4xxx/ql4_os.c          |  3 ++-
 drivers/scsi/scsi_transport_iscsi.c    | 10 +++++-----
 drivers/slimbus/core.c                 | 17 +++++------------
 drivers/thunderbolt/retimer.c          |  2 +-
 drivers/thunderbolt/xdomain.c          |  2 +-
 drivers/tty/serial/serial_core.c       |  4 ++--
 drivers/usb/typec/class.c              | 31 ++++++++++++++-----------------
 include/linux/device.h                 |  4 ++--
 include/linux/device/bus.h             |  1 +
 include/scsi/scsi_transport_iscsi.h    |  4 ++--
 net/dsa/dsa.c                          |  2 +-
 tools/testing/cxl/test/cxl.c           |  2 +-
 30 files changed, 90 insertions(+), 120 deletions(-)
---
base-commit: cdd30ebb1b9f36159d66f088b61aee264e649d7a
change-id: 20241201-const_dfc_done-aaec71e3bbea

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>


