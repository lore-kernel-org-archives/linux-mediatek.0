Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37020C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqTmB5jJJigDstoM38sCow0kACV1AHJw9siKMhzzg9E=; b=obHQJMFbwFp9elBWSGHLLuZCGa
	6lvN1FrCKyOKIIlD5PaLqtjKpLg1Dek9cAbXW9ppKmR4aoBZ4oH6DkUJ7Z1TsToIUUvgtUrSAm5hy
	WX0AwpfNIGXN58Qaz8d0Gdy6pRX7uvovSH2desVM1ou5W3JxvzeNMNM5i21AJ/1vw5I5ucNjd9/Yv
	CsIW50iZq+/XthtW9aZ6jxA7lLfGJ+FrXVA8N3PmRjAt6P7Fc5aggKO4swqyWUsuAkfPnx36foJ3t
	hGsbRrjmC3EasQ0m9cP/usdyLwzGWR6C98oW3BVZOWIuAUyDNzqJDxHO3Zk74eEX3xle77Qlro8LH
	K+DOAOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbk1G-00000005lNj-3kgu;
	Wed, 07 Aug 2024 17:00:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbk0E-00000005l9O-1sXi;
	Wed, 07 Aug 2024 16:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E4D0CE0B3D;
	Wed,  7 Aug 2024 16:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0FDC4AF14;
	Wed,  7 Aug 2024 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723049947;
	bh=UaXsUImr4cKQLdcaF51ndcRhHmrNsgo83nIbIG1E5Ig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f35MBkpFG927SCO+m+m07w+y/dAnVYMbbqE+rpwkgutGoyWHqJefehCHaZgA6NiTM
	 OyGQp3qbjLEq3MBE1E7mEWJS0vtGTdzei9dnDybUB7imgenusB/AWpHoqV215qLRFE
	 Q3VJgRKRk3vbvl2dag2NAC9gbhIhDGyqkaAEePG3QlRQCDc7/6BjYpnW4EjV6AqYvO
	 kUCwqf7nba468TMpEyElqMO1Xf/r89YLcuARm6TrkdTwV6mzG33DDL/a6zOQT1cZG0
	 kZpWBieQs9SFn9/pbeD9enjFP//dIU/nwKro+9xfdXHpaWl4ZT2IGf96MASyL1V87h
	 10EgUhONazO+w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 07 Aug 2024 10:58:53 -0600
Subject: [PATCH 1/3] dt-bindings: clock: mediatek,apmixedsys: Fix
 "mediatek,mt6779-apmixed" compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dt-mediatek-clk-v1-1-e8d568abfd48@kernel.org>
References: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org>
In-Reply-To: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_095910_698933_B2C3E966 
X-CRM114-Status: UNSURE (   9.76  )
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

"mediatek,mt6779-apmixed" is the compatible string in use already, not
"mediatek,mt6779-apmixedsys".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
index 685535846cbb..db5f48e4dd15 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -35,7 +35,7 @@ properties:
               - mediatek,mt2701-apmixedsys
               - mediatek,mt2712-apmixedsys
               - mediatek,mt6765-apmixedsys
-              - mediatek,mt6779-apmixedsys
+              - mediatek,mt6779-apmixed
               - mediatek,mt6795-apmixedsys
               - mediatek,mt7629-apmixedsys
               - mediatek,mt8167-apmixedsys

-- 
2.43.0


