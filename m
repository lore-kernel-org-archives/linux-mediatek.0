Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD009C55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 06:30:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29AE72222E
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 06:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCP+iSa1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NcoBGDbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29AE72222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7+KEdMzng3WF7uHvfQMocE519QE3WGcQUAjsvdotBxc=; b=RCP+iSa17kxl8X7/xdWOd/cBLK
	barjz0Nrw6adTWbO1UsiNs1MV4KTJwbDo2VaW3mOqY/2PxrYa6obU4OoILD2WGqorqz5PTaB093wY
	f3EVW7WHVE5Q+2RNbLNS3vyyVa6KT+VmnUdaJaYywq9ig8ERJjmjKPl0EH7Ncd/3fxN6CizHj0Krf
	L/DeCQi1U9oMI5Oqdo1zk60NysGwYj05eK3W3eNz4mjE/hYBeEizF8kYjYwuyIM4Mt1Txm2K/I5Go
	QT743EahL9KCGqB0p5xjI+kfTG4tO5NlAgnNZzefDDVr85cWfwg7kIWcgU6r6x3iv1zigize7ywq+
	Q8TW7PqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keY2J-0003jm-Vp; Mon, 16 Nov 2020 06:30:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keY2D-0003ii-Ev; Mon, 16 Nov 2020 06:30:43 +0000
X-UUID: a3f459618bcd4b49af7fb7e82d96fe6e-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WH+wNr9i2pr99uvD6jOfjdZcYgjBnZegxOdperk8f+E=; 
 b=NcoBGDbmJctkfzbpvoQVlnvox4fZC/zv/fylA8mpWTSnvDngfuSoMwFphI1yFPApvuv5j+wbncW7QnNQ4LUZenZXKf+OORh1FwyAFUqNQciBHY0k0JoynxYew5rXlbHfFxtpHw01VBiRRs6xr7TS8YS8t8/3tEIs00gX4fJ1e0A=;
X-UUID: a3f459618bcd4b49af7fb7e82d96fe6e-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 886513844; Sun, 15 Nov 2020 22:30:24 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:30:22 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:29:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:29:31 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/1] Fix object remain in offline per-cpu quarantine
Date: Mon, 16 Nov 2020 14:29:27 +0800
Message-ID: <1605508168-7418-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 75B8CD20D38641DB5CDC7A8379557EE33EB44A40F207B979FD7759BFA4468E852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_013042_288817_C2674762 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: miles.chen@mediatek.com, wsd_upstream@mediatek.com,
 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, nicholas.tang@mediatek.com,
 linux-mediatek@lists.infradead.org, guangye.yang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch fixes object remain in the offline per-cpu quarantine as
describe below.

Free objects will get into per-cpu quarantine if enable generic KASAN.
If a cpu is offline and users use kmem_cache_destroy, kernel will detect
objects still remain in the offline per-cpu quarantine and report error.

Register a cpu hotplug function to remove all objects in the offline
per-cpu quarantine when cpu is going offline. Set a per-cpu variable
to indicate this cpu is offline.

Changes since v2:
 - Thanks for Dmitry suggestion
 - Remove unnecessary code
 - Put offline variable into cpu_quarantine
 - Use single qlist_free_all call instead of iteration over all slabs
 - Add bug reporter in commit message

Kuan-Ying Lee (1):
  kasan: fix object remain in offline per-cpu quarantine

 mm/kasan/quarantine.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
