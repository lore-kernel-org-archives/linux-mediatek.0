Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC9FCD4853
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=; b=oA1vU/lqIT/TxHmjKsm5g9VBO0
	OzBIica/bqs7ekTcZlPUooBRZZzPLClpgWSAAd0fO1rM2j84Z6FtzakrV7Hbyi9wzl1dKOC2xnmx2
	YaBG+icnbxixCZ5MZWtM+TfEMgNOWBV+/MJN5LbziWBWdxGs85HOtruiGMeNT3gvrZzcKDY+1GCpj
	M0K1H4xmC2ZneAQBh7lCm+Peh32um/Clf9VdOiFg1c4AzlY8e4Lqo+0uaBcyeMfq9srshgKxmnVnx
	JTI80t2/G+T8zZQxGUZ8BvNgcZTepDT059CSPBd73RLPTRYq9oB9I8yX9B/WVpAORaVnLY0T+JaEG
	aDkqyu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkqAB-00EoxC-1S;
	Mon, 25 Sep 2023 18:18:31 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9a-00Eode-1H
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:17:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9b29186e20aso196643066b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695665873; x=1696270673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=;
        b=h06uflDOBCtXJReBY5ba0EvL0YlGbOo1wVjgz/h1vxkiBi8Jav6Gr9Kp44RLEiPdNk
         bc8kPcE2q3C8cxVnyQaIVrTHRgu7j0Mz8q8hKbRDvRvk6hxgb1B0/4SnWv4rwAOFvtZq
         kQSgtRtosrt9vYCN0+cFbN6bp/OeVL7qqP/AOo/vTfP9QbHxaj3cboynHEwsgX/w0pGE
         GqVD0dMt6hiR32RJNvx7cmvMHtYdFTLEWifvZiNDPo46X8+Co6H9SQB57Jzt1RAMRmnW
         GuC4XF0mWX9uYLAPSqhNwgNs2TMb52RevJmNjoZrQkDb8YyYf/pV77kmjfG/xTij4Fb9
         VbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665873; x=1696270673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaqmMPfKXAOtSVjFcLvPHbWm7slgkGY5/ld8VMlAl3Q=;
        b=SSxUTZNfyucbPMfMZ7jFLOjjNP6Heo3os6IlvcxrA6vNIi+BaKZFcK4Ii2JAo9Anpo
         oX8umuSOfKF7BtASFTh/pIT0pTTV1q+oyDnrhvpMmYQZZRSAFbK1f9kiyTVEwughSqLj
         p6kMZWJ7lJJdjPmSXCg3WMtoEr+F9hdFszzchWLxmq+8qIWqng6yUebuYztWqt3UES7L
         oinVfc5p51TD63hYZkUrvVvld9/JkxT/UoARHo2NMJE/4j3YshoAW8GhZUEg9MeMsVU+
         LEo2t9HiRAOxzigMwJis4++bhUDkacUiq8R8nmoiug41Thl9tAjJP6PellF6LO0Gt4sy
         aqEA==
X-Gm-Message-State: AOJu0YwbnVJng2kDFBdLXMNAKgigeZa1/bSJld3HSa0ebl2F7s+VznuJ
	CRfC2r9ykaI8nQtpppk59y4jxg==
X-Google-Smtp-Source: AGHT+IFxzjt0ed1oiSWTrzfayOWn6SKtv3vQPmnoX8XFg6JSjmVqbuZx+3Y90wckx0OT+kjZeilupQ==
X-Received: by 2002:a17:907:26cb:b0:9ae:513a:528b with SMTP id bp11-20020a17090726cb00b009ae513a528bmr8432278ejc.36.1695665873235;
        Mon, 25 Sep 2023 11:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm6793962ejx.14.2023.09.25.11.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:17:52 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 25 Sep 2023 20:17:41 +0200
Subject: [PATCH v6 7/7] arm64: dts: mediatek: add iommu support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v6-7-24453c8625b3@baylibre.com>
References: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
In-Reply-To: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9vmrSAYQ/OJGejgymOj9rq18l0jyb8olHnhsKnJiPYw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlEc7Fj1C08D9uWY76sqRpCZwA3sp773KCNObftJqZ
 Fs9XuXGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZRHOxQAKCRArRkmdfjHURTJHD/
 95xhPf1bWof8l+Jc4t2D0Wyk7Htq4NwdZDFDBUCTIeyyJYjTdPXumlZAMdZI5JCZH1b4axEjdOEXB4
 o5eaGyx6Hm20412uB16q/KxliblLI+mi/FG6cPHCJ8GiuEHWHdzcrH0vLRzr38x72dQKoEWQBVtBHR
 VKPvHuV8KWebyFt+QxFLMeUDfsojemOuJDOL34mnmSufu8XfKLJM3Fs3mv3+6bZya8hvyEZbPWZae6
 orUW1XRiKmtM5NMTTwUlgJDM3uwwKSCm+hCNgvf+UlySjiNGhm3e5olJ4Ss514Jb6y6h1a1pHYgSiD
 WV13451VfZZo0pZ/TWAUPNhtN0ETsF+V+yDD0uS1zYs/l/A42oDSIWX8oLWw1hGiGCnBkL55ZDgRxs
 mUAvzPH2bk2JE/DxKhA6bHLgF9Ho7wNnZcmZwG4uWJXFUd4US5uucRsAAv0USxVEjWxVpVnWLpozbm
 nq3cAm6HnVlYpJCTDB8ArODMbmF+EdYebP+C9bnCaUVY0J9tBkowRBrLpPL+0nA6SE9wmFjKi9cU/i
 peVev0hH+2rLNlTp7tuzz60ob90gVU8rcqjaSgYqEIakXXrksAuAh6H/Uww7vcBJo1dbq3pL7IYDhg
 k3lifliO+iCkTBiZ+KMyiEJ26CUGXcRB061PY/aQ/WyhNLoZqeMbN253uMGw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111754_445030_26CA210B 
X-CRM114-Status: GOOD (  10.24  )
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

Add iommu support in the SoC DTS using the 4 local arbiters (LARBs)

Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index afcfa1dd242e..24581f7410aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -471,6 +471,14 @@ sysirq: interrupt-controller@10200a80 {
 			reg = <0 0x10200a80 0 0x20>;
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt8365-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>, <&larb3>;
+			#iommu-cells = <1>;
+		};
+
 		infracfg_nao: infracfg@1020e000 {
 			compatible = "mediatek,mt8365-infracfg", "syscon";
 			reg = <0 0x1020e000 0 0x1000>;

-- 
2.25.1


