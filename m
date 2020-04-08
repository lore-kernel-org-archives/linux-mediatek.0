Return-Path: <SRS0=Kof6=5Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD792C2BA1B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 09:06:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E33D20768
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 09:06:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BEKUEuG8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L/xBeJQE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E33D20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rjwLim0BFm02l6fV+vXDEGJfQe3OuPVkQe20Ug5ZVMs=; b=BEKUEuG8JBRqdN
	QfHOsGglnbEjqtSuuz8sbnNWSdAlpKWXPyl8F3oF115hoavwePp7R/Xt+WBS6kkDHdQQtKh8XgmKh
	iwhxmaGQGMxCj3nkspxPPydf3ox8FxJhBRNIyLkHZR8/c8NdiPfABYaH6NUW3qG3U0hGD0x+DleJO
	HGVr0NizaNDuhPLTgzJyyKHsmrW9n5mEFVjBZe3K4PjA1srvKLMSVMTWQIT1vhvvku6zk1UiBZKBU
	jibQkSse3in/3axREaAE/kQJlfVS7q8gCmAMFL2v0ZMoWPwUt1j0F2IdkT/O8uZp5smcdUk/Tbgqp
	DVQ1VAogkMI8KLqXTv2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jM6es-0002hJ-Uk; Wed, 08 Apr 2020 09:06:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM6eq-0002gm-R8; Wed, 08 Apr 2020 09:06:06 +0000
X-UUID: ced2779995664902bbca202c54dc4e91-20200408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Qh7przKIfX21C6nfkvmRwxpYgUWlMX6+C+g6YzZ+NXs=; 
 b=L/xBeJQEoyMQ/rnJVRWTC47kzrBWTOZ2ENCT7KtODoVgGbrVrLyjROTgPA+MTvombP/60tk9MEgAl8JxT3Lech0vIYKMhBqzpecaFxC24K3iIiVk+/Wm/Lh61XE+zbtAuySs/x/W1vZC7tguSgsrkHCcqriy0b0su2ZSxdc8G1E=;
X-UUID: ced2779995664902bbca202c54dc4e91-20200408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1233847030; Wed, 08 Apr 2020 01:05:49 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 02:05:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 17:05:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Apr 2020 17:05:56 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: <michael.kao@mediatek.com>, Zhang Rui <rui.zhang@intel.com>, "Eduardo
 Valentin" <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [RESEND PATCH 0/1] thermal: mediatek: add suspend/resume callback
Date: Wed, 8 Apr 2020 17:05:57 +0800
Message-ID: <20200408090558.12410-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_020604_881280_25E14B21 
X-CRM114-Status: UNSURE (   7.54  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change items:

1. Fix typo of measurement.
2. Change name of mtk_thermal_get_bank to mtk_thermal_lock_bank.
3. Change name of mtk_thermal_put_bank to mtk_thermal_unlock_bank.

Unchang items:

1. There are mtk_thermal_get_bank and mtk_thermal_put_bank in the
   mtk_thermal_init_bank. So we also add mtk_thermal_get_bank and
   mtk_thermal_put_bank in the mtk_thermal_disable_sensing. Any
   control and settings of sensor in the thermal controller should
   lock and unlock to prevent thermal controller from reporting
   wrong temperature.

2. The mutex lock was changed in this patch.
   [v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL
   (https://patchwork.kernel.org/patch/11452835/)



Louis Yu (1):
  thermal: mediatek: add suspend/resume callback

 drivers/thermal/mtk_thermal.c | 152 ++++++++++++++++++++++++++++++----
 1 file changed, 134 insertions(+), 18 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
