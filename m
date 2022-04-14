Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13DCC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lX2XZ1wI8gr/dR3BFwPAgPlTc8V8MBgtJc3t9xMvWtU=; b=RkZxMhXJqf6ttC
	8esOaOTVASs5tQcbBx89okpUi2WZ3yYXjNOf53v/8R3G6qfKhHdi4F+vWN9oSGX80nt53qlolKepH
	h0ZQqVRqZ+AjZePi79u7jqUY3WLjyUCGit5Stzk5iG2E4pNcPwNT8ghA8cvPHshKldAd6xcBVekou
	kp3KvjNEfcVMOjThmpPA8EKf0vlr77FPpaq5k88zSzEB/Ao0SuEh5NZ4dE99Ix5rBIM7sAY9T8wLN
	7VSmAhqHIeZD6/vc07mk9LlSJmRx0DHkadE1TejbTqfLRLht7G7npyTv6QqiKuwHYT1GkDUUZOMPD
	/FpIPFNMXr1wHoQduXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1netJb-004BxK-GT; Thu, 14 Apr 2022 06:50:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1netJ9-004BjZ-Br
 for linux-mediatek@lists.infradead.org; Thu, 14 Apr 2022 06:50:24 +0000
X-UUID: 141e392cbf064073aa775be579b3d1aa-20220413
X-UUID: 141e392cbf064073aa775be579b3d1aa-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1366187251; Wed, 13 Apr 2022 23:50:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 23:48:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 14 Apr 2022 14:48:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 14:48:21 +0800
Message-ID: <b6e1b4b7b5f894cf77a60768e445218805fbb681.camel@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8195 SCP firmware
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <rongchang@google.com>,
 <yunfei.dong@mediatek.com>, <shawnku@google.com>, <stevecho@google.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Thu, 14 Apr 2022 14:48:21 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_235023_431643_793B69DD 
X-CRM114-Status: UNSURE (   6.57  )
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

Hi,

Add new SCP firmware for MediaTek MT8195.
Thank you!


Regards,
TingHan

---
The following changes since commit 8a2d811764e7fcc9e2862549f91487770b70563b:

  rtl_bt: Add firmware and config files for RTL8852C (2022-04-13 07:10:23 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp v14454.8.0

for you to fetch changes up to 10612bd12e4778069aff50caad9431002f92e374:

  mediatek: Add mt8195 SCP firmware (2022-04-14 14:03:33 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Add mt8195 SCP firmware

 WHENCE                  |   2 ++
 mediatek/mt8195/scp.img | Bin 0 -> 429668 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 mediatek/mt8195/scp.img


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
