Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E00DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThvzVdW4rnomWFmVAOCT/g/F78XG21LkZlNBvd7jn9o=; b=sxmSuPEJWgNXHI
	VlJ+QaWyCsjW7CoO09sDF9QX7Uwtzrm6FnecNClf37nJFSUVGl5qNnIZgufftKMn9dK1TR0LF4qrW
	PX4EF933mLBwNo5o3in3MBTtxkbKNiNktHfgXZ/HyjyOcQRZy/1i0I7a2C5LfQyai2pulm2wEOEDf
	/LKfcVqfo2zehChHvlCp8BG5ll3Tgj1fI6kL7Q1mLvW7vlRDVf/qrLRY1yd7MfDcMBXNoQ5VimCtL
	ecUMP66XpdlbMxSNitAKn5obmPBpw7JZu53bErqT96Rlwp0g1EPzfOS2P0DkHo9ooZY9tWO7PAGaW
	W0Ik/uuV/DzF7fAuWDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWEoz-007FUi-5m; Mon, 21 Mar 2022 09:59:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWEne-007EgR-Q0; Mon, 21 Mar 2022 09:58:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10FD4106F;
 Mon, 21 Mar 2022 02:58:06 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.22.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 351C33F766;
 Mon, 21 Mar 2022 02:58:03 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org
Cc: lukasz.luba@arm.com, dietmar.eggemann@arm.com, Pierre.Gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: [RESEND][PATCH 6/8] Documentation: EM: Add artificial EM registration
 description
Date: Mon, 21 Mar 2022 09:57:27 +0000
Message-Id: <20220321095729.20655-7-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220321095729.20655-1-lukasz.luba@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_025806_912897_3A522EF0 
X-CRM114-Status: UNSURE (   9.75  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add description about new artificial EM registration and use cases.
Update also the documentation with the new .get_cost() callback
description and usage.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 Documentation/power/energy-model.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
index fd29ed2506c0..feb257b7f350 100644
--- a/Documentation/power/energy-model.rst
+++ b/Documentation/power/energy-model.rst
@@ -123,6 +123,26 @@ allows a platform to register EM power values which are reflecting total power
 (static + dynamic). These power values might be coming directly from
 experiments and measurements.
 
+Registration of 'artificial' EM
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+There is an option to provide a custom callback for drivers missing detailed
+knowledge about power value for each performance state. The callback
+.get_cost() is optional and provides the 'cost' values used by the EAS.
+This is useful for platforms that only provide information on relative
+efficiency between CPU types, where one could use the information to
+create an abstract power model. But even an abstract power model can
+sometimes be hard to fit in, given the input power value size restrictions.
+The .get_cost() allows to provide the 'cost' values which reflect the
+efficiency of the CPUs. This would allow to provide EAS information which
+has different relation than what would be forced by the EM internal
+formulas calculating 'cost' values. To register an EM for such platform, the
+driver must set the flag 'milliwatts' to 0, provide .get_power() callback
+and provide .get_cost() callback. The EM framework would handle such platform
+properly during registration. A flag EM_PERF_DOMAIN_ARTIFICIAL is set for such
+platform. Special care should be taken by other frameworks which are using EM
+to test and treat this flag properly.
+
 Registration of 'simple' EM
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
