Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD92C624C6
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HR5w4wu2d/AdbodPVdlLXgyYzkKXoBfBxxBtTecxISQ=; b=2y073VkwJ8bM5wqSWjGz6mZ682
	THhqF5AcPzQND+K/D41khJNzoDCYxGxrj+G4y2trEAf5p6R31SKk9RIutV2nglipVJiG/Ep13EByv
	OvqjfLUwxd7q9YuI/ctXGA6QcdirDZg71S61vZsWtAPi7fqtixUFP4T8GOuPekI5JtkbU1YZz+gY+
	sLlOqN1EIdFRjHsHF9q35CLWzwozQnnZMbjWu7IZ/Ur9czBY0aDvZaLj1KJkY2C44hWW9i2xOcK4V
	Cci2iHzPgfR0fQ0Slx1DLofC2iIc6JpasKXlaFjs0wtv+Zf4tU+OlYqfyMZSX53lwCbxX8UfAVTcY
	9qZq28RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19r7-0000000AYh1-2Y2m;
	Mon, 31 Aug 2026 21:47:53 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19r2-0000000AYeD-2yiK
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 21:47:49 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-39faa67fab8so31648311fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 14:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788212867; x=1788817667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HR5w4wu2d/AdbodPVdlLXgyYzkKXoBfBxxBtTecxISQ=;
        b=gTXC9Rg2ualcIMUFmLFNnflQufjPsqXHr39+VHMMx2XpgLDMSQh2MZBfvUXAhDcskK
         inIJ9X8ZSirAO1EE0QVzeVs4B1860/MXqYZYAbh2tpb4lIngrqBlTa4zQda7pitrrL6T
         AM7ChNDZbpGrUFoj4kMcbfhNV5K+dH2EkSwlBf/ilIB0jc9d3yYks2KUt3gQjQJrYr86
         0Jvkwoj5l6P78No1X+1K0X5cOejMmXasNyFm7eemP4ZPQ6UGcXBCL7puHRLrwHWo01l9
         V1ZcuEdCgmOZ4v+mSt3JMoLUc2JOpRt9GlegJCQMQWhs9tETKHw2nafeI2ajWMfAlMKV
         k6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788212867; x=1788817667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HR5w4wu2d/AdbodPVdlLXgyYzkKXoBfBxxBtTecxISQ=;
        b=QcZbhgRBQ/OSoZdZ0P+cNWNwl6yxnizXFtjJC6YddGaK+UYVKkb/y1SJ88a5OdShpi
         HneD8ulC9Kv8KRh9VVn6Bp++iVg3O9qvZ4mgaIEphPssfiGdsRPETaogjqqU6Mqjo6KL
         n1eZ1yeIdZXdJIVlvO2Jr9weXlunOWL8ZGK2rx7Qz9/8/GSm9LbTq1AvACq2xYJdZzHD
         EZ0e4vyKrfo1PcGzOk0/Mie3gtgX0X3FEJ/n4Wxza0qTsVuPSoOATGg9ua7BrQr4X8Hs
         HxIOmsuVXkUeRyuxbANrif2aqCmNygj0YmFIbOU/Zg47iEsducm7HCR0INCP30/F3Ju5
         vB/g==
X-Forwarded-Encrypted: i=1; AKwUvBzuKnzaz9dhOFykqppC80xUqlbDznh3xIuWKHSdchjwlEf8s2K1DJaquJfCG39DCvwV/PawSwfpJW7ueCwFrA==@lists.infradead.org
X-Gm-Message-State: AFuF++ki65+KkosxB2X+RwqD6x09ivXQ/3mI9/oUOst4cOiC6prn4e1j
	4tHlhIPKs3JNmyDfAlqiLXaTqxIC2uCbDCl+Z5B0iohtlvyIkQkobbFdO471Suxzvw==
X-Gm-Gg: AYBFou34xQ96KO5LRSb8u0blrjsbLFw7rG8bJBmHYFUfApLJXtr9wvVCk6M9hAQtYFS
	ZqIQ7zwkKJeYQpkxVCtSyZ3cPnADj9QLTHZrRTg3v3xTKJsS2Np+Uz/0sCRzL6X0qCfMslj4/SW
	Gi70PbXN/xFAmZUnUNttBhrhYBsK69N9niOLu8dhe2PsciufN+qtOpQ672uu8RfPwcZ6zVjSEXk
	JzSaHrZIHj8a7SWh0yc2kVshfKQUELgNVpTisqxduNX34w2Pg8/879TBeoyV11rqgHMv+sjjTrE
	fxO7nycpS/98wojKpggx+EFPGnXKeMFXr++rPWH5DZJXjpD5WIjcpBdORXQYRt8xTxzmTdK9mPf
	UJNLF6My4pgRwoao+Ip76dfnfv52q9nwWsReQdlvdm2Zd1CRStlPN7JLWPlEWhXQslMgsOtIT5I
	vqhMsXLQpL4NuZVZjx9CLlH/j4+RzCm+xXoZg2UUzS0S4LgvxZAw==
X-Received: by 2002:a05:651c:30c9:b0:3a1:ab57:ea2c with SMTP id 38308e7fff4ca-3a33948c4e0mr10050771fa.2.1788212866759;
        Mon, 31 Aug 2026 14:47:46 -0700 (PDT)
Received: from fedora ([92.36.9.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm18299201fa.9.2026.08.31.14.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:47:46 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v2 3/3] net: airoha: grow the small RX rings
Date: Tue,  1 Sep 2026 00:47:01 +0100
Message-ID: <20260831234701.206021-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831234701.206021-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
 <20260831234701.206021-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_144748_861297_99F41976 
X-CRM114-Status: GOOD (  11.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Raise the RX_DSCP_NUM() fallback from 16 to 32, the vendor SDK default,
and give ring 4 the 128 descriptors already used for rings 2/11/15.

Ring 4 is the shared "force to CPU" ring that airoha_fe_vip_setup()
routes BOOTP, PPPoE Discovery, PPP LCP/IPCP/CHAP/PAP/IPv6CP, ISAKMP,
DHCPv6, SIP and LLDP onto, so it sees the same bursty non-hashed traffic
as the rings already on 128 while sitting on the smallest allowance.

At 16 descriptors the completion stall handled by the previous patch is
readily reachable: on a Nokia XG-040G-MF the recovery fires roughly every
35 s under repeated PPPoE dial-up, and negotiation never completes. At
128 it did not trigger once across 500 forced PPPoE reconnects over 20 h.

Ring 4 and the VIP classification feeding it are shared driver-wide, with
no DT or hardware property distinguishing one variant's ring 4 from
another's, so this is not scoped to a particular SoC.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index c195dad5ed58..0b7c90940272 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -41,9 +41,10 @@
 #define TX_DSCP_NUM			1024
 #define RX_DSCP_NUM(_n)			\
 	((_n) ==  2 ? 128 :		\
+	 (_n) ==  4 ? 128 :		\
 	 (_n) == 11 ? 128 :		\
 	 (_n) == 15 ? 128 :		\
-	 (_n) ==  0 ? 1024 : 16)
+	 (_n) ==  0 ? 1024 : 32)
 
 #define PSE_RSV_PAGES			128
 #define PSE_QUEUE_RSV_PAGES		64
-- 
2.55.0


