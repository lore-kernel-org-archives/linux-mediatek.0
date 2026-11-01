Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63924606A32F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2026 16:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kh3Y5Iaf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHto3Fwb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U2u6JPtaLF5iMQqC/jieagySVrkOfItQa7rqdEpvsOI=; b=kh3Y5IafyyuSfZ
	qLJj15Ou2KlM9O3oJqs31wb98OuIs4+TW2JI/2Hx7vStRrJDwfcTY1cSiW+9OVzUAyss61w/2B+Y0
	BAn1MUg9TIQy1savxe3vGpYLZv4qshUrE1GKKt8ehUuX2nTukw4ozaKXOzyE4X6e0bn+nUEbYJLHI
	5WF+8Uy4oAzHd4r8kMpb8LnA4D/dQJ17RCiTaXCTgdrV7+BFBzMnM+q4ADV9DrWZNWNJeJsaa7RnU
	eOvgbQYcw1C5KGaIhs9CbvASgwv3vG7sniQbgrsmdQIF3zI2zJ3PBzh6QnllbErVQZSy0OCLUcWB2
	SMyf2iTjJYtVpk3bM5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYfv-0000000EgFW-0TrL;
	Sun, 01 Nov 2026 16:44:55 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYfs-0000000EgER-1uag
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Nov 2026 16:44:53 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-33bb5afa736so313860eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 08:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551491; x=1794156291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2u6JPtaLF5iMQqC/jieagySVrkOfItQa7rqdEpvsOI=;
        b=jHto3FwbSXqurvsQVSMrpyT2SFQ1xsdS8ZjzkdnOGzwITI6U/1jjNjJNY3y0EcP00M
         UiLQ8QPv1CV8di69GPn+rbmFVeV2k5tYAYmBslUmydLZeOWYvbVJ2ORBtJ3QTqb1Tq5m
         StnglLKYSs+K5iZTkhTAUjkiKQWp6hT310qFtRI34axjUKxaK+LsEADpk5I7fu0isYFt
         Cz50AhfRZL2BQW9WFbbdw1SHOQSHgdVh+mb2eBkjrRQCmbuuYXF3/x3vribd4bxmXmmQ
         1mqspX58kSf9cq/lV4lHo0vZKspAAB3jTZ5n2+XhfSOuzfJFkyfGWsvhP/VcUUQXaV3I
         0p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551491; x=1794156291;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2u6JPtaLF5iMQqC/jieagySVrkOfItQa7rqdEpvsOI=;
        b=meNMye96MmTayPOTGWD83VPRJ/sgwqu15gBJCkOv/i/OcpPkYPxqCQO+KHo96BAszP
         I2d/27PpcqeNHWhBryed1A8Q12fW3LKGCulJWw9ylBQ6rV1d1DE/8CgZzfla7E6BHJuA
         4etb9h2KahM02AfFSZhizWC29f5NlpnbqDhczV6wb7k6TuXnj+Ppp/nFhrMCGI2NRXqE
         8TgvCz5BE0icq9Q9Vo9Z5dHxqTLgbuypRu78KQimNb8Og6US+2C1Hvd2twsQhCXOEgjX
         0Bfu59qnz4D4VK7ONAcTAzi8H+hnwrYszhgKLhw3LpSUSrchpgHTWlKLT1CVii9b9eVE
         a4Ug==
X-Forwarded-Encrypted: i=1; AKwUvBycNh133y/IXfOPw91mnBg4hEijOuYknOLVDiww3VPHde/SwxzT84TTEozU0SbR/ZUIStQVvWIBE0NoAVX7gQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKEElMRXq8Qp0jKX1XeHBHZKj7N+eG6MEjsaxYzqzmGDVTv881/
	g2+kQnvUi9Me4/AHgM3WMS5UD/dy4HyvyWv/0YVhBR5/EGiGmYol/6Rh
X-Gm-Gg: AYBFou1VIKdPmL5y2Vw+vMG0CJqb5ZnoE71emayFCX7jvfnx7GwznTmPIGLqd1JrP9e
	6Cu6x2Vf8063OmBVNlvELm+q443ZWZAnJ2L1VJbvIJiAxf+FyEkAF5P2jLV208jgBQRRlRhdcF4
	5TdbwG8vhH+2I7MI8kRg7xJ0evSbmhds77+r1AWwlPslZzr1d7iBKrndmaDMpSTFod+KWI1J1qV
	JLp4e75I+8O06HNhqvdo60qinjmuGIzbny6CGy/Ne3rXSp1QUQhX0nhW415SlTSjDdwe6C0aN/w
	0byxor6G7lzVyKVgxs4NnlaRPVTSEX6XuzguxMXV0bT5yHMqE/4HHZtviMmEIcpM04cnFwsnt1t
	mzfyfQnq40SX9a9MCnXhB29gXZJfLxFGmt889H+EKOxMWXSd49gDV8IQlEmADCXgogotnI9OkO6
	TFOYCMXjyt3xZErSElbOQ+LEP8gLgPq3NNBbyFEJWy947KTVlz/aym8N9ucIQCKCV6tumPWmGjI
	otr2YCWIVTvlW3WA5luZiLWUiv7j4QDnNIMrTdOjKq/MMO94mugnQbz9X+ruf4p5zfTwRKe9zxu
	OBIImYfz9PrUZ7tt2paOpfbMsIrZerFAMfkvfz8rJ3TeLQffkQ==
X-Received: by 2002:a05:7300:d090:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-36a4239cc86mr18575735eec.2.1793551491118;
        Sun, 01 Nov 2026 08:44:51 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm35700172eec.1.2026.11.01.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:44:50 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
Subject: [PATCH 1/2] regulator: mt6363: Use 8-bit regmap values
Date: Mon,  2 Nov 2026 01:44:03 +0900
Message-ID: <20261101164405.1743177-2-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101164405.1743177-1-rtx4060@gmail.com>
References: <20261101164405.1743177-1-rtx4060@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_084452_529113_8D6D8564 
X-CRM114-Status: GOOD (  18.51  )
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

The registers of the MT6363 are 8 bits wide, but the regmap has 16-bit
values. On SPMI that makes every access two bytes long: a read also returns
the next register in the upper byte, and a write also writes the next
register, with 0 or with what a read-modify-write found there.

The next register is rarely related to the one the driver means, so this
goes wrong in several places:

 - mt6363_vreg_disable_setclr() writes the mask to the CLR register and 0
   to the one after it. For VS2 and VBUCK1-7 that is the enable register of
   VS1, VS3 and VSRAM_{DIGRF,MDFE,MODEM}, so disabling any of them disables
   those five as well. For those five it is the low power register of VS2
   and VBUCK1-7.
 - mt6363_regulator_set_load() zeroes the register after OP_CFG and the one
   after the third OP_EN register.
 - A read-modify-write of the low power register of a buck writes back to
   its SET register what it read from it. If SET reads like the register
   itself, that sets again the bit that was just cleared.
 - TOP_TRAP is read together with MISC_TOP_INT_CON0, so the VEMC voltage
   callbacks fail with -EINVAL once a MISC interrupt is enabled.
 - regmap_bulk_write() takes a number of registers. The sizeof() of the u16
   keys of TMA and BUCK_TOP asks for two 16-bit registers, so it reads past
   the key on the stack and writes that to the two registers after the key.

MediaTek's regulator driver uses the regmap of their MFD driver, which has
8-bit values (mt6363-regulator.c and mtk-spmi-pmic.c in the OnePlus MT6897
kernel, OnePlusOSS android_kernel_modules_and_devicetree_oneplus_mt6897,
branch oneplus/mt6897_b_16.0.0_oneplus_pad). With 8-bit values one access
is one register, and the sizeof() of the keys is the right number of
registers.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: GIBEOM LEE (이기범) <rtx4060@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index aa6a8eb..cc2e841 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -811,7 +811,7 @@ static struct regmap *mt6363_spmi_register_regmap(struct device *dev)
 {
 	struct regmap_config mt6363_regmap_config = {
 		.reg_bits = 16,
-		.val_bits = 16,
+		.val_bits = 8,
 		.max_register = 0x1f90,
 		.fast_io = true,
 	};

