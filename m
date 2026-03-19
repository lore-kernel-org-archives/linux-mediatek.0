Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788881091912
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 20:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EvqUQZCqF37oJV9dJzcVxfSOLY81NlMRRK2XtKQH9vE=; b=cUENBio2p6hRLs/ffKWlZvUHXc
	4fTQTVcIA8fbk16I8kQf0Z5Pobgb+riHOZ+Oi1FvSOK8wFekITWlN52MPFkFUt+t5agRQFHujhIfv
	kFQpPQ4rzwiKMxH/nsOGdepMfPo/WqhoCp+nFXUZwKqOrmDAsoWM2GmpD/beHa04RgYbvvn0+PB/y
	+PxKBOuhb6Y45cNlnkCAkGht7kYPkHcyclBwpjnGz83+9WdUpg9CtDuLHQK61YDAxngtOpsLH6x5k
	mXVz2HtI/oFlYY3rXE+bJL9c5ACfkoHwCAGF4x9d9npPJ1hYqsURivM4cmSJcjs8YLpsTfKW2WN2M
	CIY3igCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K75-0000000BXxF-2aHO;
	Thu, 19 Mar 2026 20:37:03 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K72-0000000BXwN-1pUk
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 20:37:02 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-67baf20e8c2so534914eaf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2026 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773952619; x=1774557419; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EvqUQZCqF37oJV9dJzcVxfSOLY81NlMRRK2XtKQH9vE=;
        b=z9vdw0i5uw+aPzFPYqzaZBgD8X7K4DvfYtyg0HvrJzWfcQCQU3a0p2qE+lZ1Uo1HIE
         IIXuiBEkgtUoWYgMDlFfm68KZYFEXX21204hw4/1CWmfS8oH1mHNZELsjNulwUgNkQOP
         VGOwoNqJ4zH65Ebfg2k93xvDBMS5lHm5kDUCRIsnLUIMFcqgkBc3AbBS5LNJTVHgGegx
         9qL8yTF4XMGHLXi2QajCzK+vUtoMrHiNRmGlM0eu0x3SKCjO2EWH2oRDpEN6SeV8MTKv
         bUBcyjZcGoW4sxUXI5mCss9bWh6V4EwJ+kVE8xda5PWnN6LQr4BrgYTijFTtWVtlZXru
         1XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952619; x=1774557419;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvqUQZCqF37oJV9dJzcVxfSOLY81NlMRRK2XtKQH9vE=;
        b=aj75Oxfgh3QLgeqcptklHN8P2mxH9tHtGQEHQYF/4kgl18EiJf9Z2IuNeqKIStuOn4
         5Ywc0YTOemsEgMzGtRoBSe2T8SXbEVzoed6NZkjgwyrtfJzzzpJald0BIAB+iLK16yK7
         fUfErOVzKrivupQr4l+gCXwZ2Brs8sCVUvB0G/KSiCqtQ8j1QT5EOUATKjZWnje9GKBi
         PeeCiuv/yGg5vQQK9PADswQihHmSXOlIkAmebOTs4dryEaAHIBI2ZEYiEchID54v1DgE
         cOPRh84EVRSBTkL5hnTpAI1e4Y5ealCbmyoPrOOI5fYLBVVpWbVyZidHTunZPvCdPqN7
         SxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6jFcnEhkPo+/oWWadaZjFZUcKE6VnVMH47N1OwLDTCR16gJtvx40simQ0KXEjanaWMec/mMiK/gyg1C4ypQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdiX3Z2QM7ixZTHvfrFvZRaYPdOyzVIVYbTXGa3XNeUg3CVFrj
	HzvEfnyd/KEAkL4PgkYtP/h4vlExmjONG139l1nrKih1su3DTxdGoRzpphpB+hSMIfk=
X-Gm-Gg: ATEYQzzlmyc8zK8YggQWBjcFtwG9CqX+ZbGSsC72p7Tm1+hHwqUDKZF6uDsdZHnQfJq
	TFik5MG91Oyn40Bq00ElrNakra/Mik+5nYEebEl3MbVanIMkObHY2WOLHqnbRqP6TFnRICVC86w
	ZxxwPsXvS4+zpelyXwj3tABAhyg11zgkEeXX/08U8aZfb1Dje79TZ3EWsf1j10s8VnVc3g5cI2q
	u83nEstpmU/BiXJklK/hVWxjSQBkgKQm661VsTzT7STuQ8yPH8ry0PTdKl2ZkXLjXsB2xf8yrf2
	3mtftc8NjUV/o48uh5QjQWfdUwR4g51KwV9Ih01mEBGxdvFvOLPHrxdGOrC27N3e9ft2HYhHd9t
	ErHN9IOXH3GLnbNsv5j8fdgVpdolf18NCHDI8gh9B3uyd4ZsNNCEpU+p/xL35kCYQOQdiBfnX2c
	1/Nyf7aEh2DKXdNCAqNfj94F9QC7iG
X-Received: by 2002:a05:6820:1349:b0:67c:1deb:4f69 with SMTP id 006d021491bc7-67c22bb5697mr599850eaf.14.1773952619310;
        Thu, 19 Mar 2026 13:36:59 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:244c:fc8c:8216:1344])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252acd32sm52512eaf.3.2026.03.19.13.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:36:58 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 19 Mar 2026 15:36:49 -0500
Subject: [PATCH] dt-bindings: mmc: mtk-sd: add mediatek,mt8183-mmc fallback
 to mediatek,mt8189-mmc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-mtk-mmc-mt8189-compatible-v1-1-fb7ef2186c92@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWXfARLz1VYqLOBl12kYliaUgv
 rtpXR2+xfl3COyFA9yzHTx/JMgyJ6hbBjSZeWQUmww611VeqBZdfKFzlLZRTYu0uNVE6d+MptL
 W1FRaWzOk/+p5kO+//eguh61/MsVfEI7jBFHNVOd9AAAA
X-Change-ID: 20260319-mtk-mmc-mt8189-compatible-a62da7c5dd7e
To: Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=5skePx64WNITX84S4NyRGOGsgVrQRd/nLA8489wbHmQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpvF5i18RSPpFlTkJhXKuRHU1GKiogcHWVUfImk
 AchlfWq8pSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabxeYgAKCRDCzCAB/wGP
 wNTrB/wJp0iLTjLMrEAxu7kkALAuENcVqHfsvkgUSrsHT0Wy0MeoXaG9Cp3UIlJ9gNCXOEoAXUR
 3u/C1no4zCoDG0WMepZn6cHej94IB24DQZVNYdeDOl0OFtEDIuz902EinxNow8JfnAmLwX4w4aU
 RDSkC9kLidPbkFS7CsE4fLWlpRW0eY0OzpN55PuNEq+4jfPIYI+z5k3Qr99oTU+HCCCFVTC9j5d
 YdK7+xKXOz1AGfNSztdM7/NFqDtZPmR/8+baKRZQ01ZnuP85PSnqL5zO5rZ6OVqnVNcCv4ourPM
 WopQsPZ8TelzX2HGxM04ez5i53jSAozyu6LUB+V8ya9GVijk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_133700_730940_2C049DAE 
X-CRM114-Status: GOOD (  12.39  )
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

Change mediatek,mt8189-mmc to include mediatek,mt8183-mmc as a fallback
compatible.

This has been tested using U-Boot and the MMC is still working using the
mediatek,mt8183-mmc fallback compatible, so they seem to be compatible
enough. And there are no upstream users of mediatek,mt8189-mmc yet, so
this should not be a breaking change.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index eb3755bdfdf7..9160e449aeb9 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -25,7 +25,6 @@ properties:
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
-          - mediatek,mt8189-mmc
           - mediatek,mt8196-mmc
           - mediatek,mt8516-mmc
       - items:
@@ -36,6 +35,7 @@ properties:
               - mediatek,mt6893-mmc
               - mediatek,mt8186-mmc
               - mediatek,mt8188-mmc
+              - mediatek,mt8189-mmc
               - mediatek,mt8192-mmc
               - mediatek,mt8195-mmc
               - mediatek,mt8365-mmc

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260319-mtk-mmc-mt8189-compatible-a62da7c5dd7e

Best regards,
--  
David Lechner <dlechner@baylibre.com>


