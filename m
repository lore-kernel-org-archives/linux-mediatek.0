Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D161606A329
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OZvblfHM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMq0r6i4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=; b=OZvblfHM3cKCo6/JwvHFHcX9ge
	WWXQO9ro57aZj2DNmA9b87TpZERinDXX4R6mdLGvaqZbFWgqKEtkpthflcK0etctJSBste1n9Z8BI
	cVbNtmiX+9s2dsoTZy03k8Oh0x//upTeCguT1ZRfqgQr0hYGw80eZXFcLJaN0jBBmJq05WeRJgo3R
	D40RYkT4O22+6uC2X0UVjAeYUeyNRKj3+jm/yNyFa+yVVByrC1B78MeNisU6rCcOpdAdGXYAUDmdF
	HK1iOjXJJnSrA7VXjSFcfZ/X1ZsP+05UfWekHVlxWl4zTQmwLYVt+K/L7SXfmKZEF9sozJslD/RYC
	WDd11ghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOc6N-00000005evj-3dbD;
	Wed, 04 Nov 2026 14:36:35 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOc6K-00000005euT-0b4W
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 14:36:33 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-36d6765756fso495651eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2026 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802990; x=1794407790; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=;
        b=bMq0r6i4KCDzTw+fkhZFW/M6pIwaFkxuTeklprnt/ife0Z+Zhwaw9V6RXjobtaNAhs
         oRdJ9vVi+UTXlxrg94NztmdhZ9ByBx/h02pqrOBCs42LgGtRAOv2RJovfdGGw4n7ntyj
         uaZKKTleya1qdDt297mWMP+/5Trqe8sEjcPjHxcNdl26us3AqrFsjmw0GSAP3aq9dtUk
         d2hCfykRy+3FOwcJ62nLxK79fMXskNHEPdgXfr8Ij4VM0M1GUAo8Sgdgq2P0pn5hHMQN
         G4OghRLKxcbmNXvDfggzNOVjHveMJRVtKrlb0x5+cbdUXZb1bq2/pgC/6etDeznITRXw
         YSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802990; x=1794407790;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UsTSTNr9Wticc38e58ZIWY5uITUM7R+lCgEyKvDw3nQ=;
        b=1nTrPpmdt3/TKUbCj5mIjkiNGGzE3xOcprcglnDJy1+9HFGKUtVKhFm8b1DtpF7p+N
         p/QTkw8K7iMvfJ11/SvhsX1rRXb27b2igGUkcwete6UGVm85HLmI6J0LgwNAja0uxkiz
         kmowTC4cHdaMfq2+vV2hSpXMJV0BWwf1weYJx7S8FjiTaNu5MJMF8jyNEV7yviFAB70Z
         C+ioDHRguOHW79iu1WhU4Xme0NQ2SgXwlnU/saLoTCpRBNOsLV0r9Pq4JXOO+mGCJzjG
         8anUYqaW3ityfJU8mSyaUxPBAkjbq4STQ9axlDm8CXQnrl6dNnxvMShiazmuWPApq4Fq
         bWEg==
X-Forwarded-Encrypted: i=1; AKwUvBwDCdOJIujstpkEWyC3wnjKfJhfKWtAmzn5a4Gd4o0F6T0XCBUsWs4ZEdUa4xN5t1+Sd2tkuJ7QN8BBq1ycwQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+d3nxirfGguwrrZUeST9PG7DIZOB0mteRuzlSm/kVrdk9s24sF
	WVQB4hEAfXw4hCM3+ZuraZ4b4Fxn0wOI3uNAhIVJxswS0HhoQGsWZ+A6
X-Gm-Gg: AYBFou2AMe1wGDrMrHQjGP8VwrCfFwkJwuVyA21AprTRx8fmnQZV1DRIcSA4Bj/YN/g
	czsEy8N3fdKXwi7WPDZCsqqWtvdTitPUmNgx5Ikw8OtZ8Nqfdv2E33TdrMqaAr5wEUS+bwzxQOf
	jzXPhmFQY2phO+RfAquCZJ09T7gsOWGs9VtwknwQEDrzHUz25K7WC6L8utfp3LZzbonVbfrl025
	0VgulfVab+BjBNcFiCmWs8LtHubJH6pCcDoEfhMUwnxgujmrO0p3J8TsNe/1coZzeZMY8/rJ/X7
	T2X9RHlAoPBLyG3wrtGVDZ0c2BfmIp+KjobmSE6WeFeOrDrwpK2fkPwQLFH/km35aCxKoLTA7gn
	20QZsXrD/UW5pNPYo9zSG1Hfbvj3GhQDvYvhwbXd5Ac3gOSeu5IAv+8pdqzp/hn97vFSmqxE69V
	YVH2r2SZMa5CiS/sZcciVfcWMkvugEzLE0+ITksu3UlC4CzCDScFHQWmfVybIWNpa0mXUPo6klQ
	KWto+E8Tae7eWkcc8hGZSF16+LlcoyQL3DivOfHlqEIE62nDbevVanpCFAX/3sqO8e9Jy7hpZrN
	CWRahT0TJzSbVgFgDnpESHcwE2zbWy51wQ69T4tx6YcMye8TI6m6CypHPy4=
X-Received: by 2002:a05:693c:6092:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36a424609c2mr29593192eec.35.1793802990157;
        Wed, 04 Nov 2026 06:36:30 -0800 (PST)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm6208241eec.5.2026.11.04.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:36:28 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Wed, 04 Nov 2026 22:36:11 +0800
Subject: [PATCH] net: ethernet: mtk_wed: fix double free in
 mtk_wed_rx_reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-double-free-v1-1-efa52326702f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBRF0a3IH2uiRRO2IgZaD18EaRGJ2Ltie
 Ab3XuThGJ7K6CKHgz0vc4CMI7JDM/cQ3AaTSpSWMslEu+xmgugcIIw2RW5VnhZWUyhWh47P71b
 Vv/1uRtjtXdB9Pyt+IfBvAAAA
X-Change-ID: 20261104-double-free-b6b95c2539c6
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793802984; l=1229;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=BAz+fNM/Iyf94+H1t6m97KLkVam+zChfLqMn+estExE=;
 b=n902yQuPJrVcZaUjXryGj97qgtl3JwbpauFUgWDNdIsyHcSg+2Qqp6KztWjzVWsc0l44pJhUw
 UWdl6ZEPjM4AWQvGOzBGd31a3rOHoTI09O+BKXmwl4p8a63U8pOu72N
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_063632_194134_E7A398DD 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_wed_free_rx_buffer already calls mtk_wed_hwrro_free_buffer but
mtk_wed_rx_reset calls both subsequently. This would cause double free
because dma_free_coherent doesn't set freed desc to NULL.

Fix this by removing the mtk_wed_hwrro_free_buffer in mtk_wed_rx_reset.

Compile tested only because I don't own v3 hardware.

Fixes: 1543b8ff02f0 ("net: ethernet: mtk_wed: add wed 3.0 reset support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/map/216156
Cc: stable@vger.kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index f40ac5794341..5e9674c9e63a 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1723,7 +1723,6 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
 				   false);
 	}
 	mtk_wed_free_rx_buffer(dev);
-	mtk_wed_hwrro_free_buffer(dev);
 
 	return 0;
 }

---
base-commit: 11140c51df12e594d6bf2c8d2af5dec63b0219ac
change-id: 20261104-double-free-b6b95c2539c6

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>


