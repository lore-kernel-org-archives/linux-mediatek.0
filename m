Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EFAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 09:13:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940AE206C3
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 09:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Q70/ZWP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="usF3Ok2t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940AE206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cqhSD+y95N2mmfws15M+LmIrO1a+IEZ/g4LksMxaFi0=; b=0Q70/ZWPLIorfTN0E2HA1Ztx1m
	wLqAjc8TBVIGjMo3fIPF1vE+UiFln9C1mv2VazTPgvdIZn5jYJQ5/eInqlCJWYqvrdUWh7GH7dkQZ
	lWkNybSCejoLK4mZOzhutLKtmEqnqqEm6aCw//I7Cab+ZsZNf0DzTvIQ/iapW8F9d45/UpUY9ille
	AUYQIbkz4En6Fy+iKHrfxQ6fuYGki7CSmIeTlztkFZL0flR1DJocpYtLr0elY/d6j+v+acUGVYtPc
	iU8nQXf6MC5JZN3dsX0YLJ6h4/DGdd+jwyorc1Llal8PO+dKC4SFAiWUXk48myIkySdm1wmVYlS9d
	ZTbdvkMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtSbz-0002hr-0q; Thu, 09 Jul 2020 09:12:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtSbT-0002RE-Mv; Thu, 09 Jul 2020 09:12:29 +0000
X-UUID: 6d6e1a3521294eb5a10e472c1ddb0823-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5IFnrClxea+W0uhCfZ9UPEzqQzIug9UzC95zh8SU5JQ=; 
 b=usF3Ok2tHqAwGjKUhhzk1fSPCATIsuT6dCZnfXHFZ/J3BcV/z6LsdGyRZJrawV3u6HojJbICp7/S79IrAq2I5bnlSQyJKpfMKely+Z0h1+6jd5plewC0uIE9INpyHkIB+i+UMLqXePAVZGwjpG91w2sKORJk66DCfqELwcFdaPM=;
X-UUID: 6d6e1a3521294eb5a10e472c1ddb0823-20200709
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 519143183; Thu, 09 Jul 2020 01:12:10 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 02:12:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 17:12:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 9 Jul 2020 17:12:18 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] Add MediaTek MT6779 devapc driver
Date: Thu, 9 Jul 2020 17:12:05 +0800
Message-ID: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_051228_044324_BE4EFB46 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These patch series introduce a MediaTek MT6779 devapc driver.

MediaTek bus fabric provides TrustZone security support and data protection
to prevent slaves from being accessed by unexpected masters.
The security violation is logged and sent to the processor for further
analysis or countermeasures.

Any occurrence of security violation would raise an interrupt, and it will
be handled by mtk-devapc driver.
The violation information is printed in order to find the murderer.

changes since v1:
- move SoC specific part to DT data.
- remove unnecessary boundary check.
- remove unnecessary data type declaration.
- use read_poll_timeout() instread of for loop polling.
- revise coding style elegantly.

*** BLURB HERE ***

Neal Liu (2):
  dt-bindings: devapc: add bindings for mtk-devapc
  soc: mediatek: add mtk-devapc driver

 .../bindings/soc/mediatek/devapc.yaml         |  82 +++
 drivers/soc/mediatek/Kconfig                  |   9 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-devapc.c             | 466 ++++++++++++
 drivers/soc/mediatek/mtk-devapc.h             | 670 ++++++++++++++++++
 5 files changed, 1228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c
 create mode 100644 drivers/soc/mediatek/mtk-devapc.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
