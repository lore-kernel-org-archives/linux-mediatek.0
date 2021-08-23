Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B48C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 04:44:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A24AD61356
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 04:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A24AD61356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fPrPigVJZNJK5sbXQ1fI9ixj32wUvo0brEK24lDFPYc=; b=RiPF5ruLhrkiiz
	+kJTjxfJffL6Qwh+lRyY4pkVpW4OWh6alV0Ga0qxJV67sjxWvHo8NlAurXlOxR2aPcViN7Lr1QdjQ
	cq+CLbqlav1n4c+D7xNjE7NZEwjt0LfivcGJUeSNZ+c5DLF3GONolv8VsRVXb6J5sS7NadAS01m1n
	p45AcC3JIk0DgX31/ghmMbh2GGhZ2bvPoCnv1Rs3scDS9wNTsmjPOA5423F1gUKvW9osYjofPqkQq
	dQxAPMnll46B2nRawdArDGnx50SpLa0rQQDmetnpuaUAa0VYv/YpEJGmXjnKrA+5X9JpgM2otfhL4
	HyN9c0j3tjGjz3WZWvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI1pF-00FP6P-7c; Mon, 23 Aug 2021 04:44:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI1p3-00FP5R-0P; Mon, 23 Aug 2021 04:44:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id m17so2364390plc.6;
 Sun, 22 Aug 2021 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kimq81Qxw6v1wSE08WSZPq384v+/RN3JYeCnUsxOALc=;
 b=n9O7CBENvG8TkCdxP+Kgz3Z/GrSpRczECUWQSwHTNsKstuYhnDx1KEkKeNBwg2IuK4
 ja068jQ3P84VgEpBCpbHkzy9CjLY3kve5vNfc2y15qiDBJqvE7L5+/5EKlWNLqhaiDzi
 tXBxLxBxVpM82U3uFHzR9tn8V7WIgLRLGPQGFlt/W9P+yFFM0EJY7LncIcxqoYb7xHQ5
 y1urzhvo52PKFpZ3fJFVRxPu5sieRxMOuuM5sgsk/eWPlRW8OJTg1GF9qS4B7YL8NAUQ
 ru55WbOXIcrDw7DBcztcGmOjzDoGYyHTFgYRHqj2uqBxI82Lsw+uvZjt+t3BvcpXoFcY
 ql1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kimq81Qxw6v1wSE08WSZPq384v+/RN3JYeCnUsxOALc=;
 b=aYe1MRU8N53AIT+yjOaQQH6sdsPBCFjMufJh+/iczrw6+jkd3IkW+2+gHPYYVoTIqO
 7TZhGliwbEnQySuan38u2uuPazylDBpPjddCDiYrQpRKdKTGVLgdK3Dkm3KBuaN9xfsC
 0A5jQW3rY85XrJgSMey9JQTpcz9DLxatvk8hVD/z3bkbVNFbxLkgu3kWc51J6BNozUml
 U3AZxeVxLcUgkVIV6mXYU2QNTe/TmzOp0kdFB/WfJPQ3xqMEKmMYkbyweEdvIZW7sSQo
 /H+NHMheU0fomc1/4NrSNrBb9n4LnFNwjM7IAHNZ6q1F2eYif/pkIGADTwkNx3xod8oq
 gOZg==
X-Gm-Message-State: AOAM533UIz+UcRl+TLwBqvy2T4EjnhfbZLV9g39qr9z/v/AFMtpwJm8I
 FV6Py/bcmmsrlTErDUeVedk=
X-Google-Smtp-Source: ABdhPJziW7qgZ0SgjWRqZtRHKEW7G9Nvqi47fjiME67bnyVWX4uyYzl67PW8+omECJu+4iPsDRQnVw==
X-Received: by 2002:a17:90a:4894:: with SMTP id
 b20mr18369064pjh.13.1629693870752; 
 Sun, 22 Aug 2021 21:44:30 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id t5sm14351856pfd.133.2021.08.22.21.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 21:44:30 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org (open list:ETHERNET PHY LIBRARY),
 linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net] net: phy: mediatek: add the missing suspend/resume
 callbacks
Date: Mon, 23 Aug 2021 12:44:21 +0800
Message-Id: <20210823044422.164184-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_214433_138021_89D50044 
X-CRM114-Status: UNSURE (   9.05  )
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

Without suspend/resume callbacks, the PHY cannot be powered down/up
administratively.

Fixes: e40d2cca0189 ("net: phy: add MediaTek Gigabit Ethernet PHY driver")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/phy/mediatek-ge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/mediatek-ge.c b/drivers/net/phy/mediatek-ge.c
index 11ff335d6228..b7a5ae20edd5 100644
--- a/drivers/net/phy/mediatek-ge.c
+++ b/drivers/net/phy/mediatek-ge.c
@@ -81,6 +81,8 @@ static struct phy_driver mtk_gephy_driver[] = {
 		 */
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.suspend	= genphy_suspend,
+		.resume		= genphy_resume,
 		.read_page	= mtk_gephy_read_page,
 		.write_page	= mtk_gephy_write_page,
 	},
@@ -93,6 +95,8 @@ static struct phy_driver mtk_gephy_driver[] = {
 		 */
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.suspend	= genphy_suspend,
+		.resume		= genphy_resume,
 		.read_page	= mtk_gephy_read_page,
 		.write_page	= mtk_gephy_write_page,
 	},
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
