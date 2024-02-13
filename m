Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1240DC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rz/JENP+mkMNpO0Fb4NRZPKZ1gPhaTVsPbcqMTZ94yg=; b=l6qRGQBSOIuQyC
	YVYMSAwQbUpfN6osGNlr9+HV4CGt/6xJmCV0S4uwY+IxtmYbKF0EhO8thpDqVDox4gNr89BHzu3hs
	yJjaGBet+Rxb1u7+64oNrBhVweWHMV1amz+/3mvWE/+ezQhfzKnDm2ikbfWDQK53SjS1t4IPYPxAp
	dhahJB9+RBhKZc2yDP/HZs8YQ1AT49l6aMUxE+cn7FuzYvH0Pc6Nk/OEGm/NeT9EAFNl/zpTnVm4Q
	0mEkAXB7xG+Rfds+nv4xXuOX8ssEvzyt2cv/GMhRTK/MddcB+jC9zAwy05IRt/k/o+Yj6X4bgwe9I
	99s71UBpLIIV7RG0Ahjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuJ9-00000009ekm-1udW;
	Tue, 13 Feb 2024 15:02:51 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuJ4-00000009ehY-3cdQ;
	Tue, 13 Feb 2024 15:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707836563;
	bh=eEv8+8VvC86Bw7Uzhzb/XCZwOrbOPyVh+VvVVKoxqyM=;
	h=From:Subject:Date:To:Cc:From;
	b=RW5U5X5JHjwOZzH44YpfCuXOVcUUlLHIWNRTX3iI6/5ddJ+8fo0fm0lnEmrzuSmLI
	 2soL9QJSTeS6pa4ufqbyycCFUUh7rp5PxyP9CH2sIlMJfpum0cm+fv1KmB5DztZ9uH
	 a+uC8ACYdi7GrCazaRADh3OrXYQpC52iVtT/qT81Doww6fRiMvBdyJEUr99u3V+zZi
	 ifHGixsc1ZYtPIVD5CpoIjv/9wnherQxp5QPeqicqav6PEDhoDKGO86Op5W1fsKWn6
	 Cx3Sw3Y1nk9bRv9jvu9rPT0Kd1lPauoZly7IZOolHhzSAbu+LjcFtlfewj5xi6GKpj
	 0c+HizhaYg3dw==
Received: from [192.168.1.42] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E18013780BFE;
	Tue, 13 Feb 2024 15:02:40 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 0/2] arm64: dts: mediatek: mt8186: Fixes for ssusb hang
 using defconfig
Date: Tue, 13 Feb 2024 10:02:36 -0500
Message-Id: <20240213-mt8186-ssusb-domain-clk-fix-v2-0-1f981d35f3fd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI2Ey2UC/42NQQ6CMBAAv0L27BpaSC2e/IfhsJRFNgIlLRIN4
 e9WXuBx5jCzQeQgHOGabRB4lSh+SqBPGbiepgejtIlB57rMtdI4LlZZgzG+YoOtH0kmdMMTO3k
 jmUoxO1uUXQupMAdO+qjf68S9xMWHzzFb1c/+110VKtTGNZW9lIaouDk/DNT4QGfnR6j3ff8Cz
 Yfb/coAAAA=
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_070247_111955_E1685CEE 
X-CRM114-Status: UNSURE (   7.49  )
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

Two fixes in ssusb components (the power domain and usb controller) to
allow them to successfully probe and the mt8186 to boot using the
upstream defconfig.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Moved the XHCI clock from the power domain to the mtu3 node and to a
  separate commit
- Link to v1: https://lore.kernel.org/r/20240212-mt8186-ssusb-domain-clk-fix-v1-1-26cb98746aa3@collabora.com

---
Nícolas F. R. A. Prado (2):
      arm64: dts: mediatek: mt8186: Add missing clocks to ssusb power domains
      arm64: dts: mediatek: mt8186: Add missing xhci clock to usb controllers

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)
---
base-commit: 2ae0a045e6814c8c1d676d6153c605a65746aa29
change-id: 20240212-mt8186-ssusb-domain-clk-fix-a691eec834fd

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


