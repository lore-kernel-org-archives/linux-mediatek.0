Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233A8C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/iRPnKOXmlOdilFnoShh5yI6AjtEilCaiDGDFmPOYkQ=; b=Qqse39MXN/+ecb
	Nfk8Y0rGJWVH9/fQsPiSW4JsDflS8FWLDC0Bmq16/slryDr0EnhCxPRhgFZdXIBTeN74sGbAmtRGz
	rRGCorcohD+dDVomzDUJfdQCkWsi2d5sHwEXdWuZpsNBurHZh7lPmGGJBWayYWPUd3L5Nx+dmuUkf
	/qKz82aPaPLHqGfZi+17WygJC1VF3Vp1aXdZ+HlTRCHiBq1zNFED1KnuakjTt2MuOaZna3DeIhpL3
	y9URblktYowHznKklnUdEHX3VT5kSOJ+F4/bvti7U7pAhlTxpS+cTWW2od13oGBa4rMqOnk0i+uIf
	qT/zn1+za0L6xpvKcn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjAI-009m4o-3B;
	Fri, 07 Apr 2023 10:17:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiAW-009cud-23
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:14:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id m8so12830786wmq.5
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680858843; x=1683450843;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iRPnKOXmlOdilFnoShh5yI6AjtEilCaiDGDFmPOYkQ=;
        b=ogxAc3Mumf11FOLzjNLFLfFgMp+ab4L7z16PKrZblcnB1bdXshZsOK131l7SG5N/om
         olvuifIVwhP+I1aTafFtDXnzvWvvA0KTB5MW6KvfAuPzjKW9e7vchST+3zsHNc2UzlB+
         N6RTjD7HlfwUIn80UPhAuhYiyTsaZ2zlQS5mjPItPzfLDl5ELhSzrKVP1Kqwf2dHeAi3
         GPdm5cJg2BDEZGudj3MiXkWfj9xIiIXFZtwwD/evDAINM7uhY+X5h0jt+/zAREpnC07R
         l1/mpoL8+occ1dfb0og0K8TM6Ze3S7+fTAyBXCb7lGgmi0Q4tvTAKoMd1n37tnEkhXWy
         sTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680858843; x=1683450843;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iRPnKOXmlOdilFnoShh5yI6AjtEilCaiDGDFmPOYkQ=;
        b=RTD2vAFlK5Cpp/BHdbK2N4nqTVS7DJ5mHkDd8qEsn/G3J0xkjyo/WrU6D4UiUWvYwy
         hhq68lYy4+AUQDftX/pHZaUtvUtyGNN1im5E02voNCitNA4xKIOeOyi/omd+goR6K5bx
         2Ersnx9d1IfxE9nKbHeDb7F02S1ROoAnweWVxWC5JJ237r2r/3KP/88bLNi4g8IAzap3
         CuWh5BL8KbJz6zDRKD3He6zIjNP1qmohutJwFIhX/YpccM8Wl4c2xRs0/LZEnuYAc+6t
         /JbZ+hJXpXpPbqWjaHKgESKO0oBxu6vxLTBaP5TybLjTsQFGt5NCTUBqgp1jze6QEta9
         UWTg==
X-Gm-Message-State: AAQBX9finLbPKaMwW/e6xJtjxv6qnXQkIxBRxJZEmzUPYsijKJqlaqWb
	Wj8jFYwrussJ6MkFml0WoywKOg==
X-Google-Smtp-Source: AKy350Za/6RWX2oz9CbTQclsW6Ctfk4fA1+j0eL6S8zuOsAqYIbYNirmY3B8SXWCVkE0U54tlTqMlQ==
X-Received: by 2002:a1c:cc05:0:b0:3f0:57be:666f with SMTP id h5-20020a1ccc05000000b003f057be666fmr1107869wmb.7.1680858843049;
        Fri, 07 Apr 2023 02:14:03 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id k22-20020a7bc416000000b003f04f0c5a6fsm4026429wmi.26.2023.04.07.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:14:02 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 0/3] Add MT8365 SMI driver support
Date: Fri, 07 Apr 2023 11:13:50 +0200
Message-Id: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM7eL2QC/22OzQ6CMBCEX8X07EopBtCT72E89GeFTaA020I0h
 He3cPb4TTIz3yoiMmEU99MqGBeKNPkM6nwStte+QyCXWSipKnmVDcSRwDEtyNC0SjXS1E4rFLl
 gdEQwrL3t98ocCjug9nOAQN4mHsCQd+S7Ik2BbDHOQyJ4o04z5x+fsGOddoE8Fhjf9DnMnq/MP
 cU08fcQXco9/eu0lFCCrGpXuxbb2616GP0dyDBe7DSK17ZtPxSVflz0AAAA
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1864; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=XMCnV2elFtLjP2Sn9yuzQN2YDzzqESOsgUOGg8Iu4SA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL97ZcnlQw6HSmOX693KdDwg2alXCJ7TraSlf6K/2
 n31XqJ6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/e2QAKCRArRkmdfjHURQiYEA
 ClYLk2Ia6AyQSoVshjwgtKw5Rd4wqlwAaZ1Kv/UHdszErCHNyRfSzeahujY6zPDaOhFtara4IHCm36
 /U/ImHXqgcLCAPpxym32iQZqXxw8+hsmtFK+Fd/BNB8WunCJfFrKCd0G21UGQ69ljerMqQ6MeekmmJ
 c0bGxcedFVatQmKil+NEZSw31IRE1ZUWSBPwUsIB3ZbMkIymG7K6KGkYpbEkaGz/Dkg4ZbKin2xU8d
 VzEjzEhn80peQP4pSReFChDTpQoQUiaYlYQIgK+2/YTcEEAzvdUXOvCAxFQOep9YMAn7eqBdYCv2RG
 21J2ktHK6lsaK/puctOisPEu8I0Wol+2tWQrTNN4V2CJ+aU5FWl6wFqeNxIr3nof3PlQVyeictKOEv
 QfgD4G2PhMCHIIsgqWazIACGmjQUn1BPT72CG7wfb9K1WXvr/R3+S/jthvTGq4D4rvHldb3P4eOAXj
 aOQxgDsHoHE8zOzqG/pysyNCFa4xt6R6eyUlSrIvCmgn70pb1cSWI9/Ws2Bc9f8h1ovVXThn45BfuP
 jgTqaQNHtTHl7lYtQtGRA8RP18Da4lrBRg7Yfql0ivu4a9BbgFZR07yNs55tMjH7CN23DkvLRLvDLL
 CmTrPCFCs0xss0ojm6DwrMMps+O2xQxpOpcAMjuPknoTWP1+hD7uVLtiyWlg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_021404_671555_99B725C2 
X-CRM114-Status: UNSURE (   9.20  )
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

This serie add MT8365 SMI common driver support, to be bisectable and
avoid issue with the DTS change. This driver change and the related
change in the DTS should be applied in the right order (driver first).

Here the related DTS change: [1]

Also add the SMI common and LARB bindings for MT8365 support,
I kept the Matthias Brugger reviewed-by from the previous series [3] [4].

Regards,
Alexandre

[1]: https://lore.kernel.org/all/20230207-iommu-support-v2-7-60d5fa00e4e5@baylibre.com/
[2]: https://lore.kernel.org/all/9ad8c606026586b682df5e0ce0c699e21a1e6fb7.camel@mediatek.com/
[3]: https://lore.kernel.org/all/d1dc242d-c381-3307-b939-7bc35c6ce55b@gmail.com/
[4]: https://lore.kernel.org/all/0e863367-5b24-9559-f782-4d3e5dc06961@gmail.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v2:
- Add SMI common and LARB bindings for MT8365 support.
  I kept trailers [3] [4]
- Forgot to mention, in the v1, I've addressed the Yong Wu's comment [2]
  by removing "has_gals=true" from the mtk_smi_common_mt8365 structure.
  Then I've put the reviewed-by.
- Link to v1: https://lore.kernel.org/r/20230407-smi-driver-v1-1-036d6d8e8993@baylibre.com

---
Alexandre Mergnat (3):
      memory: mtk-smi: mt8365: Add SMI Support
      dt-bindings: memory-controllers: mediatek,smi-common: add mt8365
      dt-bindings: memory-controllers: mediatek,smi-larb: add mt8365

 .../devicetree/bindings/memory-controllers/mediatek,smi-common.yaml | 2 ++
 .../devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml   | 4 ++++
 drivers/memory/mtk-smi.c                                            | 6 ++++++
 3 files changed, 12 insertions(+)
---
base-commit: ea2dcf9394947d5d8e24cb9d52144923f6645632
change-id: 20230407-smi-driver-782270b6da2e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


