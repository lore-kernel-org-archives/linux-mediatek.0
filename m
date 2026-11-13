Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18496077D12
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 16:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ns7/9ecn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROXDoczG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=; b=Ns7/9ecnd8dI2p
	ivJGPEK71lkCLd5Wtvj7YOpWS/Edh1NSI8ozcaCM5oYlK1r/6mwGK83gez8LZb41ZaNh1EoaJMeon
	t501ps9DuFVtWI2R7I3rf3xY+Jq3bDlT6lhXLrS5Dz13gPjwoyDy6PaN5DUhyzmNokq9PI6VUgbb6
	yZ9UAs/9+njgmCMibYBJLMFai2nvmSyaLP4WhHpjB47MyKw4Hib0Qx38B8kQcuWU9uDI08ZJ13YE6
	GsnT5kma5cROSHI7rLdHYsCxWkh3s5DsDwfo+4/u0loo/EhmQBmhLKSKAuYcYesp20aX4UTsAu2ds
	DIXfL9uJAy8PSLQ0zpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuMu-0000000DdBT-1Ia8;
	Fri, 13 Nov 2026 16:43:16 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuMp-0000000Dd6j-0fFw
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 16:43:14 +0000
Received: by mail-oo2-x06.google.com with SMTP id 46e09a7af769-8629eb92bebso43665a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 08:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588190; x=1795192990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=;
        b=ROXDoczGp1m2NB5WwFojpGs0J63Pms16t+guKxv8qqlmKY54LKwmtb2xyBeWLy1bni
         TgTsrcBPEe1s5wZMYRNc/2seTVODIxq1D1xkBsqpScL1wkZEyAAOG3waCjxWkfo2ydh3
         4l0dWSMhMdwK9vmd71/NHGVjKLscXDtBz1qw0znA5hXPAcOS6n7NFLbY2WImUX1XIUYw
         XXFKSeMjYnRR3HukFul+YLdJO6MKGx7C898b6GaFBDwXlqMgUTin0T39R6vEQ7OrtVu2
         8Wf/k2g0CaRELED72bRlQueRJ6YQH+oWqTa9gQIY8G6rinC/YVOl7oci1Qp+gmxC0GFC
         DthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588190; x=1795192990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7HUW+ncuH9lkksRwIY3oA2dBuKo042zJ9HBGsvTacY=;
        b=cfn6z7i3NjyD7e1//6NwGQMS6/pl9/FbNs5Tmlj5AMMN4PwIEl+ZAS8pnEPQwRSoFi
         MIziZ1JV13/dEkvbSMX5iMvWRelrRpto9V5stPBgMP0kaAeEo3B3L2QY15RZdWFgO0uf
         /QYs8IA1+W50Q/AT6nH/jrTvyKvHFhctLkL6Fd3hFktPOAM/vA2lbvOekDMS6lFfGMbC
         vLfOY9N7aSrbrzQ+LIosku6Jbuca0lNLMnuNz1aF/NNOGDlty3+B5uZWycwOOLRFrjl3
         CWeLrSY+N5A+yNRHyyrMKudgFdzsH23XKVVfshxXanHAn0E9YWlOLOBMxmSD8tgS8kTG
         /yFA==
X-Forwarded-Encrypted: i=1; AL+hErFl5VSolF1CWYWwtWx5/++SG0Zh9xT2mu8PYkCxHXo5FKkE7UbrcpW/DgdRlL3J63DGNcmxH4XURzQNa5UAWw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9UZRaFntp8EGtKyBBkz0V5uubFQqvvuFx9QmeLiXMcje+mjRv6
	UJIjBNcCc1V0bSVqqPKij0ZiFD2icK0Hv36/qEFUWERBAaOKQNRMWATJ
X-Gm-Gg: AYBFou1ZhTmouGw0/KrX8kA0dyVB9JT+X9Fn+Es51BWiRLVbYCV5trsUukK2lznOUQe
	N5afWAH3238uMfMlQjlemPHqaTdl0wL9tJ+9VFBDQ7ihwo9OVXXHwaXxoajb5CdDdWzOWzwSBo8
	2SQJAHdtl0PKQxU8l+Ix6ABRLRtx7pAfERSri92OpT3bFQnPbjzN5a3w07K95tND8XINNPnbqFO
	KvaSrTJbjh95mTnUsO2RVjGFgDf5//EUhB+B5ngSAFlihMLZzasEEh4fKr31qq/l/Du/873OtEc
	xncDluNSzbQQ6xK9uplmF4AGKXioQaT5/j/kH4UCNJ/QO2q2H5Ny+Ete7qCQgdjXesGl4tenqCc
	KjDFbQJuUr+bnBQYekJ1Mg2wFM1FrtRyvlh9KezSVW/WUTxQ86fk5C6NeFBRi+fp/7i/MBBh9z4
	VG85meL1Z2J2WYYBdb2QsT/rG3EAgky/9BaerSpBdcMuDlrS0LlXJ3nhf0WjxqJJ72ihjN8Y9Cd
	mm2rnskcfcWUURDZ9NPomJxAQpT/CQ+1gTT0yIpfjRthSriQSJE92iT0tuMUhxSgUWS8EiN7Vfb
	nRjf4C0bjWuIsD+5hzxQuC4AjDLPQVVEiHB29h7QdRVk8jwOlvtZUD9RNSNPMK22h260B8WBjWx
	3JGWy9y4/ZkA+61J7hus=
X-Received: by 2002:a05:6830:2709:b0:822:6f0d:d04d with SMTP id 46e09a7af769-86289866833mr2450881a34.16.1794588190361;
        Fri, 13 Nov 2026 08:43:10 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm2712816a34.10.2026.11.13.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:43:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 10:42:44 -0600
Subject: [PATCH v2 1/3] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-1-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588187; l=882;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=I6NAM91xiG7y4IDUJHiYq0Fw7LL1iEfDMhzdluyzqJk=;
 b=hFxh2nuoCt+M9OhbQICBEs+ke7rF5fRGCqw7H2cvfOLLCmLg/RuSD/8xWWVTL43MjLHeuoI+e
 PTT1VNMJ1OyBTfk/s33BI0jXHT7JcrMz5LW4pwiYIr0wef1T5m2cxBx
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_084312_192319_E13FA077 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
codename suez.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..26f096587631 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,7 @@ properties:
           - const: mediatek,mt8173
       - items:
           - enum:
+              - amazon,suez
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)

-- 
2.56.0


