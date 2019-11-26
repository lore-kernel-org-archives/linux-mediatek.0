Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE65C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 05:38:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1FA8206BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 05:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sXZZReEa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mj2lbBLv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1FA8206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtyUFjnLeo8dccUTZ6ApP+iRwzvy16Ogusuo0/b0098=; b=sXZZReEa1UJgBO
	2ssCyu4mSpbdwWinrWJ6CFB9kL1EJczbCRzrz6cRwSp/5biYQnFR9hvPQLUmI+rlgDA417+Hv6bnU
	YYG5ae7UzTLzFHJwOMdo4bB3r0kqrHCLkg97jyWyqkY97ft4RmFYYJQRSjgMMpX0eKh8p3SllfOMW
	wfJE8B50tWYPGRKOaEZyVf3nOjmam4uJoSGHy/VFvsECVQktBw1hJXa2jo2HHVyz8gOfax5QBnDy5
	CH4LBg56atUalLGb+xhPY0w3JFrZkNsbXq4GE9cWXHEyukDvcP8yvnuMOT6IadYPCSSEX1DLb4Xsh
	/c7g1YHQOoVuASUmcZZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZTYI-0005G2-Ga; Tue, 26 Nov 2019 05:38:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZTXD-000479-37; Tue, 26 Nov 2019 05:37:12 +0000
X-UUID: f3fb41bb820c4b7bb566ac84705eda90-20191125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PTHlyvPT7+DKctsDgzzDOzGrtWUVdvF9uAmdUpUUCzI=; 
 b=mj2lbBLvkictvFSSj+JAgzHcQAc4bXK2h+Ln6vu27+lO41QJPsV5dmm+cnyQd0MGxR5vvilDM1cbmzvlhVQQSk5Mfs40q71MwdvBPexx59/WypM7JnpUQ3y+9Ug/4Bz3bWa2a6X/DHAAp3hZ7ZPe1+qor5um8q2b7nAun44O/Co=;
X-UUID: f3fb41bb820c4b7bb566ac84705eda90-20191125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 416290031; Mon, 25 Nov 2019 21:36:48 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 25 Nov 2019 21:35:03 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 13:34:42 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 26 Nov 2019 13:34:35 +0800
From: <freddy.hsin@mediatek.com>
To: <sre@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
 <linux@roeck-us.net>, <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 4/4] dt-binding: power: reset: Add documentation for MTK
 RGU (Reset Gernation Unit) reboot driver
Date: Tue, 26 Nov 2019 13:34:50 +0800
Message-ID: <1574746490-625-5-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574746490-625-1-git-send-email-freddy.hsin@mediatek.com>
References: <1574746490-625-1-git-send-email-freddy.hsin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_213711_168111_580036A3 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: Freddy Hsin <freddy.hsin@mediatek.com>, Chang-An.Chen@mediatek.com,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Freddy Hsin <freddy.hsin@mediatek.com>

Add documentation for MTK RGU (Reset Generation Unit) reboot driver.

Signed-off-by: Freddy Hsin <freddy.hsin@mediatek.com>
---
 .../devicetree/bindings/power/reset/mtk-reboot.txt |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/mtk-reboot.txt

diff --git a/Documentation/devicetree/bindings/power/reset/mtk-reboot.txt b/Documentation/devicetree/bindings/power/reset/mtk-reboot.txt
new file mode 100644
index 0000000..708d351
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/mtk-reboot.txt
@@ -0,0 +1,30 @@
+Generic MTK RGU mapped register reset driver
+
+This is a reset driver using toprgu to map its non-volatile register.
+The reset is generally performed with a write to the non-volatile register
+defined by the register map pointed by toprgu reference plus the offset
+with the mask defined in the reboot-mode node.
+
+Required properties:
+- compatible: should contain "toprgu-reboot-mode"
+- regmap: this is phandle to the register map node
+- offset: offset in the register map for the reboot-mode register (in bytes)
+- mask: the reset value written to the reboot register (32 bit access)
+
+Examples:
+	reboot-mode {
+	   compatible = "toprgu-reboot-mode";
+	   regmap = <&toprgu>;
+	   offset = <0x24>;
+	   mask = <0xF>;
+	};
+
+Optional properties - reboot mode value that will keep in toprgu nonrst RG:
+- mode-charger = <BOOT_CHARGER>;
+- mode-recovery = <BOOT_RECOVERY>;
+- mode-bootloader = <BOOT_BOOTLOADER>;
+- mode-dm-verity-dev-corrupt = <BOOT_DM_VERITY>;
+- mode-kpoc = <BOOT_KPOC>;
+- mode-ddr-reserve = <BOOT_DDR_RSVD>;
+- mode-meta = <BOOT_META>;
+- mode-rpmbpk = <BOOT_RPMBPK>;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
