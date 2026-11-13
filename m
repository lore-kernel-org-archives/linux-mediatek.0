Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53BF6077D34
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=udnwyG2j;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XaNEHUo8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+YBuuAmTy41OiDGu1XUvHph2eW8UaCdom070kDsHJH4=; b=udnwyG2jr8owdpJchRjL36Rqlu
	QMCd151Na5cZB+VBVgygYJJRa2jtsJhlTR8/V6Agv8xfaGMl1bZOookRPZM2s6gT3/qWcTUZwi2Ry
	Yj9+KOKn3+665gNAzZ00sr46ll9LuoGDFrJgiPvMlqMA52qI/7D/Syoi1HXLogAmu25xmg5kho9JQ
	fHeki2dERv5DsjTw3ZbYWhxHi/3fnY+DzpKOGbSZbB2Hb/1AxqRsp7VB2so2TUoKToHrCurKfPjOH
	ucLwHAbzJ5Fvge+xKF9ag0QvdhFvMfTUjUYXsCCGzqCjrTlKThClnmavGhhTjVAtJVUUK9x8kHRjr
	sTDGwRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuMz-0000000DdEn-2O3k;
	Fri, 13 Nov 2026 16:43:21 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuMo-0000000Dd6g-1Mmt
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 16:43:15 +0000
Received: by mail-oo2-x09.google.com with SMTP id 006d021491bc7-717028b412bso446489eaf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 08:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588189; x=1795192989; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+YBuuAmTy41OiDGu1XUvHph2eW8UaCdom070kDsHJH4=;
        b=XaNEHUo84b5S+vho0m6u0nlrf63n6Xrh72JlKpRgi4jLQ9UHcFEfbkpr6B/wiQ2Kkp
         QlJyOJyD+7sXbmLfbr8XYe9M7VcKJUmd+CgjIo8v61mWVfxqJ+aU2DbT57mKXJqE/cIl
         ANyfpIG0IbkNe1opG5Kn7NPKddqCeg41vwpIdHwBalkX0tdR/2UogMvLdGXdHOuCd0IT
         1U+i5YTzO9krP8zFDClLnEglHB63b8K6+wZ6BSITSGFN1CdddjK8M+8R2r2wTnM2v/SW
         41R2XShW5eukP0HkLBDdjRsIkIMxoJI4xuRUr2UveMmq1WiT3hdOl92BcbQvC8ZMNiJr
         YsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588189; x=1795192989;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+YBuuAmTy41OiDGu1XUvHph2eW8UaCdom070kDsHJH4=;
        b=ln/DBw7NxNiRx7XZTpJuDVwYomVHzom+0mYbfA/Oh965ijrfWPnXJp4cq/5e4O6U4t
         1YewZB5xvZ3K0D5lha25GCaDLkGtVFflum9g2jncZbHVG8CXNqfF0jbiT49T0i3ISoho
         xGm0twQjVGvK3LPHnhVD20wgVS8sLV/aw0c8DG+ISikHToW2LpcnWhfAn3pgCCUoN/Me
         0L7GcfpZYX5nQeXljRZBCE7SnH48w+gSCXVDznlG8mfq68b13+9y9LGTO1K0eZ63Qbya
         yBx1nFnyE8G92uX+O6s5DNsQtyyr///VdvKDYCl3dLCwsY6l75s8b5pmBfZ/4EH9wd25
         n+6A==
X-Forwarded-Encrypted: i=1; AL+hErG/a0E13KqnBCp92qKfkFKf1UrKzrYr6dIdqt4zIQj0UchRRI7xyQnvnIveBnFv09NlhfZwnmjuuJUeRomVLA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/YaDOFwec7YVQrlYHw1Knhq7OuA0zNYvP1V+nZDpdF9fSDgPI8
	ZE9zqe2brCfk+GRcHmHS0zmTt+uejSWgypmMKSpgCQxFNuONfSVLVNjo
X-Gm-Gg: AYBFou21sEw+bGczsTMq+KlSDinFU5/JYw6vt+z4hpAr444kPdHyFF46y2KTEUKFVTU
	1YPCwf5+zKTRMhDQRZ9Uzs5g8U8SxAe8dKFW7kgiu13Z9iYPHZnpTaCFr7oiGPgmBiODc52blqq
	3NvtWX7T21O57Np2sfW8G9CZBBmtcp3cDKj8p8DMJz6w6w/r8uB2S+qGWXm2bpvvhRj0tKt8Oef
	8mCcQ1eNDZkvZYV39umQ5eNmNuflXplZmL+Rm/pJAnKipUVQepRrHXfbOPZseB0JM9fVt5tEdoi
	aLKrzBXl4SEWkxYSJd1bJzmuYPsLwVGhe+hanPwo+oR6cuFHPfgeqpQA4qIksQ2/hmI9xQrnj34
	VnNiHadFD+DtaE3MliLf7VicH7nzqYqnwl21V8EIP2CLc7S4eQZ5HmZ3QTPa5vmPwoN6Mx7mhdU
	v1IHCY6MyibtlGSGmxNVYNwIgJgT60IFz4wnhigAw7bjwQnt4xdeTmZ0t0eyJYwh/hJEfJFW1gl
	JTn/rOXXMpusHsw+wf3MZlFpGjuu212RpozOBJq5DdDciWAoowhpH8yJ8XuRUkvjNbpVXj2XlT/
	r3qFR2uEOCHFpBgZOdEd/KpK0oB2M1Qiyn2++FfjLxXme77/n1R0GDWyDvNtsZFKp62u6NaV2Be
	GsQDCQxLVjOALA7oYsn0=
X-Received: by 2002:a05:6820:3382:20b0:70d:a53e:845 with SMTP id 006d021491bc7-71ab4fbc207mr1421060eaf.17.1794588188901;
        Fri, 13 Nov 2026 08:43:08 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm2712816a34.10.2026.11.13.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:43:08 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: mediatek: Add the Amazon Fire HD 10
 (2017)
Date: Fri, 13 Nov 2026 10:42:43 -0600
Message-Id: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43QPW7EIBAF4Ksg6iXixwabKveIthhg7EUK9gawt
 dmV7x7ZLlJFSjmv+d6bFy2YIxZqyYtmXGOJ80QtkRdC/Q2mEVkM1BIqudSCy4ZllxdkZcEnW+6
 lZoQUp5FBguc8nXmohQmvjTPCBGUUvRB6zzjExwF9XM8749cSS6xn+MtZsmO8F39iqWrVGwbLA
 4JnLQopOy5b33K7trvmoCDzc0qxWmIa0yJ0ru200E4pzxsYXG+0H/jgAEIfglaDo3uvWyx1zt/
 HP1ZxFDumCyH+O30VjDNjXGN8QDBcvo8J4uebnxO9btv2AwmaHLp0AQAA
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
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588187; l=3912;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=WylSHm4dzrdtVgGa+mGeS6ky2xLAeM7GIvqZAq6Kk08=;
 b=nBxkN4N0lqElqm29Lbz4sWMFh/t7ntJ5rI6el+UpB4ylFVvJTBrByCx3qtBoZMZGo8JOaIrDj
 UD1c/lyd9LbC+XyDdVqVaPXff+mVVwFC1EAlVeQuqGMZynvBNWDKrMi
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_084312_241512_C0A92367 
X-CRM114-Status: GOOD (  17.28  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This adds the Amazon Fire HD 10 (2017), codename suez, an MT8173 tablet
with an MT6397 PMIC.

Patch 1 adds the board's compatible, patch 2 the SoC's keypad controller
to mt8173.dtsi, and patch 3 the board, with:

- The eMMC and microSD slot
- The micro-B port as a USB peripheral
- The panel, the backlight, and the touchscreen
- The accelerometer
- The light sensor
- The charger
- The lid switch
- The power and volume keys
- CPU frequency scaling and the skin thermistors
- The battery thermistor, on the PMIC AUXADC

The keypad and MT6397 AUXADC bindings are applied for 7.5: the keypad
binding [1] is in input (patches 2 and 3), and the AUXADC binding [2] is
in IIO (patch 3).

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

Tested on the board, booting this device tree on a v7.4-rc2 based kernel
with the pending drivers: everything listed above probes. The device tree
validates against its bindings, checked on top of [1] and [2]; the one
warning, on mmsys's assigned-clocks, comes from mt8173.dtsi, so every
MT8173 board has it.

The fuel gauge, the sound card, the MT6630 Wi-Fi and Bluetooth, and USB
host mode will follow once those drivers and bindings are submitted and
land.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com/
[2] https://lore.kernel.org/all/20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com/
[3] https://lore.kernel.org/all/20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com/
[4] https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/
[5] https://lore.kernel.org/all/20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- Add the board in one patch. The volume keys and the PMIC AUXADC are no
  longer separate patches, and the keypad node comes before the board
  (Krzysztof)
- Don't disable the VPU, the video codecs, and the MDP. They work on this
  board with upstream TF-A and the MDP fix [5]
- Collect Krzysztof's Acked-by on the binding
- Link to v1: https://lore.kernel.org/r/20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com

---
Ryan Brue (3):
      dt-bindings: arm: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: mt8173: Add the keypad controller
      arm64: dts: mediatek: Add MT8173 Amazon suez

 .../devicetree/bindings/arm/mediatek.yaml          |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 679 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
 4 files changed, 691 insertions(+)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
prerequisite-change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50:v5
prerequisite-patch-id: d709637c35c840fbd22b30dd39452d3116a8e8e4
prerequisite-patch-id: 04f2ca8ae588298f0ad75af44266cd028d00bbe4

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


