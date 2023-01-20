Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D83C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 20:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPyrNEbNLMWHFahjxQdIqcNPsnlOeM92Wq1ZSo0WTWk=; b=h0d5UcQCscc2pp
	6b69DKdm0Aib2Ubol+uRegzvhem7oBZn3MighniwrrqePM0UaaVwXpqhPFsyUrBlwOppsS0WI+TpY
	OURikzRnnMhGoIOhHX8AyvV6Kp0ww+7Fcf1NiSggFyztsfaDBfshadHyB29HenFY8B+42JXjDLcul
	251C0a8zRZFhT7lNpvLhdomCkWXLkmZIhb2tUKfNkVFExDyswudVElUCkpmW05+nc7Uq2mQ4opy+m
	3XmgZDpVy48VLsOkeO6fYIRkuaASE6s2Ra+a4otvN/jhCGEtuttcARudKw4UChtovsfjkjMjwVqON
	MF4UXsaRlLW1/pr3n9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOm-00CLPc-VD; Fri, 20 Jan 2023 20:54:09 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOh-00CLM1-JI; Fri, 20 Jan 2023 20:54:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674248039; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J/1jSSeMLnGOpdk9Zv4q+4WvlUbhklh3pF6K2K5znR/CDQGGTzpnVWuunr7/9l6ckGn6vGAYLIlcoqzUGZOabKdP6Azp7BvYOeVpBaGdabmVuc06mZQ3tIPwBSh1/6DafBJuvF2ssiTLKJiHvFF9a9kl+9RuBNYyi9/KWTbogpM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674248039; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=SPyrNEbNLMWHFahjxQdIqcNPsnlOeM92Wq1ZSo0WTWk=; 
	b=jJZYR6A97K0KZhDV+ZPbySyuNrl5ER9RKn9YDWo8en5YDy6HliVfCra0Vu7iW0/MQ+diI8fpYWMy4NXsi9+zhPyQoDXSoDS8Qo7rbnYNE1qryB7eCNBedwT9UloiS2eakF50tuI+CtvjCu+PdHUSnfIWnnIECm+d4qgvCBBHor0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674248039;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=SPyrNEbNLMWHFahjxQdIqcNPsnlOeM92Wq1ZSo0WTWk=;
	b=OVJsNpj0cCWTWLCHZjJdf9L6b8H0t3ak/JYcdYhs3ZuSj/1KsqxLFGGKi+kOtURz
	pBhM9cBk4DkcilpfBcfL5whVsP6eOQjAUCReG6lS5TMXwoPkEyt96olFhzBONsLsZIo
	Ea9XOYrvYeautp8BX7Kk6mm3i7yIFV/OlU84dk3o=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1674248036766892.7602944834606; Fri, 20 Jan 2023 12:53:56 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 5/5] arm: dts: mt7623: enable flow control on port@6
Date: Fri, 20 Jan 2023 23:53:18 +0300
Message-Id: <20230120205318.519493-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120205318.519493-1-arinc.unal@arinc9.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_125403_860858_0373FE7F 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Flow control needs to be enabled on both sides to work.
It is already enabled on gmac0, enable it on port@6 too.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623a.dtsi         | 1 +
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index a1a393028629..a522a00ab67e 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -87,6 +87,7 @@ port@6 {
 					fixed-link {
 						speed = <1000>;
 						full-duplex;
+						pause;
 					};
 				};
 			};
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index 7c3298a92887..96c46f766e6e 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -228,6 +228,7 @@ port@6 {
 					fixed-link {
 						speed = <1000>;
 						full-duplex;
+						pause;
 					};
 				};
 			};
-- 
2.37.2


