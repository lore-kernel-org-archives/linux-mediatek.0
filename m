Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BFDECE577
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 02:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ai6i40gtLi8KkfaAdRGfJKbTUS/9SVUXMlQmPGbzRSI=; b=yBWf+VFh0aIuByqH/BCGQhwGST
	PHNNrnIUKC/rxOV3S7+BFhjZmQb6EUbcj03QIVR21Lx43xdiGM/kIeRH0dYcjyybF5Jp6qSZjpvzx
	XcaE8lj0kP03HhMiOsl0AFDiBW7F33dFWYOCiI373cu5jRA4Nl4M2AuPhObv9SA7dt1cqW/nCYZUu
	Cm0V8QU8P2VuQalA7Q0LQqysdgWvLNXjcgs0N61aKG561vwAkbSoJMMuWWII6C3xIO/lytVQCBnDd
	fCcEI5Jqplxm5bW0ZWANWtNKWt/N4dC5XIy8xdwK2s+JbhVCyVLXKcwVAIc7wd6KHlfUO9NSuerVO
	PYkCexww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUCI-00000000HfB-38IL;
	Mon, 09 Sep 2024 02:32:10 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUCE-00000000HdE-2UBL
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 02:32:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d892997913so2507248a91.3
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 19:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1725849126; x=1726453926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ai6i40gtLi8KkfaAdRGfJKbTUS/9SVUXMlQmPGbzRSI=;
        b=h6BuDZY0/x12IQXuvX+QLz/P3PzlbrGdRwhyum4UIZELUaW4TplzCnXpUbDnKpMieg
         i4YDRMvDJKeC7rj1GEbAU/Ff4OyMT21xui2X+WuFyu5E1lPUqb8HJg9NXqS2f3jZO8Nx
         S/E8+g4Wgu0fUtnKMjI4K+rH1XRkmh4a8el6Jw4RL/h7sYvC1X+sHRNCGoy66VHgBypy
         xY6HecNhqE1aLfQVA3QTdQ7fs2W51du68jYFyL1BRj9J4RqvPp9x5e6gEAld9iLajCJi
         M/95QoEVtwE8b1AmBe+/T3Qjbw2loNMt22NyUkP4VHBmtX9ZKeZyiRJuxRJ7+q6t+dj2
         ZFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725849126; x=1726453926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ai6i40gtLi8KkfaAdRGfJKbTUS/9SVUXMlQmPGbzRSI=;
        b=EwGYmYGEl2RGq3eUGvdGNeXDxn0anU2Cfr0DuIXSDbfZQFPjEMgSXQnIS83rz5i/NW
         DAgZRpY0Xdj6Uz5JqlfIqOde0d7R8g7Z9F1VMo8a7cvEYR7Zl1Epej4N3Pzz6qs5sf4+
         DxbaTC7gE3XzhUjFDeqzqPrE9LZh6UOl+xUTOJ+vqzg5Rb0JQQC2dHK9B+A6ylYCcujJ
         54wYwZ1UyzCNxQ9tLN8PPSG20ptvTaIP7MQ95NpJSPne27j07YNLjxPD1BkUrhorkUAK
         nNm3fUQl2YbcQMNsGbXgYrRANIoHcxanlEOCFRiONu5s3pW6WaD+Zonj+k5P4NEIwS50
         1IdA==
X-Forwarded-Encrypted: i=1; AJvYcCVku3LYSZIk9JBV9bL2Ao66yt3xQXvot4+NfKAahL7OcM3OdoJEmlagZe2ZXGUMX2jwFJi3+TMfIWIyW79XbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzATEgSgxwnP1gye7eSHG1aB+epTXvqeH+m7p/7dND+49bRyCzP
	PyfMSxYjrz+rWKI/mMnemtaSIpHqQjBJCsEpdkKoSjrq88/fmXuXUAD7BjDNqVw=
X-Google-Smtp-Source: AGHT+IGgNx7WABZhDETOCChw3HAPeP3YssU06NrA2tHr9bsZ2XDn3kY71U0vqFahzzAqH5lBWek1ow==
X-Received: by 2002:a17:90b:196:b0:2d3:c664:e253 with SMTP id 98e67ed59e1d1-2dad4ef6033mr13296275a91.10.1725849125363;
        Sun, 08 Sep 2024 19:32:05 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db049873b0sm3323645a91.47.2024.09.08.19.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 19:32:05 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: hsinyi@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
	cengjianeng@huaqin.corp-partner.google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	hsinyi@google.com,
	knoxchiou@google.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	robh@kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Mon,  9 Sep 2024 10:31:47 +0800
Message-Id: <20240909023148.1677936-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
References: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
 <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_193206_654271_C7357639 
X-CRM114-Status: UNSURE (   7.71  )
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

Ponyta is a custom label Chromebook based on MT8186. It is a
self-developed project of Huaqin and has no fixed OEM.

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..43a824bee1b6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,16 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1


