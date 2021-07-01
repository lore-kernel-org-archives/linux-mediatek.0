Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5E9C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:41:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24B806144F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24B806144F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T02MKmeux0n68QOnhtjxPs8lB4+sxEhh2CMhrjEgtMo=; b=qe/FEtGmczsRbQ
	F2kufmbGcw0+6piYhZ9I0leLyXpC2uw31Qugcz9b3PT1+57ykB89zuZRVEQHLKxEF9WBDFVZ7t7GB
	k9H+b4OqqfgmzD30XQcmnXc9BbPiFCCRYdhHfkfluzHuID8dBJNteICj/vR47O63wkrk3fdP2kfzc
	3NeKWSBMi8WlwdqAtEmUoP81alB1zoqJRv8ZSHLbVy39ZqjunD/oE6Pad+RJpFpDOtfFx61dn/n2l
	lVjvv81lvbi6Wdv+8XcnkBVWwR13kHb0xeS9SbyUg2hoB6XKL3B3uCJ95fPHOVOnjiZXeG3lRYgcK
	ZAM0oJtP1vN/asn184eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lytBq-00GmsO-Pp; Thu, 01 Jul 2021 09:40:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lytBT-00GmkW-4t; Thu, 01 Jul 2021 09:40:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id EA4F71F43DDA
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 Bilal Wasim <Bilal.Wasim@imgtec.com>, linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 2/3] soc: mediatek: pm-domains: Add domain_supply cap
 for mfg_async PD
Date: Thu,  1 Jul 2021 11:40:23 +0200
Message-Id: <20210701114012.RESEND.2.I2e1bf1b589f9138ba6f89791ed9f1e9f3ddd0a5d@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210701094024.1273759-1-enric.balletbo@collabora.com>
References: <20210701094024.1273759-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_024035_388801_DCA5374A 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Bilal Wasim <Bilal.Wasim@imgtec.com>

The mfg_async power domain in mt8173 is used to power up imgtec
gpu. This domain requires the da9211 regulator to be enabled before
the power domain can be enabled successfully.

Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mt8173-pm-domains.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
index 654c717e5467..714fa92575df 100644
--- a/drivers/soc/mediatek/mt8173-pm-domains.h
+++ b/drivers/soc/mediatek/mt8173-pm-domains.h
@@ -71,6 +71,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = 0,
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8173_POWER_DOMAIN_MFG_2D] = {
 		.name = "mfg_2d",
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
