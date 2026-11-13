Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9456078B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xkTZmQUf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LYyLmBMi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=; b=xkTZmQUf46LEK+
	icotABt3tC8tYWlBeji2pSK4ktEo0OHT/pj40n1JAl4WfQ/YDaRFhNaaO34jCZIa4CcFkGBqfAsoz
	EwpyLvWO7wjeCAjjnTgZcLyc+i7TyLsps9YsT1mahPK2f53g/FZhfZJv6hZ7JYlg0EOBoY7K6IUa1
	XuPtAqld5YpT/XMI2ZvF98Iv6Uu/QFzktnS/9r/sgDsXetdgRireUGg1kA1pUrz/uFTVQ/gj402Hq
	m+pBvvEc9zEO2HmX0RSzRYi1+6hyhMdpMKOz7YI2DOosPXu5zNlfusgn4PSuwRRkd3DZFX0OSMvpH
	abAt1gIHuQHw0EodwwTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuMz-0000000DdF4-2jm6;
	Fri, 13 Nov 2026 16:43:21 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuMq-0000000Dd6m-3ED7
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 16:43:15 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-84e513877a3so1866157a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588192; x=1795192992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=LYyLmBMiw+5DUMVz6J2Sv/0+BF0OTUG0JFJ5CGP4wNilMOC7Mu/zHYnxNZrSuB2BwG
         f9AchTLxfWSg+pio8DY9zexrHtj57oe1Jqp0vHjvq1shgZK89SwdtWSARZMkp5Typ1DE
         9ilY78nFpnnFUq2hD+HVB1HYdatRxYfvIxqgtP+VKNRS4ZvujUkBW8R/7vHxJMA0PIAH
         2O+dXJAGtB7q7Nq79PdPKPTR7ovtUBl/TD33DhlZMhRZP9MnRBJS4r8kSFSN2uC55bNe
         nHrxi6xSqcIm1W9MOoVTOtyPtY9VDEbtcv0kDwcsXrBwHMaRyYsgn/H69L8cFCFyOfyo
         1TAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588192; x=1795192992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=NcH8s165vnCC8yz6+QTkFGWjRjZAMWME9FZJxLnBQHSlB7YNI1VTv/kB4SJCWaTEBY
         lT4KXZ8p46sia0o8EOwpfTnRN92l+FrgEyGFgOHjXH/acORU33z+oNR/vdIyIossEeVt
         /zQUFEwpdNJnDQitKin/Uw01XEe/YnB6P5Gr2BmFMbXpmHFSf+4MaAGQQLPeeMKZN2Xr
         VHAorRQVMJgvTPQBtM20JHMf30V3MSY+nWHpEuDfX/GdPk2aIzGApZzMzL4T35/330O7
         TTGROMXF6/j+b1RjmbqRbmVVenC1VHnLfsCqBHU5VtRsj099BmcQGvOK7nGru+rLJJPM
         HdBQ==
X-Forwarded-Encrypted: i=1; AL+hErEabWeprccIA3HvgJL9CQ21RlOCpS3eB/UhJQGuTmWi4t6GNN1AbyLMXRAUh6jHzjjxdnikitg/aYHVJlmVKA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+0y+ydJtBodDOzABI2U2JgDBZ9gjfgG5wMP/6dj2YPuM5WsD5k
	PBOjSa4/vvnAUc55oKbyO2mmwTVZMpzxdGuX7EW27DSIbkYiDyJwGj4K
X-Gm-Gg: AYBFou3VilXq2L/ImLh3c3tnEmdJiNd3XmodMt82Cr+cotmFHnrSs3wjwx8DsUdi4DK
	KAAwTTaFNP34NKV3556S+UqFysF8euL8AbWtZXG/9ubbhr5xYWUiBWUjwkmepUEqK0TfeV1xInW
	vLVOGagsetxxIv64RQSKYj6gDzk2vd7EWLpLZx41dB/sFyukaTITeHWs24ClWoR5NL9ZzHqwrxr
	FnDfe29C/HlsrEGBnAL5fDzDBm8gcRmzvSp062Tvevmbg+KOXuvafkKPdPvCSz/emjLWAxrGlCa
	PydxN5aIfcrz5vLD3/wYQV+5d9uKd29xKCJJAUR36v9/we6bDZOIT5tF2Ku69DJMFkWolowrflb
	4LR7uGBZ/3RO1I6zgKDzfDj+uLUusAnhKrWg4L9Y7jOGq5pWlGJrZIK6HD+r8fryHrpfSc4Yi7p
	EmoU3cw2NgMct2QFkmGfd03FCxHbKVFO25DN9c0uZE5mwE2yeqpjpsIJePJOsTQLVHUFP2kxsq8
	KMo+n1UEGqrcPK8rKpjs90DqqA54pZQjCsYZszFzl+1VH0h0BLtLAJohzMgGduG9xhMXfjY1DeP
	GkEH7lvYu4qFo+pSAMy1tjfY0BGoN4UfvgK+bqRvDSSKWSiBFdDKHp1eUG34gbewzOqIRxZFLcn
	76++a/IxqZ00wyajQ1tg=
X-Received: by 2002:a05:6830:8545:10b0:861:befc:9b95 with SMTP id 46e09a7af769-861befc9e27mr1819572a34.26.1794588191654;
        Fri, 13 Nov 2026 08:43:11 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm2712816a34.10.2026.11.13.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:43:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 10:42:45 -0600
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8173: Add the keypad
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-2-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588187; l=1040;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XWTgqrmP7rORvhppkX5O4ecuuFFQiKCRGXT4o7Blnls=;
 b=p1V9+WfESnlytGo+yWLkayiutHu52hR6G9rdCc885GFv0kK/66QQx3BmStt3S4rQZBGGzCuSb
 N1MV6nuLbwiCY6FjGl8S0MX7B0dx1kTM+hKuPoR9KcdWLmYpg/fcM72
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_084313_908533_0A4B405A 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

The MT8173's keypad controller is register-compatible with the MT6779's.
Describe it, disabled, for boards to enable with their key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2ecdea33672e..61261fe643ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt8173-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&infracfg CLK_INFRA_KP>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		cec: cec@10013000 {
 			compatible = "mediatek,mt8173-cec";
 			reg = <0 0x10013000 0 0xbc>;

-- 
2.56.0


