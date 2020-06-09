Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069C3C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 10:25:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC38B207ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 10:25:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gJYt4bhG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G6XwXEti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC38B207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mE0Aw5tQJY5yXtiU4GEjnfR6nSZ9Dmy0zvb8XOG0yvI=; b=gJYt4bhG13amtI
	knAO+eNnS067Js8/M4HWB/g+JasBxvJbUHJhorU3cYSvUq+1udgG9L/I6DTTe0wmq06QB0yRemS2b
	PJLA+0eLw5KY7LA69IdaH6DU8JFSfmE60KBrgyj1mhkZK8wyip20WYeYdTProL/ANgM3LiFgt/Ibx
	w+nw7tBREO3ooXi+sF/FzcgjRmZAMkVvL1wvrb4Os/h4/xOZrm3Aa2Gv/0K9cjN4iCPo32wpFnM6F
	e3NdqK8CgIoPfcpHU0Dm5hV3IufnvES5MdNyQ34AdNvg5dL0R/FBRevkmJdl+9GNa08oOB3AaMuc0
	2p7X/AvHLFsicgDn1zAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jibRV-0003jd-Oy; Tue, 09 Jun 2020 10:25:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jibQz-0003Fu-9C; Tue, 09 Jun 2020 10:24:47 +0000
X-UUID: 387c5cc9e8c74d1a830209fa914628d2-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=27GaRRMJgI8jXomyewf9EjW3IGOTuWZHXBF43R7U3x8=; 
 b=G6XwXEti9LgKFhiMGH4u4AWjtlbSdrPhFOpaBWZjexEoz1S1qZonWg9E02aEW17gUUIIjRcsWNJLlbbTraFQx0kfrNc9JtJ/wTpnX9s7j5+HLeYz7zAnR+Qw5/KsCZob+2TAUxwlEkU2Usikm0K9gER5ccN3oBPEGMCrpJP/glc=;
X-UUID: 387c5cc9e8c74d1a830209fa914628d2-20200609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1253366072; Tue, 09 Jun 2020 02:24:45 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 03:24:38 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 18:24:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 9 Jun 2020 18:24:30 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Add MediaTek MT6873 devapc driver
Date: Tue, 9 Jun 2020 18:24:19 +0800
Message-ID: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_032445_331686_3958C260 
X-CRM114-Status: UNSURE (   7.22  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These patch series introduce a MediaTek MT6873 devapc driver.

MT6873 bus frabric provides TrustZone security support and data
protection to prevent slaves from being accessed by unexpected
masters.
The security violations are logged and sent to the processor for
further analysis or countermeasures.

Any occurrence of security violation would raise an interrupt, and
it will be handled by devapc-mt6873 driver. The violation
information is printed in order to find the murderer.

*** BLURB HERE ***

Neal Liu (2):
  dt-bindings: devapc: add bindings for devapc-mt6873
  soc: mediatek: devapc: add devapc-mt6873 driver

 .../soc/mediatek/devapc/devapc-mt6873.yaml    |   61 +
 drivers/soc/mediatek/Kconfig                  |    6 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/devapc/Kconfig           |   25 +
 drivers/soc/mediatek/devapc/Makefile          |   13 +
 drivers/soc/mediatek/devapc/devapc-mt6873.c   | 1733 +++++++++++++++++
 drivers/soc/mediatek/devapc/devapc-mt6873.h   |  130 ++
 .../soc/mediatek/devapc/devapc-mtk-multi-ao.c | 1019 ++++++++++
 .../soc/mediatek/devapc/devapc-mtk-multi-ao.h |  183 ++
 include/linux/soc/mediatek/devapc_public.h    |   41 +
 10 files changed, 3212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml
 create mode 100644 drivers/soc/mediatek/devapc/Kconfig
 create mode 100644 drivers/soc/mediatek/devapc/Makefile
 create mode 100644 drivers/soc/mediatek/devapc/devapc-mt6873.c
 create mode 100644 drivers/soc/mediatek/devapc/devapc-mt6873.h
 create mode 100644 drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.c
 create mode 100644 drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.h
 create mode 100644 include/linux/soc/mediatek/devapc_public.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
