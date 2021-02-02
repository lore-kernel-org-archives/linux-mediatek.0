Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB01AC433E9
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 10:35:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3006E64F5C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 10:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3006E64F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pneP9obrf2YWQoxCGcqJuN7lQYTmJICdamRrX1Ug+HQ=; b=rN/rjbR1rbEafnqgp/ekfXwcok
	mV5VfBU4DNGOVG1YppmHCJtXXOHyEFKTWYN/rUh4ElDV4vShAoXi1GWcUlXYykeHcfmiaeU2O2q2/
	Entj52SdPdYZFBNX3yKH2hdwFiPlR0SB+Ke0wnthesReWVKh6oUEPXn8yXcU4WH0iCHqLhdIQtq17
	UUbqGg4yOoK6lg6MOb4GxxewpppgzJ/W8z65akpTQhC5DbdJBSkI3xn8TKm5QeR/byg08QPpinzYB
	DlTPtOk0NKUOaHdyAe1T/EFBYRWRwFDNruzR++FXG3/apouiOlZHhTMgElvAFe+6LBcVwO1lcMdgI
	XYCBSvtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t1S-0007ye-NG; Tue, 02 Feb 2021 10:35:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t1P-0007xD-8v
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 10:35:00 +0000
X-UUID: c4cdf7c298fe40fbab69109073b0b3e8-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BSeHR1LTPXqgTutGQTYYXOtldQPH/B/FJZKm3VkDcZg=; 
 b=f4lAZX2H+eE0RuKvh6ieQLUMjqNtJgHkiG/PVcMX4CC9BlK3yNxlMn6ZtxVLo/TSgmrQWzFCFwHXUuQVnDy/7TzUNbBP+qbMeRY14cC6tMYpovlTuA9mhMbfeFmUnQI/QeOKgWMfz2GkC9N5hBD4vz9LzytqhCcD5jdxbAcvumc=;
X-UUID: c4cdf7c298fe40fbab69109073b0b3e8-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 785278667; Tue, 02 Feb 2021 02:26:39 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 02:26:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 18:26:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 2 Feb 2021 18:26:22 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <Sean.Wang@mediatek.com>
Subject: [PATCH v4 0/2] Bluetooth: btusb: Add protocol for MediaTek bluetooth
 devices
Date: Tue, 2 Feb 2021 18:26:16 +0800
Message-ID: <20210202102618.27640-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053459_452800_3DC45BA1 
X-CRM114-Status: UNSURE (   7.15  )
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
Cc: robin.chiu@mediatek.com, "mark-yw.chen" <mark-yw.chen@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Eric.liang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

v4:
1. add read chip info. from MediaTek bluetooth devices.
2. support download firmware for MT7921U.

mark-yw.chen (2):
  Bluetooth: btusb: Fine-tune mt7663 mechanism.
  Bluetooth: btusb: Add protocol support for MediaTek MT7921U USB
    devices

 drivers/bluetooth/btusb.c | 211 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 206 insertions(+), 5 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
