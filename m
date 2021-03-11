Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E22C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 09:25:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B005364FB0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 09:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B005364FB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=STfL5DXL6TUBSe04w8txw3f2CmG744KKNRedhthuoxw=; b=A+X5BwoICjWYrUYC6dXdHRXy6n
	Gx7i0h8Q2Mz5d5tyU8hETy0UQ91f0HsFE7bhsM16uAQ+xKpjWyiYcjN28VYzPeglz151zOgtQ/saO
	u+y5nQqsc21DeBLMq716KGQx2AOcqL3elZ3HrTrEjO/QinZLqiy1RreXg0XfKon+llQ5gxSGPdskC
	lO9yyL22xdV9LAAQMXDldOaWK3LlmGgIynNT7BmvKAktfCWiewSxSP1RG9JoWeG6Q8mvTsfshk7rC
	JGKq04g1Ht6qHzxhVoZN6XwlDCYFGHcExJstEcZANLoYNmD1V+ab0FX/ZPi0o7z6cBoy97iTAimCN
	tmjlePpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKHZf-008kn9-QA; Thu, 11 Mar 2021 09:25:43 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKHZV-008kma-AD; Thu, 11 Mar 2021 09:25:35 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lKHZR-0002Ad-Ob; Thu, 11 Mar 2021 09:25:29 +0000
From: Colin King <colin.king@canonical.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] usb: mtu3: Fix spelling mistake "disabed" -> "disabled"
Date: Thu, 11 Mar 2021 09:25:29 +0000
Message-Id: <20210311092529.4898-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_092533_416291_678573C0 
X-CRM114-Status: GOOD (  11.15  )
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

From: Colin Ian King <colin.king@canonical.com>

The variable u3_ports_disabed contains a spelling mistake,
rename it to u3_ports_disabled.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/mtu3/mtu3_host.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index c871b94f3e6f..41a5675ac5ca 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -109,7 +109,7 @@ int ssusb_host_enable(struct ssusb_mtk *ssusb)
 	void __iomem *ibase = ssusb->ippc_base;
 	int num_u3p = ssusb->u3_ports;
 	int num_u2p = ssusb->u2_ports;
-	int u3_ports_disabed;
+	int u3_ports_disabled;
 	u32 check_clk;
 	u32 value;
 	int i;
@@ -118,10 +118,10 @@ int ssusb_host_enable(struct ssusb_mtk *ssusb)
 	mtu3_clrbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
 
 	/* power on and enable u3 ports except skipped ones */
-	u3_ports_disabed = 0;
+	u3_ports_disabled = 0;
 	for (i = 0; i < num_u3p; i++) {
 		if ((0x1 << i) & ssusb->u3p_dis_msk) {
-			u3_ports_disabed++;
+			u3_ports_disabled++;
 			continue;
 		}
 
@@ -140,7 +140,7 @@ int ssusb_host_enable(struct ssusb_mtk *ssusb)
 	}
 
 	check_clk = SSUSB_XHCI_RST_B_STS;
-	if (num_u3p > u3_ports_disabed)
+	if (num_u3p > u3_ports_disabled)
 		check_clk = SSUSB_U3_MAC_RST_B_STS;
 
 	return ssusb_check_clocks(ssusb, check_clk);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
