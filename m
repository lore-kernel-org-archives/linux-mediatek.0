Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6190D41D53
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2024 05:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kK3U8pQ/oVsZSw+Ik49NDaOUzj3r9K2JH8mb1XDC8U=; b=RHuntkkN6l1o8mr0Qsbfj90BU8
	wiqqMJAarodF+tcrxeJEtcCGWUjZkhHFYorAYJynW5hiyPznuFMN7bpv/4QczCTks/1gwNe4bkuSV
	WFDyPGRCPfdsGpy5bkSJxn79d7ldngufiR/p+gs+fHc2U+AXk/3n4CElvv4KTvgE70zftzyYMwVii
	gJ1U4t83n9I+7l8W6Z31Z5NkCYeTmNOOVeLeOXGjjR2jcAzyV4Sk2iBLopSpVVBrEP7R8QjstoNAO
	qcNOIs4FHz4ztm9/OhkQVaRcctWEmgS6VLXrfswiswclcPdFUm+4YvkCCMAJi7WoczhrfkjrFYPVa
	eG0Ms6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjM5-00000002F4e-2HCi;
	Tue, 12 Nov 2024 05:22:21 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjM1-00000002F2h-2coY
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Nov 2024 05:22:19 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4F3E311401D1;
	Tue, 12 Nov 2024 00:22:15 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-05.internal (MEProxy); Tue, 12 Nov 2024 00:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=2016-12.pbsmtp; t=1731388935;
	 x=1731475335; bh=8kK3U8pQ/oVsZSw+Ik49NDaOUzj3r9K2JH8mb1XDC8U=; b=
	OOROsmSN51+kdEIZyYaKT1mqI2yX2LIxaWjlL5m7f2PIib14HlQiX3mbNlfV281D
	3usjqHWfLupuoDHU4w+JD+BWiFXCthumm6AQGBhxV1h4ZnIZthjg2FLyQPcs7EsO
	lckkyahvAiwv3kmt1KvbRXY7ZM/BvV4gNI5wAitqG3g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1731388935; x=
	1731475335; bh=8kK3U8pQ/oVsZSw+Ik49NDaOUzj3r9K2JH8mb1XDC8U=; b=e
	urYevQt4J3NbEfLryNaK9IF308g1dkBj17a/JcSnIPxQYzSy3OlO3E4Q4UrDqamQ
	yUmpFY6X6nLWIDVSN6MAzKn37tWHpskm+F6i5Ooy+gNSjsHWLaiJZymJKFD/5F98
	9Nn19RsBbZJjyGSbEgwJTcKqEkpKRp+CUxhBkFDe7uHRw3D6Kd5tXs0FmyywF8xQ
	U38xPggFEx1lVpfF+gU8of3jYg4XP2lON/HSJmdCyO5FZduUiKOStYX2KcddxtF3
	/NgtJD9N8o5PB98yQ0AvBhW6Oddo3EdnkfDOAAqQbREwpLDjA0Uhxb0YDz4gbQOv
	KFE8bRddeIp1SUjgbbA9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1731388935; x=1731475335; bh=8
	kK3U8pQ/oVsZSw+Ik49NDaOUzj3r9K2JH8mb1XDC8U=; b=UPt3vMFa5wj4iU3vf
	3j4n34PWJy/ZVhyhSonlxnJV0xrfzQh+XONDax+Kqvv066EgWobO/PMYl8NgsgQ+
	+FZWffxamm6BNquBUfFby++2XE4jA67iqEvsPXyAboLwM5o9rY/UXwpNw/T9PBOV
	HEAogTVG1y5TLAysvgY3r2K9M8QVYjMo2eWNu0B60PTAorOTxJ8MjIQGnioezf6K
	UTQqq8YMHFUqOFgX64EBrDJ5RCHIHuoWw75o7paN9m3OjGPUvnEpvsEV5utlyL0Y
	lJjmOo86dAHGX0N7Pb7+SxZKdB/cW/SbNlDulsvsRQP6T31tuuo63R7v6lrGceA2
	Mc+CA==
X-ME-Sender: <xms:BuYyZ-rPwDh2cca5q_-DRXpjj2X_FLIDr-QYbFVik6MY_hx09uwV2Q>
    <xme:BuYyZ8rekkQvaZCz6jVASRQ5N_u83qXjcEBqXkrP31f1qI5SfxnyPuw_ojNfrYLOc
    iy8BUMYr0LulXaBW5Y>
X-ME-Received: <xmr:BuYyZzOwSqwIx9QOv_XED7P_G0EzKIu1HP4ZJk-P8YnIu7vR4NcFgBF-9bxQHZuEDW-py1GyLIU8UNpUeJegv4-sXLVSMJiF0GoIx2LdueuZMiQtQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecu
    hfhrohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvg
    htqeenucggtffrrghtthgvrhhnpedtjeeuieeiheeiueffuddvffelheekleegkedukeef
    fffhudffudegvdetiefhteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehnihgtohesfhhluhignhhitgdrnhgvthdpnhgspghrtghpthhtohep
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprggsrghilhhonhessggrhihlih
    gsrhgvrdgtohhmpdhrtghpthhtohepnhhpihhtrhgvsegsrgihlhhisghrvgdrtghomhdp
    rhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnh
    hivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhpmhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BuYyZ95DAmQkpnkiXu71U9pHIgZF2pXwm0a8yiBDCv6HDhgV2YeBcQ>
    <xmx:BuYyZ94d3O4Wur8h9Hk7QrzxUyliobuTeDGS2kXFWo_cAv_kqhUT0A>
    <xmx:BuYyZ9jHHATl5FLVbbUrb80rwcVkS9oql3vXD3tZooXpL9QC0wikdg>
    <xmx:BuYyZ364ipkOzpLwybVrtUCBvktEV17Pg68u658RsXuFk9FqMRAHvQ>
    <xmx:B-YyZyEYyIabCCCkZWkBlmqeooF-eaKtuB9beXAGmtHnF2RfEsl18BUv>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Nov 2024 00:22:14 -0500 (EST)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 01444ECB7FF;
	Tue, 12 Nov 2024 00:22:14 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nicolas Pitre <npitre@baylibre.com>,
	Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 2/5] dt-bindings: thermal: Restore the thermal-sensors property
Date: Tue, 12 Nov 2024 00:19:39 -0500
Message-ID: <20241112052211.3087348-3-nico@fluxnic.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112052211.3087348-1-nico@fluxnic.net>
References: <20241112052211.3087348-1-nico@fluxnic.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_212218_231218_5AA2BC81 
X-CRM114-Status: GOOD (  10.16  )
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

From: Alexandre Bailon <abailon@baylibre.com>

thermal-sensors was defined in thermal.txt but when the yaml binding
has been defined, its definition has changed, dropping support of multi
sensors.
Since we are adding support of multi sensors, use the original definition
for thermal-sensors property.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 Documentation/devicetree/bindings/thermal/thermal-zones.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 0f435be1db..cc98f87633 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -96,10 +96,9 @@ patternProperties:
 
       thermal-sensors:
         $ref: /schemas/types.yaml#/definitions/phandle-array
-        maxItems: 1
         description:
-          The thermal sensor phandle and sensor specifier used to monitor this
-          thermal zone.
+          A list of thermal sensor phandles and sensor specifier
+          used while monitoring the thermal zone.
 
       coefficients:
         $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.47.0


