Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA14FC48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FA+jIHvO6N83h8i/+0IHkCxHo1xBrnoRrPyNFxf5Oks=; b=DlWOKCFROLc/hdS1YjTSgFsOIQ
	mi2T6FYM213in+D9OzfyG/Ak3iqOq3MiWjl5B17rGlK4Guuw+HAUgD8cXcYJBs4/DFpnRqLuvgM+u
	P+i4Rg+ueIgBkqsi2DxLt++4mLtUUVFWFbB3Xix+zYpUWDJeVefEEt4NMxlZ5sbng7bei+qzCkdqg
	OynnN5+2AXZ974xGZ8OD3yORqAcP3cTkUXoYp+IrRCy1aOkko/l1lhxPzkVm7Zgoyn9KB0DaaCWOY
	b4XePsf63rmAWDU05+FtdRvcH+8fn74b/IKnLTxkAigzxjiuFe0r/XIxA3F4KfEfoZMN1qicA9a7v
	GcaXfTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsQy-00000009Ge9-0BIQ;
	Tue, 13 Feb 2024 13:02:48 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsQu-00000009Gd9-30QO;
	Tue, 13 Feb 2024 13:02:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a3d01a9a9a2so67635366b.1;
        Tue, 13 Feb 2024 05:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707829361; x=1708434161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FA+jIHvO6N83h8i/+0IHkCxHo1xBrnoRrPyNFxf5Oks=;
        b=nkNuQQOXbhQyilJDiye1PA044o25i7H1y43opnlPES2damtbX4FQ/SB3tQva3Uvale
         VtH8hkOdopOsZyvnuIUWv8UGRwQlgltwFpZS4rP/MY2ZY1ZOvka7Xs0OR8dOFoRhl888
         n0xPQPxQsVjcAafBzWT65Z5FnffsjqglfV9mXLGxgON+PRWl1IDUOLaLF8meP5RTiYWZ
         m0l1wx+p3uIC+LTokvLz/KjmPLj+SKX2eHeQ+nT/S4GbpkD7Igo3QxZrZoxDBI6cZrg9
         wuPRVo5mQf8qX9pqfIzua3960gu+t6pwUA98uPocH/otEiCMT+os4SZ/AAEPpC9uuN5a
         qT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707829361; x=1708434161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FA+jIHvO6N83h8i/+0IHkCxHo1xBrnoRrPyNFxf5Oks=;
        b=j5SoZF+1jcKI2x5V+z10j9VC3dNGBWy8du+mH63d+sWXdBkS5/b9jYdQ9Qnw8bhX4Y
         MtSaaxOgD7sTZ8Y+6Gkup42aH9bwNlcRznJo3dUm/bLeD/QdaQwu2hUP3T6ZOeHHm9Ia
         v2lTZ+FPGbTfvcybrfQciGNjtA2ZqkngpO5QzqNHR0sMUVQlf8pq/ylT569DTrjU2Vd+
         2XvAF/iJZvfZkQ6uPS+oqzMedQcfC3vGfFzal9qGkoyUKlEkm3AXa5RIHvCdPJ7iq0a1
         guV3X7cfY7imgDltjAD0cSgtMUqP21X2sc/QBAnsvYtVt0ddzasNjnD8RNZncPo3GNX2
         8SWA==
X-Forwarded-Encrypted: i=1; AJvYcCW9YM//f142WkhlAvrMIZiM2/Z8em4tctd2VfAAyKYFb/zdu/2voOcD7KKNAaRUgp6HFN3H4vXXWAnTl5MhZFpBKocnGEnPLSHvolc50ySTPrYt1EFHvQ8t0AJJ/ni6Mv8nvBEPAj6vWs2/v6eR0Rl3D4jGP6MCNag=
X-Gm-Message-State: AOJu0YyC4oBGQJbGvtYssbhPedUJM2lcccbNwn5bdc0HST2CU7Vckybc
	57i5n0VaJqCqZ+5AX/QXQhbXRfjgRbxMsY/QjwjhYOsU58QVvLpMvHuBHiku
X-Google-Smtp-Source: AGHT+IGLZFPjqI6ocAaqhcRaxmUy9C+7hjlIlp7ayrZIp/AsNc0AgtcJB7Qxj0AFAKUACpijfOXF2w==
X-Received: by 2002:a17:906:7db:b0:a3c:3411:de61 with SMTP id m27-20020a17090607db00b00a3c3411de61mr5741003ejc.40.1707829360724;
        Tue, 13 Feb 2024 05:02:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWI55+H4k9UgqDL8KLU0rUmH2A9ZLaSIsHdTf4k9CBW8dH54wO/DOBOCkyFHTqJiPEX0c0e0wYflDM7+AI7x6K17BAUFqq6j2lh8k07nujtqQkPv7w7uG63Zx+5p7WHh80vNaPZ/rXbVU6evNkn7/Lso6xD2BVEvPZKfuF4Qgh9r0F+lKh15OpYg+IyEVNtiOGBba8z7FRYpbvP9QimVyuT9cULQ1qWwob3RgG55GRryjEugtLgBmAWkyjidGEeNu48Ic0RyYWgEPi7TKGXwHwxdPnqJI24vJOUCRlUcj+wYoc9Li8fIem9CMGX8M3tmtwAEeDtCG5Vnz+dRM5cd5mkBj/NkK4lCjRbnRsUrD5NW+PovYwvAPfWqXtWAxa9ocEMxj14jDZ0gGW6brFuWSWZv0oCDeIyKXn9ZKbvlvrdWa33sYvRyIk5onw2KWBCjGdH5/8uLK+vKQoK2nl12CXt1XwG6Ifvq45xuyknHyKyib/Ns8UCtE1svBDDejDTtk0SrSIDBZqirQCIiX83SgutbK76Lh0M7ZFgU9qdhtOxGw==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id cw15-20020a170907160f00b00a3d004237ebsm633078ejd.212.2024.02.13.05.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 05:02:40 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: usb: mtk-xhci: add compatible for MT7988
Date: Tue, 13 Feb 2024 14:00:43 +0100
Message-Id: <20240213130044.1976-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_050244_782671_6C2E5E11 
X-CRM114-Status: UNSURE (   9.55  )
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

MT7988 SoC contains two on-SoC XHCI controllers. Add proper binding.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 924fd3d748a8..ef3143f4b794 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -29,6 +29,7 @@ properties:
           - mediatek,mt7623-xhci
           - mediatek,mt7629-xhci
           - mediatek,mt7986-xhci
+          - mediatek,mt7988-xhci
           - mediatek,mt8173-xhci
           - mediatek,mt8183-xhci
           - mediatek,mt8186-xhci
-- 
2.35.3


