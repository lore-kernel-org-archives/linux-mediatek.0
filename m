Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619CEE6FE49
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EbzoF2CIeQ13tOfcxQzqTx9tox0wQ/Af1PggQmUsF0=; b=euJWIENBEvf5yz0gFa7jcKWYiU
	OX0JWrj7LJNaHl6HucoZ423Mt0o+oU3ayij/nwMdlb9ngtlaRn6q9IjLjlHD7MMo7hFrHZ74ki41Y
	slgcIU1Jcp4yoztdDwKLn1CFGEcIvKukUfKPv9Yvj1vUjWHf81meTcB4Z0axcrUqSrpx3KVveRtK/
	7aNZG2gjgDTXgGRqNWh0fb9tqMVSy/dLOUr/R/s7Wo9Di4A9o7r5csuvFZq6F5uXEyarnz9UPcUJq
	s8u2Rroy9j5ihtJi/tLBAVyERV9sfMukKZgQeSi6y2KP2rX7DKOfKi33D+zqdlpJ4glHFOb0VJ81x
	q7PFOwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYtu-00000000qqT-0UFf;
	Mon, 09 Sep 2024 07:33:30 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYpq-00000000pI5-07Oo
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 07:29:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2d86f71353dso2702679a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 00:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725866957; x=1726471757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EbzoF2CIeQ13tOfcxQzqTx9tox0wQ/Af1PggQmUsF0=;
        b=eG1W4dLU2ZEt6NO5vZ+1Itgzkp5ppyO8GWCmibD0QeMZ7QrPTHLXWYCND0ASVINO87
         Qk1YjKnb+euHuwwyhc+AuXx/2P3PM3xBeXde9XvOFzmcyAqDNR2JT4Yp3xyCTo3uLwj9
         xQOCZ1EqKfzKYVCmBul+FZ6l4u01qiubCfCPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866957; x=1726471757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EbzoF2CIeQ13tOfcxQzqTx9tox0wQ/Af1PggQmUsF0=;
        b=Ts1m/zd0IXJYkL59nj7BibbUTwhIwBD93eIMKhu+GSP4a/YdHfWHDF1wwb1ZMnNZM/
         fV2aO/7bjpp4ak27M62z6XJopposvVKTvJPLOGIbEabgAJUcL+KKjKe2JCO5tn+IYPCr
         8P579O5yWdMOyVnr6yJrTEemd6NLhsn6E49xz6J2n/97YSRTBaMiqwbpl4e0WsqyO5hB
         D0qwmwnMzKwn5KedB99fsXrrqLGQphB6Ra8NswCAasEyzaur5Yg2ycxxEpeIasQOAgEl
         JCsCQykrx0R+Ue5FZITeYgCwKk2gm9PsObFgMbCoIUO2QrA+rkv1OjJZ/GSUcn1OHNxe
         mfSA==
X-Forwarded-Encrypted: i=1; AJvYcCXL/VgymyvOAQIoX3zcPFfw3I4FzLaXJ2ohBwhqAYEnDFgxBkqQ2qsIrqkC7zy/9YTutTyfaWSHVtyLxRoVjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXEDXSQ4ciKFey+X2gZ/i4BE/znCJL6F6P3q5+CHJr6M+kB+ni
	RBhDxCBE5V+7SU8rjEExurCKo1HEELLJgCEATA9V7Hi5qzFMmw6mLI74o2l+Fw==
X-Google-Smtp-Source: AGHT+IFjL7b062+is93Jx29/CRZIbtK03YhVGX1Pg1wS2Fwc/CY8oz/ekfV7ybVyzECSpb0riIOWOQ==
X-Received: by 2002:a17:90b:4a46:b0:2d3:da6d:8330 with SMTP id 98e67ed59e1d1-2daffa3a743mr9135392a91.4.1725866956638;
        Mon, 09 Sep 2024 00:29:16 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c3c51sm3841065a91.21.2024.09.09.00.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:29:16 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 09 Sep 2024 07:29:05 +0000
Subject: [PATCH 3/4] arm64: dts: mt8183: cozmo: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-i2c-delay-v1-3-4b406617a5f5@chromium.org>
References: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
In-Reply-To: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_002918_361205_FF2BA8D4 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: 52e84f233459 ("arm64: dts: mt8183: Add kukui-jacuzzi-cozmo board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
index f34964afe39b5353de7b17e82d14d1fba88551ab..83bbcfe620835ab6d34cd2f4c2183fbdf11d0909 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
@@ -18,6 +18,8 @@ &i2c_tunnel {
 };
 
 &i2c2 {
+	i2c-scl-internal-delay-ns = <25000>;
+
 	trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;

-- 
2.46.0.469.g59c65b2a67-goog


