Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FE6D0E6C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=; b=UuWgMDJLGY88XYhXlpKgBoDRxy
	WfucT0Y8Jf7cSLEbEJtDqw3W3RwUiiAiOl7n72XH3j2NIHUoLwVc5IvE4N/SZA1u8eW0CG3ovYmiT
	X8IKMHz8V42op6KQEsaFK22/vK1j8yBOBAt2SPlvlq1/ZcsqR2uqzoSMT5WFE6HOKDE4icxA/Cyw7
	Uc8aHPJdRhh6/jOFmstdM+XvP0GK9arDVzdyw5tv+ZLuswnLia5UqWbBzDsA65WGDe1yBpk+QITeI
	/jLbJid5SYicNMK+fz4MMz7tjKuKbwHeMI7aWPIShM3ZjybS+E9cb9prEiPj6tDKoGpFlODdhTpAM
	P6ZdpH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mv1-00000006O0w-01t1;
	Mon, 21 Oct 2024 07:33:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mpL-00000006NK9-2ZQC
	for linux-mediatek@bombadil.infradead.org;
	Mon, 21 Oct 2024 07:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=; b=nAJgc/xg7wl9kVx56MHJ4jCWIR
	4dmI7s5LQ5CGmn4COY7IjvmQo/6tZWoa+Jru8X2K0j0i5lWbCutfy6+O48itcr6IqXVVp4iqIYw9M
	iQGGfLEQraXeZ7IGrBWziQeGRkchmlFlREucq3GnEqOra9YI3NJeFJEJf+SXqs+Fejn3PcCKsdI/8
	Xxk5jAS3G9oy/TXXgNkWN+VTlRCQwMwvAxjU/cD8lEpK/G8R+aGLz003/zBNgrRj/nRafYOidayrd
	q35ySbhJ5qsAQK0s80sV/joCPC25/crQD+g57JEpOZbkOmhRFFGLdrWaMtLG9Mq2m21JctNtisywg
	cjofsK6w==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mpI-00000007qgh-3V5H
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 07:27:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20c7b9087c4so3166795ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729495658; x=1730100458; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=;
        b=xbYTgBnxDokgOXlvqbKBpjAQaFdHXk/S1WMjRpiNwRS+oO8U+GjdZYYqO+gOXjkcMM
         vvXLUECKOCQhYfbjx++EyIe/KP8hxnr8JTrNBnONhd+ow5eoKrIjjdJ+wytRG1DoIFs3
         ud02OWNXAk763ZFE2duH7oE7d2P4aMxsKIJCZrn2H/1Z4Tkfca8k8Tou9KXTIYQAIYc+
         jRyVC2mFPbzHyTVwiReCHLDRtspZ30X9nM+LywFFIHiRMd5JjJaNyhz7RaBLjpJe0rNi
         G1Cxo29lUeEf918DaOPNPj6JJiMYE6K+xcFDkqMrIV/j88l/N+3guBu2fytEFrWy3QgE
         3uYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495658; x=1730100458;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=;
        b=s5d5gyqL5gubjMUBd2yYqMOamJlWNSZ/qXm7V5lr9KzxFuL4ifkJ5tB1smJZ0PholJ
         H5/9vgLvYuhd85WCmEPr5n31kSa65eWNgWmdvmr37HM5Z9oDNBz2MFXThmbAitMIE+lt
         Ad0qZqEvbmGvalOtW0GD+N3E5TjsysO1ThQTtW9VzgWknWt2GneqmGS/vnzDre+pdiyH
         6TTiseb2YgGb8vXrFcbbYtOjfdSAD1GEqAvgBINBsC7tcRIpXN3nmLvP6+gUahaRxpru
         yq6WVKMOfnBihktdKQP7bJnoglObw+vf6poQyD26+jpvipy2oCa/ixRBERjTmfUTQeWX
         +OlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3qujAQlPIs8nMW7W/I3K5gtRwteTb4K1xR8sCAXZyh5jFcHqXID/U2Xj7VMqVO7TV7eTaWFaNmymC7jNpTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy25HeRyriFB9Wlc4FU5kquTpGXlqEzB1MAr+mCK0AkRuY/6bk
	H4OCFnTewKD2LDidnAqJgofQFWBBDnnbGWtW4FZjvH3LSAUxBzn5r/vguayLNlA=
X-Google-Smtp-Source: AGHT+IEh6/03mZfFhuxBy6xAmriaeuAlOB4siq5+NfULwqzoaaUzBkefycmGSb5S4BiTt/jpYQtLhg==
X-Received: by 2002:a17:902:c44c:b0:20c:df08:9a78 with SMTP id d9443c01a7336-20e5a9ae59cmr57079665ad.13.1729495658258;
        Mon, 21 Oct 2024 00:27:38 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0db2desm19749595ad.203.2024.10.21.00.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:27:38 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 RESEND 3/4] arm64: dts: mediatek: Add exton node for DP bridge
Date: Mon, 21 Oct 2024 15:26:25 +0800
Message-Id: <20241021072626.15102-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_082740_992195_C75E0C5A 
X-CRM114-Status: UNSURE (   9.13  )
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

Add exton node for DP bridge to make the display work properly.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index 682c6ad2574d..943837f20377 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -424,6 +424,7 @@
 		ovdd-supply = <&mt6366_vsim2_reg>;
 		pwr18-supply = <&pp1800_dpbrdg_dx>;
 		reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
+		extcon = <&usbc_extcon>;
 
 		ports {
 			#address-cells = <1>;
@@ -1656,6 +1657,11 @@
 				try-power-role = "source";
 			};
 		};
+
+		usbc_extcon: extcon0 {
+			compatible = "google,extcon-usbc-cros-ec";
+			google,usb-port-id = <0>;
+		};
 	};
 };
 
-- 
2.17.1


