Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45357606A321
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYp9E4QC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oYFi0v1n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=; b=vYp9E4QCoQRGOC
	M9ha8qw8ptCcnXHrWiZPPY2rLfFq6LCDvTvxc0rprQR7gd4sxDYAeiSP4zs8qx8fHFLyCtry+EA0t
	x1rMdMSoG1XItp2KmCaBCewdAdg9XGSSbnBFoGlP6x5AfmE/QZt7gDzK9k7b2uwzyZTPuT/0mpi6p
	9l8TKV34LaU/SxFmnOVh5XU3A1mHv4lPmGcEWILp4821SxNKcFhq8Vqof3qUosJUZZFQu2LJcFB2B
	3zl/kv3o4mB/g1ig9eynyWEvIqpQRdaPPdkGtUexC0jbixxDRoYcQtxpspUEjbXvoGURu9UaXJdKR
	2UfwJI7cdGBhSQJs+w3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS5F-000000037Dg-3Xxt;
	Mon, 23 Nov 2026 11:19:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4i-000000036ir-40ru
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4cdc606b47so530217266b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432747; x=1796037547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
        b=oYFi0v1nv37SWlpLiXRsdZopHSk5G2l3yXle3jtas2WZlbcXd69tnZbSogm/GR+/T/
         voUiZwA+FTXKTVhsT+dTAKPFiWrVls7FmO9gyKZ4dYyODlUesvGydXJ/an6cKOyBu5bt
         SA7gNaODtlDfXKVTvpJCUbazWAGESsiTVOR25vsyfXrUAOCrPUnYGB/m6mzpVZqh6000
         zvxIyZbBUfM4zNVwfn221/0njEbU6YQMF+XuVH/bzW8a6vsaOnuGwArgY1qLYZ9XJM83
         C6KpjqlQyhz4qvQ03s5L/GXGUmSn11czG66osUv01xMpLXqlT+awyYCCcmmNT4NRAN0X
         9/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432747; x=1796037547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
        b=nt8kQ6wLU+PtGcJITk/1xFanqKRLsmtkERSb5mWlPqP5NLGmAJwgWDYc6F++M5CSxn
         1tpOrgDZFAHRXKFN961Q+KFXKOeKOnoTeZG3RnW7uPqPjzr5JDOmlePYse7rYGq9m+rg
         muG2859GBGJK/FR5WJWAX/TaUqpOSjcm5lrTo/Wvv+DVl6aMhmJG6Bj/DzAKsEU5pSu+
         Srftzz1ZEbx1P148vhCa5n1n0yIclOjr5nmZDHqjaaGPubB86dR/jLwnJ2A179QF2Ckj
         cYkxHqyiXPtuQPJbJbnqArW0TeIRsJB44JYyUOPXSgAz6Y1q3W2XF34/IABqsWDPKjIf
         1K9Q==
X-Forwarded-Encrypted: i=1; AL+hErHMyYOZ5XU9xhR3chO1mCsP6DTqd/TpTb0ib8LYMw3+wghr6wxHV5XZVOCWdMtRtKgoRr1fFetF5eMu7xzNNA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+YZ3c7CFkwLavpFFMaD82BkiFwo/PbLmHsC97V1aer4keTqYyz
	HpSfLRYhgrzXuGtFrCAjTs9TsORe2JXmTmmpI+U7zCRwBCawSiBLnLpI
X-Gm-Gg: AZFdTZfJvQV5FUiEt4s5VLFI/fwKeodg9A+J3y0+f4jVdQpuiDHlaXOKWEmXJGqeThy
	s5J9nI8FTE/kGV53iahPGpqrM6PtQbVqEXyEySqX+zS8S9kcQ9/qDuxNIbA6D7WjY+kuPMZAiPa
	tMTXcZYc168ZKxAAXe9nKNkh7v8NXWVRnPKcHSRAKoSHSYyej4V3DO8I0j05qPGDslEFS1C3kVE
	gkH5fWB0IvvHBZpywJU7RUBqI9IJO0ywTYi2FayX2ODk/Mrk/w84qQEkFTT5vx4NXpCXIcGVIyT
	A/BHI5b6iy/xmWhcKM8OLSz3I8Mdt2VkuPEmKti/ilvemPjQDUe9PePTgVYRypWADZYRef62BuX
	9Lbn0dJOod/UaAyPiZ+N+na1lw+H5XdpBTqD30wA37gFYTl+9fysp6XeKkSG7WfHKiyLAWfIuQq
	q2zXZSXhNuMkxBX07DwziDaVsanv/RVrm2Yz0cuDEUCmwXHJQSJVvYm17AT1it58vG/nUCd8umt
	TpAVURyZbveTPA+6KkqGYun+9LYJE77DtmnjoBJBWuyzK8CB3Vy95rwQBq1S/DzpSvPtOA/3itg
	10YDwlFhv8Izv7opkMt0Hot6wdNx3YAWrlG2GHKDDl3cN7LLjm2zmUQqTiv3l/ASvQ==
X-Received: by 2002:a17:907:1b1a:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c513a5ea1b5mr863152766b.11.1795432746902;
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:36 +0300
Subject: [PATCH v3 3/7] dt-bindings: timer: mediatek,timer: Add compatible
 for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-3-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031909_006475_A70ECDD8 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..ee4af54c29b5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6895-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.0


