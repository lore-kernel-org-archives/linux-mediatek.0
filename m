Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1E2606A332
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F73jfrU0;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo11p71u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NnFwZfhF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=; b=F73jfrU0VSOuCH
	vNSpr0q4s5MZsl8WVTqLuuchvQC5zoZpXwmeHQ1SXKV5XAMO9qZOfdfILuQdLvA6COhUmWk1Bh6B6
	xk6XCBJa9Ono5VBlf8lVwrRVecpJmqLAsRTPf4c+jIU49xfPZtlXUZ1GsDWSz9mFqSKZaey7TyMNv
	E3FSnXqRF50DQ6a3GTnJZTC1riK6S3JOokzD0/ObMRjanlvOdbXTdYi5XTfLCL0EL/XA9vZCyI7WZ
	rTdOdrr08UWhYWa5CIQSUJ9JupYCsoHClXFuspbYGH90jgzcUPoiFURnV94aj0zbWcx+OeuEGhSbu
	8mlv+mvag5hWvIjjVZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA8A-00000001KKZ-0BcX;
	Sun, 22 Nov 2026 16:09:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA87-00000001KIi-07xQ
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Nov 2026 16:09:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQS6m3853066
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 16:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dyOk/+hQC3d
	S2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=; b=fo11p71ugXj+px95KD0I3tYDbTh
	yS9cS8ycCi2GiMgJ1j8GedN7CBzMcbpWS4qXCxe2NuSKyGHBARcGIzocsdXToWVK
	y1bcpA4Oc+uIVfCp5gmY4cRwXXK5FO1izXGR5WE+KUAnxFEdgYpa4D2VzoemGPUx
	9QP3WefnhdCgec0yiiuJ82z0On3b11VWyTGY2JB89i0LnBcr1Wc/IjF+CXBN3Pq1
	jlNK9H+2KMoKbuQVcYjXnaIFiIDh21fggm42Y5o87jwDTYfvqiSgdNMMEwexXVwM
	htEp6POXtjAeln8wZE5NSqMceJ+3UgJjSlAUFW1XroSL2K/pTQ4etxW7wqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3qjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 16:09:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso639928685a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Nov 2026 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795363765; x=1795968565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
        b=NnFwZfhF/yV77IjGapa+F1CnaFQWWQG1IEvOmiw9+O/bD06wgGexJcu/Vqwa4xOpXZ
         Lwpqg5Reh4JRVymG13rqsqQKjKTTPD7GqWgNg4o334A5wpX0IR2DDkCPyn9OldFG/Kve
         Ox4azBi9XcTNhA2lOu3cK0Z773gijBHC0cjqgGunaxSR5NczHYWdKe/mXVMgjZWTRgcX
         1DEBQAJf6UN4WqW5CD/kD6c5jymApSAvM3GvIaWBKrOhXNRc64NZpaKxAzWy+8nT5L0S
         oisss+Q/6WaX3rNOwSVNE743nSzRv14/sz7XKL9x3l+lXcqyC2MwcKXJGjCjBBT9dXBJ
         Da9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363765; x=1795968565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
        b=rc7Z/tp9kLye2diDhkMx+hLY4hemHJKaJM8XHdRIsB/uzriT5QTYeq0apXYSjvZTb5
         nFcRhz8uByWJ/HpfAFAWUBU9mPubZz7JSBrnZOXf8Dt64ZejNHu3VY2qbgXZovdUCc1P
         4wnUCx78bKjwh1fE1uerEZIuEwbO+QiFthpHrkHACg92gYvNmWjcVCtTZAein5uKgTKH
         4i/5lqcNUZ6TsYZzPTJw8s3XF8e/3mzFhXkf1n0aMdAaL3oZjcdcBLBSl0LPxlxjKBy/
         K7dyTdomXspWflKOeTIslaxoZjd8Zx2wRVwEpaEXutS12BS0m3ZjzH+CiYfVRWd6fHr2
         8atA==
X-Forwarded-Encrypted: i=1; AL+hErE/2tezJerfRajsWAHE8Vc37WcytL+GnmyxgUgsmNa2hlw1qTq2eM2EUnxVkp/bAYxfOnnp0Y7DviOTIRY9cA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9g+92Lxc/uh9aMVe1KKfYZwEbQ4XEMmzr5WTl2MYT88P+UzO0V
	pLy+Fd/xtxkaqmVrQcmoVwvyZ0MykBfzTNIip+VAayT3KUe1NuAgoBHpa88Wl170dCCsV7gJitF
	MXxmK2BhkVP5wCLCd9YPNNBi/WauTY+aQ++fKWxhiCEGZGT1WyyKH9Fs7j+8WkcrxMvbrHl0ZiK
	I=
X-Gm-Gg: AZFdTZcnfnCL4ptmBFaPHQshW+vj0ZwhLWo+VNr/dBl37+cwOvtROY8MG50Sd+q2NPs
	j2OUyx1UG6d8jfV8uvYG+qgT9siKhja+fbs5Ti2Yvehu8f0UCRcedVnOoVXfUoWB+loqhpDA5II
	TSg3y7N6Q70tSdH4697HI8Mwkr+lrkscUSGfre24PE3fOKz+cFFat/UxEyPlGI+V7BQOO1kEYPd
	gfzcTEnJJcUh2jWtAyT29W8Zx0Pf5LHQ31MIO3t6ss8Cj0mMvSxFfu3+EKgMYkBtonDRfifcsNT
	fQ0DGyoYYvTe0mzl1D7TcLoRP8PwY+i1vU8jUBLQnIHN8gWPTPWdHR0bEMB2vvUJrT+tr5fUaVW
	2KciuhVwa4bWlmfGwRPFumYD9PQqS7EiUMRpACFmaQNJ35quVcsaFjpfhm5BO/A==
X-Received: by 2002:a05:620a:2682:b0:949:671a:cc77 with SMTP id af79cd13be357-949b34035a5mr1661821285a.1.1795363765129;
        Sun, 22 Nov 2026 08:09:25 -0800 (PST)
X-Received: by 2002:a05:620a:2682:b0:949:671a:cc77 with SMTP id af79cd13be357-949b34035a5mr1661816685a.1.1795363764668;
        Sun, 22 Nov 2026 08:09:24 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm320526755e9.6.2026.11.22.08.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:09:23 -0800 (PST)
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
Subject: [PATCH net-next 2/2] dt-bindings: net: dsa: Flag unexpected ethernet ports
Date: Sun, 22 Nov 2026 17:09:09 +0100
Message-ID: <20261122160907.200727-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6422; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=reMATxFxVxRB+raQ83jYfeaAK2V6mtUNc6Wp2ta7pEM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxOkOJWDsz07omJXLZhaMWPp6woHPL8+pCClu
 +kZC4bdMluJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMTpAAKCRDBN2bmhouD
 1xQIEACaFedbtKzfFmbnBJcFU8CEz4FyuAcxxPgxdFqxRqpIg1xHeRGybC4E37WJVdFmDXL+IiM
 FZdr8VzQM8M2DA6tywEWp/eKIa0cZKVKpdARltyyNDRG/YtWqJgjc5BMnYxsVAqb7Vo6kjQr5Vm
 9nVSouM8M+29Ue122ZMOG4/rUOQog384qunka/dtrk8IysLT+e6UvBvHLsiPuA95hYzqS9KOVzL
 3VHZybyVb6e2m2Y/r7XzFzlhR5H0EDq7gJ5NJy8MOG15tAcJ+TU3plPFRbtBjkSOB7i8Ubysvhr
 xUQCrae3P5pSL4fWowBqQNdGvP3fPkhgA+w5tyOvHSAdCed5brmxQdvHogqCW4+KCWT+PWfpMQH
 R7E1iMnrzjWZp2X9SbexuwXUPfw2orGQ5jZJslTL6ODd8dCeVJ/YuYRvCAVsGKviS5w5MsmZY3z
 r5KeZ3KftGG2iI7ViBELF45gUtCNed55Qf+zyf4tmwZzBmPz7BisgagXHW2QHhCdw/R6L3sid4m
 HnJPr8+IH6gyV7s8rtUJVLJImgJ495iS9vziAi328myZSRS3NjFllSR3IYkdwjgnXOHgWtYTbau
 4GUlpviCm+QmtNUAHyKzm7LGUNZsQzrtIigRBlx2oqktTVRCSLB7mGcLj6/GlI8SrWpa+q7CJCW LmkHerMGT7PwnEg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GiOAZiFmKJ3FD_Xi3u2eEE9bM8lVafnA
X-Proofpoint-ORIG-GUID: GiOAZiFmKJ3FD_Xi3u2eEE9bM8lVafnA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX0TdXS1efUwW9
 9Zmq+hUnWTGK30LKNOXxWs+Nhme0TSRZHkJa0zPXsflx0AjVd3Ty21UzlI2lx0vcnwyVDY/ZdMg
 So6KJk736fUqND+8xt4v3U/z5Izjlfpx+I6YJ40SZfTvPe8TnDrZLbKrpkH8zhBfC266WL/R/jK
 iXtqYsqRo59zzNcggVayKXaw5xbBtbu/ou18HXbBggmI6H6u5KncBX6jb/ZlMudWqNk9AMQ3bTp
 KZuqWLtNeLp3jluKC1t3hHV4AFBQcD3910Y8PkW1L3s0P1YgCPP2O0ZNE/tDmvCgc3iQ6MX/imR
 LPDJyZO/QAl7ItxQAgBOOOhg13A/Mg7gSI2xQfqZR/GJgicLaNDtBaXXVgf+dP2fIVAx/UNX4mU
 R/URaGa5kbVxE502194Wu/tbGSAIYaTvtxUBt0qyl46nTcIQWjHqycal7QqONsIlm+D8jpZYkBT
 oQ7c1Wio1wMhUD+7Tzw==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b0313b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DPh3dRPQxyF78rqZMbEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX7qO5lwyYz2LC
 wLg0Yf1eg2ltHkN+QPCPcxBwZD7Pz65o1D4eEDYMk7pXcd+Fx6XYszvKqNrjrbUhPyhWgiiDvp1
 H/MoHRBdA9u5P1cpMovQWLjU8ATUstE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_080927_223057_67EAE8A2 
X-CRM114-Status: GOOD (  12.41  )
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

Bindings which reference dsa.yaml ports and restrict their own
ports to specific subset (e.g. with pattern "^(ethernet-)?port@[0-6]$")
actually silently allow ports with any unit address, because they use
"additionalProperties: true".  These additional ports are incorrect and
should be flagged by the schema.  Solve this by dropping the unit
address from the pattern completely and adding proper constrain on the
'reg' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/dsa/lantiq,gswip.yaml        | 4 +++-
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml     | 9 +++++----
 .../devicetree/bindings/net/dsa/microchip,ksz.yaml       | 4 +++-
 .../devicetree/bindings/net/dsa/microchip,lan937x.yaml   | 7 ++++++-
 .../bindings/net/dsa/microchip,lan96455s-switch.yaml     | 6 +++++-
 Documentation/devicetree/bindings/net/dsa/qca8k.yaml     | 4 +++-
 6 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
index 89f78a1bc113..83cdd6c80d09 100644
--- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
@@ -108,13 +108,15 @@ patternProperties:
   "^(ethernet-)?ports$":
     type: object
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         $ref: dsa-port.yaml#
         allOf:
           - $ref: /schemas/phy/phy-common-props.yaml#
         unevaluatedProperties: false
 
         properties:
+          reg:
+            maximum: 6
           maxlinear,slew-rate-txc:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1]
diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 90b3582b7619..80cda7ec5cb6 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -179,12 +179,13 @@ patternProperties:
     additionalProperties: true
 
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         type: object
         additionalProperties: true
 
         properties:
           reg:
+            maximum: 6
             description:
               Port address described must be 5 or 6 for CPU port and from 0 to 5
               for user ports.
@@ -208,7 +209,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
@@ -220,7 +221,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
@@ -246,7 +247,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
index 4ed13870ed3a..9cc14aa7b4b1 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
@@ -129,10 +129,12 @@ allOf:
       patternProperties:
         "^(ethernet-)?ports$":
           patternProperties:
-            "^(ethernet-)?port@[0-2]$":
+            "^(ethernet-)?port@":
               $ref: dsa-port.yaml#
               unevaluatedProperties: false
               properties:
+                reg:
+                  maximum: 2
                 microchip,rmii-clk-internal:
                   $ref: /schemas/types.yaml#/definitions/flag
                   description:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
index 9973d64f15a7..36a7c81df747 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
@@ -39,7 +39,12 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-7]$":
+      "^(ethernet-)?port@":
+        type: object
+        properties:
+          reg:
+            maximum: 7
+
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
index 517bc4c00de3..17e3c00f5a32 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
@@ -105,11 +105,15 @@ properties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-8]$":
+      "^(ethernet-)?port@":
         type: object
         description: Ethernet switch ports
         additionalProperties: true
 
+        properties:
+          reg:
+            maximum: 8
+
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
index 167398ab253a..3840b336bdb9 100644
--- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
@@ -75,13 +75,15 @@ patternProperties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         type: object
         description: Ethernet switch ports
 
         $ref: dsa-port.yaml#
 
         properties:
+          reg:
+            maximum: 6
           qca,sgmii-rxclk-falling-edge:
             $ref: /schemas/types.yaml#/definitions/flag
             description:
-- 
2.53.0


