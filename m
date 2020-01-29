Return-Path: <SRS0=1JTW=3S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2413BC33CB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 06:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5B3206F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 06:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WAx6O9eE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HkrrDZHu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5B3206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIzs/oYeuUgsixKF9MCMMhm6VfAW0HNldDMFT4t6EAo=; b=WAx6O9eE0W/R9J
	wv9GgokzahEBiERLOZ8LhnIr7PIzWhJnBu/bmuxEuttNWpP3+gTJbjGUkJ+BctavMLo7iYRBl/yDp
	nOtTLjnY3mQDNwz9hV0H2neK55k72ZnAq5V3fuxeBtkDRuPcZ/xJ6XkTPD1xMlY1gSA30RiZK9AUI
	HXGmTEZa/cEuPKMEui28b86egE3VaWUJmwehiNkuArWCserZaOdtgffIj1Of12DHXlmK7jjUUXM0w
	7lWqmhiXpvOhsT0uN7JX4cy+iTCiZe4U6IaGyulq7jgUzduk9gui/w3RoI9WXzu7ImYyqk2g8Oww1
	ZtNlvpUGlQw61gXA48dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwgvk-0004nb-P5; Wed, 29 Jan 2020 06:34:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwgvY-0004eB-V8; Wed, 29 Jan 2020 06:34:18 +0000
X-UUID: e2503d2275244a6697466a88eb817e57-20200128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ujk6W1itj+kyGPWCpmoTXw9A47Q4LtnJX0OapEkv6Rs=; 
 b=HkrrDZHup2REa8MtxmosCkPS2cLm6biREC/G85Xxz2ifw/hufxhyJQyE7nO/eyv2UbcbOJrp6r7QWC/kYf3/gCYxNXbcvGX9QAwrgXNf2ZDE+B+nfo73VozsGay5X4rLIqZw3nigefKFzduoYRwFJtYM/gN7PAk9bJffEryUGbs=;
X-UUID: e2503d2275244a6697466a88eb817e57-20200128
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1135705889; Tue, 28 Jan 2020 22:34:11 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 28 Jan 2020 22:34:08 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 14:32:35 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 29 Jan 2020 14:34:03 +0800
Message-ID: <1580279636.15794.0.camel@mtksdccf07>
Subject: RE: [EXT] [PATCH v2 4/5] scsi: ufs: fix auto-hibern8 error detection
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Date: Wed, 29 Jan 2020 14:33:56 +0800
In-Reply-To: <BN7PR08MB56840A622E2170C4F913A5D7DB0A0@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200124150743.15110-1-stanley.chu@mediatek.com>
 <20200124150743.15110-5-stanley.chu@mediatek.com>
 <BN7PR08MB56840A622E2170C4F913A5D7DB0A0@BN7PR08MB5684.namprd08.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_223417_009510_9C193743 
X-CRM114-Status: UNSURE (   7.00  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bean,

On Tue, 2020-01-28 at 15:52 +0000, Bean Huo (beanhuo) wrote:
> Hi, Stanley 
> Do you think it is necessary to add fixes tag, and combine this patch with previous patch to
> single patch?  That will be easier to down port to the older kernel.

OK! I will update this patch according to your suggestions in next
version.

Thanks,
Stanley

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
