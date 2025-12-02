Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F98D1267A
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmNNRl59vgMP8cPlJ3VMqrg0LGlaSXqBEQGyB8dPFTQ=; b=FYCEcAHwHeR8LNdYNC1MSts/wA
	ZS+4tWcrQDqeHnH780JSPL4+ZXTl9l61zWT5JRFDTHUOXlX/AsDfVpS/8iT1hZr64z2d7uHnYITn+
	SRPjIiLXNueEQouBcbiuZRw37JhP3Cxkt1liC5YsulUxm4ckunqZl8l+FN3UekCr0+u+reZaxN4sJ
	ATfWCt+Agw0l7J8LQwT2FlcwiwFtYPqkKIuL8sgJZXKssDxXve8d9uITQCP+5Lf8k4CjB+lPqQjWk
	p1+T67OllP62MOKSJKROcjsYqsvhFOQYGSc6tApsiM9/Cv0OS4nAVIEz4+BoEQvbueRyfrTpDBoO4
	8M/Zr2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYg-00000005smg-2pSC;
	Tue, 02 Dec 2025 22:09:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYb-00000005si7-2pJh
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Dec 2025 22:09:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47118259fd8so59189505e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Dec 2025 14:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764713352; x=1765318152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmNNRl59vgMP8cPlJ3VMqrg0LGlaSXqBEQGyB8dPFTQ=;
        b=gm0pyvttjn8x1dNDwcVzPjEfhtRUZBHOH+qhqK509UHn2SZJ+Ahs8z2EzQeI/7UYZv
         ujmN6v0fWZ1i5Uqf1S+86aIdHlPqkkUsRoVfUzagTmPHizwnROvasS9K/z3wfUzv86ob
         EtVBBc2SySjj9kxEZ0yIJED/78ECgIER1qpeqEKCQ9izGP0a+mXJEQsO3Co2p90j33gp
         /EZZCy7pyCezUf14glw1qsKOjZNvUYGe/5lkqQQz19RSC/56BWopyPm8+i5s3HAKJEs4
         OQu7q4Or6WRx1psqPmKBOpC2JNWQA/bb0f/6ZR/GWd7CsXh4RxjkAswklKLwEp71zxtM
         tedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713352; x=1765318152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmNNRl59vgMP8cPlJ3VMqrg0LGlaSXqBEQGyB8dPFTQ=;
        b=mlk70iyBnltUb9UcGcnOMuONLgjbAvNM5BbqIbbYSwozJWKPtVC4sLii1l+EkRg8uF
         txe3QCretem35RY3PqxsLCB1Mm5kyKOReGItIctuzpFZ6xqdzciVnuerpk2efmlqE85B
         xAmZYSov36b1j6VxIe5pTme/Z4/RJnGVwDn+1htE7P1hhtPr0C2c9oSZSx5ROOjb83Lu
         1Ab4HD9SXZ7ZpMiJSL9HyNfgLaVtCXpYf0enD5cTtYzvD7ERE43YxM/cqCBtZ2os51/Z
         eX7SplBHt9M0s1OuAwNcIuMEbUTVVblq0vslu/sAJOeJQ0TNHlYLtujWDE8BLFkmL2Ru
         6i8A==
X-Forwarded-Encrypted: i=1; AJvYcCWkXXhff1E0r90mT+sZvD9/jHaXhGDBk21GDvD0fetmWJFjCU6oYPNKZCXuzwwLTk3Q1c4DNORE58Tt7mBK1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDFDBhrNIN3brH8uEAIqeT8hwNpTfIuAUNoEQk9RQ8QV35anYf
	d8HFdJrDCekEqVClh8W9UwFHgbTyHs9ScSfPqdVaCuIBvUsV9WmptIo+
X-Gm-Gg: ASbGncttqmUgkmg5Augc7dQbmSbYWbZvVq423PgbbNYwmFje79FliSTZbiTTK79755o
	q3Sc2YyxDsog0aGr1jtUMnfX648zkuX85Y4o18halBLn4fd062NxvL47lW7XP8D+ac6yuzW07JV
	wqE0cmqemogJAsmK+0sjEjxHlx45QW1WoFSCXDeR8wTq4CDc2vEapefaybcQ0bC/8r4tbu/HkBW
	pSSabtUZKtmwJJnHJj3GLpckKBfRlOteqljgQN/sBOtuZpwAc4+nOU4pREapj5lA3j0KTYjefEw
	lHTkZPGS755UUliFxws6BHP/0xesVjxJCmXzzZvPFOk1ORprhIzbC5VGsWHeaHKhHKrcwUQECGd
	VewUKeOG5Idr8H1c1MuljfY5u21ytLdI9ja/wkBlZOf+jseq+7QC4rZM7EFxH7FAKMkpDkO3Js6
	gkdP45xh242DOGSkWiEEUmWUdeYw==
X-Google-Smtp-Source: AGHT+IGcYut1avBJ0RhbMsqBzps8Zu+UKnCF1K3gVzlO2l/t9Cn0eEwJtq7isEezD+hqY4z1vphezA==
X-Received: by 2002:a05:600c:4448:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-4792af327d1mr1552995e9.18.1764713351773;
        Tue, 02 Dec 2025 14:09:11 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:d253:f5eb:2f9c:dde7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79760esm11534795e9.3.2025.12.02.14.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:09:11 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 02 Dec 2025 23:08:46 +0100
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Ezurio LLC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-review-v4-1-93f5cd2a0d4a@gmail.com>
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
In-Reply-To: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764713347; l=992;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=frdAO3Hz729tIcyTYD7GFdGupWOs08m0/yUdMpYeKN4=;
 b=bWwx0WQbvPFn66LUG5ddmc7Hwf45SFYXRstCUIQZC9ScvBFH0x52snjIbVMGVjU64S8Gb/bg6
 bN2AIKBcVPfD2MyQzbytFb6AwnsG583uqQYdSOrRwSaJV7lodfJHo0/
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140913_723921_2EB5F73F 
X-CRM114-Status: UNSURE (   9.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- None
Changes in v3:
- Added missing Acked-by from Krzysztof
Changes in v4:
- None
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":

-- 
2.43.0


