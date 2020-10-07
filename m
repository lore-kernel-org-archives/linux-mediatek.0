Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC58C4363D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 02:44:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC6720789
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 02:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fQLXA7QI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eBGwrty7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AC6720789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lj1S9D3GaLUx6+Vz+0C1jnltNR2oXNIIn0JQztX6gMA=; b=fQLXA7QI4CI/aU4ZbE3lgFnF/p
	B1KSj1SgZx72BjJfaKKOxJYpVYpslhkWHWHbBwcos/YEJ11QB2iIedbAGusytb6KblQsFPYZciOVO
	OI8Lr/1m4s6fBn6kf43mQllOZJFZj+XzBKkI1HNbeCBjBUk8gBSDbBWXPaYOUtth2a60WynW3zp8i
	iYcI6/P56GeCsPgRGUUaxDZhFq4OMmvEYaQwO0W/Zy41rECa/Svn/IzDRcnXvUgJoE7S9J1eIWJ61
	IvgytioBGWpM9fMsyB4Cpv2VhRTkkOU7OOZQWIpTw/yYM1TcMCg1J9n5Vh0PjPCqWtx91uJNwivnG
	8sn+/JYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPzQn-0005Yk-5a; Wed, 07 Oct 2020 02:43:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPzQj-0005Xt-Qv; Wed, 07 Oct 2020 02:43:52 +0000
X-UUID: bf9fb7a81d6c4b6ca3af64bd9b237377-20201006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AFPXpclqC/BVWvt1LdPXCMRHLa9WQf2iX9kXqT1ZSNs=; 
 b=eBGwrty71ludhboOCgew7oyCJIcOzGTzYnUfNaGFRPQizsUc/ctOd/odc8h74bUnePBQ/p0Zp0eliuk8qjLRDYd1fPMyit7CW/xo2vXpvBATRj8jWnIpaPfQHN8qAjQey5e9DYJbYJ2/Fj/DUMQQi9Hm+SlyVJOsnBSgvazabnQ=;
X-UUID: bf9fb7a81d6c4b6ca3af64bd9b237377-20201006
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 464012900; Tue, 06 Oct 2020 18:43:39 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Oct 2020 19:43:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Oct 2020 10:43:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Oct 2020 10:43:32 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH] [v2] thermal: core: add upper and lower limits to
 power_actor_set_power
Date: Wed, 7 Oct 2020 10:43:32 +0800
Message-ID: <20201007024332.30322-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_224349_992626_9E4A4377 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The upper and lower limits of thermal throttle state in the
DT do not apply to the Intelligent Power Allocation (IPA) governor.
Add the clamping for cooling device upper and lower limits in the
power_actor_set_power() used by IPA.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
---
 drivers/thermal/thermal_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 72bf159bcecc..a260e4a575f3 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -674,7 +674,7 @@ int power_actor_set_power(struct thermal_cooling_device *cdev,
 	if (ret)
 		return ret;
 
-	instance->target = state;
+	instance->target = clamp_val(state, instance->lower, instance->upper);
 	mutex_lock(&cdev->lock);
 	cdev->updated = false;
 	mutex_unlock(&cdev->lock);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
