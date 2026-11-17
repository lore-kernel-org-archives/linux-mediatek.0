Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC2606A886
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 21:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GZv0xjLS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOHlvyh2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d1K+mbLNZ3XlygCDIt+0jGc1s8u9UEZgC/x+nQI36Zc=; b=GZv0xjLS5G9GtGbTFpGmAz3zT6
	24V01o6cQHsrunWIb6RwQHj4IPsMlru7ofIFLFVw58dFbb1u2GoPlkd7ZbvZ80gAZCxbBY7KQPu4t
	fjFklAnduqkPfwVsMnS/qqkbnJnx+aajTFKTy3/3RLi8LxSYOBq9k2xJsc1O9iVCMtTtAp8OYFXdQ
	ndOE8I+WDRJjvryDCU8AUfXQd4DvfxCGJGHPSxYZZF2oQ/imLzuIQRxDnuxWQ7UcDDsL8MEZJN2VG
	MZJ+zKpvpy8Xg3x667DdB71A0/FoS/Qayz0AV/MACONeSDrPJYW9RQRGa79Y5bevb8r9ILgYIyRN3
	lWMjIspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQTf-000000075vA-1OWM;
	Tue, 17 Nov 2026 21:12:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQTe-000000075ue-20gl;
	Tue, 17 Nov 2026 21:12:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F11E640068;
	Tue, 17 Nov 2026 21:12:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794949949;
	b=S8cDcwBdPTTDYWOWCVFtu0VV+Bt/1rFoIEEWdrD/uuzU2UY55e7eHD/jOL9xaGbiBs7j
	 GZ2gJlsBdYnCzzfRPCjusZVKMxk58HyVf2mZdTfEYoGnkuv5a5lcXpl6tt5PpWbTwpkkC
	 TAwoMBZj4v12ohcjHo9dIxUTWLRPHkwQ7Qyo7y3sm/iN8i5CkdqO8Y51vEC+HKDfJA9Vk
	 AybdmCaSKIgGuTfPbcX7Qml4CpAjFhpDV2fzjudYPAPXVMzhRMpiQoGG1azIRIhvlLhjh
	 05dyTc7yDqqIKbmspK7vtBLMCwtkTLSfVaf4gY4yGDfyFgaY38HUO0kKLt+INzw7BXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794949949;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=d1K+mbLNZ3XlygCDIt+0jGc1s8u9UEZgC/x+nQI36Zc=;
	b=Nf8MD2FS3umZyUzdKt8K8iu1IMN+uhkYp/hBpYodfIWhd7B/8BKAV0bnhDrbDfS8fpLG
	 d32OkmPNKmmliz/WSED0Z2W10opA2cjuQ4qaasMkP+5ujGxXgYB0nT4nl3b8y+OnMnHsh
	 /iTstoI4Ey/3cAAHjT8sL+qxjSujfT2YFVP/PudlFjxcDj0CwCOg0iAEVjNcPJK12xXAN
	 otpUMpPTNh6CDhi/NaYotYgTibO9QdKteGy9VEVHcbz+qN1MvmYhIRy/2OJIOUanbPOsM
	 QTE1CgFEFBxnzdTwNfTokE0kC0qFHTwvdU4f0rorZgm6iUtQ3yyE8x1jQiyB/4BYP4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DF8E1F000C5;
	Tue, 17 Nov 2026 21:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794949949;
	bh=d1K+mbLNZ3XlygCDIt+0jGc1s8u9UEZgC/x+nQI36Zc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=cOHlvyh2oHA7xkEYKqaw+99eADjB1qW2S88ey3QupNnY6b/7IW1gLEkKO+rgYk+Dr
	 aiIGU4QG2vJaS/z1yw4bMtVIFxiccpkC1BGnpYAW9BhiPYeGCf96yb+D/oPzNBFUjm
	 U1aWwSGFLfhFii4pw2FaCKfTVimP0HYMbb2jtQM8QdTsuaIM0AJYg/nqCptNwfTDl5
	 lRQrXxtDyhkuqkGFWi8z1lO3dpKcv569AHybu04Wn6NcBZ+I3haqi13bJxluEhRFKz
	 B3qfMg8Dw+gbsBn01kYsqb0fYLXhUMzTtWEKkTHFMnK+ADUvASZVUCdsobtY/ehQcd
	 MaHCxjWSMvztA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A4D334AAF3;
	Tue, 17 Nov 2026 21:12:28 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Subject: [PATCH 0/2] pinctrl: mediatek: Add MT8163 support
Date: Tue, 17 Nov 2026 21:00:40 +0000
Message-Id: <20261117-mt8163-pinctrl-v1-0-2cfd12206b17@protonmail.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3dwSC0MzY92CzLzkkqIc3SSDFAND0zQjYxOzJCWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgB9SlqVcgAAAA==
X-Change-ID: 20261117-mt8163-pinctrl-b0d015f2346b
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794949947; l=902;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=1RUSaNQaX406sgZc8R8mxzN7Q315rl1SptZhofKDiBA=;
 b=iXMhQXmjmJwcA72ZEb9q/p7LA5/PVRKlDSXyJRUfsA8uP1/qdR69WaGrMAPELn1Axas5Tdwri
 /VtuCOgZJ+WDk3PnzY6T9ITFfXzfbdpPKHKftPL4mwiXxG/1sxny5Nk
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: bengris32@protonmail.ch
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds device tree bindings and a pinctrl driver for the
MediaTek MT8163 SoC.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
Ben Grisdale (2):
      dt-bindings: pinctrl: mediatek: Add MT8163
      pinctrl: mediatek: Add support for MT8163 pinctrl

 .../bindings/pinctrl/mediatek,mt8163-pinctrl.yaml  |  208 ++++
 drivers/pinctrl/mediatek/Kconfig                   |   12 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8163.c          |  478 +++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8163.h      | 1299 ++++++++++++++++++++
 .../dt-bindings/pinctrl/mediatek,mt8163-pinfunc.h  |  821 +++++++++++++
 6 files changed, 2819 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-mt8163-pinctrl-b0d015f2346b

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>



