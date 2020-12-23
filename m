Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B66C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:45:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CD22256F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8CD22256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UM21YsvGEa4fvqkhSzG6DtBKn1VtL6gRnA5nfgP5t50=; b=hLne6fFe0cSXinq1VsIWqZjDpz
	WT8nP0xqRRWGn8IeJkVKKbzeFdf4yID2Up1kSQ3ufxf9NZPn+orPxU7nzdxBmTKjPcws33vrX3Flw
	6RgmCvXrp9HMw6L+glkAV03Wlh3maPswZ1k4k+HksKkGITgXTv7Q4ZtzN4gvm/70qJa3ZvFPQSgSg
	VmncRwiti0Js5Bb824N03F7x5NYhyKwfnWlK3Ti9v1F0kCRgLPSs/pt+w/zf1tvd3a5jiCSz1XviQ
	rTwOxvH7fAO7AwmqGa+zRRBN4PrXrjMtb0CbN0sFctQ8OVHGHD48DZT4pJByvKo0HRrfACU1WavSg
	0UR+INOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kru8y-0003ck-7Z; Wed, 23 Dec 2020 02:44:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kru8r-0003Y6-Og; Wed, 23 Dec 2020 02:44:46 +0000
X-UUID: c935f7b2bbca430f914fe1a0f5c2ba03-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=iG8w2mz/wE53nIZjYD0YlwA9e60L0bEifIyxiiYqTvI=; 
 b=qYJZ5ks5iOByWOZZk4/pvxmcmCZ0PWsZ0CS3ySaUJMTgKFHyW1h4oAT6nZ++Q65tnLjdITizSdSmw94WiB5wt6UG5sLnyNIsr/KO0tC/bg4ayyyFWFO+IqSTLdg0z+qGgmjwoZaTV6g25Q0ux6DonTh2eNaq0E+s/eUFeZWwb2Y=;
X-UUID: c935f7b2bbca430f914fe1a0f5c2ba03-20201222
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1136221868; Tue, 22 Dec 2020 18:44:37 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 18:44:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 10:44:35 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 10:44:34 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 0/4] Add SPMI support for Mediatek MT6873/8192 SoC IC
Date: Wed, 23 Dec 2020 10:44:25 +0800
Message-ID: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_214445_952105_EC2D4C4B 
X-CRM114-Status: GOOD (  15.63  )
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for new SoC MT6873/8192 to the spmi driver.
This series is based on Weiyi's patches[1].

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1608642587-15634-7-git-send-email-weiyi.lu@mediatek.com/

changes since v4:
- modify the constraint 'maxItems: 1' to 'minItems: 0'.
- fix the error of the binding document.
- refine the mtk spmi driver for the bettery quality.
- add spmi node into MT8192 dtsi.

Hsin-Hsiung Wang (4):
  dt-bindings: spmi: modify the constraint 'maxItems' to 'minItems'
  dt-bindings: spmi: document binding for the Mediatek SPMI controller
  spmi: mediatek: Add support for MT6873/8192
  arm64: dts: mt8192: add spmi node

 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  74 +++
 .../devicetree/bindings/spmi/spmi.yaml        |   2 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  15 +
 drivers/spmi/Kconfig                          |   9 +
 drivers/spmi/Makefile                         |   1 +
 drivers/spmi/spmi-mtk-pmif.c                  | 504 ++++++++++++++++++
 6 files changed, 604 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
 create mode 100644 drivers/spmi/spmi-mtk-pmif.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
