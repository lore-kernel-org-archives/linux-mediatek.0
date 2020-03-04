Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB67EC3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C440120836
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q2bc3vPM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GsivpPa1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C440120836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8TEAJkC5r5a1vvPMsmtdo5Df6sna8nGVpOymXV8wufs=; b=q2bc3vPMsTXuEM
	0xuY2cVQTxqVzlZrGuRpV09B6nZjAQqalj1yC7gHPXo151KcEZASnXQXXEuIWqoT3yARz9LXI2FpT
	qXZg/Zsv41W5EtdaacUY2GhoUfU7gsIUjzXkqurBkkVUyaf5q2F6DUvdTiSeZgqhxunIF12YpBnGn
	4mffPgxVZwfhWVm2iyhtvsDGyKzpcr/2ISYkMqO1hFN0WRSnCIjHEHux+JJZjG0eqoa3vPu/83rvq
	P8LOE1pcVvJbLfgKawguX7b1e5HZtZpd6zfLYmC9tZSb4ScqBMcB7l+Ba0b0uBH7AjBH3SaPhmOZC
	yP3XkMD9bp+QyllyJUBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9Kbb-0005oj-03; Wed, 04 Mar 2020 03:21:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9KbX-0005ne-J6
 for linux-mediatek@lists.infradead.org; Wed, 04 Mar 2020 03:21:53 +0000
X-UUID: 198860dab26b40eab9497fd1406936d2-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ms2wWqOqtGBB8GyMpY5bqE7MNpxudDVwWEf/7/Mb/Dg=; 
 b=GsivpPa1gd+n9L+zvhxhuDHEZPzzY6VfrVZF4NlkkEpgwzJeCa3vmR7qD6KeaMtxWV9RseYD9f/0vyb8ZDH1+nLLf2IxqEMxn9urKSb1s3uuW5011XVpoZNkOEuj/I/1M17DbJmicgd42X7yw3s6y23CxHZF0g2yc/tGa50KRRY=;
X-UUID: 198860dab26b40eab9497fd1406936d2-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1190993730; Tue, 03 Mar 2020 19:21:47 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 19:13:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 11:09:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Mar 2020 11:09:47 +0800
From: <light.hsieh@mediatek.com>
To: <ulf.hansson@linaro.org>
Subject: [RESEND PATCH v1 0/3] set ro attribute of block device according to
 write-protection status
Date: Wed, 4 Mar 2020 11:12:14 +0800
Message-ID: <1583291537-15053-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 258F618788D8BD34AD63C33AFEEC9AB93F696BD063FC16ED2CD906E508FB6E5F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_192151_783350_D708DE23 
X-CRM114-Status: UNSURE (   6.49  )
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
Cc: axboe@kernel.dk, kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 Light Hsieh <light.hsieh@mediatek.com>, linux-block@vger.kernel.org,
 linux-mediatek@lists.infradead.org, stanley.chu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

  set ro attribute of block device according to write-protection status

Light Hsieh (3):
  mmc: record wp_grp_size and boot_wp_status
  mmc: check write-protection status during BLKROSET ioctl
  block: set partition read/write policy according to write-protection
    status

 block/ioctl.c             |   2 +-
 block/partition-generic.c |  10 +++
 drivers/mmc/core/block.c  | 217 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mmc/core/mmc.c    |  16 ++++
 include/linux/blkdev.h    |   1 +
 include/linux/mmc/card.h  |   3 +
 include/linux/mmc/mmc.h   |   2 +
 7 files changed, 250 insertions(+), 1 deletion(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
