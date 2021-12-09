Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2129C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPL3a5XBsB23EVoQnMrVoiqx5ptvEAzTfEqRV87dPyQ=; b=vMLg0VH48BcIDa
	EjVzhGcxyuSyxfCO74Aw8IQj12qiReeiFZubDvuapi1i/Zf0Hbm9JtqtBPXS2UYkaNre+EsM8XHZA
	gmtS7x9nkjkmV7AVMq1W5Evc3/F8LKxpdBSgoRNo9d62tbcrkVS4xVJaVJCLsw4zicGlvmpv1e30t
	8OdHVlyddx0fz01hEakMsqdAuDCTjoyRTjMJTudSwgIOu2k2oqNJTpgVquKjTcCPuJltk5IXlBzCS
	HqaCtAID+tUu6G5wDGa0+/oH20e8jSN/unLTl2SyoEVPBVKrkJgtdxz6UsXfBTl7/qPdvuWG/jN78
	VH/M+3b2IlVFqKrCpYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJDN-00G1Dc-U7; Thu, 09 Dec 2021 13:12:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJD2-00G158-SK; Thu, 09 Dec 2021 13:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JPYkcsWO2bOIeCroDzA3GxjUHPWnW9Ax2oHoZ3I6X/Y=; b=YrKrfrURtsDXcwy0aG1jH7g85h
 6yEDXuXAxpKjpe9VHasELJkX0r4D0F477owcBD887EIOseIel1m8DJrKXJztUBvuqpMcRypSmwmZU
 KXA8R5yiNuuAJGvSjilndbvCpPg2nw8etHZiz/kc/yDmVmP3GPGRQhgaM90WDTJlWqBWmV7t/UctU
 95sogfFp9dkv1WSvapL8tMn+g6CNAW1KseEYcNcKjLMzgrqe3+bc8aVYuz04nCCIC1Z6h2J0/6DiU
 rAqozPIyhPOFVjAvovK+BCbxdwaRmYUprzIcTgvNJyoaLTYZtRjc7lFzTlcP48fFSMO9PVRf1MjUw
 sdLUJQwg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45528 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mvJCv-0008Sh-C8; Thu, 09 Dec 2021 13:11:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mvJCu-00F93r-UO; Thu, 09 Dec 2021 13:11:32 +0000
In-Reply-To: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
References: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: [PATCH net-next 1/5] net: phylink: add legacy_pre_march2020 indicator
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mvJCu-00F93r-UO@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Dec 2021 13:11:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_051140_941999_BBE9EC3D 
X-CRM114-Status: GOOD (  13.47  )
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

Add a boolean to phylink_config to indicate whether a driver has not
been updated for the changes in commit 7cceb599d15d ("net: phylink:
avoid mac_config calls"), and thus are reliant on the old behaviour.

We were currently keying the phylink behaviour on the presence of a
PCS, but this is sub-optimal for modern drivers that may not have a
PCS.

This commit merely introduces the new flag, but does not add any use,
since we need all legacy drivers to set this flag before it can be
used. Once these legacy drivers have been updated, we can remove this
flag.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Resent with the correct cover-letter message-ID.

 include/linux/phylink.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 01224235df0f..d005b8e36048 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -84,6 +84,8 @@ enum phylink_op_type {
  * struct phylink_config - PHYLINK configuration structure
  * @dev: a pointer to a struct device associated with the MAC
  * @type: operation type of PHYLINK instance
+ * @legacy_pre_march2020: driver has not been updated for March 2020 updates
+ *	(See commit 7cceb599d15d ("net: phylink: avoid mac_config calls")
  * @pcs_poll: MAC PCS cannot provide link change interrupt
  * @poll_fixed_state: if true, starts link_poll,
  *		      if MAC link is at %MLO_AN_FIXED mode.
@@ -97,6 +99,7 @@ enum phylink_op_type {
 struct phylink_config {
 	struct device *dev;
 	enum phylink_op_type type;
+	bool legacy_pre_march2020;
 	bool pcs_poll;
 	bool poll_fixed_state;
 	bool ovr_an_inband;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
