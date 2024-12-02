Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDE9D10DBC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFwz407Fv/XwMseJNTNI7dRyydn8B5G2ldLHp0TZ1PA=; b=WleEAjZEWVP87kvArdvQ2sWirO
	LzXR33IJcbkX5TeE2MQYxTZHa44rqBfxWZ5RX3aLZNW6aVZWV0ad4kIElG3jANyxSDiFKPdrpGJKM
	xOm4//DEKlgEhmNul5xuK5YVm6xgBEuZkQhm4RA8ctZ4glhB5fWT412Fsro7TYMnTLbGdiYMqrHa2
	CnDFethOZ1G4PvcLQHkSrvggE5TOtsL2XZDU8KsM9FF6aVwXaiYEhF1WxgJXfE8Lavh+xqeO+DVGU
	Uefva7GrrtcO9c3bq9NmfhBmc3WQj1RQsCZHtHduqhHGBDSUT+o9C7iW7+i+MVFbBVYycvSjaSguC
	McmDO/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1bP-00000005Och-2YwL;
	Mon, 02 Dec 2024 08:16:19 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1bM-00000005Obg-2HqT
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 08:16:17 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso2536625a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 00:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733127375; x=1733732175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFwz407Fv/XwMseJNTNI7dRyydn8B5G2ldLHp0TZ1PA=;
        b=Pe8geqJ5xWZFuTAU7i+fAiu6RCr3/8nkPa6jRBXcxs1r4dp+NBMFA+6YNJwW3eDAQA
         17Rh26sL6oapaRD14zsnNc7OIIU6zgfZfC4sX0AE/ji+pb7AXkxrEz5pT3GomzKoA/KA
         eAcIJC7yRdqEYerVOaK5liBC+LSFlNeoZvz3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733127375; x=1733732175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFwz407Fv/XwMseJNTNI7dRyydn8B5G2ldLHp0TZ1PA=;
        b=vNoQ5VmINpraGQIgY16RMhkZMg3d4dDwz6TMW+UAngiJMv5NT96jzwdPDobNJ1rUKP
         CwsEvwwA2W4GpnIZs3SaAEe+EJ5gAxIsOqvwK/uMx0zLkKBtwb+7tZhyBVdKy0i7VnTp
         neDy5ZuJlGZQCToojAkUftD0/GQyJKTvcA/EwxENbwB9ND+JIplGH/vh9Z8ZMzFoLg+V
         45cIgQBnd7o15hvlJaA+7enI8XOtkOrj78IKvFTKKkjf1oJ7x/SjsPQnRxS9+VVzjEW9
         DwuyFEaVTdqtWpPcoQyzws8RCoZYI+dN0ekXGy6ODTyhUHHQw2KSHo+91VFjT7OWtB1J
         VDAg==
X-Forwarded-Encrypted: i=1; AJvYcCWIg5WEx8Jmc5KvVRHvLkDb+d4uRThwF45HUAEliT17YD95q6qo9mXtw+oY+HP8cU3QaJiCtdi+j5rNt/pfgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWGFRWHA/tqdck2upRRj7c8P/AoDBRWrDdk06vyScVhSSLOgk3
	q2/6stK8NayQG9jLpK4f+12EmA8XStdXcSDV60w2yqE3YnmYQAo09ldkO0HfHQ==
X-Gm-Gg: ASbGncvoXK5qkOox+8VRJqaSLUibUVqXfY9ll9CopR4NMOD7SzW5My5TnyZ1pkzV0Br
	OTq6F+Ccp0X7f+VEt4E3f0RvB8U6USJPlsz3J59+xgETuY9pl2n2/MK1IGiVLdj0Ipd9oFD5zOg
	IVfuMpqlO0O0t5XCSII94rFJE9AOrKcq8vLrmrgYL1o51CQxqv1iJuAdFPeQXIWdSx1RiO7V84h
	bNaiw1m7ocDSnh7v8lPV4JkAMIqXwrx4PJCZvN05EQKK52SB4ff1GElBft9BxB+BEFU
X-Google-Smtp-Source: AGHT+IGVKJH1h0FeZuaxYpdL1EkQ7vtbsLObgOmtsoxPqtC7AsSUKW71maa+1Cg0tbmdqz/W2Hd3KQ==
X-Received: by 2002:a17:90a:fa45:b0:2ea:61c4:a443 with SMTP id 98e67ed59e1d1-2ee25abf59cmr26106958a91.4.1733127375376;
        Mon, 02 Dec 2024 00:16:15 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541848505sm7891833b3a.178.2024.12.02.00.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 00:16:14 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Koichiro Den <koichiro.den@canonical.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH 6.6 2/2] arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
Date: Mon,  2 Dec 2024 16:15:50 +0800
Message-ID: <20241202081552.156183-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241202081552.156183-1-wenst@chromium.org>
References: <20241202081552.156183-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_001616_581390_8C3DF589 
X-CRM114-Status: UNSURE (   9.49  )
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

[ Upstream commit 09d385679487c58f0859c1ad4f404ba3df2f8830 ]

USB 3.0 on xhci1 is not used, as the controller shares the same PHY as
pcie1. The latter is enabled to support the M.2 PCIe WLAN card on this
design.

Mark USB 3.0 as disabled on this controller using the
"mediatek,u3p-dis-msk" property.

Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
Fixes: b6267a396e1c ("arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20240731034411.371178-2-wenst@chromium.org
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index b78f408110bf..b21663b46b51 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1296,6 +1296,7 @@ &xhci1 {
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	mediatek,u3p-dis-msk = <1>;
 };
 
 &xhci2 {
-- 
2.47.0.338.g60cca15819-goog


