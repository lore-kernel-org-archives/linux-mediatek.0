Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C3CC4450A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKHPXevOZIRD7NtOtigxNI7jeedcNPyYjNi8etmOHek=; b=X/KomQGUqwPQ0x3+QCjco8/7Q+
	ygV2/ViwUNlgtMeKP2Yo+vQvhXj8+N0ZuRIbUoPuSEoXV1bU4zorPEzSXHJFgK9kQfspg/7jL4mb6
	PEQ9+19ckcT5sSOhsMO4nKIgE2rcqQjq6pMztWhTtiv/YLADEaaM+dh7GiG62CUyCrtaeynLc7Nsg
	inuMq614JgaJbhcI/075vYNgMAoTRanFMW8ytwxYJcyX700Jr2jFGdZipyUAQ2AtzI+NoD26XErP/
	ITx3pLmyMuFaUSdT8FbR1BtjsJLNZr1wZxtu3Pk1yAIxbmzfV7cP0Co5RBkM6OAXVMP7/8H/pS2gd
	A6iWDa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmNo-000000021pY-1xZt;
	Thu, 09 Jul 2026 10:53:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmNm-000000021jv-27tc;
	Thu, 09 Jul 2026 10:53:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0322043F2C;
	Thu,  9 Jul 2026 10:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB433C2BCF6;
	Thu,  9 Jul 2026 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783594409;
	bh=QOGjg1/RGN8flpFs/dZ2Z3VqQGhz2cw/vr/wk+e5KKU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HqVV3yhkSXk/HVlsmafNx1gc/znDcEQGYrEuInXS9n0c3WQ/lew3827+dp3e4xz9i
	 RlQRusTz5tmpIryNsNt02x9fAk1MpEAb1yM0ij3YiJ086On1MYH77/750YDj1qJBTy
	 saVtjjNAjQ0bWkOUVMHUM9ZiSISZhoQHzKnpRDLhNtdi+zwUogvYW7fplHVOMNLmiV
	 LMPwA3VZvEJ28i1c/MHiyQ64eNVuxdTu01sIS4pMOvRpgsnaj6BfVmvxRzKtKdnWHF
	 iilUUq7NiJgnwcjCCliJhJpcel/klV+OuWG1JcivH3ingezVrsmwvZWT6D+LZwp6oP
	 3Mve9scPeUE5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA335C44506;
	Thu,  9 Jul 2026 10:53:29 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Thu, 09 Jul 2026 18:53:29 +0800
Subject: [PATCH v4 7/7] net: wwan: t9xx: Add maintainers entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-t9xx_driver_v1-v4-7-a8c009d509c5@compal.com>
References: <20260709-t9xx_driver_v1-v4-0-a8c009d509c5@compal.com>
In-Reply-To: <20260709-t9xx_driver_v1-v4-0-a8c009d509c5@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jack Wu <jackbb_wu@compal.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, 
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, 
 Minano Tseng <Minano.tseng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783594407; l=817;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=r28B5Pv3emoSo+1n1DcJ9EobPmHHNOtOYu07ftmyDY8=;
 b=PiBgIiVz9ksnTjvb0CYcJcpobiGD8EdCYsdrvrKB3iyw8F0A4HI43IHVNa3bcV2KbIM2gEv8V
 C2d/d6NkbzNCEajOfj+bffGiqBWS4VOwuHSql5ANfknvjWPlSPnDkLl
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
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
Reply-To: jackbb_wu@compal.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jack Wu <jackbb_wu@compal.com>

Add MAINTAINERS entry for the MediaTek T9XX 5G WWAN modem device
driver.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..8155d26bff03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16494,6 +16494,15 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/wwan/t7xx/
 
+MEDIATEK T9XX 5G WWAN MODEM DRIVER
+M:	Jack Wu <jackbb_wu@compal.com>
+R:	Wen-Zhi Huang <wen-zhi.huang@mediatek.com>
+R:	Shi-Wei Yeh <shi-wei.yeh@mediatek.com>
+R:	Minano Tseng <Minano.tseng@mediatek.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/wwan/t9xx/
+
 MEDIATEK USB3 DRD IP DRIVER
 M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
 L:	linux-usb@vger.kernel.org

-- 
2.34.1



