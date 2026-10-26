Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9842E60A263A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XNNHQK8Q;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YYQioDVA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=; b=XNNHQK8QVWvwq0
	ArhTeZw4ZT7SjvKjjXSm17Xl+B+DR2g8PgeYbvEJtjqNf9b3jDFuvpZbrV+ccFES7kbN4kYiaiqhW
	YA5RhiQRsbWea8OHlp1JOzTIyuaj2PTjy6t7RL3YSjhG764xwnEmcT/Cgvx6964GGxBV/WVyY27TK
	RR/cC85pJnnvwmiGMZRua5Mrbah0dm6Swii/Cu9XsP5LaL1T7rlRYR8DcL3ZE46QofFsaDKIjSquA
	m3KD7Z4RvyI0GZSR+kjWQ0GKrYCi3vQon9Hw5Yy9MRGwcLOFOea45uYS+66Qy84NBQHw4UZAv9/un
	9fyAaR/COE60iDt8xLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHqE-00000002Fx6-1JCl;
	Mon, 26 Oct 2026 10:22:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHq7-00000002Ft1-0Y9O
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 10:22:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28531895e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010121; x=1793614921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=YYQioDVAlBa8Ag8vBGIhsxysiel7bfOUPSv/ZuGXEHv+I2iKgdD8P7r70jnLk07G8m
         lyQSV7SCPw/Mz748U7LdIWcc60RAc6CDw49/DF6s3DZVkNClUgWUeAt83p9eNpPAKD92
         FgHQRkunQVdYtDb/KRSDmUJT76S1fw4eo1XlJFMqh3mHCUul2lLl3VYUQmrA5aeSKMmI
         G/pnxwrs9lQvI/sBgASTPPcafa+opW4xcnS0/uJFkiFhDbFNNcJ/9pqQxvizVUW9aDp+
         7TfLzTC6dF8eD1FwxTF7XvgMZZjAX38QY0LXPtOoV6T7ReJW1a5L611heVxH9sF38kmN
         xYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010121; x=1793614921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=Cks1VkuiNKlsjuknkA0+xR+fEnblln+usFuasQNShcfzbu1/19P9PDNCWN/9Gk4kOH
         M2ZTOSdU2LL9OkH87feA3r/x1baXn3iBtPA2v4z/c03B4FDK2T2w5StfSHsyF7A3NdwJ
         4eWcM05qHqb7zrRQnuxZRojSXiOLpg8dTlxS5LEBl3wlEPe5522IkopYa71GcEKlVjxo
         0p64o3cOxGDwpdBOJlu4ErCcrDOHyhcmEoUZevR8X+OqQLkznuj29NkVLxQegfj5gUHb
         898H+/E4MBUK/km6aUnTnJuuAlqVOYR+lPCYPDrOw/A7f4j5IosBDmtCMnjsr/J1nybc
         Rd8A==
X-Forwarded-Encrypted: i=1; AKwUvBwdNoacF0BxQi2igs2ZWq4AF+Hazxn1aEK0yfAgLYLhHtR97w2g8iK45BAhy39Fg3gYQXJjCxckUGh79ZivPQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIzNEKHoJT4Djt4CVHuUSNn13iOAmO4BvVuo5El4sxWadTxPdJt
	jWH2o7o7mj6f8T74dqgxAH7GlN+6rhJEbZsMdq2A9g3LyLLqpirK5iP0
X-Gm-Gg: AYBFou31+fJDjDGDQrqNFK+KYWs+hWz3m1zAF9Uq0DFG9IKaP2H6rKhYOiNyE2RAiK2
	iAVbodV7jW1X+cvl/+Gxu99kLqUogwLoUiPDwlUAKeN5+/S43f4B6DWldPXCK1zbN9kVPxgOt1D
	VAAKTJjrpCGm+Pk8U132a5dhHvuvDP44w85dPCruAEScoJxyWVzeaUAWItrXhKmSCTxY3MYK4AS
	Eh04meTwfhoFm2TmerGtkkQ6nqLlMELRHcYOUnHSFeY8kdpbCYZMbtsHOqZaUEx3M8ThWS70csw
	hhzH9YrKwpFE7CCz3oBGo6u/02cLqiFTwi7rL/ST5MR4PvC/ZWM3U2WzDjsZtqly0NqPWY2TxSD
	h+YTEpOFhBYidmyKpMlWqZDOaO4w3HLLTlokVJw642HBOWk5jmVFqy73n74I+IEHgiPQBDvZ1Mv
	mZyanQUA8lfI1OSAwwgJhuy4hILbsEEdLkYcPwcFpqN7W7gXJMestYL+ThbvRThBZ3XUGx7MQJd
	n43/VPq6+cKw20SIlGztaIhdnlVfK4YAMtf3kZALgkUJDfSNqmE5j98AeUcw4pMUwsJhk7h3SRp
	DuesYhRIFWsPFbYaHt7TPQ6ZRFau5dzU6kHHHu1hQ+//jNAE/gHUk8buJ+DZ
X-Received: by 2002:a05:600c:a106:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4a35aea23edmr84243625e9.9.1793010121069;
        Mon, 26 Oct 2026 03:22:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm16762876f8f.18.2026.10.26.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:22:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
Date: Mon, 26 Oct 2026 11:21:37 +0100
Message-ID: <20261026102138.36786-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026102138.36786-1-ansuelsmth@gmail.com>
References: <20261026102138.36786-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_032203_187404_AF21475E 
X-CRM114-Status: GOOD (  10.26  )
X-Spam-Score: -2.1 (--)
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

Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
MMC controller based on MT7988 with the difference of having a single clock
controlling it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 5b160fdad3f0..736cff2783e2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 };
 
 static const struct of_device_id msdc_of_ids[] = {
+	{ .compatible = "airoha,an7581-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
-- 
2.55.0


