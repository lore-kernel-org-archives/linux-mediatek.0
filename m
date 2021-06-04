Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4F2C07E94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 10:04:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E72161406
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 10:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E72161406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wwUakuFfFD1vKPUZn5W0VASihdicRxEFYSM5OVq7AYY=; b=eiBBI2o1aqC6Ah
	6MU8QFGihE8250SQWYxddKejqTghEVatL/SyGwQtbfknTVGQ3aVwRu4rxyC1MNSijjidvCQtGTpSV
	RQGVRp5S12QiqSCXcNj3knVS2acvJH/S0dqAvxGZLUlpMR1h9sUvbznHZ6K1M24tCC38xZcGGbEh6
	fNrs2C2M8wh9+qWGmaCr5ZcWD9WG6QoamKoBM1ert99cor644srCVaL7rKOzgfryI4aFjGxbEqZaT
	cIDWKT+W0MX1+HrC7jEKG1X8V03GRy2l6P+aptyVpLzDD2HfHsi3nQX3N/QqOYyn9uawHORd4P3wp
	0oZCpROUlScLApC3NA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6go-00CneW-EA; Fri, 04 Jun 2021 10:04:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6eq-00Cmix-K6; Fri, 04 Jun 2021 10:02:33 +0000
X-UUID: faa879221ef94f49b689d89657c8875c-20210604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qlh6aE/x/gHWiz/nOA35Qg6lab0OgrxMdW1A/X19DM8=; 
 b=LBUR57n73tInk2adbrWF20E7ZBCRtIYJTslNvbcd3zYwg8ZCjxvcvettu+AagIj5ReQhFsuUXZa1SGWxuH90jIPHg7XIqdh5wmH6t9qc6D1w8nBAagFBwkP8OzbUvfqgLTXMXTkH6ShU7uAweH1n8h0hoej2I7qqUTzo8GyBtCE=;
X-UUID: faa879221ef94f49b689d89657c8875c-20210604
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2049133341; Fri, 04 Jun 2021 03:02:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 03:02:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 18:02:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Jun 2021 18:02:21 +0800
From: Dawei Chien <dawei.chien@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>, Dawei Chien
 <dawei.chien@mediatek.com>
Subject: [PATCH 00/12] Add driver for dvfsrc, support for interconnect
Date: Fri, 4 Jun 2021 18:02:06 +0800
Message-ID: <20210604100218.13613-1-dawei.chien@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_030228_704805_4C7DB2E7 
X-CRM114-Status: GOOD (  23.93  )
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

This series is based on v5.13-rc1.

The patchsets add support for MediaTek hardware module named DVFSRC
(dynamic voltage and frequency scaling resource collector). The DVFSRC is
a HW module which is used to collect all the requests from both software
and hardware and turn into the decision of minimum operating voltage and
minimum DRAM frequency to fulfill those requests.

So, This series is to implement the dvfsrc driver to collect all the
requests of operating voltage or DRAM bandwidth from other device drivers
likes GPU/Camera through 3 frameworks basically:

1. interconnect framework: to aggregate the bandwidth
   requirements from different clients

[1] https://patchwork.kernel.org/cover/10766329/

There has a hw module "DRAM scheduler", which used to control the
throughput.
The DVFSRC will collect forecast data of dram bandwidth from
SW consumers(camera/gpu...), and according the forecast to change the DRAM
frequency

2. Regualtor framework: to handle the operating voltage requirement from
   user or cosumer which not belong any power domain

Changes in V10:
* rebase all patches on v5.13-rc1
* add acked TAG for interconnect provider driver (Georgi)
* update comment message for typos. (Georgi)
* update cover leter for typos.

Changes in V9:
* modify the configuration of dvfsrc.yaml. (Rob)

Changes in V8:
* Fixed the dt_binding_check error of dvfsrc.yaml. (Rob)
* Remove Kconfig dependency of DVFSRC

Changes in V7:
* Fixed the dt_binding_check error of dvfsrc.yaml. (Rob)
* Fixed the checkpatch complains of "Signed-off-by:
email name mismatch". (Georgi)
* Fixed coding style of interconnect driver. (Georgi)
* Update comment of the years to 2021. (Georgi)

Changes in V6:
* Remove the performace state support, because the request from consumer
can be replaced by using interconnect and regulator framework.
* Update the DT patches and convert them to DT schema. (Georgi)
* Modify the comment format and coding style. (Mark)

Changes in V5:
* Support more platform mt6873/mt8192
* Drop the compatible and interconnect provider node and make the parent
node an interconnect provider. (Rob/Georgi)
* Make modification of interconnect driver from coding suggestion. (Georgi)
* Move interconnect diagram into the commit text of patch. (Georgi)
* Register the interconnect provider as a platform sub-device. (Georgi)

Changes in V4:
* Add acked TAG on dt-bindings patches. (Rob)
* Declaration of emi_icc_aggregate since the prototype of aggregate
function has changed meanwhile. (Georgi)
* Used emi_icc_remove instead of icc_provider_del on probe. (Georgi)
* Add dvfsrc regulator driver into series.
* Bug fixed of mt8183_get_current_level.
* Add mutex protection for pstate operation on dvfsrc_set_performance.

Changes in V3:
* Remove RFC from the subject prefix of the series
* Combine dt-binding patch and move interconnect dt-binding document into
dvfsrc. (Rob)
* Remove unused header, add unit descirption to the bandwidth, rename
compatible name on interconnect driver. (Georgi)
* Fixed some coding style: check flow, naming, used readx_poll_timeout
on dvfsrc driver. (Ryan)
* Rename interconnect driver mt8183.c to mtk-emi.c
* Rename interconnect header mtk,mt8183.h to mtk,emi.h
* mtk-scpsys.c: Add opp table check first to avoid OF runtime parse failed

Changes in RFC V2:
* Remove the DT property dram_type. (Rob)
* Used generic dts property 'opp-level' to get the performace
state. (Stephen)
* Remove unnecessary dependency config on Kconfig. (Stephen)
* Remove unused header file, fixed some coding style issue, typo,
error handling on dvfsrc driver. (Nicolas/Stephen)
* Remove irq handler on dvfsrc driver. (Stephen)
* Remove init table on dvfsrc driver, combine hw init on trustzone.
* Add interconnect support of mt8183 to aggregate the emi bandwidth.
(Georgi)

V9: https://patchwork.kernel.org/project/linux-mediatek/list/?series=440389
V8: https://patchwork.kernel.org/project/linux-mediatek/list/?series=421713
V7: https://patchwork.kernel.org/project/linux-mediatek/list/?series=411057
V6: https://patchwork.kernel.org/project/linux-mediatek/list/?series=406077
V5: https://patchwork.kernel.org/project/linux-mediatek/list/?series=348065
V4: https://lore.kernel.org/patchwork/cover/1209284/
V3: https://patchwork.kernel.org/cover/11118867/
RFC V2: https://lore.kernel.org/patchwork/patch/1068113/
RFC V1: https://lore.kernel.org/patchwork/cover/1028535/

Henry Chen (12):
  dt-bindings: soc: Add dvfsrc driver bindings
  soc: mediatek: add header for mediatek SIP interface
  soc: mediatek: add driver for dvfsrc support
  soc: mediatek: add support for mt6873
  arm64: dts: mt8183: add dvfsrc related nodes
  arm64: dts: mt8192: add dvfsrc related nodes
  dt-bindings: interconnect: add MT6873 interconnect dt-bindings
  interconnect: mediatek: Add interconnect provider driver
  arm64: dts: mt8183: add dvfsrc related nodes
  arm64: dts: mt8192: add dvfsrc related nodes
  arm64: dts: mt8183: add dvfsrc regulator nodes
  arm64: dts: mt8192: add dvfsrc regulator nodes

 .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   |  67 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  13 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  14 +
 drivers/interconnect/Kconfig                       |   1 +
 drivers/interconnect/Makefile                      |   1 +
 drivers/interconnect/mediatek/Kconfig              |  13 +
 drivers/interconnect/mediatek/Makefile             |   3 +
 drivers/interconnect/mediatek/mtk-emi.c            | 331 +++++++++++++
 drivers/soc/mediatek/Kconfig                       |  11 +
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mtk-dvfsrc.c                  | 535 +++++++++++++++++++++
 include/dt-bindings/interconnect/mtk,mt6873-emi.h  |  41 ++
 include/dt-bindings/interconnect/mtk,mt8183-emi.h  |  21 +
 include/linux/soc/mediatek/mtk_dvfsrc.h            |  35 ++
 include/linux/soc/mediatek/mtk_sip_svc.h           |   4 +
 15 files changed, 1091 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
 create mode 100644 drivers/interconnect/mediatek/Kconfig
 create mode 100644 drivers/interconnect/mediatek/Makefile
 create mode 100644 drivers/interconnect/mediatek/mtk-emi.c
 create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
 create mode 100644 include/dt-bindings/interconnect/mtk,mt6873-emi.h
 create mode 100644 include/dt-bindings/interconnect/mtk,mt8183-emi.h
 create mode 100644 include/linux/soc/mediatek/mtk_dvfsrc.h

-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
