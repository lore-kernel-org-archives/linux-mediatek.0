Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B351606A32C
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aq2iYW/y;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtAQdl0/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgafN+l4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=; b=Aq2iYW/y+/pqH9Iub+5fP51Bfp
	NHGuhh5YWWWF/iQiAqOIPfWCU3d8TOplkwYR4mKsKTxp3d+AwFGdM6byOCYYdX/2uMzqUSD8EZpqQ
	F9zqsxUHe73ZJY0ps2wguW1F6lxkqD/XpBs2BkivvVLyV3KVU78NQFIRZ6SQ1zT87wTD0NFgh1zV+
	5tJGKZrVjxx0zbKUj5CwXbL09qE7CySofnYm5n17PVxrQw5NbLR+h4GBBhK+mKJijBBEj6Z2Nsu2y
	I+hePE02FJAel8jpRGDZTqke7XgHPECsu1qBvevLfRsAZ0d3nrDqR5HMSaEfCSHfynI/m+w6zBmEL
	/VoO0T4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA86-00000001KIn-3twR;
	Sun, 22 Nov 2026 16:09:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA83-00000001KHr-3MPj
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Nov 2026 16:09:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQ7dY2877518
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 16:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOq
	ITaBP6p4=; b=mtAQdl0/VUmsTmBfCdsUiZlwtJktWhyrddSFvdoDARKMDsTNwg7
	1SmyLGMBNciWmtKHIeGNOeeL7ir2VLfswcIzeWnq2AUHdJY+pnkpSY/94BrU5QcB
	8z/Vy+qoCcJbX3P7yOc8cDdFZ5tgs6oyLFYEOtuooRiluGFbgzkNt5M76iLUw/FG
	8htUFfqpEWBHq0vSD/9fOQarjyjsezvEOVOk2Pc+CTZB0fGXKWbDOlhrsnUbXXI3
	cYNDz+ow+YeikSSxDtz/vgB2GJCBMXk8RZyQtVIaoZqC9wTGvLNjYWgh0YknlPbZ
	T6rUSEfzij8r6geVPJxujPz1eegQUn8YNHQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka3k6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 16:09:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so733876241.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 08:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795363762; x=1795968562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
        b=NgafN+l45WyoJHFPL3hjOW5a9X2aQjhiBRr3/3ajGO1TANLxSp+AExrZ+XaXMYbRfl
         PAc29tsAytoPIkraaSeH04rkO9JxQA/OLibKfjy5XJHQBPY/uSVQJ3asI5BUPtBSpNFN
         162XZV31bORhfgQULkU8L4xLWXpFMBfp3Vf/sPhZ1wy94MHyQEhwqG/3Cd9nYfrLct1r
         RZc0GeRhqsenvl1yj/W5GzCyMA9Tb6Ee3DWHTRDXwNxwgT7UsnBLYoi6DXhOfUxuOciN
         oEXnICdM7EirCp4DqV+NweN76SDlforpljJqVmpk6+/oeTKofhFVRdIrbyQk7lGrq5cL
         tHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363762; x=1795968562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
        b=X1sFHW50qBsOey6zWHC76RwnBNjukgLpgqSgRnK6hM1h0fEXB7qF7b6RLQXhYpkvex
         wJWIozz4Wte33uaiXqUQ2TKNqbK7NfQa6vNQlA9zPGPRnN0nKd/I9CwBR4Y972FrLRuN
         IgxXwKVbhAM4zxU2+L+BCc2LdsmzKW9mds5KIuafVu6K/l7b9lmvMnmGpCnUgZaMeAwk
         FO/8yhhd8K6BFRuWnwqmoq/x1IJx2Xml8T0lxFgZaA0IB9fRjUodJzaC7Yz+9hu/JZIO
         OE1a86/8BxX1hh3esyeY5yBedBDkAtfKXD0fV40vpd5f4EraHm3AAN1JLQTWkNxOkDN3
         HDEw==
X-Forwarded-Encrypted: i=1; AL+hErFCNnoqJ1tB7mdqGvFXATuePmZhtJKszv9DiODSzPdjcbc8oiK+GFb79BXRsdPTIz1VIN66zRH8tLxB22smjQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8sR5K6fCEoO+Lo8rIAoH6DxkSEXZGjkZ+cWFmABSUaXBjQTIk8
	UJfqZy2bACumetT2HhBS+dfCK6Bf50HiOk6l6fR3JM732qMYWTh+F6xXVvueaShpq7unqB1jrYv
	lKtR151BVREh89qUl14Vf+GrSxwrIF4lKv1yV6sEuX6b73lbvZFYn/83hZbH85biMVcREHbP1Za
	s=
X-Gm-Gg: AZFdTZeONXR+demjKDHYAEEVRJbS6FQ2LGj49p6sHTlEf/o1SwGFJREDx4N8nb5Bz5E
	THSPBA/H5yWCCU0jWd8gefmhFhBQ2bFiQLDu9JlzsdsPc7rWYd3Br/R0MGU9dAavplXZwMVWvPk
	Q3o1amMXBEXechZZa0moVahF+p/RQqpMy3TqcglBFbVaWopy382Lr/2UMNyFK4gEHBICfWMjd1g
	fEmlQcVeUrH7LN42uTmz9k4bLoaoH/ihKab49E3PnRyNQj3uwTapcU2Fbz2V4bboJJjG+sfI2TW
	/95ptS6gzzRF6/h181wyv8xLaX7/AKaLR51txn4F83IuWsbnILP43oACbnmemFCCdEYeeEMmtpa
	agKkWz01WP3vO9hWrK3Eu3DRNoUL7WWWOfjX9zCQgOb/prf27NL5irAnV1UiJNw==
X-Received: by 2002:a05:6122:d96:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee8adf69a3mr4700300e0c.1.1795363762312;
        Sun, 22 Nov 2026 08:09:22 -0800 (PST)
X-Received: by 2002:a05:6122:d96:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee8adf69a3mr4700265e0c.1.1795363761433;
        Sun, 22 Nov 2026 08:09:21 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm320526755e9.6.2026.11.22.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:09:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
        =?UTF-8?q?Jens=20Emil=20Schulz=20=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
        Daniel Golle <daniel@makrotopia.org>, Marek Vasut <marex@denx.de>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: nxp,sja1105: Properly apply ports up to 11th port
Date: Sun, 22 Nov 2026 17:09:08 +0100
Message-ID: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k0dJnwwVOMUlPc+I5R+F03eCmWOTtijHmMPA/BB2GhY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxOju/4Z86N0mMZw+6sMiO3a7sqHSvn4onpHC
 tSJ0snI4fGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMTowAKCRDBN2bmhouD
 12p5D/4xaQ/IqdB5b/zXL7JJOMdwpoOJvhCY5xO3BhYDj2VfkgaUsxoy2xYJmK30cmwXITVYD4r
 kvQ2E8lPZVSNbkquqmYyv1bWwufE0xZj+5gPZr1phRuJyyactBViEXTcJDcagSilgixm/PTF+u7
 z5y1S6qnTXywKiLuIQliVhMXJuBnHjNxqLe4mLuljad0siZklmDDulm8ia9LjSm+zmKXfJd36RV
 dutmfs5njSG1lRa/cSDh3xk2Rz9U1SNO045QHN70NfTgRT7qpXKTDYns+QvbrZmkF3qg2llRcw/
 wE/p/M24NbKFYpFCqVEDtz9JgoId3ADhL/pR1JRovVXsb0JQAtpwS4E0cnkKbKC3xCVOTJnzjlP
 qq8lb0t6g9QAkFLlbNjd1gU4o/f0gtTYuAgGO8LmT3oxxldhJwO7WeryuFoHONCFAMf6X+j2ooQ
 IUAYKNRsI3DHDl7un82Eo13QGV7OSjGroEWz04mzkajrj0Jhqt50VnGuVynmaLPlNs7lM2AbZvR
 b7i9+JQSwFl2bDlHFZ8LNYXGgKjm3hkUYhhpEv2uEq8wCfoD1RS1Z2vNl7dIaY8dyhnJLWyH265
 WS5FNaYYHg8yyxtirYCjADcL0ofnaweqCxmiu3Tr1P43bVhROoiAxR76amWY7rPkK5g5roH2N4s j6WjETiSGU4vMzw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7W0HzgMVgDTT
 rAv0IG7vnI/IfdYwMVsEtJf+HXxcNaPu/BwVD/ZyPWT6SSj1UglxR/lxzPig1OKMMKi/hpiQZWM
 oVdbTBnFJer1D3h0uA+dH5zGU5kS1ZHOFuFFNXh+L1opJXGfY8o5biaRcny8NTo5F6e7vJSAEQH
 svWjlYXUuRCxIOORimH8+bvJI3x4Lw6uKfDhSedwjdAW3Kf3esSgDIxm3qaKvMdA8PbdEw/UdsX
 +JGiakwi9MjlH6dodYVqLQq6kP8UPtO94C3PLUaR0U+b6IEOZsT4TrC3xvA4pdS/DscQH0P+jw1
 WrpLWDB6dVjm4GtEQMKhZo2hBwi6K6UF/XyZNH6kknUB3H4bAKLiI4IESYcNObylxowdw/ajUGu
 lteheUBCHsOPrMfhirqPz9MEujAJLZtYZfv8AhEj8UfzTTcplmiv53D5ZTbMS5wRDjmBFVC9zb0
 KyEXemfkK7QedCaSNyw==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b0313b3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1gOBQcDwdZx5nJ0sStIA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: lAYjycFbxoQSzL8uhBDx4k0s_OgXVLEL
X-Proofpoint-ORIG-GUID: lAYjycFbxoQSzL8uhBDx4k0s_OgXVLEL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX8jES8Yik+mqr
 hOYXRbaztCVTRJdeXIH2AV/AWjjJzh9r4lwimnGARJFiGyNcc9h3HplLvUUG5eGjGVGALAwiDYz
 FN70ccp5dToWHdQJQZbAVRYI5HcZG9Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_080923_837723_BF1BB900 
X-CRM114-Status: GOOD (  11.89  )
X-Spam-Score: -2.8 (--)
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

nxp,sja1110 devices have up to 11 ports in DTS (highest port@a), so the
pattern was missing applying schema to the last one.  Fix this by
dropping the unit address from the pattern completely and adding proper
constrain on the 'reg' property, so child nodes beyond port@a will be
properly flagged as incorrect.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
index 0486489114cd..e9b53820cc36 100644
--- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
@@ -89,7 +89,12 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-9]$":
+      "^(ethernet-)?port@":
+        type: object
+        properties:
+          reg:
+            maximum: 10
+
         allOf:
           - if:
               properties:
-- 
2.53.0


