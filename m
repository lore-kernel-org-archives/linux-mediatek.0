Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139D1C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 03:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=; b=fFsPuUI43THyTXmdGWXSiFo8wS
	jPctF9OXgKXbgbIrm9OHqZ5sWxxtiD002E9R3ZDpNW8FmOPinDErcnnqeh/VhWIBMy4NgerRtZXio
	rhLWBcnOi7ivCH/3x01HXPtOOtlnU6TOFIQ/gNIsQWrhdAxbcWSmePqhY7Ev0R5EibwNxLOH8wI5Y
	an0UNQNOlwIpnVI2dbVRmtwhHY8sI3KbWtM81kEgDUnr9+HK2Boi33iWv9y7LC0hP9NU8jWYxg4aJ
	PuVBivj1WFTtHdqvvDipC00ZBAK9D4Ekd1iS8jZoa/6VXJgImnl727pQ8/42t0XNyTDmztZnnC1A9
	+BI6OW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gcr-00000008GXo-2ZCP;
	Wed, 16 Sep 2026 03:48:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gcp-00000008GXX-3eAp
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 03:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=; b=j+2DKK/okMtFFlJqeHvDbGoiSn
	5IwOYa2surdSEPq7QQUAqd2wbdqf46f3Vq85OrCe51YQo5IVB0tnzVBIEjZIXhkeltdypzlmZ92tE
	L6CvWoFgWkexw8tsbEUetR6bNpVNAU/1lUFN+xsaQfzpKoDqyq2M2UXe0lcT4iQIwJbL24G5pjIPt
	qb8RPcseq4/lAdEXuKpM9uAkW+TX9tuGff5TOyilDnPur3KE/Bm6RQWZSaHoUlADBa4aZsHjYzkq6
	5fTusnDVLlDSIVR9jtCzifnQWGV9tp3wfl2LOoE75RCDWwjauXkQ3W6ogN1iy7PicYIBwScneVaCM
	YBq25E6w==;
Received: from mail-oo2-x0b.google.com ([2607:f8b0:4864:31::b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6gcm-00000007Swk-3awX
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 03:47:58 +0000
Received: by mail-oo2-x0b.google.com with SMTP id 46e09a7af769-8069d92e182so1480289a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 20:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789530474; x=1790135274; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=;
        b=iiNFxP9H3IBkL/7KykMaXJN5e2ArvAlNyybj0IxDf2rUKxewi0dFdCxzb5dhaHwtOk
         ZXZmCbo4JP6Zip/3gQBZyZJQp4U85VjlW9RJzx573AC0IiZEFQD+nIalBExJ0gaN3zX5
         IrgrMvbSE0OUiE0iZOK9/dOANUpePWpk/GyRmEBvyh2fHaGjRzHECmWndnmJuck/c4MV
         f9y2tl3g251cPKT0Uv9uecv0aeiiVhRysiT7XSL2e6ZM78eocvYJmSvi5//9UZL8+he3
         j5Nbpj3Kq1MvhDycdMRJOsE6eoMj2UazazSekyqrAB/MT56rbclIRmcB/qw4a06MOjYX
         Mm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789530474; x=1790135274;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=;
        b=KEguyDZjlchWHEkmPOJUjup+DOpkLo5PhcGOOjV7vCGK0ADNXITubgxXqMR8BA7uc+
         MyD5nWFZmIBGTt+i+aJK4ogSN6byiu1PmQ3othFO3/qkDBWI2YWO6ZzEXPZhWuMdJvWE
         C2crDAUEbXuVTFq+ketuVNki+HYy2UZOZc7dLbHghPDACZ+iuZDLia1unYdrxmxKvcwD
         ROZGwXDgliMx5eQPDRwiciPVAMMbEu4HsR4ldFn3fwZ+1U/Jj/9YOyDLjv7bP6WErf+A
         vv6WsM3f1GPQqGSozFGfo5iwbsLXihKowyLGeeZCFoEMzA+6UCZQvMWk6Qp6N8uuTGwY
         /WLg==
X-Forwarded-Encrypted: i=1; AKwUvBxNrRKmVxciIzrA421iVZMsRV4ydpqEz7wAC0zuaE01RnM/ixtxXr3Jhu1JvxSdgM9cHAQN5AkDzHGw7SVVnA==@lists.infradead.org
X-Gm-Message-State: AFuF++nJ0lYxNkonZD6qRSSbdPMn/RAcwiFRxXyesGQeKCK83k6RDeq9
	38NhOPOyLUfEIqDT2x+wGtHNzldNRj+f9XGdlz2my2mljlYYKwMI3seY
X-Gm-Gg: AYBFou0dFK9lr6FxIsEPuv2KrkqS4dcnsDvds3eG8PNbCydS6BSj6yes1gmPs6nKIxW
	IhxlEfEVAIpiyftbAJuWgbcHAn+CKXpj+5KnQpThLNDk4DVXw38cJYUgk+/vhC5OKxiLTyvezt5
	FcRHumsPgtMwQQ5ya924W00rQ4wcp+ra9cRj2MUBJW9JdpZBRttpckNKj7WTKvd+b5mrrdFywF0
	NLANRigd0BlBk6SHgtAqBemosJONjrYhAJQsF+1qXmuCSOqGmSbj9cI38jLLQzSwRx87OjL/Y2w
	4U49yIZOFSmtLPCUtW2Wepp5Ijm++LBIxiJT2uqI75Sgv6yRB4ZfNgIK1J5pNt7RGd7OZXBxyRi
	kHDQiXDHbCGCuFvS0DB7NWKvgJcNJSw5Vq+CRlHq69RWkRjLDs+qH4g40mKANB0SKu6dYxqe1wO
	tF8qUV5RP+wM9rMnSlG722klx2tPNA+0ce4Va0qFd7ZtOCe+0rEQZPqEzqk7lGBqabWP8=
X-Received: by 2002:a05:6808:4fcb:b0:4c2:e38d:4de3 with SMTP id 5614622812f47-4ca4a9047a1mr1733472b6e.17.1789530473675;
        Tue, 15 Sep 2026 20:47:53 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca2377aae6sm1446666b6e.7.2026.09.15.20.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:47:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 22:47:50 -0500
Subject: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the MT8173
 keypad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3Nyw6CMBBG4Vchs3aSFgwXX8W4qPQHJ4baTKlRC
 e9uw/LbnLNRggoSXaqNFG9J8goF9lTR+HBhBosvptrUrRnsmfWuGZwyfpxjWhVukTDzsva2a/i
 Jb3SeJ+/HxrYOZuippKJiks+xud72/Q+w0P5JdgAAAA==
X-Change-ID: 20260914-rbrue-suez-upstreaming-mt8173-keypad-fddc316ae098
To: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789530471; l=2015;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=iB6N5HJd5gxJ6JfDRUspRgFcS0Yl2pln4xko2Z2q6Tg=;
 b=ALF9MhZ4iDbh4vFTTUxFBuixvjgq+QLsNGyPYSFi+QRZHCViQOngwQy98zKiBOP33E4wyYcbz
 YQjSzhJfhYlCnTGnNHLmhDpo9Ie+KvCnRBPR12NrzDy5tFpdqQ85FYX
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_044757_232367_770054CD 
X-CRM114-Status: GOOD (  10.87  )
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

MT8173's keypad controller is the same block this driver already handles.
Its register map agrees offset for offset with the MT6779 one -- STA 0x00,
MEM1..MEM5 0x04..0x14, DEBOUNCE 0x18, SEL 0x20, EN 0x24 -- and
mt6779-keypad drives it with no code change, so the node only needs the
fallback compatible in second position. Add the mt8173 string to the
existing enum, which is what mt6873, mt8183, mt8365 and mt8516 already do.

Verified on an MT8173 board (Amazon Fire HD 10 2017): the volume rocker
reports through mt6779-keypad with no driver modification.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
This is the binding half only. The board device tree that uses it, an Amazon
Fire HD 10 (2017), is not upstream yet and comes with the rest of that
board's nodes later; adding the compatible first keeps that submission from
carrying a forward reference.

No driver change goes with it. mt6779-keypad matches on the fallback, which
is how mt8183, mt8365 and mt8516 bind today -- only mt6779 and mt6873 are in
the driver's own match table.
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 914dd3283df3..b45dbf805ac8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6873-keypad
+              - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad
               - mediatek,mt8516-keypad

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260914-rbrue-suez-upstreaming-mt8173-keypad-fddc316ae098

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


