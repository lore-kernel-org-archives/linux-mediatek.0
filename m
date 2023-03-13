Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E232C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=; b=rTT/UHWG3kZeZR
	Zjg1BUmpPYg3MHmiMjjIhjyZrptd3+LyX5p1j3Iltotnn4eUW9iaH2RT1XP+nWKnYFd38XM8t088g
	VtEgGvvLEsDWT5Q7j3ja7dh7HDZfh6AtBYNKMvEUCJMkKwsacVMhCnaiKTrdN4REanHgFkqFHvpJh
	0F9nFl9n72lTyipFFTjEjl7EhYd3bqVQzvA3buFBBcaCoZrWIZVorMRdKNndmpOKP4M+WRQ5TSf5+
	9BsMey7+NLdufOMdiYrzN7K7Csd9fcO0gsmF/YjPVwdx0jJfG/ds/kTe3DKKBjP46MYOOEQNlxF+a
	/Wem8B/nQOSxsKejRV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpLk-007nKP-1g; Mon, 13 Mar 2023 21:04:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHL-007kr0-32; Mon, 13 Mar 2023 21:00:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id k10so53920552edk.13;
        Mon, 13 Mar 2023 14:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=;
        b=Hb8Br82KNmwX9BSxxeTCf1zDvWyjePfmpic7DjXG//6b75lq+DqksrNoBT7vC1JfWb
         BxhGzFBWJpYCsf4Da55Kqsp4ut+GKW3yR5d6XLA2YRb0lIdET/mYMW96tAjrdoxYT2lc
         KVoYK7TUz9/QfYyi2hXz0V3kSsytQ/HGF8553JUnU9XcvlEtbuC+4ikFelNgWvuOalbE
         GrCW3xTJZB6cfUNSpgFakoRtVuMZgSiRKK/eVl5gAvtF98fv3Ew0BZDpA43fflvBm3O5
         SdjlDEmSwy7Fq4Dvt6kfyJrKSX5t8bQHwkvzJntq6eS1I+iSug/BAIpS05MW9KBDWX3L
         BzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT6hzu0DmgFDhxzzLNhQjlkkdnwsxET9D8SPDLbHKjA=;
        b=ZhWK1WuzX6nUd/wmaJYpuhKxUO2+6ncl92rDDpEwM/ZaoZguJ3WcrA0EdO/nl2eCrm
         Q6qYFy1QCe4s0yuCy3dE0PayYNRY7YzzdO0T5EmVzC0CMBjjjkBEwnllKU4ngk9vfMp8
         v5XJFggK6+/h8LEJfPHhPq+OY+taEkh3JeDKB3aJz6dNo5p+p3ET8N1u83zLZaiw6Gcm
         Ct+1BstRQQeFdZ778ZHp1KQvszYMdWsQCY7/hDx1ufM4HWCml8b7my128abtJDSx9nQt
         uDmmRwLmcNwDlTbs1WICKRDtCKNBFBvh1z83fOj5jvlwiJO6+UiYCs7mRMKVggRjIG+y
         9lpg==
X-Gm-Message-State: AO0yUKW9Io3rcbVPTtlRPXXJrbAFxtXgnBqSOvwVr6IBXsHfoAFJbYVa
	0wcOG1ya3IGldjIMiUZ25FQ=
X-Google-Smtp-Source: AK7set+GOiHCz2Wl4exMnHntgAJAIrDgWzcPmVY9kFtII/vjyy5dgCDOqL6+NdKorDhM3BWq8/pUvg==
X-Received: by 2002:a17:906:498e:b0:909:4a93:d9d2 with SMTP id p14-20020a170906498e00b009094a93d9d2mr39606011eju.2.1678741216898;
        Mon, 13 Mar 2023 14:00:16 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:16 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 10/21] dt-bindings: pinctrl: mediatek: mt6795: rename to mediatek,mt6795-pinctrl
Date: Mon, 13 Mar 2023 23:59:10 +0300
Message-Id: <20230313205921.35342-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140023_330684_0BA69279 
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Rename mediatek,pinctrl-mt6795.yaml to mediatek,mt6795-pinctrl.yaml to be
on par with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...ediatek,pinctrl-mt6795.yaml => mediatek,mt6795-pinctrl.yaml} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/pinctrl/{mediatek,pinctrl-mt6795.yaml => mediatek,mt6795-pinctrl.yaml} (98%)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 9399e0215526..c5131f053b61 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/mediatek,pinctrl-mt6795.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6795-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT6795 Pin Controller
-- 
2.37.2


