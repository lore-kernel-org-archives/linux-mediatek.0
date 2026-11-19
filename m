Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D682606D6E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 20:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rPLZuXgN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4nEQinT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wlYjz4H7PCBDiZQa8+1jdG4sriSVI/tDAKiU2tNjwaA=; b=rPLZuXgNI2vhT9
	UtTIYbPwH94ZBsGT3Gx9hhJx1W/4VUbEUaJHC1Jvh8nmcvCWooNS3p0/StMYs9HERJ+tAEEoRQvxs
	qnQKDgFVX2fr60EjyqF4TikE0AE2ttcn4mRQHaY+AUPd/FcxJ7xE4MnIgfVnVL20wMo6sTLFA0SLo
	mGaNHrVSaEBVQgHO/q8g5jHYW2Nv/tLmrl/8obbEkmkN7KRmBc/O1VQw5DtZxepbPjFFwXcy8vora
	oC786safEog+2lsHOwZv9w62YfM3O6QywOVqtkmBmQ2ILiPUqEha4gk9KSzCsCu9JVfupNY1dskcK
	pSp8fNYReQw711TUwK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU93L-0000000DPZD-0fGS;
	Thu, 19 Nov 2026 20:48:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU93J-0000000DPYe-1Fon;
	Thu, 19 Nov 2026 20:48:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71AE9609F5;
	Thu, 19 Nov 2026 20:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1A91F000C0;
	Thu, 19 Nov 2026 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121296;
	bh=wlYjz4H7PCBDiZQa8+1jdG4sriSVI/tDAKiU2tNjwaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V4nEQinTN3jJh5hGW7AZFmTrf/urY2z6q3EAakxo7y0sapSfJocohchQGbmkT8RYs
	 YycrpfvSwqBeWFJtWKnYY41PUuazCpXCNzgkd7+QlmtXobWyLcnUlqCMKjauUF1eEh
	 FYYwLQqOSFNv6jXSy/33mI+14EfbARiFfkW+l6XCiEfhOw1RwPiANBYmEXZrMk25Nn
	 3EJzXOJ4JjcPy5RBjBuIr26Ywh5I7e6KMOF57PRb4JPvT966ELmyOv6wvO3ssckNIy
	 uaCcCe2g5wzqdv8VqJ4kuQroVEFCp3hiMgaEPel7iHB5shw3ul0Rlhx/OIEPiZoCtG
	 QQBhWx/DJS6XA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rob Herring <robh@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 3/6] pinctrl: mediatek: mt7981: Add missing entries to mt7981_ant_sel_funcs
Date: Thu, 19 Nov 2026 20:47:18 +0000
Message-ID: <20261119204748.2558209-4-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119204748.2558209-1-lee@kernel.org>
References: <20261119204748.2558209-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt7981_ant_sel_pins[] defines 14 pins (pins 14..25, 34, and 35), all of
which select ANT_SEL at function mux mode 6, but mt7981_ant_sel_funcs[]
only contains 12 entries.  When mtk_pinmux_set_mux() iterates over
grp->grp.npins (14), it reads two int elements past the end of
mt7981_ant_sel_funcs[].

Add the two missing mode 6 entries to mt7981_ant_sel_funcs[] so its
length matches mt7981_ant_sel_pins[].

Fixes: 6c83b2d94fcc ("pinctrl: add mt7981 pinctrl driver")
Closes: https://sashiko.dev/#/bug/linux-6233f285-1487-4d2d-afe3-d4ce3c445054
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: No changes

 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 2325cc8b9345..62fec909408b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -800,7 +800,7 @@ static int mt7981_mt7531_int_funcs[] = { 1, };
 
 /* ANT_SEL */
 static int mt7981_ant_sel_pins[] = { 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 34, 35 };
-static int mt7981_ant_sel_funcs[] = { 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 };
+static int mt7981_ant_sel_funcs[] = { 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 };
 
 static const struct group_desc mt7981_groups[] = {
 	/* @GPIO(0,1): WA_AICE(2) */
-- 
2.56.1.750.gf70dc682cf-goog


