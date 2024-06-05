Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C035C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pPVdkB+pK8vyeCGT+ND71XGGj9LFWm9WJb7b3YJ5ouw=; b=eajb+dpcup4RElYQTd3p10O317
	6bCuelqYzBdFykCqZIqRUlPeMwbHKMRQwbrBddvjJ6ZUHyy9e2IMOpaA9ZvoAsIrZv+QZoPbkRkLr
	QUgjxnQRl1/A9Wu9C6qBzm1kbDcPsfio6z0UeEv8p0mnbwYB6vHiMSHYtSpKqT848bY8JK6dMKKnW
	mdu+YVG9izuRfqTy2+R3RoJMb/MkIjv7Gq24foAa0vW69Oqv03RUZypCL9pHGBdHr9Sfmw8IvEM/x
	pdnosqPrwtGDLEoQElNNVPpk7FxFQ64nxhATdIznh8cHCb9VPlDA0w7ktGIlbsBzJqxv9plJ4CXiB
	0gv9ubkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmQ7-00000005IbT-0Bxz;
	Wed, 05 Jun 2024 08:54:59 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmQ3-00000005IZX-0DIG;
	Wed, 05 Jun 2024 08:54:56 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so2464566a12.3;
        Wed, 05 Jun 2024 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717577690; x=1718182490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pPVdkB+pK8vyeCGT+ND71XGGj9LFWm9WJb7b3YJ5ouw=;
        b=Qp4rYc4V2NYhlfYat+9EwTwc74TDdG5uyszvCCPw/zoXCey2epLvElfFG5Q9rHscbX
         vyFrvQXsFgWWOn52uwjU2+Fve9BgLIerg9AxJrjEARTdZIfsQ/w90maVq668uR3VZjEF
         jHUA6jzVqbiq8BBnG7K31YnoODVv6KfS1WQRvoXRnmsBGI1PWX/rqH2ZkT38yObUrCMP
         JEwsnPf9nHReDptMO7cuCxipiOqQxzJzsgMmZRulVDrS/v31ck9IlgNsstrQzs4fyO/s
         iV/jrorBW1KEZEhiJpPnexEUrOyBWeOXYX95ENreOENpMuXFCt7xobLFD1WS3tiFAlzA
         tykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577690; x=1718182490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPVdkB+pK8vyeCGT+ND71XGGj9LFWm9WJb7b3YJ5ouw=;
        b=c6jEDDMFsLfaA4z/hptar5jfy6Dfn7DP8fVCn9oau8JY45NugyRMtaHrk31Jb/hLLV
         y1JjdwWoknE2v4EQP4zGH2PRlac87o43YGr7ZANNGWW3dv/MH9xqAySxKKTIBpAzvpaj
         HTbEnx1TxA2SKnFAGlnrB7stAUo3QpXrlrhZMNLiuiWSZC2ansxcb42NoE2q/ch57rTo
         MwXxPXbv/Qtz1grCAtcuT/nLKsUpNcmH/BT5gY9FYoSH5YU35Gm6mIihFFo6kb5ITPa4
         kiI9hZmuxd+BWqv/atjXDZHuooVVXLWdox6F+UBs4lObUVmd/Pi57x85Y6898Y1rQP60
         c4hA==
X-Forwarded-Encrypted: i=1; AJvYcCUkdGxA/gSSYsQ5SC+s6lZFePIVwv9CiEZ8ExNUPGrj9A2IIuSiHPKBJk6IFTi78FDOUq7NAqnB8LMWXtkVLRAOZbmOPv7YnsN0xEn5fNwgQMBW+KMuA1coFuHjWqN1NfoqfqFWwXiXHdW+AVvGfwzjlXfyceVA+RE=
X-Gm-Message-State: AOJu0Yxwis7KD18PhNRv/UeO7Om8tLInEoc1VwXgtBlkYAwfnxKjxUfm
	KHJvVkyCStxMeIvgaLbpBRnokfIRhmMroYfnhBGYhonG7lo5ZPtFIp3AUw==
X-Google-Smtp-Source: AGHT+IGqKF5PNj+xnr+4M7kJ25iQkjtQ7GBoDWpJYm9/t1zTf4oATxXyIasJ3eML47Xf5OpG0jY+vw==
X-Received: by 2002:a17:907:1187:b0:a6a:44d9:7d15 with SMTP id a640c23a62f3a-a6a44d9810dmr64892366b.58.1717577689757;
        Wed, 05 Jun 2024 01:54:49 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68bfe84c67sm586249866b.62.2024.06.05.01.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:54:49 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: serial: mediatek,uart: add MT7988
Date: Wed,  5 Jun 2024 10:54:32 +0200
Message-Id: <20240605085433.26513-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_015455_114241_0071C574 
X-CRM114-Status: UNSURE (   9.54  )
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

Add compatible string for serial on MT7988 SoC.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 303d02ca4e1b..ff61ffdcad1d 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -37,6 +37,7 @@ properties:
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart
               - mediatek,mt7986-uart
+              - mediatek,mt7988-uart
               - mediatek,mt8127-uart
               - mediatek,mt8135-uart
               - mediatek,mt8173-uart
-- 
2.35.3


