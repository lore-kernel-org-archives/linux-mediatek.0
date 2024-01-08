Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492BAC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 08:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ppF24KpgP4fjgy/hlMdkQhkb5I1IwiQejK7rQbEm/PM=; b=3rxLHW5noFU03C
	4Jrc5mS4gfA7KndeKl2aBUPV/k7Goi/in3trLbITH2D37lCBAC31FhDCIakyfCVTNGpiHlum+OCdW
	5nNomhNkD/Tmpb81VzAAMlmLSl15LpSmCbVoPBEY2VbRjoLpRGu6sWPlx8gkxs9XNrrENkbNbktLV
	tRheE15a3WJg4yCwrk2GShjojPlO0vEZc2rPSIjxNO8kljbCKACekvzG2nROMMsuZs4sWBEOmP+pk
	FqhI3svPE5Hhn84zpPT0FoU6FLTscaNZdjfu1HwmNkbLkzLITsRv/7F9MgkFP9w3r+KXHzH6GMtxz
	ov2Bq9obluDuLq8qR7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMlNO-004N5F-0W;
	Mon, 08 Jan 2024 08:52:54 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMlNK-004N0l-1P;
	Mon, 08 Jan 2024 08:52:51 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a28ee72913aso444195366b.1;
        Mon, 08 Jan 2024 00:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704703967; x=1705308767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppF24KpgP4fjgy/hlMdkQhkb5I1IwiQejK7rQbEm/PM=;
        b=Sp6+8vXsxkbvab90K9Th+cFys0+sAQsxgyu9gwUGJ4XZXRcQnvdaWs1bVPEe8Lgutz
         CBiivleOuArK84z64dNfEIrsVuC9/2l2vlx32EjG9OxuqtUrlzJWN5XJHw7d6XqZFD6l
         Hv647kAvNMaussTHGzvUBr64m+p97l331xhgDo2W7bqFVgZuaaTaQu587MLfn4db73ZX
         xMfedJk3MfmYsQaCNYkhQdTvTpXrb3oTuF5kKImf4e5Woroa7BZj4HzqArM0mMO2p+i8
         7qVxGgMzY8nMTxkAwDH76N4efa+HVki40lwxdg/QNLvB1jAvjVnhHjgflx5/O7/mcadn
         ECTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704703967; x=1705308767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppF24KpgP4fjgy/hlMdkQhkb5I1IwiQejK7rQbEm/PM=;
        b=E5JzPagqCXjcaF9buom63U5aqtPQYfxCle9LlEJTEMjKPnOpol1lNijP4gVNyXlxtZ
         o5sAceH8tZrgMBOX2+c9ezwxMT8sxLl5FPHGK1MzQ9doszS+SmTr7CI8kviMTPnjP4Dt
         4LIC6wYNJpRat2ys2oV6RwQpPMPqXcuFcZdRvHICQi+AqFxVyVobiMMetLCneYPy07K1
         vJD+1pGjolifAPFQ1NtoA4daOna4MAuTt6nWZdifBw7K93rCnDVF2m9jhKiCJYoQ7wxK
         vN5FVWvbA4eFS1UWxeMtBzapFxK3ug0yGfl/mjWF8wEF0H9/PLHww1UzzOTbLHN36oIg
         P4qg==
X-Gm-Message-State: AOJu0YzgJeUn1m/yRcQjTQJDlQ0/UGZcwmdHX/fhV/QvjgoE+sujSlwp
	Qsky6MfhFYtKXHByCIdzHdY=
X-Google-Smtp-Source: AGHT+IEZUGj+AGl61d6B5jZoTKEYcG9DUr85VaOxtUgLTqQ+hJ52tqWzHjbsBOE6xTUBngYETXEMGA==
X-Received: by 2002:a17:906:c2d6:b0:a2a:a3dc:621b with SMTP id ch22-20020a170906c2d600b00a2aa3dc621bmr1080196ejb.4.1704703966805;
        Mon, 08 Jan 2024 00:52:46 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id uz29-20020a170907119d00b00a2aae23b414sm666046ejb.26.2024.01.08.00.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 00:52:46 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH V2 0/3] mt7988: initial DT changes
Date: Mon,  8 Jan 2024 09:52:25 +0100
Message-Id: <20240108085228.4727-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_005250_473037_BC263680 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, jason-ch chen <Jason-ch.Chen@mediatek.com>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

This work is based on linux-next content and was successfully verified
using "dtbs_check". It's initial code for MT7988A that will get extended
as we get more bindings available (pinctrl is big blocker right now).

AngeloGioacchino, Matthias: is this something you could queue in
git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux
for v6.9?

Rafał Miłecki (3):
  dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4
  arm64: dts: mediatek: Add initial MT7988A and BPI-R4
  arm64: dts: mediatek: mt7988: add clock controllers

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  11 ++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 136 ++++++++++++++++++
 4 files changed, 152 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

-- 
2.35.3


