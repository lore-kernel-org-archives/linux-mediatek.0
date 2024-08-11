Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979CCC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YwPrNBUvnU4mbdftoy187GtvdUrZHe6TFCVGlwNgbXc=; b=HDrp/F/SsBmjOi
	lZphz92F4k5xIjowduqIv7doFkQ09xcwIdIxREXhG9F8sKIl94mVisFKUk+OrMPbC7OtM8LxQLlCb
	m0twh0lr7+WKn4ids6pMhTLiQ9i+8bV8HFYTa70Z065z8j9Xr1wsHsjg0pfHFDdDwirU+Xph374/i
	nV+h8LjvFNibVTlnG1JANuNXrCocs4e+l4ME8xwsze3BESvf6ZvDn26c1oeUxmjhsgfce8CqHbnvq
	/oHs1Trn/euQwUTKiMpOusSQBAeKkej2+cs1V5yzSUOR2Hb1b1IT97a2zWRqM3cc7IO9bLOl8IDOr
	eAoT0pXh7jI3cxGqaurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD87-0000000FvQp-3mwI;
	Sun, 11 Aug 2024 18:17:24 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD85-0000000FvOc-06eW
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Aug 2024 18:17:22 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2f149845d81so41498041fa.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 11:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400239; x=1724005039; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwPrNBUvnU4mbdftoy187GtvdUrZHe6TFCVGlwNgbXc=;
        b=fznkvShcr9r68OlXsrOGdqXpPIvxgHy6flNUO2b8By19lo/VD5gFAChJKTpOIeHqhh
         icDSy+gvLrLBrBlpLbYCNFgThVURQsJAjQDFFwYXxbj08zb9IYK5bKoZRhb/Y92C6JyV
         CpcILiOF8AFGVRTY6H6Gai+aTBDJB+cEo0cnYjGCpJff3Gv0iMF8j3pwQBk9oyhAxvp8
         q3+pTaSF0H4qjsLok5spx6hzfIAGcB5Uo8PIWDc+r5qZ1w6NCD62zrQ18aFnqkalJRm8
         I/FkMiRTKDuaEWK4nvWwZFjZO+wU9v6BEsZwKZH0m6lIfpHKkYP6so+srNP2In4qcxZh
         LXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400239; x=1724005039;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwPrNBUvnU4mbdftoy187GtvdUrZHe6TFCVGlwNgbXc=;
        b=e+H7wKLHdUzG3XbjLaPN3sp5aeOCp9s2G8dgdmpwGfbW+3puTXAzbExLjcoBR+RCR0
         aFcSpyopiGZ+Iy3bTMgEjrqb9XK5Ln0ZVa9vQywDK21OMMUtBlnD17hzMJ7nS7c2ztgI
         x4hIwRltNHmqKkCBJlUfqKvbtIzVM22FRtPwn9O80obgWmX3XCLDU6/UqkQGa3EljomP
         e9iL3MP/v192RjPIofHFXLGgu0+0+YF+8XeDW2d9V/A8WljHS96CKuhtAetn4OuZnqJF
         kl6Duf2Sl1lnIYHG09nBvgBZYur+Ii26Ldz+d1gQprs39z/oDNsNtaGZl09RuTxO4fOF
         tQyg==
X-Forwarded-Encrypted: i=1; AJvYcCVMWKTHgvaJ/6kA9ZFn5PTIYtIlUjvyZoFpFjomgGcvs0H1QcGwSu5H1URol9JAyfepGJcjUp8Z8ucxBr1m9TQDjQ5qVQKTF0RckJQkCH5tXuoA
X-Gm-Message-State: AOJu0YyIwTrBZEgtXnz9bWUng57uzRVi5UrGWCWYa3KeImob6PD0scfN
	V9y6bD9okQw3V9hHkOg9VvaetfIEXi7jD59y+i+UXEHI31Vg3tF2mLZowrZG+/0=
X-Google-Smtp-Source: AGHT+IGL8dYrPpIhxDmqwnFdq5fwLCKAJWl59JNXZWtvR62sQOT8VXO5t1ROG/0yftq11lxeIELW0Q==
X-Received: by 2002:a2e:88c2:0:b0:2f1:5c89:c875 with SMTP id 38308e7fff4ca-2f1a6c687d4mr43015351fa.26.1723400238328;
        Sun, 11 Aug 2024 11:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] dt-bindings: add serial-peripheral-props.yaml
Date: Sun, 11 Aug 2024 20:17:03 +0200
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB8AuWYC/x2NQQqAMAwEvyI5G2iLYPUr4kFt1IDUkogI4t+tn
 nbnMLs3KAmTQlvcIHSy8h4z2LKAaR3iQsghMzjjKuOtxXDgyDFwXBQ/d9gw5UgryVdlT4qVbcj
 P3pOrDeSlJDTz9b90/fO8b4n4MnUAAAA=
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Daniel Kaehn <kaehndan@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QEqX6jTyd8mtDAP045rVWWxtAM7yNW08id9PkOM91fs=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGa5ACKhowuFQWEQGWLBZ65ihEcm7sWDm5sILJ0QDnLhNFcNn
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJmuQAiAAoJEME3ZuaGi4PXOQQP/Rf3
 0FQ0xAoCgS7Rg5Leu6TCRvJx00s5hvLY/OatLg1j6RJ09EPW4CjZCHUkNAsii1fmw6D36YOIxGn
 yANtN0FjOqIRKi86b/M/Ew+30nEv9+heFkhedxy5+qeKfgB37PVf4e1xJ+YzAjp+GEcCioB4akh
 qF0Q71VKHz8pCuK+0r18ceZ4ltmTvUWDlRPz/U0gIsv/ey/X+AeDwLUJH+/3OurVOzt/l759wH+
 k9vny+3L2RAnKnYCJ78J9h9cZHns7SCJzjLYXahWfyKIHWAhkKq9n1dw4YcBuTBIvMRy5zDRFNx
 YrhPRKGeCtFT3dwngVMuRLm7pzBWJ49NPLnT3oh3olQ+xyW6lx8fSyMRPBbM11cam2MlRbLfQe2
 Ckj4G2tML2zwirNyyxMFh/runDKcakRCwTmx/+1ixutFkxKWHisMKz8hYuR6Tfi/g3PBvYzxhqo
 //11FD/jMibRLb2pdBuj8ZnU4En6gKb4zn3UkXR0d0+dozzXGe6MUwGRrepM2nMAJCsc/ss4G1U
 9nzaAN5EC7bfkVBiTUswgxlr6FLmQCfdZfRP7spBixaxXYXmTc3CHC3oajHfeaTzBIEJhKG4hbH
 QdW7lvHeGcMv43NdDPCaitsgL9WiDAevkhH90YumKd9T+i528h/dtRnT8NFyoZ5LBM2snf73M4y
 2qY7d
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_111721_273081_EA48058C 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Add serial-peripheral-props.yaml for devices being connected over
serial/UART.

Maybe the schema should be rather called serial-common-props.yaml? Or
serial-device-common-props.yaml?

Dependencies/merging - Devicetree tree?
=======================================
Entire patchset should be taken via one tree, preferably Rob's
Devicetree because of context/hunk dependencies and dependency on
introduced serial-peripheral-props.yaml file.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      dt-bindings: serial: add missing "additionalProperties" on child nodes
      dt-bindings: serial: add common properties schema for UART children
      dt-bindings: bluetooth: move Bluetooth bindings to dedicated directory
      dt-bindings: gnss: reference serial-peripheral-props.yaml
      dt-bindings: bluetooth: reference serial-peripheral-props.yaml
      ASoC: dt-bindings: serial-midi: reference serial-peripheral-props.yaml

 .../devicetree/bindings/gnss/brcm,bcm4751.yaml     |  1 +
 .../devicetree/bindings/gnss/gnss-common.yaml      |  5 ---
 .../devicetree/bindings/gnss/mediatek.yaml         |  1 +
 .../devicetree/bindings/gnss/sirfstar.yaml         |  1 +
 .../devicetree/bindings/gnss/u-blox,neo-6m.yaml    |  1 +
 .../brcm,bluetooth.yaml}                           | 33 +++++++++--------
 .../marvell,88w8897.yaml}                          |  6 ++--
 .../mediatek,bluetooth.txt}                        |  0
 .../nokia,h4p-bluetooth.txt}                       |  0
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  4 +--
 .../realtek,bluetooth.yaml}                        |  5 ++-
 .../bindings/net/{ => bluetooth}/ti,bluetooth.yaml |  5 ++-
 .../bindings/serial/serial-peripheral-props.yaml   | 41 ++++++++++++++++++++++
 .../devicetree/bindings/serial/serial.yaml         | 24 ++-----------
 .../devicetree/bindings/sound/serial-midi.yaml     |  3 ++
 MAINTAINERS                                        |  2 +-
 16 files changed, 80 insertions(+), 52 deletions(-)
---
base-commit: 8626c4826dd708e05ba457c44493d575d75d375c
change-id: 20240811-dt-bindings-serial-peripheral-props-419e8f88e270

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


