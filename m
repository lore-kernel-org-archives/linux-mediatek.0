Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C84C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKQy0Roxug4kkR5po0rLyjUzaL22dO97ot74i0woU9E=; b=YGEclZ9VksoAup
	9qH9We5lJw5t0QrsXNAHvad/1OzxrON4m4a6y1+HZX6cM9EBE2KbMx3vIomMIDXEaP0nl6Me2XX4R
	VkzEm/uddRUffbf8Hcx1LKPjxaTu87MjrbXHeTkFLGMJQXgnXY64IouR9+G7BiH8LPihMDZLJLmmf
	TiSxmHcBKo4ImjnM4p+Smd1IBTRFCKveNd7sBnO5yl9yQ6JKUfX7FVPn4z+78XoaLEWRUV32loJLs
	gVCRqpd91/vf692ktzAXBG4dq2KdiuEds1IVvVzr5UacyHW799RAPzEDEYC0aqOoJfpSAYaatXCzI
	lTUQcqJf5m5kfqt/vPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu95-00DXev-Sc; Wed, 22 Feb 2023 18:47:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2d-00DTxA-NR; Wed, 22 Feb 2023 18:40:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id p8so8880699wrt.12;
        Wed, 22 Feb 2023 10:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKQy0Roxug4kkR5po0rLyjUzaL22dO97ot74i0woU9E=;
        b=nNOOQ7DgV8lPHE+nfWbX3cWwCtl/7owyKvNHmLHcylpRUFHwaxcssFOmWZDMPuzzVz
         zCEmDKpncYSFJaprUGjsxDzUbPyLDYX1HmiY7tq+p/MUYd74vyCyrPLOGO1SdpZoLskP
         iZYGKS1EHhwjlmv7DTd3j7lYR2vI/493G3StlNrJnIBipXtY2ECt4nw7ZBvIXg32aJyI
         8LZBucpTIuuCVtFHfLE9uc5+Ak+hejscMtlw5IKhC7kgChN/mL5KyathBwmsqDCOWDi1
         N1wPqpM40IUXVKmT/k1UTXP5gvOkz/8CwnrA0jquzzO713stT75SYkR9Osr8pdLzMjcw
         K2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKQy0Roxug4kkR5po0rLyjUzaL22dO97ot74i0woU9E=;
        b=zFDcdK2qyWzye49v/UnyyeUBQ7wrb3zvVXD0mOLkSnihHn2LH7hpRwMBO8XQTU+8ON
         TIrC/HBVmHs+Mg3IscP0CZoQP2Dtu1wMQvc3yUEPHDvDGEDW5m+rCOkG3g1Pi2z+Wx+c
         d/wYKc5uiCg+eRNsBba3mlti9fDWGkm8YJ9c9vbeCxZI7pXJSpXD24vO6e1Nn0YcjhA1
         bVF6KTDgTpY6cVSV9BxorTFCo/QkxArhWlDnnwCcZWrmXRhDQqCptMjh8yGCgJmPZobS
         QrTv04u68h1LEBKmM0TVnAE/iK0tyvQH2trRLeYFtNDZ+58fQ2uxUOg3o7Oszzm+xTIy
         GVqA==
X-Gm-Message-State: AO0yUKVSn+8klkd6epHIVQkH/icGoo37HV6eDOiliZeVUT/Lyg+M+sdb
	8on6htM67IFn0iaEOfK/WBI=
X-Google-Smtp-Source: AK7set88JNw8RxRWRdD2IFAfAkRWDGKxya6LpvIZWMWrlzdQGVzUwktZKapYh/fpkyfou4aD51W42A==
X-Received: by 2002:a5d:6090:0:b0:2c5:9990:288e with SMTP id w16-20020a5d6090000000b002c59990288emr7671369wrt.18.1677091231890;
        Wed, 22 Feb 2023 10:40:31 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:31 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 12/16] dt-bindings: pinctrl: mediatek: mt6795: rename to mediatek,mt6795-pinctrl
Date: Wed, 22 Feb 2023 21:39:28 +0300
Message-Id: <20230222183932.33267-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104035_791857_55A3CD13 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Rename mediatek,pinctrl-mt6795.yaml to mediatek,mt6795-pinctrl.yaml to be
on par with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
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


