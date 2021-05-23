Return-Path: <SRS0=uBnB=KS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BE8C47080
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 May 2021 14:48:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B5260E0B
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 May 2021 14:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B5260E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2XdGhLRK2SSEdaWY01Nf6WObQkC40HKHOo7YqlUaT7E=; b=Isnm9JefI9CTWEmJtX4g2Ctu1A
	6YvOJC8mz7Tdi75/3B/W+XbeqMYz/VP6VfspmDWoJrkqiTcscz+f9ul54enEBgRnbBKE0rp+Dj4vG
	zNTcXDRC+0tOvQZwQgzleSsdtiGiwpZxVmYIvJlLKLfZ4BtHByCKO/VuLfYXS1hXfqE3Nx3CICbDX
	va89fsQD5YH2+RbubN3L1LYPB9juXwB3oxGIrQZ8vhudXvdrL0mm42oIlgCpalxUhtOiJq09wlq1f
	Fie6HN/8LgHoGo5ZN16kr1ELzzDAOp/aSzGvy0t7NTAQu5oxtDKVl8QvzZRA5mYz4f5pqPFcgiuhs
	Q4dXNJ3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkpP8-004W5Z-NL; Sun, 23 May 2021 14:48:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkpOw-004W56-02; Sun, 23 May 2021 14:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=GZwfWA295f4RDy0ynim7ZMzb4wqY1p6Zq0kG2VoTpAE=; b=rEbg0qh4FUwV3LdbfDcPeOW0g9
 RiLHYzoHlXRW4H2V8P1M52L2MEkmfUG1qJCuLvW3fFItpj7gzQ48huoNC/j/ZXrkEBOtuYD4BaAfX
 os2oM+fI/wXHnwLLS4i2/jaXjDNOP+6u49Ih6RKHZ+O0wDx9jRHzHPPia1EeJUh+V2VKLqEX2ysTX
 FMzJH5vyXoByHVarogF+jH1c781pJq0YlmTMDUFFOmnFxTL/wjN1f+7uRK4PHGTlM2ngaqi2LeEgh
 xFjrHInGPOUkBhUT2B8M6Of/DqJqe8jm+hoXPQazcWgRFrA6NfEYagWiIHn3caBuHaaR6T7ZUbuZe
 ClTt1utg==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkpOt-000TCc-3N; Sun, 23 May 2021 14:48:20 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 29so7084753pgu.11;
 Sun, 23 May 2021 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZwfWA295f4RDy0ynim7ZMzb4wqY1p6Zq0kG2VoTpAE=;
 b=c5hXx0ag+I0Eo1OJnDvaIBjDcGZJaN182tT260aS51zpQPAMbhzfQo7qyqEcPrNEnz
 eY/HfKglB2mty/ApboIWW4ll9QPziWY0hWaBTqzsgnOij3lek2DJrXYzZfNt1N2wGXjI
 ktqwZuFT8HDHKBkx6NOe7JlLsvmMPSzXoB9Ib75BkSlCTnCS4zlG0lHmdEtqg4piH0QH
 /bRuXJbyjcov6p6hJhusqFCmC01E+njhjv+DggceHdaH9uhAsI/kXd5JSnR+Qm6O+2tK
 RIfvfVVRXIT+prQctxvHub6Wp3uO99PQWjzyNl7YhAmFiphu9kgS/ItxLR0I41j5MlRj
 4tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZwfWA295f4RDy0ynim7ZMzb4wqY1p6Zq0kG2VoTpAE=;
 b=tXEQYCEfHXs1wmyi2w01sqJ0Qk5BSFeQXU0ARMyjJm4XFOGHkEhC4UoV18pI//QT2E
 9dOpfKiPhcDLEAspREVX/bNvIh19EraVAZHLPbVmv4EnYIhnEgj2VbHGbkc+yTSSUZ6X
 YFDYyTBQS9oIEUuNRGMo/bJvWHdaVav4PxybEO/2na10IYHFeorRehMerO4LYkRrfGoc
 uMipyHgdSWvbER8hCw8bNoA1Lhu0lUz3Tc1ad4C+ECQBx4/qbX0sNPWYPwe0hJVHeeW8
 yPYipr0GDgnqHqpg/0oJ3QdeISG1w1MlvYAdwlVrE0PW90/5uG0IMuwDvkf7mK1rP9NS
 VubQ==
X-Gm-Message-State: AOAM531TJjS+Di5Ow5JIJA/ZTPOlRwexFpgdcF+6j377CMrqFZKjvI87
 ma2lSydeC2l360TeWHt1nek=
X-Google-Smtp-Source: ABdhPJxF8YEU2dKbvt0JNgX6XHdlIGKAdfT+F6rHY98QI/DUtNusVcifD3jweNS2zhBHr+m7NE98JA==
X-Received: by 2002:a63:db17:: with SMTP id e23mr8933915pgg.274.1621781297422; 
 Sun, 23 May 2021 07:48:17 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id c7sm9341162pga.4.2021.05.23.07.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 07:48:16 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH net] net: dsa: mt7530: fix VLAN traffic leaks
Date: Sun, 23 May 2021 22:48:09 +0800
Message-Id: <20210523144809.655056-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_074819_176253_A646F28B 
X-CRM114-Status: GOOD (  12.65  )
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

PCR_MATRIX field was set to all 1's when VLAN filtering is enabled, but
was not reset when it is disabled, which may cause traffic leaks:

	ip link add br0 type bridge vlan_filtering 1
	ip link add br1 type bridge vlan_filtering 1
	ip link set swp0 master br0
	ip link set swp1 master br1
	ip link add set type bridge vlan_filtering 0
	ip link add set type bridge vlan_filtering 0
	# traffic in br0 and br1 will start leaking to each other

As port_bridge_{add,del} have set up PCR_MATRIX properly, remove the
PCR_MATRIX write from mt7530_port_set_vlan_aware.

Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index db838343fb05..93136f7e69f5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1273,14 +1273,6 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	/* The real fabric path would be decided on the membership in the
-	 * entry of VLAN table. PCR_MATRIX set up here with ALL_MEMBERS
-	 * means potential VLAN can be consisting of certain subset of all
-	 * ports.
-	 */
-	mt7530_rmw(priv, MT7530_PCR_P(port),
-		   PCR_MATRIX_MASK, PCR_MATRIX(MT7530_ALL_MEMBERS));
-
 	/* Trapped into security mode allows packet forwarding through VLAN
 	 * table lookup. CPU port is set to fallback mode to let untagged
 	 * frames pass through.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
