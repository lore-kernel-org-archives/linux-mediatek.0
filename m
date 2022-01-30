Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE6EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQlZAegk//yZqAbCDKyLUyqRP3wBXo6eJPmDiM5e8+U=; b=UrV0AEMSm0TdYf
	0AiaKXC+4aPfuiB+1yQoTzYz8RAdW45LjIiFiMxVc6b0hoCNzVjUOPUssnYV/D0S8gViMgU6SsyMN
	lXlbOLUkHGfxhGuwIopeSh6T8mUp9l6V5x8fDaZsthHmPTqeukQJ+kqcRfXzK+6pu5HI2HE9LKk8M
	52vtpGkv7yBYCmqfbn6b5IudfJ1Bsv6EzvLcBkD0mpB6M4MJcSdbAmj1ySn2r4ZlALsQvF8XKUkQ5
	Zch2d0Qjp37GOIJ015oQd1WYEkX/TU5KgNOXk7gvsHf/WH2CTyZ3wuLdYCdY35OEykTHdMrZ5Xin0
	XIs1Q6lSnzNXlVa8iDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBaA-006k2g-Hx; Sun, 30 Jan 2022 14:53:34 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBYE-006j1t-Ne; Sun, 30 Jan 2022 14:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Vumq25WNP3Df0zlSA9vs0wGYkSiJD1gefdGJvPtB7I=; b=br3frG6Mce++quRfNbb4TTsSn1
 UOm2Ob/3U53NV36dMUOCBwE4Ux3LvWjVKIVC7xwfTd40wXy3IWjDt6KKyQ7uTR2l8aWfm24wFAuNc
 KemFDUqswL8rXMpzoFPK/nKTGyltFagwccpCH0z73APiyj+MDB/USjG8a3/yCbG1IQpk=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de
 ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nEBY7-0002if-J6; Sun, 30 Jan 2022 15:51:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Russell King <linux@armlinux.org.uk>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/13] ARM: multi_v7_defconfig: Add support for Airoha
 EN7523 SoC
Date: Sun, 30 Jan 2022 15:51:07 +0100
Message-Id: <20220130145116.88406-5-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065134_986531_0890B172 
X-CRM114-Status: UNSURE (   8.07  )
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

From: John Crispin <john@phrozen.org>

This enables basic bootup support for the Airoha EN7523 SoC.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 1c2c3e9f0e05..3b413635f5bd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -34,6 +34,7 @@ CONFIG_MACH_BERLIN_BG2=y
 CONFIG_MACH_BERLIN_BG2CD=y
 CONFIG_MACH_BERLIN_BG2Q=y
 CONFIG_ARCH_DIGICOLOR=y
+CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_HIGHBANK=y
 CONFIG_ARCH_HISI=y
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
