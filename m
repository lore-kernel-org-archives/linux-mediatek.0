Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED512ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFcYjNN1qXzDlnBkl6i0qfOJ7Ms9qe82BWNfSpUlHsY=; b=dn4UgJ6uRRAb+8
	DUmInZGgKU/zBaO5IH+Nazn0cAcYiIKYbr0XqKKJxqv2FQ6yv9kPRWwaMngZwUVjks4PZNviM1/J4
	o3+U4L2kBjLSL2rHKT5NCh9IVN402C491kh8oh0l6hf+3wFAsj/dRx2qBk4X/5UDnxxslV09zOhRR
	se3kY6JayiU+ptsZwai9RtQdXbsCqt7jqRgaeh8Ue5GHHgpTNaEc8+zSHePyScOohcwoANNeBBT6Y
	6QToXaKuSKBK32BBacNOABa4n4KuQIldLSs+i8jtjQRv27S0CqFIvTdnsIs8MgCbjwjELwp3KRqe6
	teQ1Mov8yOS/wbQfCmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndn2-00000001to1-1KVx;
	Mon, 09 Sep 2024 12:46:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncP4-00000001d9y-0j4A
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:17:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2053616fa36so43979985ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880673; x=1726485473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFcYjNN1qXzDlnBkl6i0qfOJ7Ms9qe82BWNfSpUlHsY=;
        b=iovYQ/B/0Sx9WIRkU05JPr3GgiBpwkW7pdEaOrzwHa+PMpS2vRGCqRclazyYoMTJ3o
         LSmxqaZDrfbo+J995ugwJauvBRMMyL3DZBYbdyCJS2R+Aq5N8B/E8s3Ovk4ZqtW1XK0B
         0NxS1jIqJLzuhPzhVxpfYVZS/pDXyzatlxuLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880673; x=1726485473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFcYjNN1qXzDlnBkl6i0qfOJ7Ms9qe82BWNfSpUlHsY=;
        b=kCQnXsP+WXFsOXLpjrIcq0WiYYndvrP93+5bzHR7EUmN3obJeoWXr6nuY4fDsnDMIt
         Jd7K6oAu3DI9+b1SB2kLpbMzYj6JnckXRP8sF147edkxfvSoHZ+eEUQp4wNkitpBrguX
         +9/Eo+hiMvaBpe7KC4Vxh1A7/I5+vK1grsBTaxWC5n2HPbgdsbEBw5QqDu77uJgcMIKs
         msOEbVfVzESvQOMKq/TJrOF1emaKovUv59apsrOdyH/geMPgYxbHH98kQh9xPhCH5bQo
         y08X8+9vFf/6iQH/K3CHHX3MgoycY+xOC8NvXekGQasx8c4+4T7vh2KaiWdbBS1a5pSy
         lP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRtXRzFI7imJgC80lX6RONA54W0qKxnqXYDV6wfDacxeQUFzWYRjFQ0ygVgKr+gA/HlSHVPybdPQOpQL0PJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3JoABAXs5YjX5cMy/xFNr7a9U4ynoEWuY/UFVb3IbOAi2nGAy
	OE0vc8YsrXIcmgtxesD/jzaNMgzCb5A7bcIkHvJh0drMxO4ZKFTI4tiA3IZRZQ==
X-Google-Smtp-Source: AGHT+IGW/m/QWYy+K8SbOWl6PqefCafd3OQvK1UrzaePRrUeDkDzlOR+CjxwO5NOu5/gsy/3FH/PBw==
X-Received: by 2002:a17:903:22c4:b0:206:adc8:2dcb with SMTP id d9443c01a7336-2070a537840mr96366815ad.25.1725880673325;
        Mon, 09 Sep 2024 04:17:53 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:17:52 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 02/13] arm64: dts: mediatek: mt8188: Specify CPU big core cluster
Date: Mon,  9 Sep 2024 19:14:15 +0800
Message-ID: <20240909111535.528624-3-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041754_229501_3324C76B 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8188 SoC features two CPU clusters: one with 6 little A55 cores,
and the other with 2 big A78 cores.

Update the CPU topology to reflect the actual hardware configurations.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index cdd2fe14effa..788dfb5484bd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -203,12 +203,14 @@ core4 {
 				core5 {
 					cpu = <&cpu5>;
 				};
+			};
 
-				core6 {
+			cluster1 {
+				core0 {
 					cpu = <&cpu6>;
 				};
 
-				core7 {
+				core1 {
 					cpu = <&cpu7>;
 				};
 			};
-- 
2.46.0.469.g59c65b2a67-goog


