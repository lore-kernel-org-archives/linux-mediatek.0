Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07459D111A8
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4a79qbAhHSz0GVRGOuPPFX29zZ9ssNqofDb2WClFfw=; b=cCIJzZIQp6UxxodM6CaX39I8f5
	aWyu9AhLKd3IIta5e2BSmqDtM7G0DONpbTs6fNusxHa6ihAYIqGmRcUWUSnIvSck32yRM/hp/Gl5c
	+zQNdwQ/zUg43AUky4MOJlQDOeeygucl4P07jnbZpHVlxsdfTHODhcvFxo1HOea0w5NYWWglkBt/R
	D8mkyzAYlWR+/EYLIssompNcCB6TY1T4BFQRmEYAIy/9oMXzwJ2fxcRH9k0cGw52J/RN6LrgJmRsN
	HTur0DuOfuIZjRs/ow7CYC7fWkoNhp3hFZhvpkYJ77OHPfVLX/OldmLAaQnuCpGNMjXzFIx+FkpaI
	qPewKC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14G-00000003JWs-41cU;
	Mon, 01 Dec 2025 10:23:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14B-00000003JS8-3Mup
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 10:23:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so715249f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 02:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584614; x=1765189414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4a79qbAhHSz0GVRGOuPPFX29zZ9ssNqofDb2WClFfw=;
        b=nZEV9eMoOv/fObas80t1io7amVWJufXYw7oz6YA9qt2s5U1T+rzmAPrQ19o+/RgALK
         BRD8w2xblOhT/geMyAgycYNiPV+eMpcTU6hZxzY8iEi1rjVMAAX5RNto+dK8dhN2XIOT
         L/uaVsC8uDVHW/yTS4VHJ3WhNW6T/KaXTZ3kaXW2Y8cEmZFj8CGcxjZmNQ9NO9JgwX4P
         CTTCxq2CzWo85IRmSgQLayj7W9UVJyj5VYs549/qoC8jES3Jo5cAN1oImoky7in6MKLW
         bM8G8c89FJ19/HGcztYby6npziLgW8tS9kTUcipY5CJQDMO72iVxS+yFL6Ttsj76w1FB
         A02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584614; x=1765189414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o4a79qbAhHSz0GVRGOuPPFX29zZ9ssNqofDb2WClFfw=;
        b=u5ZvrtFq343Sz8jUW8jovCWU0Wm0CEfIoRFPMeSloCG0zT0W+3GCDX4FC7mjh0a8GA
         anN0l14QlAPSxLcq4yRXabLoPTFSixGYZFoCXAhQJLgxIVE4Sz7blS4fZPCAiQPB4fU0
         LGlOhMNU4CpSXgkam97+Mzu9kN/19XEoFhNDT+QwMRqSGMFge6smrmUzP5EHAc/kZ2NS
         EbrQnbTUoFXiZhi5fnj4pjnLzT6fH82faePpUtvuyGsVf0//WdIg1O/DElb02WhLWCQI
         N9GiWj9XR/t6GpQGJ4YUgEyPo98oOdMem7y/BT/Oi11qyy9OS976+mlIPGaCqwVOptKV
         KnZg==
X-Forwarded-Encrypted: i=1; AJvYcCV0cWMbRRjNkM5SF1H5A77zddFqSGJSoV82X/ZvALh0q6PGRNljLbgFT0VFPVA+LBAENdOLtrOQfO1rrIltSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLSdNBaWIQtiKkt3RWVBC3ia/Q9SNFn73v15aqc8bSJ1scSnCO
	H8n0HZ1H5VP4nSISqL6iL5LOe53tZHewfGAzh5EOi/RxWDWqgWmwbkbv
X-Gm-Gg: ASbGncuQD2WWydv/QiyKmkqiOowIFhSBFNhcGgvxlW5Co6LVgJF1ZzTZ6mwDg+/DHNO
	Ox42syGFlTRcvr2MLxl2So17WoRV80FT6gFlYJ8FpPMz8nbQQRcPVSGgLzA0lVnYhWC78SeTITu
	ADwFTyG3y0XD11DROOhOPMN5meAa4V0QLC1DNYLdQgacLCpseBOZlhN9ElYRKF/qVyXu5uTzvi4
	vzfaCrKGypIyEmsiOqvjPbmnJY2WyqlC5tBK9KbR28sfHPHebM3tURwCOzka+k1NQfmPU9NVT1E
	8D9JZ1EHTt5TGewMStHNBHNwwcdta1EaskRUYSN0GUMGk6d9X695ThGODyY//r8TnS88WcLVVW8
	oErQq2q6t7eqdBixrJpF4AzegepjLkg4G5/pRp81tHXsFt5gS9djF8NFbKBycoHOVl4u7Jby6kA
	XpUhQf8r8Q6+UKA2A506ZI/UHppg==
X-Google-Smtp-Source: AGHT+IEvoJmHWGBhQjM5psKaj7CFsvFQ9IZtp2KXdt++ZNs4WoTdza7+ouoOPLPDIL9YaHNygYGdtA==
X-Received: by 2002:a5d:64e6:0:b0:42b:3131:5437 with SMTP id ffacd0b85a97d-42cc1d2e213mr40229023f8f.34.1764584613796;
        Mon, 01 Dec 2025 02:23:33 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm29466439f8f.2.2025.12.01.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:23:33 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:23:15 +0100
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add Ezurio LLC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v2-1-dc2df44eec7e@gmail.com>
References: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
In-Reply-To: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764584612; l=810;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=sBILIkJb6G+DOCCDeAbWnW+wLLUhfq8ymrsck8EV9Jo=;
 b=N/TCEjh7vDWCZR+tSZvOuJvefgjFJU8DubFOCGtYvMnX0LIupKiqkZKFQFM2O6F2iHf8ZY85J
 fheYbSvw0rfClXGV/sNSTTcBPpI5Jl0CH2cQE49gVhdvAQ1wIdsgNni
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022335_848183_052DDF48 
X-CRM114-Status: UNSURE (   8.75  )
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

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":

-- 
2.43.0


