Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2ADD1625B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/b5fPLxKnk8ixP+B6dTshS60Kk9g27O3Ki9J1RjhYRQ=; b=wsSLbipe8Lqduk
	FtkiHhg/Juti+X8pL2Imeva78NVOKEFFeQCCKmTok4RXCy/uE/NELTrfeOMyL5JdIHYdu+CtNNncG
	BGYDHAK+ci6QBjUuzJMAFpzex3h8ikq3d2ZqMz4qKnktMADHElbRl6+/S1OIZHtIfNnKnMf4KY5qr
	h5jRlxTVvx/btFiEMWpWVAwppeU4ktwp1yUT+Jr1YEOcZweX/YHKQvN6rO7pe34/SDNtPrQQZTB1a
	2XGSWQRb03gbQlACCS0oJUGtlrP2HVohNBnTM1kRp5ea4/lDCTjYhA9JOHAR/xin9CtDEqfhv2pEX
	Xsc/MuUU2CyIyHG01zDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KV1-000000058L7-362Q;
	Mon, 14 Oct 2024 12:48:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Iyq-00000004rMO-1kdN
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20ca7fc4484so16719715ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904276; x=1729509076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b5fPLxKnk8ixP+B6dTshS60Kk9g27O3Ki9J1RjhYRQ=;
        b=PsHTpEeCAQwsFloxSJhCo1N7j62XMndLuznGSjVq5jtXBFYUNgfozeiHtPs8/Z6w5Q
         AhUk+EdE/PUiTWKBrbohiXRQ2QU7THbUhmSGPHQST0DSrnIOIQ9tcLvhwf+vhhpUEzqX
         7l/y8QAn/xW49JPFt8W0akTogO6XGA3RrNXEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904276; x=1729509076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b5fPLxKnk8ixP+B6dTshS60Kk9g27O3Ki9J1RjhYRQ=;
        b=dt5dxcdm+uudh0LEY7Z9vRFBIaoVJ/GGeNuIX+atqk/yKvurUIqPSSigg9vQfziTjC
         UZ3b2w80ap8QAWz8TSXWv0TIueOCNBrgZY6Qm29FyGU/9z7nPMBTH5L9MImOhDgeuLs3
         epLmdfAldFiz/umpFXaA7CRkNzIkbKxv1pjB3VMZohMp1qx4yxB9AHMCL8QYVZq0Xwsj
         l/CsoKSx5mhhtB3U1/cdjxx0/SjDZeoPjlPMdD3N4o+2bjervdbgtE+nRBQniRMma+rN
         xNt3xS1n5pG5AAveFu7eEo1i9jIlwxgwrdMd/UefAGzED5ZKTe1Q/cQZpi/Njp4hmTiB
         tEWg==
X-Forwarded-Encrypted: i=1; AJvYcCWV83Te3T1MuAbFWpX5SiJVZn7tEjheGUr/aLQQ0zFVMvCGX0DJAHCntdWuZtAsDLnZqAoENhmdh47se4KhVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6ocDFNky4FXb+JF2wdiJgmDPpckSjz/TEAIqALrSFmy2OrQy4
	ztq80VQvmiPtodOA0vYei9mfCC7uFJdMkYo1MuMjyS9Tf2zbRQ7Yg1B3F90GNA==
X-Google-Smtp-Source: AGHT+IFDRAoJ7Z63lA0MZEZ+CdOcVFusjWYuKIU0aUZ+jje6f2o/eSKpoKgYTvF5qObMc6WriIpZSA==
X-Received: by 2002:a17:902:d48f:b0:20c:f9ec:cd8a with SMTP id d9443c01a7336-20cf9eccfcfmr31699065ad.7.1728904275775;
        Mon, 14 Oct 2024 04:11:15 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:15 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 1/9] arm64: dts: mediatek: mt8188: Assign GCE aliases
Date: Mon, 14 Oct 2024 19:09:23 +0800
Message-ID: <20241014111053.2294519-2-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041116_569916_94BE1534 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Create and assign aliases for the MediaTek GCE mailboxes.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index bf15ac9901da..10195a4e4e9d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -23,6 +23,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gce0 = &gce0;
+		gce1 = &gce1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.47.0.rc1.288.g06298d1525-goog


