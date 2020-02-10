Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F12C352A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 06:37:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BBB120661
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 06:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlFzPov1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gUSGqIUw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BBB120661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlaPU9BKvbMI0T7J0S0JpmXAvyzVPrVPWlLDsh8z7DE=; b=RlFzPov1HVvg0o
	2qIdsiFv818uRoD3q+jneqRp9ErMHcc0fuJBYnWVv4zHqdk4s1RdGBW2fF1u0qxkX1RSalsjV5LUb
	bgIOH56orvOW4fGvHURSbOiDhoj0bCqikgCewcO+fHnrVrFCRy/L/Z6vDoD5eYbtiPhr0jKY2UcGU
	Y7Pd3XQ+0QVaYuWEgK/CgS4lur95DUA7cRElZuK/9byWg+yqxffHbtOUQ1r0px7rCVXjepeoU8AYw
	uadWehmPJ+eFHh46fm60qkVlKPsfPjO2IWCjR6N62dlZUiHfL/Ei7qyLjdjNmkpxTt9ZSpSfNmSPi
	yG3EQO2bj+xESwO+2Few==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j12h9-00026S-OZ; Mon, 10 Feb 2020 06:37:23 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j12gN-0001If-Rs
 for linux-mediatek@lists.infradead.org; Mon, 10 Feb 2020 06:36:39 +0000
Received: by mail-pl1-x641.google.com with SMTP id ay11so2432364plb.0
 for <linux-mediatek@lists.infradead.org>; Sun, 09 Feb 2020 22:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U4T1sUZ5d5/lE7jdAROdnSabgnZhFUdcqE+KF1UFLYs=;
 b=gUSGqIUwzyoakxw3TkxBU5Ql7F+G+0GnrYl+v4e4+nJTwIC+CnFaeoDOvD5toFci+W
 7eFCHr2zwz9WiHq/IMGHoATS1LQ4FE5zhdc301dfx/vlTkZ/20ULmJnWcdNdj/trPMAg
 QH0wTrs8BbzERklKZUiY9UAF9H4mF3x6x2EY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U4T1sUZ5d5/lE7jdAROdnSabgnZhFUdcqE+KF1UFLYs=;
 b=n3kuE+FNvs8GJLJ5/KOWSEYeq/mtSC0Au6oaHxwm42//+AcOe6toLgbkwPiFRG9E6S
 A275alAEmQhv4RsaI1pHHnCsBNJvz27eSgLCyTKyQlIs3b07TnjlPOXo/q7jx1Z6GIDG
 I/Aylpy3aT4amm/n8R1Dwm5uOyHKSyHugiv/Ln+cGUA4F2OoN754sBkLbX0ZBcL0W0VI
 +y9GWWAQbI+K20Qo0FFZAVBvFV6pLhZHs2o36d+Nt/qHTMkXQmIRdXRSx1wRE2CbKKct
 M+mRrus5MqaApHpzObNB2htdK/aodHUMMdbXZ/ZqS8NcjW01ScdzRZVvtch7FCjfGsSy
 7olQ==
X-Gm-Message-State: APjAAAVGuxiBP32LoEdatIl1yZ8bq253BzpeaypgDCzt68dDCCo+iJ2M
 8HUj3SOHYMsY46CEk4kB4Z1fNQ==
X-Google-Smtp-Source: APXvYqyXUem1drftBReu+mmxe6pn4dX7A8nVAJDHrAsQ3zKM8+P+ZWpWg9JrY64PTKd9Jf7tGph2BA==
X-Received: by 2002:a17:90a:bf81:: with SMTP id
 d1mr18701198pjs.21.1581316595020; 
 Sun, 09 Feb 2020 22:36:35 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id f15sm11070041pgj.30.2020.02.09.22.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 22:36:34 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 5/5] media: mtk-mdp: Use correct aliases name
Date: Mon, 10 Feb 2020 14:35:24 +0800
Message-Id: <20200210063523.133333-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200210063523.133333-1-hsinyi@chromium.org>
References: <20200210063523.133333-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_223635_962646_65695456 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

aliases property name must include only lowercase and '-'. Fix in dts
and driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 9afe8161a8c0..0c4788af78dd 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -15,10 +15,10 @@
 
 
 static const char * const mtk_mdp_comp_stem[MTK_MDP_COMP_TYPE_MAX] = {
-	"mdp_rdma",
-	"mdp_rsz",
-	"mdp_wdma",
-	"mdp_wrot",
+	"mdp-rdma",
+	"mdp-rsz",
+	"mdp-wdma",
+	"mdp-wrot",
 };
 
 struct mtk_mdp_comp_match {
-- 
2.25.0.225.g125e21ebc7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
