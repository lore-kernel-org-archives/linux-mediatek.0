Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9E3C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 03:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSNBwL+37ogjDZhFrubRTlVeN1yn/UiqziyW4s5xbIw=; b=MDWuvSS7L8cHlwxVNlnLlX5pQU
	7D/Hfv2ioJ5hsWTIKLuobDYkYdOcI/6jPwH/nxh1+SpEk4ThPAY56y29tC360b9mZEAm5aARt5Iq9
	X4Z/qyw9kQoTlSd4X3z0l1Vxt+Esw7016MQ1HggvbxCYNjykE5Qq4/p7cKazFxeg+YIZR3l59vSBw
	zDSYhCKiVEpTUIqa1gX41aIA7RRwJJTmo6GunmTYeWfqr9HrQ1DOlXgcbnuf33p9nUdqoBNWmRfgg
	4wGklrnhU5MldaSb/5m2BM1qmNJnsoi3r+3187F7A7G7zdKtXXYoxmOj7gHkjmW5Ov9Eie1QcDd6c
	cqNXXgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0Gl-0000000HCKX-2dLx;
	Wed, 31 Jul 2024 03:44:55 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0GI-0000000HCAs-0827
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 03:44:28 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7094468d392so2030328a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 20:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722397464; x=1723002264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSNBwL+37ogjDZhFrubRTlVeN1yn/UiqziyW4s5xbIw=;
        b=Y2GSE3WPJ0xANVD43yuB1zxWLPnaCdHrTne5ZkxLdytDfxIV0Y0lqkYhp3EnZg+j4K
         JM2dGU/5rCwpITaPvXdVYv23wFG9BEab/GY3N8zolu7FDfSOBgeF7EqYr4nFJnc0lVci
         GHrQi3cgJp4gbBp8vKBlL/vkCEEP8CKimIQR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722397464; x=1723002264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSNBwL+37ogjDZhFrubRTlVeN1yn/UiqziyW4s5xbIw=;
        b=txkozdvYREgIIBsjZTyM4icAJDILrU8FfjeABpkHIKGD4QkHuGByxDEa3WYxoNWegu
         KGI8ZiI5/Y2e/PAuEEWwBRuAUUY8AKmGRblLx4AnNX+giMoK7cm4Cc1g7NvK++WvVG4F
         cn8OUj2qmFsMsasPJOtvswEJktiqnnJMG62BDiO5iGkeHsQ8eNJzDdhupR8CFW6AK7L3
         x8d9fZ0YR/+Jg8wGp3JQvHIygAAzY6Y9Ew32oKMBujNevFZiq9UhUS14MOunH8lz/dVi
         MoX4mBxoXjWQIfJYfHRL/+TN9KYwYmzU1Ig71fP7RaHBDS+W6xVq7RP9grifsmFCeUvO
         8CWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAVY9vKSbrUhKkxTp5Fqw8eDwzUgqXfmTL35yQydT6kD1hVpue4Uk5f8r7k55Uycjj6KXIc8x28ajffC3Utof4IODqIB1YZIcIhRPVCHGnmEbO
X-Gm-Message-State: AOJu0Yxk6RIvT+ouvWDRMGRf6aSsUAG8w59MQrFbhHJJPcNYeD3vgdpP
	q8EXujuoLOKbzf2dYlu/q0ZQ+66OzuzTzymbvGSyY7duKG4o9fk7Uhvv0vD0AA==
X-Google-Smtp-Source: AGHT+IFC2gv72MD76iLYrIda5Eq5rF0jA/Iac8CNQ+Wji3s0CVR3dGMwhSKkd4f/9qM7nWs4EH2/vQ==
X-Received: by 2002:a05:6830:1688:b0:709:339e:520a with SMTP id 46e09a7af769-70940c947b4mr13919521a34.28.1722397464132;
        Tue, 30 Jul 2024 20:44:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1cfb:e012:babc:3f68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead81230bsm9093008b3a.120.2024.07.30.20.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 20:44:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/3] arm64: dts: mediatek: mt8195: Fix and clean up xhci1
Date: Wed, 31 Jul 2024 11:44:07 +0800
Message-ID: <20240731034411.371178-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_204426_125341_C6375022 
X-CRM114-Status: GOOD (  13.86  )
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

Hi everyone,

This series fixes and cleans up the representation of xhci1, whether
used in USB 2.0 only or USB 2.0 + 3.0 designs. This work is a result
of discussions from the original Kernel CI report [1] on xhci1 failing
to probe, and subsequent patches [2][3].

Patch 1 explicitly disables USB 3.0 on the Cherry design. The super
speed pairs are used for PCIe instead.

Patch 2 does the same for the Radxa Nio 12L.

Patch 3 rearranges the PHY assignment such that the default links both
USB 2.0 and USB 3.0 PHYs to the controller, and designs using only
USB 2.0 will override the PHY assignment and disable USB 3.0 together.

The first two patches are fixes and marked for stable. The third is
more of a cosmetic change.

Please have a look and merge.


Thanks
ChenYu


[1] https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
[2] https://lore.kernel.org/linux-mediatek/20240711093230.118534-1-angelogioacchino.delregno@collabora.com/
[3] https://lore.kernel.org/linux-mediatek/20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com/

Chen-Yu Tsai (3):
  arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
  arm64: dts: mediatek: mt8395-nio-12l: Mark USB 3.0 on xhci1 as
    disabled
  arm64: dts: mediatek: mt8195: Assign USB 3.0 PHY to xhci1 by default

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi               | 2 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                      | 2 +-
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts        | 2 --
 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts         | 2 ++
 5 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.46.0.rc1.232.g9752f9e123-goog


