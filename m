Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ACDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 23:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFDB61151
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 23:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEFDB61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yzz4sfo2wcjd8LBCF1kVSgyHaMYBTOkX2n6NU9+aGok=; b=2aRXwKXpiQcOgW
	Vk/ipC11TE6iSaZOHm7lNsKVARaYOxZpoPd+I1o4ZL1rHmFGo36cpgDfQz/RYwzUdlZxEB4xEePKb
	7srzFnvidLRkBhlW2fcWe3S5maebjs/r80lLG5QT9/vMRDTrf9vmoERvRox4uhLt+k+6D10f3QpKq
	NzBkqzQnL6zlSlbHJ4dZsFUG9mQwSz/W0TD8lK7YSppi2SRh5vQF2JITPVdgqd3EhqORC3+nUtFel
	BG0fHpzy9mYybrHOutgQzCce7yW8EKTHWNgE+m68fuBLHZViX9264qH4gTLJilYQOkbkVhs8F7RtE
	PoKlbWp4dxjPZEfbaq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWTM-0094gi-7O; Fri, 15 Oct 2021 23:18:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbWTA-0094dw-CM; Fri, 15 Oct 2021 23:18:33 +0000
X-UUID: 2eeae2b8790c4b7f852910b087cf18db-20211015
X-UUID: 2eeae2b8790c4b7f852910b087cf18db-20211015
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1021390615; Fri, 15 Oct 2021 16:18:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Oct 2021 16:18:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 16 Oct 2021 07:18:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Oct 2021 07:18:22 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <bvanassche@acm.org>
CC: <jejb@linux.ibm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <martink@posteo.de>, <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <stanley.chu@mediatek.com>, <wsd_upstream@mediatek.com>
Subject: Re: [PATCH] scsi: sd: fix crashes in sd_resume_runtime
Date: Sat, 16 Oct 2021 07:18:05 +0800
Message-ID: <20211015231805.17509-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <14930227-aca0-89a0-25ea-727d263f8bf8@acm.org>
References: <14930227-aca0-89a0-25ea-727d263f8bf8@acm.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_161832_470112_79956730 
X-CRM114-Status: UNSURE (   6.66  )
X-CRM114-Notice: Please train this message.
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

> Thanks for the clarification. Given this clarification I'm fine with your patch.

> Bart.


thanks for your review

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
