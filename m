Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D13C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Dec 2021 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAEJnhBYBnYVb3YAQg6kE5oRxC3a3hE1jn9agLzDbBs=; b=fUj9KW3C06wg5b
	YW4kaXlB1Ffld0LRIpJPZrGLkIYV5WBFNOX6M9Dks+IOL3GEWg4p09lPrsefUsBG/pS2o0ST4TY5J
	3WY103yD5O0NFDHNURnT+BtrceT3k8hiFyjTvrmUXnUlQlKQGklZqanD1PJALCOadjBQG4iNcHVgQ
	FU9eKOpLse2EtxAeTID0bNs/6abWrPhgGF49gBLTazsGbltBG0glv38pz9tUFhYByPeKytAhOGlJ7
	mAFpwi+EduRU7sw+NxzZ74IF4+l/vjzuH0gHbxyNx+SvxXd9KNMyZHllUSXcdJpmajkKaURzDPH1D
	GHuouFg4Vi35BB1pKPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myyCN-00GEkX-PH; Sun, 19 Dec 2021 15:34:07 +0000
Received: from smtpng1.i.mail.ru ([94.100.181.251])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myyCJ-00GEiU-HL; Sun, 19 Dec 2021 15:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=TtROKgMbo8kfwZokexEi1qH487IPn2N9DkbB2biMGos=; 
 t=1639928043;x=1640533443; 
 b=q8kflRVND9ldIJNQjareccUVhWNeRu6Hp64owxGLg6ankVu8iURbjpr3/J4BTcKQH/ZcfETUOHGKBdUWPxl1Bigimd24KfRzLXZcG+0/IB1Gpk8XmvG9NxtehFkoRNzObadTudwmJ06kAdSPTSlh7MtOJLE6OLCl2Jpkk8o7L0D8BsntPUxtiIDTeM8cZJhCI8HJT6i2F4qpFZ+T+hTurniLpSntCw4pbSK2BcDPGHtufz6Bcmk9KrJK5DyOC3G99O7JwrX+VuUO3B2B/M1BNvHD8OzAWkrfwifCmtlcmqalIziPevEDEa58kzN5Qa2u2MSqICdabvlO58U/sVnodA==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <gtk3@inbox.ru>)
 id 1myyCE-0000Gy-QR; Sun, 19 Dec 2021 18:33:59 +0300
From: Maxim Kutnij <gtk3@inbox.ru>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxim Kutnij <gtk3@inbox.ru>
Subject: [PATCH 3/3] This adds a DT binding documentation for the MT6582 SoC
Date: Sun, 19 Dec 2021 23:31:34 +0500
Message-Id: <20211219183134.3849-3-gtk3@inbox.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211219183134.3849-1-gtk3@inbox.ru>
References: <20211219183134.3849-1-gtk3@inbox.ru>
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=gtk3@inbox.ru
 smtp.mailfrom=gtk3@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B5397E24C93BDA67728EE92B76C34EA93F43F472DF252270182A05F5380850408E2C77D129F0B5C164BFB4DDAAC7B9549365909DBC60B572A5A01CF329A45F8B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BC756B860944890FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373F9BB84380CC00728638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D845F50ADDCC460C1ACFC8D82FC99E57F96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7FA587F4160EEFA029FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637028599BB38096F4F389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE493EFA58DFCB7B0AE11C8D5298E42E60C1FC4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CFFD95778845B350B31DBFF92B5B027D8773C971C4292EC4D9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EF6EFF71F1B3C06F72699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D343C45ADCD169245FAF9473002471058ADABE5E9B5ACFDAA2FD907000E865807EB7C67CE4D7BE20C461D7E09C32AA3244C27CA708908193D0012EEF1F21BF40143A95CA90A1D8AC565DCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYItFUluOT4t9s6ayP29iYg==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D159C0F68C27BC24DE62B72BA6983DE788F8182784CE3FA142B2697F7A04D759B04FC54F637BA925032C609A2DC06202998FD9B05CC386A12349DB15C680E247222B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_073403_967450_6BB817AA 
X-CRM114-Status: UNSURE (   8.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds a DT binding documentation for the MT6582 SoC.

Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml           | 4 ++++
 .../devicetree/bindings/timer/mediatek,mtk-timer.txt          | 1 +
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt        | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 0fa55497b96..fedce0d0f3f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - mediatek,mt2712-evb
           - const: mediatek,mt2712
+      - items:
+          - enum:
+              - prestigio,pmt5008-3g
+          - const: mediatek,mt6582
       - items:
           - enum:
               - mediatek,mt6580-evbp1
diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index e5c57d6e018..62acdb11aff 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -11,6 +11,7 @@ Required properties:
 - compatible should contain:
 	For those SoCs that use GPT
 	* "mediatek,mt2701-timer" for MT2701 compatible timers (GPT)
+	* "mediatek,mt6582-timer" for MT6582 compatible timers (GPT)
 	* "mediatek,mt6580-timer" for MT6580 compatible timers (GPT)
 	* "mediatek,mt6589-timer" for MT6589 compatible timers (GPT)
 	* "mediatek,mt7623-timer" for MT7623 compatible timers (GPT)
diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 0114871f887..a97418c74f6 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -8,6 +8,7 @@ Required properties:
 - compatible should contain:
 	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
 	"mediatek,mt2712-wdt": for MT2712
+	"mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
 	"mediatek,mt6589-wdt": for MT6589
 	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
 	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
