Return-Path: <SRS0=y3Z3=3Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF551C2D0B1
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2020 09:15:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 914142084E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2020 09:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2zYoV3e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZbUNAVMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 914142084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YRnEmYX8DBjNkB5FrjlHwTbUgOjSgNpHrynHgHf/9sA=; b=d2zYoV3eitbN/C
	U2ZvJdNjWFmXsv3qRK+QgqFSxnyoWbSaYEHY08PsHs9Jzl0dcPUwvl3ZPf5Ngi2EJ0UhSIghfaZtc
	zr+UOdyr8qjKEUXBm9wJLIz1XeU1zybNWGJe8MvNc5YPyM6NTFVQjDn0jM+W5py0Qclc63Zohuj+5
	6BsVNwF3shDJ/FQ3EtNCSHMCIDV23JQ1mVvV2FxDgmDmg5YvOkb3Mh5vNAlOSEiQHPnBvA5BPJrYf
	0PPbw7mqumEX0ErUQiQqmT0J2c8G58znGdrCii7gKLk3yC9FfUBoDp65m//+Yb7WF2/do+sZwUYTB
	IbNIZRHEyNDnv7nQQZOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyuIy-0005n1-Gx; Tue, 04 Feb 2020 09:15:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyuIw-0005mY-8A
 for linux-mediatek@lists.infradead.org; Tue, 04 Feb 2020 09:15:35 +0000
X-UUID: 1a0f12b207764e95bbc1daeca1c04adc-20200204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fQaXdeVDrEL7G0OipbsvUZ4eyfT2E7gO3ttXrpO3g5M=; 
 b=ZbUNAVMKpShRXgd1DB04GDSBN0perqckMQS3VOq2yExytRJZxTMrfmoxjufegpQxUiinUdLV0AW4f2xt3BlQhvPiRZiF7omV0rUfiKwSCPme7F2eDXhSAiG3tXSsTJgtPB//GezGt8+niPCD9TV2vax9dE01+crllpu1udejkhk=;
X-UUID: 1a0f12b207764e95bbc1daeca1c04adc-20200204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 771297515; Tue, 04 Feb 2020 01:15:20 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Feb 2020 01:15:17 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Feb 2020 17:14:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 4 Feb 2020 17:12:46 +0800
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos
 <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Joel Fernandes
 <joel@joelfernandes.org>, Christian Brauner <christian@brauner.io>
Subject: [PATCH v1] binder: transaction latency tracking for user build
Date: Tue, 4 Feb 2020 17:15:14 +0800
Message-ID: <1580807715-26609-1-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 888C6AE8C31F60CE5AC86D6652174CD78C707B853BA9C90257CA6842ED7EF1AE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_011534_296298_71C390AF 
X-CRM114-Status: UNSURE (   5.33  )
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
Cc: Jian-Min.Liu@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Record start/end timestamp to binder transaction.
When transaction is completed or transaction is free,
it would be checked if transaction latency over threshold (2 sec),
if yes, printing related information for tracing.


Frankie Chang (1):
  binder: transaction latency tracking for user build

 drivers/android/Kconfig           |    8 +++
 drivers/android/binder.c          |  107 +++++++++++++++++++++++++++++++++++++
 drivers/android/binder_internal.h |    4 ++
 3 files changed, 119 insertions(+)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
