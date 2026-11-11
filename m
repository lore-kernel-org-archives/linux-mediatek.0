Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3C60A263D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IVPjZVcH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmDKaDUo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=; b=IVPjZVcHQ5fVkrBq1VR072r47J
	XSFdB6xrOFYZidPTYSOKj0E9qcl4GCj9KPNacVu14XxfGwDoPtR+wpAgf5FthShw2JX+hp7MDUHO3
	RBt/DgwiC+S/TE39tD+6OCvaZGfkigXoO2LtoLQbwK7TJjaL9KZysQbS8F50LVHGKp1UGiLTIOLlE
	9LkF7J1BUSTlhQJdEeyIyjSuugPHxSZPFEI4zQWwkd1C197hQ2GJEEdLGVcwgguLGCeiFReb/PEka
	9zNlzZKw90I+Ass66O8IiQHQDudik1bVsQYeABxtpcayIe3ldt3K7EAXrCl9HX/aaQ/aLnuG1mMRh
	2QkAV+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCva-00000007ODU-3G24;
	Wed, 11 Nov 2026 18:20:10 +0000
Received: from mail-oo2-x03.google.com ([2607:f8b0:4864:31::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvV-00000007O8F-1pRb
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:07 +0000
Received: by mail-oo2-x03.google.com with SMTP id 46e09a7af769-8459f7bc7c0so1582665a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 10:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421205; x=1795026005; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
        b=QmDKaDUo76p2vvLaZbShvUEr5EHtE8FNHjPWq0Cf6DpQeLKDhJYPilH9obpy2QrjlH
         PJ7IUfWjUqkb7h2pezNhQhXJslPI/P6jZ+soS7yHvLVcNUc7eUSg/C3RFn8mz03OctXY
         DsD9XXZwl+PgM/SpMh0FRPyLAzVXRIdR4nMBW4NB0V1eNWXggG/suzsu8Zo9+VsjF/g1
         kSE/k9cpDKRycS+GFKCfBXYDKHWrIsyG61LpTJbrtZjcziaxeP5dY/qtlTXJhc0nQyL+
         6rhDCJNwjBJXM8dzu7AYhMREvG2ucmc4NC6NuPfnTlMQ0OgEQgUOb6amnAwVvWgi6T4w
         pkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421205; x=1795026005;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
        b=XFDGLhwnKqqJ9Nx2AvoDaR7K9m4MDtilLtdtH5O6LJLjTqmL12VBn62HwQsJB4wJns
         EYEbwcLstjIj2J5YK99KyZ7pNynMnwRG0Jv3tFB/C/HPf8skBiarfJ31jq2rZ5tqINQY
         qYb4A6VevnpaS3ahhqy9sQldtnL5eNHtZ1mu307MRNK9ahKleoOHE13egsks1xPPUVnH
         uC+VHskwNalEZYn7CfP795G6StyTMTyJefATas1QY3XCcybyG1VLBQ6ynkSw8r9WPr3/
         Wvw7SiyFfSbeDBO7brA+LoH1NXcnceYb5MLYkhJzlynfWOL702dXC8PjbxgW+VrMuuhR
         i6Ag==
X-Forwarded-Encrypted: i=1; AL+hErGR0GY0dZZPN5hgLU0O+WD0+cRV9gxrq9bbsb2E+4j2MT8hWoqKz+s8lzA4eex/6sosw/snLLHcC4carv/XfQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9D9s3+CT80t4bUSoZXPHbhuCMmyyG4bJ1+X/hoGjZiI8AWpNL6
	RrCPSyv8Yf+u+WihN3c2CNogFHvotlIQSFgxK8gb9r6EbtqJpZgkBYLr
X-Gm-Gg: AYBFou12P96crPwhR727KbYRSt0JPW87tYm7Zk68wOjYGMav+OJDH1bIU9z4gpv4iPW
	baJi0e9i3oQ5Xpp1Vxs8hSeipUkmsLGi1SYlmnHajPF2+D9FCqvQ+WxAVVjFO0zudBiUOvUkZcp
	XK75FS300MWo66iCX9RIMpNAlxClvpVi10O6PklUckPej7kA6GwmD9U6w+Ql/iu06I+YKJDpFX7
	cdMuXHGqvqOB+Lx7UwesZit9veFQUFvVPG1KjfQhU21ac/4GWUapZgLls95MdAMaa1s25mFVSme
	Bm/bIKBE3TN1CyDzBrZkqtVo5M2ZOBQx5cc1GBfKKdx2SIcxE/YB74VVgAMsykrWWd9qNw8ESRo
	q00ypvLmoOHNCB/GMC1hoB7v/gU1m5vguL+CzdtsrGr7W46nsK4X6o5xMmE0V4z0gGhYgDBNOrb
	ZbinH0l1oLLGkpJ06oQgMkqLRkfUqktyMemRNfDTKC11Yotw+d1Kk7Ntz5tDk6i3DuCOB0nHtLT
	Cf7wvO/NvA/gYxR9nsOlTOzdQW0dacmnQHanriQnEJ7J4ijYKHoc2jDjPk0gJ80/+2gvJqYPVKn
	b2F8J977lWFs/M651FNGP3y6biBbEF/lK9G0gjeFUiRsDG57MEedHbOrwAHByxy6J67CtsZXBX7
	iol4a8SYxa2CzPNvBv34=
X-Received: by 2002:a05:6830:230c:b0:821:c75e:5309 with SMTP id 46e09a7af769-860f2824528mr4052098a34.7.1794421199944;
        Wed, 11 Nov 2026 10:19:59 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:19:59 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/5] arm64: dts: mediatek: Add the Amazon Fire HD 10 (2017)
Date: Wed, 11 Nov 2026 12:19:49 -0600
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/3XNOQ7CMBBA0atYUzPIdhaDr4JSOM4AUzgBL1EUx
 N1RSEFF+X/zXpAoMiWw4gWRZk48jWCFOgjwdzfeCHkAK0BL3Sqpa4x9LISp0IrlkXIkF3i8oQt
 uncb9Dzmh8q3pjTJDZSo4CHhEuvLyhS7d3pGehRPnff44KzZMntVfLOS2Oht0ZXGDx4aU1iepG
 99IOzeb1rtE6KcQOFsxm2ON0Wvo3u8PINOci/AAAAA=
X-Change-ID: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=3441;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=JY/ZMokU8A01a1ECQeqMylLF/hWf9QwtOhovwgrHl/E=;
 b=yxUBcqEPnePvIAwjsS0Wu2SVXsFmjFxaGEtbfTmm8jhed19s+uQENEkUxREo6Yd4B5zk5bx+R
 s/e+p1ybKXTARwhbGECLRC42nkc4NZ+EFC7VSvDb9/DeY9c1U2jbR4I
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102005_710047_5960077E 
X-CRM114-Status: GOOD (  15.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This adds the Amazon Fire HD 10 (2017), codename suez, an MT8173 tablet
with an MT6397 PMIC.

Patches 1 and 2 add the board with what upstream bindings already describe:

- The eMMC and microSD slot
- The micro-B port as a USB peripheral
- The panel, the backlight, and the touchscreen
- The accelerometer
- The light sensor
- The charger
- The lid switch
- The power key
- CPU frequency scaling and the skin thermistors

Patches 3 to 5 add the keypad and the PMIC AUXADC, whose bindings are
applied for 7.5. The keypad binding [1] is in input for 3 and 4, and the
MT6397 AUXADC binding [2] is in IIO for 5.

The board needs a PSCI 1.0 firmware. The stock BL31 implements PSCI 0.2,
and its CPU_ON never powers on a secondary core, so with this device tree
the stock firmware ends in a watchdog reset loop. On this board it runs
TF-A's mt8173 port as BL31, started from the stock preloader by a small
loader that hands it its parameters, with U-Boot as BL33.

On an upstream kernel the panel also needs the DSI command mode fix [3],
which is reviewed. If the bootloader leaves the display scanning out, as
the stock one does, the board also needs the MediaTek power domain fix
[4]. Without it a probe deferral of the power controller turns the
display's domain off and on again under the live scanout, and the board
hangs.

Tested on the board, booting these device trees on a v7.4-rc2 based kernel
with the pending drivers: everything listed above probes. The device tree
validates against its bindings, with patches 3 to 5 checked on top of [1]
and [2]; the one warning, on mmsys's assigned-clocks, comes from
mt8173.dtsi, so every MT8173 board has it.

The fuel gauge, the sound card, the MT6630 Wi-Fi and Bluetooth, and USB
host mode will follow once those drivers and bindings are submitted and
land.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com/
[2] https://lore.kernel.org/all/20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com/
[3] https://lore.kernel.org/all/20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com/
[4] https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (5):
      dt-bindings: arm: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: mt8173: Add the keypad controller
      arm64: dts: mediatek: mt8173-amazon-suez: Enable the volume keys
      arm64: dts: mediatek: mt8173-amazon-suez: Add the PMIC AUXADC

 .../devicetree/bindings/arm/mediatek.yaml          |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 702 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
 4 files changed, 714 insertions(+)
---
base-commit: fd9230005e85472b81c1c7c16afe93dd878996b1
change-id: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
prerequisite-change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50:v5
prerequisite-patch-id: d709637c35c840fbd22b30dd39452d3116a8e8e4
prerequisite-patch-id: 04f2ca8ae588298f0ad75af44266cd028d00bbe4

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


