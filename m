Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C760A3801
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ltiUZr3A;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bQ8aDD7R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=; b=ltiUZr3AoMr6mH
	U7wHFe3RD9LWDVfsYSppo+JZ4qLsQ0rFuI+7kP2CglMkiuud1MTPgJzSSi/Faeo8gjz/Pew1n2E3m
	IzFAHiQUqmPy4ly3oYFwXQ+ntY66sTDh7UfVSBvH2Yyk6DzhTKsjmn8o6tN8fprqLCbutp7Ff0XV1
	sq5Kq/VH+zNDqVozKDDagiUlDaKV6H4KaLKRT5NP0sn3eO3QQFh/sc3JWTrkxIqXhnhCmAkrrMQW6
	taBy7yvk+RcNbHfoSRVZDfXV1Llw/w7BPyvqyCZkcI7+p4dohnS3YoJ/gecflFe2XQD7VingvIuRD
	qtf9UhgEfpRNMVivuUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvc-00000007OHd-1vhT;
	Wed, 11 Nov 2026 18:20:12 +0000
Received: from mail-oo2-x00.google.com ([2607:f8b0:4864:31::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCva-00000007OCK-2xcr
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:11 +0000
Received: by mail-oo2-x00.google.com with SMTP id 46e09a7af769-84e8a9fae57so1752029a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 10:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421210; x=1795026010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
        b=bQ8aDD7RcQgYJSgmu0x2TR8ytGFEDFMUDdx34Yy7/bpKXmjNCm8aMzaTXztuVY0/YJ
         L9J3fvRQH8jUA9lXPhRaiQYFB2RgHN/dYTdiGz75lHdAZ+zUuT8h/wR67UkPLOFwwMWA
         PMMRwkVa8+4/HlVUQmTGFsa+G0Lw7To1ekJ6xq9zmieFa7v878tXEdybdo/ch9wqcN1T
         S3HB2AWVKbRn1+vG91m9hS0HOu9b8kJWmStjDBnjzWv4m32T+aTKnUOadFV+yvQGbekr
         IL5+sGg/nliWL8TaQLiXzmoFWlV9FEv0GfkcD3PcjzdF96GI5jaTvFOzYq0SQW0iBR2y
         5rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421210; x=1795026010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
        b=tLJ08wBK0DZtalWxqFPrBEr7Wx+BcXK9jplWbwUQqShEDtWDvjCJWQuNcJDGrUnCTg
         hnsiyDN4Zq5kZTgLtysdUvUwd+Zg/8HVhCu8fHSW93b3kOheZCAoN9RvSAkAgEMiBgbm
         ndakgv9RTeXwrYjGYukiEAuzj1ScbPRtBxErF8tGvo//PvmGDUyoqmCfjbEvAbLGd+YL
         ShPPGxwsBt3+F/ncrzPZ52TbF/AcyhzxzNaheRlKdlSsfQr1eXOI1G5Vez2eYHlVS4/S
         e0oV4G+qt5pFbQ6MfhPUuFOAdU+q8Hx3lI2b9UyuRIejshyJL0WMgLyNP66Hdl5XDhYh
         Vdrw==
X-Forwarded-Encrypted: i=1; AL+hErEebeFVG1WClidphQyTbDgN3SW3QQAP8Q1C2M1D7kGrfRWqYjDaAaEw20QXjeiN5VEOMYOUheWtXvH2Eg9Tyw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZFHcpwfH1nPtcPdxnxAwfyG2x6pvcScIXi7toItW2Z6aE/hke
	IF/gDKsRflMjk+8v5t8MQyfUltS6HkSkoQYfS5a5s2kyWFwZ7+t0CkZb
X-Gm-Gg: AYBFou1WY2z3SVygY3suTqv9Of2HY26nrM8kCvVWolZmnWbkZvtnym4A4QH9jkfBdty
	CK53+ueE4Bkon40ibvyNkiGkQKFc4lyp0iemPXn8hJgWZ4R37muAPAiSpj/xRiwE2BxHn2nhZJr
	jiXNtPaz2zqIdCYDsv1+Rc1wwNsjGGmUneT60hyxj/q9KjaEsIlxwa+hgcC3S7yL+6lwteP/xpQ
	jMF0zkaRuj/E5Hry7skYmDtvxEM5DuKJRUA7vet6UDcXtvnXh38LNdH/cu+9RCJMFbUr8h8hz2n
	yqrnhXRqpmqBYoju+FSASpQC2ZrrKZ22iKW3ymBTflVxBZ8+alE4rsIXnwNsM5TLdvAnFlWXgiO
	7ER8m62ZD/kzLti/wYcbg69O8vOIZUjli7/0obT+vU3YbPF5zxUJMDJusUiRwl1SEsCZaoUonZv
	vtyF6/gCep5peBYO6tnCtI5TO6xatgmKtbT94/+1l186SxNN/FxCN8OjXMuQ5akMZMHLteaEzo/
	9L56WM/bns8dsvE9NUdUEf3bVovAor2z060LhM9pnJ4jG+dIrn338S4piz788XAKobJNkHMaiJG
	j9ZuPB5Stp1jlWvY3NVAMq8+RKtkJnbEB8IunB/HvXgwLWhBGjqUl6F9vEaiGa4w/WZSTdmd+VD
	4YNPXfKanJgD/ZdGa6+U=
X-Received: by 2002:a05:6830:2b08:b0:85f:2832:6a9e with SMTP id 46e09a7af769-860f28162dfmr3039526a34.7.1794421204976;
        Wed, 11 Nov 2026 10:20:04 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:04 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:53 -0600
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8173-amazon-suez: Enable the
 volume keys
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1176;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=LLpoR3iw1kaqxYPJDFxiXt3CwLjEI88IEyMOU6ecomg=;
 b=EIrYCD4qDZS8ejbMBRlTKqTEnwo/3Ulc5Kn6KPn4xB1rCIw+hZ9UrVfNDVz0yk0KNiQToEl33
 BPHHMIEBaerC5i8AxGY8qWMSsqKkkjU/ywf2pCEqkga00yBk0Ibf0c9
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102010_758891_1D878A3D 
X-CRM114-Status: GOOD (  10.11  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The volume keys are keys 0 and 1 of the SoC keypad. The controller
reports a pressed key in every row of its column, so describe its whole
8 by 9 layout, which keeps each reported position inside the key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The key map and the debounce time are the vendor kernel's.
---
 arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
index 6fd7777eb491..7dc0d818a44d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -250,6 +250,17 @@ light-sensor@23 {
 	};
 };
 
+&keyboard {
+	/* Each key is reported in all eight rows of its column */
+	keypad,num-rows = <8>;
+	keypad,num-columns = <9>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)>;
+	debounce-delay-ms = <32>;
+	wakeup-source;
+	status = "okay";
+};
+
 /* Consumes the VPU, which is disabled below */
 &mdp_rdma0 {
 	status = "disabled";

-- 
2.56.0


