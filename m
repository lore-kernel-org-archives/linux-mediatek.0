Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC660606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3poHs9+2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T85tbhYT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=; b=3poHs9+25rd81u
	PUZ2d7nk4U/On59noMFp8tS48bpgZIYvEDpGSUzmBvjnw/HKDd7SFcsnfArPr0BzeTZQnPVNVkcv+
	QGc89p1TdEclfM3eMrfekkLyaHPU7QDxSKJQZ4ju8uRS4N9lSRAEi5eUq/8EoiedKlM7lWux3XWTt
	pRO9QnzQnHneIcwGDZpQOAtw4Xkj4hXQ5vuEBvenu1A5J8FwLpZMJs//CON8i+a3uQ+EDKzcRKP+A
	BOca3Dn5wjbLdIvEGsPasMUWdFWecwrtw10LdDIMu451h/LEfTAG2T0yiW2iPBk1AQUHmCJhdVxkP
	HsvDlIY1mZ6SP+ovF4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDD-00000000pFp-2tja;
	Sat, 28 Nov 2026 14:15:35 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJD6-00000000pBz-0qRt
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:29 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33fb4680717so6874306eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875327; x=1796480127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=;
        b=T85tbhYT6CzFT1mmzJqT6sjkHSfkZlxhSYGImJCyilRyx0sfFBNEBr80edO5plwD+W
         rL8rSpaia40/EJVLoeaBL9jZQOwyuPImdXQBY1/g3U2+K3j/Uq2RsFucLpK8/NeUw6m4
         IzxxxkyTPpcUsGJYEsMJI+dhlCjqR2W6PGtJfN20ysXwW2Mzu/dB1/cf7wcvGep72vzQ
         AOaQhYvtg4v5qqcY3Codm/qFY+1efSGOFqWGeUbyHjztbvTCPPpDoJlHavTEQtZv+b0T
         jVETZ7Ck5VKJ91v1Qxni7wTUd2gcNaC3+NV1o80W7VoxybpExxTHQCZN20RSmqntZceE
         fbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875327; x=1796480127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKok+0ThrlCjoRPesLMsSdjxyl9vGfxVogmiolLgcN0=;
        b=zk4y5fknd5oYibiCA+vRbPlxrFSmmGgimpIjiOkj4MVll0bqekY9Q3fFn42KTNXmIc
         1uwcgMQv882bmrkceaGUWuqMu7tq1EskmPspGEgu3eiHXhv79Rw0kUxa7N5yZQc30h5W
         2Y03ZeZFGzE3Mqskwnas9nXTEPC4hW2qHRUPFFeqklnJwPXY1gvaCdfp2lmw0hCS9+vk
         aRAhIqIF0t5Y8fXy2VcprG+oZH8ZwoH+dGdsjFNjOI3vMb7XtnUzxyr53W+EE2ofVLV1
         4FwFap1WVOQnzKIJdcLAMGL9D8kNeY4g18EFFNZnPpU+mZeYzkHlMxL5Gjskz5zxZOTF
         icXw==
X-Forwarded-Encrypted: i=1; AL+hErEbS35/hebiHZLLTy946lalEVzEYydb5ttqygaHR8yjh+udboFFv0NqtXAFW7QUhxyeZpo5G/bJ7t4PblYGOA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Xd67Hqe3wnrbzOFkLg+2xeaE614H6A4PeziSMg/ptChLu5CgV
	m7s4jFNgOCxML253itqzgdocIr7pdysKr7cKsw7Kx4+sCmq9iwgJ8vhE
X-Gm-Gg: AZFdTZdYDbv4o3I02h1AbwQgvlD2mtdLYDmHNG3FCkn26TaSpxES+zdz9qVoj1mb6Id
	/kcQ72a4oHDSUQAX2EecfC0LJL0H1R7AVdNzbEmuQcouGGva+2fpSSTwMaU99cjhlsw0NM97nZt
	YCYjczr7Nr4Pj1OSHBZxPQxIKCdkQdJGqbSCGKTzejWLwylh/i1//RYvDkyyU6GT/p1UMJiJ4G6
	tpNuriGWRMcVAce/xr+aF09ZG/vBkneNoILlLTom8fLvao+F4UJtNOo+vJIEmNNnzcjd1t0C3bZ
	GRA99i3gxkOPunqs3zF0Q415Pmz2y1wedBb81Xrx+fusXYP2skf8b0msI+Sn+qX45OyH8tQXKZa
	bLHZyxT2mvmvNI9crwebryZYCyqqAVsCGQqpF32ASaAYAPb1DtqFXdG80RTrcsmz0JDj0CO0zdj
	w+TR0MYi6cZarPCU600qepjIHEk5KP322n3kobuBdUC7YuDlcJh+gDNM/b4SmHNhrxM6w+JC0gp
	aqXIPUCesWT3Ou0p4bqvrmRM6tRQJK7ZG5+fXqCtfpijNe0ePQe4un0BRlrkDRSiXH+Vnynj0gY
	owpvkKXrwf42hyS79t7+WYjwN5d1cqgm3Zsz2OQtRQfhtNgsjPDCPlios1SXLTBCv3+ID7RU5HB
	ZjiKIUf9vLBIymTgNwhjtfGPSe/af
X-Received: by 2002:a05:7301:6405:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-3856ff54addmr30382725eec.33.1795875327352;
        Sat, 28 Nov 2026 06:15:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:27 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 3/6] arm64: dts: mediatek: mt8189: Add watchdog label
Date: Sat, 28 Nov 2026 19:44:27 +0530
Message-ID: <20261128141443.13065-4-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061528_297350_E0526C60 
X-CRM114-Status: GOOD (  11.41  )
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

Chromebook board files need to set mediatek,disable-extrst on the
watchdog, like Geralt and Cherry do. Add a label so they can refer to
the node.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8189.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
index e0883da15..8c80a1b1e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
@@ -1014,7 +1014,7 @@ power-domain@MT8189_POWER_DOMAIN_PCIE_PHY {
 			};
 		};
 
-		watchdog@1c00a000 {
+		watchdog: watchdog@1c00a000 {
 			compatible = "mediatek,mt8189-wdt", "mediatek,mt6589-wdt";
 			reg = <0 0x1c00a000 0 0x100>;
 			#reset-cells = <1>;
-- 
2.46.0


