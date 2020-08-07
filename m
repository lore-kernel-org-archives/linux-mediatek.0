Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D3BC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 02:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60442177B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 02:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0htEGr0L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PwNN2kYn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GF4dRF6y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60442177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zgF1u3EKsIMIN9GvpS82Ojb8Ap5R/1w512TqXiZ0xww=; b=0htEGr0Lsk762PQdzYopCYXZD6
	8ZVrmHBkx5k5AgwBd5p8Rkv4uKfEubEVhhBNvr+GvVpp5ULPBAz9uS63NAG1HIs63z+02R2NJ3iHj
	JU473FtNeymUEiFwnZNUOajb47QaKWhuwJmRqD2RcGyPT0AUWyI+jfze4bOQ3Mafitqfjlz1t3z9q
	SgCU0f/JSLdTh5Oy8dIzSFAYftvad499DPi/Nsd8PoXkffeda89BYGr1Jp3Yuh5j+OM7VJLp8prSw
	q97P24ctOiWF9HpPn85BBNQ6pjL6QpbvHfWElQj5e2r0RJH02pa4N9nw7+fWvwE1Cad1OA5kqy5dB
	FCRDEgjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3sDA-0000bD-5h; Fri, 07 Aug 2020 02:34:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3sD3-0000ZF-EF; Fri, 07 Aug 2020 02:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=BJiDnyuYO7RUiy76gfERJoEHx1JqO2dDx+agAtDeSyY=; b=PwNN2kYnua3oUSTS37zvxcF333
 lucW8Ljnpz2mc0uZBY+CLZqkCiySdijc8zLHUhrEdPmAO6mSnpsYfSCHaCqP+WM9sR5hSSc0DchcT
 /YgGrAGHZEok4ePDek050t0Vk/L5FNjRx+9xz+CHhETSovQPTUf+UJcCFwtOKhE+YhMbteBqTLfoJ
 gBzdM7U0ZUhD2Yqq6+xTBVPj5oNxwtIWiWQp1HVIawgwTlDB0c4tQhSXmFspLZrGqrfQfgzZM4OiI
 nVgXfe1YIBQ1gdn9Q5u2U8HCeaFXJY1Lvma03uPZZ+lHX4dHD113ZaCjqqPL5f+BRuPwI63oFZ5ox
 d6isJQAg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3sCz-0006bS-J3; Fri, 07 Aug 2020 02:34:16 +0000
X-UUID: 4f14ac5a6a1b49599d61edcbde8cd545-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BJiDnyuYO7RUiy76gfERJoEHx1JqO2dDx+agAtDeSyY=; 
 b=GF4dRF6yVi1cxkbAQomtcVYHbSFjy5RiLIdpGz6GpFI2ZvQOBM5Xq2Z5wxsbcKnm1zPJDiUHnx4gwWO6m79WAB271Uj4pIH1gWZePbR68LjzjJKv4vdm4WH84DQG+3mZ2T6t5b49IDbNDct62vitC8ICn3HFxQf6D1iZZF9t4Ms=;
X-UUID: 4f14ac5a6a1b49599d61edcbde8cd545-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1487365780; Thu, 06 Aug 2020 18:32:33 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 19:22:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 10:22:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Aug 2020 10:22:29 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5] Add MediaTek MT6779 devapc driver
Date: Fri, 7 Aug 2020 10:22:26 +0800
Message-ID: <1596766948-29767-1-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_033414_223384_FC954FDD 
X-CRM114-Status: GOOD (  14.99  )
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

MediaTek bus fabric provides TrustZone security support and data protection to prevent slaves from being accessed by unexpected masters.
The security violation is logged and sent to the processor for further analysis or countermeasures.

Any occurrence of security violation would raise an interrupt, and it will be handled by mtk-devapc driver.
The violation information is printed in order to find the murderer.

changes since v4:
- refactor data structure.
- merge two simple functions into one.
- refactor register setting to prevent too many function call overhead.

changes since v3:
- revise violation handling flow to make it more easily to understand
  hardware behavior.
- add more comments to understand how hardware works.

changes since v2:
- pass platform info through DT data.
- remove unnecessary function.
- remove slave_type because it always equals to 1 in current support SoC.
- use vio_idx_num instread of list all devices' index.
- add more comments to describe hardware behavior.

changes since v1:
- move SoC specific part to DT data.
- remove unnecessary boundary check.
- remove unnecessary data type declaration.
- use read_poll_timeout() instread of for loop polling.
- revise coding style elegantly.


*** BLURB HERE ***

Neal Liu (2):
  dt-bindings: devapc: add bindings for mtk-devapc
  soc: mediatek: add mt6779 devapc driver

 .../bindings/soc/mediatek/devapc.yaml         |  58 ++++
 drivers/soc/mediatek/Kconfig                  |   9 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-devapc.c             | 315 ++++++++++++++++++
 4 files changed, 383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
