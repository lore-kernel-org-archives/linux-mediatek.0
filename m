Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAC0C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=; b=MExPakZc7ctZLgHO/PPUTk0ht4
	y3MXr0G9VXDI7I6+UaCXleFTFSvsXpS2jo8L5IUbrybumhIGX1C7DlgBYSBNkiNW/oeKgooN8HFUu
	lqk0e+BvPvMhgjVQYDSIu8+7JqbZEB4vuZag4aO71FQJ3IpUOeBtVpQ3Z5coVKGVDRC/Mpc2GchPg
	OPulupVdCa1DcGgpz3THHPXDZCPvXRjwb3iMSxRTytecZFIT26AnFFKvi8nrMhMmyo7ml9GZzBBb8
	BaakK4v9/bnhaKkPDW8oB5ZNKW6vKl1M3weSV0/VujzX2ptkpMwFSV0Uro0cwF8grxUGusS/05mic
	r5rGICwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYl-00000008efp-26eK;
	Wed, 16 Sep 2026 08:00:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kY6-00000008e8s-2oon
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=; b=EYVSEidn/98LCmhmA2MGGO9aXR
	tPVdoffp+2anNEUXS6eirwUf+a2mmfDRs0TO5XgCfK2dOpKhKPNDD89KFgXBbQZdwUxWs8zqsm/Vh
	o0iKfceVBNp5ynXmEzEd8BQUcp2N3+R8iNEdl71thDUsbPA2066/R4tajwC6AhbPfuOPqZDVg23x6
	F8PG8F1ZTSmq8JkylbxOuuof8q9aNiINGKvzxE7AsaRpFsDMOkpky2bDyYnDHpEn/UInZTT95rR4X
	reRn6liWr29g0lRvHexjhyUQexF9LALs9Mwswf22DcIsS1MwcMaAa8Kr/h83odG/RqTovArzzW6jl
	fm5LzVbQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kY1-00000007bc3-46d4
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:19 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396cccbba91so453876a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545556; x=1790150356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=SCLM4+MH6n1fa+KN+c3dgv8kXHkBDTs+j0fn7XaMgC+aNWEL5Zofb4hTAzY5fGoixz
         ggQSMrrRqOx42noPeaWCcLMYxJCCJwaYum6YJU/bMg10sZd2Jk4ydW/+1i9JdXc9u+ms
         r6rbGGcCpP47tatZiGN4ID6w5Myho6NiZK6WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545556; x=1790150356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=bDxdgk4Z2cSsPPbUiVJmCV/ZEqv23OJNrPefYIWoYWHPHvCuTjAH4iyD2KO1wpp0Q1
         if7QDotWre3OcfFkrzr1wFstgz0AwFYVo+MkTLJH7b9bHlK5T94r4EhUB2zmSFbsj5do
         C5XGVNoDifTCDVkdh8ID+kFZCpjk2ig1ZdS7N82YwM7clRbNyWPp4cH+8YKLUBLHG8Y9
         BgkIOyLOxRYW2uABXCJmYCh5Rv41qrUHxr+vTqjH98jCm2liJe/008cnV//k983/o+hA
         I0j+7Ru1yYNWMgoniJafOz/6GU7+LmVrLYJVrYvw8C+oCLmQ5jii3VV5CCTLRHkhM4/t
         HyHA==
X-Forwarded-Encrypted: i=1; AKwUvBxH4msyplPRljIslWb5kPftLbFbxplF43Hmwb4r8qDLdG0M3QMszKMvO31NwAiMJtR2PiBezVAOeKFdLH5m+g==@lists.infradead.org
X-Gm-Message-State: AFuF++kMb0FWtNHjabUgN2noEjG8hwqTnKxBJGdlaT74VuLnAUG1Zghq
	NAn5xxNiM4TB+6PMLLJLBqj132vw3ifKydTcXWQtI72tNTTnEuZAvv9Gr88TsHf7xQ==
X-Gm-Gg: AYBFou2jxNc3TJpk4Y5VlXblXes3tyQKyPbtXCYap88oIGZRSyya7Ss92klx9dJ7Cqm
	S0Nwc187KemAgiZAeQAHuIVkneYIB53I/ZSKFkWQfS0Eb1PpzZsZiCtpXGOILrdFxau1KhnSSyM
	Jfu1VDgq4tlvC4VkIhjv01mDgpBXP/bUMXUc3QB9FRJ4Q9H2KLI+ER4K4Mi1rjLRL+j4sNiVQoF
	5eSnNVD33c2C8/tHg+yNwzEWl787+H6sNHODMNm/3YO3B1sNFQ4FpV1AcKr3zm+2q43Si27N+s7
	04wrsw4o5eInpcxHehtLcbzE6z3Y6EG2hwxd3YjBMfMHsDf+Eq0X8RqvLjV6Qv24sOrGfYr1tKj
	DPFUYi83T87DNrjwBbqLCQdsEObeDsQ0bxh0grlc48/brttWKPLBv7FMNHCrpvSjd1VAyQ4kLAT
	eJchXJsXdHMKG3XxWALeKAIj6RVrUM2/FieqKyaFub2ZaYKPlWvPlCnNjcdMsGhW8cL0JW3Uk9N
	GO+7Qto4ENyjJRQhaIc/ihbgyZXDi8c8wc7+hHDD50rqfmg3geyaBOeqw==
X-Received: by 2002:a17:90b:4cc8:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39e1e330a2dmr4372580a91.10.1789545556050;
        Wed, 16 Sep 2026 00:59:16 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 10/15] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Wed, 16 Sep 2026 15:57:36 +0800
Message-ID: <20260916075745.3549953-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085918_347204_29C3AAE4 
X-CRM114-Status: GOOD (  11.95  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.1032.g73a4cd73de-goog


