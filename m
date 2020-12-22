Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69177C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 07:29:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D862D23124
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 07:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D862D23124
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BpyPVf1BRmpVOMX5xIhyDMg/k7RsBUXhasHM9Kl9nuQ=; b=Yk/9cPTiMbYNLqIPa1xV8fYkT8
	fHGkViA+oT/ZWQyDBCUcfrBPX0V23JgiRA/rhITFQ5utRK/vjes+866x844duf4Jn9y1g27DBPBZb
	MYlLtqn2qDRe4Y+OipKID4sZ9gMl4lA60iBl/e1a7kSQdmzZrNoJ6xiFZCm/LwPK8HFeeY2RUqOsU
	acRok9hC+6WvEgmqppo5BMuvtun+3A7PZaJQUULWL4MI49ZN72s/2HQDz5sQpyyR3DOJ/zssSgigq
	N/ivv4vHHKgzq2uaNcqSt6N+qy12FaNRIPYW8yQgyl3iHUKG6prMn2UZYGnC0YzP58IDl/PVrMdBG
	f7TxUSHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krc6m-00027l-2N; Tue, 22 Dec 2020 07:29:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krc6i-00026L-Gy; Tue, 22 Dec 2020 07:29:21 +0000
X-UUID: d20e41c81cb34a158972c19e22773ea9-20201221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FEzixC19aVmciJHLT8MAZsygjwqgIqCBXjfmci2CM+k=; 
 b=g4FGudLpg0zazTJ1OKbyee1KTJMR2jL66gmopjU9jO224Sql8f8Fnqd1D6D/BrKtqgJL1COI3NDZesY1xJpmg42j2klrHL+PxG5rHVuyYrvoqqeVZazFjdtm6yi/vu3ICAMUPlgQNX0E9d2iW2UnWV4Vg6b5itm59WpZTlbiHPg=;
X-UUID: d20e41c81cb34a158972c19e22773ea9-20201221
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2009876807; Mon, 21 Dec 2020 23:29:10 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 23:29:08 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 15:29:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 15:29:05 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 0/2] scsi: ufs: Fix power drain and hci quirk for
 WriteBooster
Date: Tue, 22 Dec 2020 15:29:03 +0800
Message-ID: <20201222072905.32221-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_022920_773848_9900BB3A 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
This series fixes two WriteBooster issues,
1. Fix a corner case that device flush capability is not disabled during system suspend
2. Fix the checking of UFSHCI quirk UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL

Stanley Chu (2):
  scsi: ufs: Fix possible power drain during system suspend
  scsi: ufs: Relax the condition of
    UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL

 drivers/scsi/ufs/ufshcd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
