Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B575C3DA61
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jul 2024 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5i/RPAEt+X5RN+U7Llg8eBVQiQiZ0+jhsIvicw3bLk4=; b=Cx++eGKQtUlLQvF3GBo81+Ix0h
	cVXTJiPNtgGYFJ9w+0Tp/IKt+mXSpk48qxugF8BludKntcn/qZHXw3VybSKiEog2dktHNufrSuqwc
	jB5Rw+RvmkOrObIcewkCpKFzesdjQUj9dGl3a89IFjdBEJ1M8WvAizFIpLfqozdfEnWFJJKKZ5LWm
	azJwWKewBO9miHcOPxYs+jbqgAdPcEub9G/EeXncQNPTtjz2XzTcuXZgxYGt7TuMzHOFezKmL+1//
	Bm86Gg4fZ67FbDRu9U8m2evW+Ho/grMJa1NwiLFAvtu0cllZWuKun77uH3jHF74QJDhvAptqOxdwL
	hIH2VFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXgKX-00000006fAB-3VPM;
	Sat, 27 Jul 2024 12:15:21 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXgK7-00000006f70-24CH;
	Sat, 27 Jul 2024 12:14:57 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2f025b94e07so26175701fa.0;
        Sat, 27 Jul 2024 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722082493; x=1722687293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5i/RPAEt+X5RN+U7Llg8eBVQiQiZ0+jhsIvicw3bLk4=;
        b=ACXr6HOx5GkJE9Cq4gwoXjHzmclg64evywg744doVdAmFN6FVG/9LeJBb6RPWbqm+5
         MirJfiVOrPguQfOfGvMMf78hP3nXVQMKyB5XIT0oYrIqFit35QsDrKYsws7IN7lqo2Dn
         sEv9SSGHWsacw8vuvUT1v+iNN9T76uk1eOO0QKPwLVIUwGSyRHU0BK4blhzP/+aQ3PjL
         ngocySkldOpXEwuaiRUs84vYcNXEq2cLK0LZNVUZJs9fta0aJCBjJup6m0doqhp9p4+5
         cUnN41s8NFALGXTGa3i0fAwTG3iTf/ZebD4/obmwMjRq5pKlS22cf1pUQD9WV2tFSVoh
         SxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722082493; x=1722687293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5i/RPAEt+X5RN+U7Llg8eBVQiQiZ0+jhsIvicw3bLk4=;
        b=SQ1l8foZPug1n9WvEmx2QAQpPk0wN+wSRldTErBTJrLp0ouCQJ4oStzrEsNRtuC6U6
         CkiU8man5OFN5gOYDdyYPl18S3BA53Qo2d/wMNk0TXuk2YpCdeFehQtD8I6svfOAgw50
         PHILTqHoJTkoQvTckqEiE/n9D3abJoeuZqakGVnCxkEcKE4oRK3jztkUjsqbiTJM64Gm
         6mUI3RiZNYwD7ZBqlFWnvtgiuh5eHKg476AWekSnVHjEAxOBxCvMJUirTD9Ul6SBGDz7
         8uobRToUi0T/CD1r3xJA0wKb43L8IYx9ln+d1Z9kaqA0nzzx3N1S5MXwk13MkQqVTngm
         VLjg==
X-Forwarded-Encrypted: i=1; AJvYcCWck97+uPJk+XVbZ3OfIgIgNKwItfuPKVjz81zt8IRLGCctAHVileNbitI+DukQbO+2w95Xau/5uIdJEdC6CBZDlc1F0yZbse5UGuLnaCTpF0gsszH47qy3RBfYo3SvxEFl1VsNdThh5PFI4ZxfdS+LQWRvp/R8zco=
X-Gm-Message-State: AOJu0YyJxAle+x9+RvScjA0KTiBLcjX4WFFs5hqXcXFBxdGmCyBKPVjx
	VPYzf2o88i6QCIK9590k5aCqgmbfbz61uH93EzrSdOACNdat2/3KWMoxFA==
X-Google-Smtp-Source: AGHT+IEk8TIJM9PpIVUJ/v4T39HeP7HfTLORM7kK3IUCwmiPBpyqRdBIiMVkQeuhuirbkSdQ/m5+KQ==
X-Received: by 2002:ac2:4acb:0:b0:52c:d27b:ddcb with SMTP id 2adb3069b0e04-5309b269d13mr1645499e87.3.1722082493171;
        Sat, 27 Jul 2024 05:14:53 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63590e73sm3005180a12.35.2024.07.27.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 05:14:52 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	John Crispin <john@phrozen.org>,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: serial: mediatek,uart: add MT7981
Date: Sat, 27 Jul 2024 14:14:46 +0200
Message-Id: <20240727121447.1016-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_051455_555891_C231449C 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Add compatible string for serial on MT7981 SoC.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index ff61ffdcad1d..1b02f0b197ff 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -36,6 +36,7 @@ properties:
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart
+              - mediatek,mt7981-uart
               - mediatek,mt7986-uart
               - mediatek,mt7988-uart
               - mediatek,mt8127-uart
-- 
2.35.3


