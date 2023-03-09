Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673D9C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWLXsrQU8r8iBGzoibkZ5OVm/pVG4g0LW7vlYuupzQ0=; b=g8d5NqokvqJ8k7oWZDHSZFvvRs
	uc/y9cgL5IcBG5hwW1bM2tUgArxZh40zQVm2s6yJMhKCZ0Bs7nZuyo51z1DfFEgPfVCbbuaLMliG3
	eHB2/aV8ABT4nr3yes0hb15Gqbhr8IXlBP0IukbHHdBni8utbCqJignmbXqKr+S27Ymyd/WwQDuQx
	dQT5kd7FjQjp8Iy8GIAVZ2rrB7sS1SNf5MCzSdxyQOPdO+Zpqih9o7Ek+pZeYP1o/Gy4PElUKVa1M
	7s5y4G1lw8j+ad88FwC/Z384floJ2qT3mAkXZLzOH+7DAGKBCeeI+FH7kiN3z5GfdFTvsitVsW1z2
	DDaUFFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCED-008hnZ-GH; Thu, 09 Mar 2023 09:06:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCE1-008hhV-E1
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 09:06:15 +0000
Received: by mail-wr1-x436.google.com with SMTP id f11so1107362wrv.8
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678352770;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWLXsrQU8r8iBGzoibkZ5OVm/pVG4g0LW7vlYuupzQ0=;
        b=c9DY57l6BH328f1T/IuGy3UGlMX08fdyv0xGGK71ceYc8K6OxMVs5U7DH6Ds/NteNr
         HLJt9zi9wkF+pZk9PY6jZB846V1M997sQ2np8mNY1siIPAIubeIKXImVEqZWq3yx2Jdz
         39U8oyTxDnBv6ZhHzgjpoIRHWlrXF0uV1TzTmuOR1gOsf2ib5T56EcRv6P24KrIqOy77
         XnImIlM+NT0QPv9dWHDT3XmNt8OhptXL20KveMaomIM8oBoR9LJjRggljwjSdfVJRg5t
         L4ZUGpofa5Gn444pQgTEmLW2bwoOJqStNUYHbW5DSPcqZ0mVZ0X61r3gvNxIDikUcLtI
         vEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678352770;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWLXsrQU8r8iBGzoibkZ5OVm/pVG4g0LW7vlYuupzQ0=;
        b=0+2vjvWgWTAnbuh0c8QMNFbutO9yVqwxSJNli8TujJ5njxCk55+gtBoaNxUMsuna/z
         l0efak4aUxEVo361AVD74tMchXOVSVTJ1D1DD18b9dQmVrdacI6fbt1JQ5iFUYY+7WQJ
         +y61GzT5R2iR/PHb3lshgdTIh518MPohJWe8bGZEbT2ZyXHNupatJWMZqPSw94Z9jRju
         YX3Sepd8OgiqUXsljk91TkSZh4wl1pNRSr9U1VE9QUIw8NhCzrHLAGwusJjlCJP3PSSM
         rcpM9PZ5pZKbQv4tXzpnxHByg2nv1tStgrq/bJU/oIXIa5/5MTMyFx9MggnG3Qx+U/0p
         ptBw==
X-Gm-Message-State: AO0yUKWK0TAMIGdlIdIFfFQwggJaZohpVWAYGUCE3qhr+PGTVD7R4Uvn
	dgf6DbFPrrAJgm2V4D3sAfPskg==
X-Google-Smtp-Source: AK7set/xWcQ3e6C8V9K1no/lYj82bJP03UJ98Zjsnfj7tf47EfzLA58Hl0ucNV55U1teahWwBS6hEA==
X-Received: by 2002:a5d:6148:0:b0:2c5:5335:73f3 with SMTP id y8-20020a5d6148000000b002c5533573f3mr18826708wrt.34.1678352769884;
        Thu, 09 Mar 2023 01:06:09 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id g11-20020a05600c310b00b003eb68bb61c8sm2073243wmo.3.2023.03.09.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 01:06:09 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 10:06:02 +0100
Subject: [PATCH v5] dt-bindings: display: mediatek: clean unnecessary item
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230306-ccorr-binding-fix-v5-0-6c56aaecc3b1@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ane73DE2EH6XTssrtokRfjsFxb/F2uv7GT+5uVVvMaA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCaGACge7X0KLwuoqnZ4fw3r3jhLJMOt67yG9WGat
 LuOxaJuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAmhgAAKCRArRkmdfjHURVd7EA
 Czp7QiKLjtd5p68htZwWE4nDjor7AOsvtp3IS4KjRWv/VRtZrXJsy+RgqgCKe5cf0sGQSlHXgZvm2A
 Xg9ZwbC4WqVxgaDSQi8Ghgzcjg/nba7zSYTdMH6aChuWSUkPqDm/9MRkoNs+doS7ZAs7kwR6M+l9dz
 wnJsH686DmFkjzIRXxVbpTFSqlt0lCj4jzoO2WAsnz7CTslFXqLqSzmFtHaOLps1D5dWTdPHH/rcHZ
 UaNzDgSg7p3mKBJ8VJoMxLT9/FUDvursRQJ8Zox+wFSq8CL6ueKnsqjT18/SK7tyvLNIZ7zRngd0n9
 JMovt8IlYUhN2zmrAkXKH6skGQcKbteBFsKgUssRv7zflF+Hvonghl40mY7mbOs20b2g+ujmwQAOXB
 oYU7ybbe2IJewTR1XEXaEgHmABOyXh5ohHOMypvBe7jh3ZMsl5xacZe0MbZSsrTq+TTfi5Usv41Axa
 MKIfhfXUS6SChFwYNp+jTWY5rCwYFalQaLdh/0FOA3QT1VASQnEYV13WK+3qbF7wBo3bMtGzmSuh9x
 HJqU8GPrnfzkOXDaA2shnlVpNTfgOnbbVYqgc+dmExtZZkM/tWyUJx4IZU81fQ61BpuSyY/nAwsEor
 ap7GzUHFvcovcqTA1vSeUrkn46guO3pjI25vYVNDF27Nm7EsCZVflwUxcqBA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_010613_716414_9B435ACF 
X-CRM114-Status: GOOD (  11.42  )
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

The item which have the mediatek,mt8192-disp-ccorr as const compatible
already exist above. Merge all compatibles which have the same fallback
under the same item.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Fix MTK color correction binding

The fallback compatible has been duplicated in the 137272ef1b0f commit.

To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
Changes in v5:
- Add trailers.
- Link to v4: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com

Changes in v4:
- Reword commit title and message.
- Link to v3: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com

Changes in v3:
- Re-order compatible.
- Link to v2: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v2-0-4822939a837d@baylibre.com

Changes in v2:
- Fix commit title.
- Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com
---
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml         | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index b04820c95b22..bda86e6857f5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -27,13 +27,10 @@ properties:
           - const: mediatek,mt8192-disp-ccorr
       - items:
           - enum:
+              - mediatek,mt8186-disp-ccorr
               - mediatek,mt8188-disp-ccorr
               - mediatek,mt8195-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
-      - items:
-          - enum:
-              - mediatek,mt8186-disp-ccorr
-          - const: mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1

---
base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
change-id: 20230306-ccorr-binding-fix-718c6d725088

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

