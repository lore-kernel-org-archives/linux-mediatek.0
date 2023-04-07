Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8789C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70JWiI3ir/yodHMirtpCr960hDJucp8ZmgOAZyHHfjo=; b=YGl0DjHhQLYIBTFQzhLuGIqoHH
	9yht6RChKUkcsgUG9gfNQ+HuapZy1CFjMBGHox9Ohc2vxoL6jLFV8eYtLCDEGLCBku+EA0AlGb/rX
	w5o+HmeGu2YCI+b4IxefNfZ0O61GInJzjnZJiLkSWfTLhI/HuGxuDefCSRJYbBZWpqUFMPtNjRBzt
	/FFmDdMYcwTLlcyrvBJqk9C2+7O3op3Hi5JFY87aBE0kzb8rwsVuyEcETrOxjyp/2nLAbXqSDAzbS
	LucjgN3v6aqHUeUH6JMRxAOiF4PLpl9qZ2h+FMPbVCYu1aJUNPn+haJXJ9h3MPBKMKyCb5NdobQqj
	LzD3HFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUM-009g3J-1S;
	Fri, 07 Apr 2023 09:34:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUJ-009g0H-0A
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:34:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id e18so41840610wra.9
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680860069; x=1683452069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70JWiI3ir/yodHMirtpCr960hDJucp8ZmgOAZyHHfjo=;
        b=QONjcM29kV4dmGB3rYEiONRK5cMaa6iuyKF2F42L3XXJJguLusSxoZpsDfEYzNHrJQ
         PCve/XJithRyJlBCCehKo5C6uADcrcFyBiWsUjesvvs4csM2RJExdrtZYgQfAlS/TcwH
         WquiPJgyLMhp05XnzHIPk2z2kmkrURr0wmt+FjT5EDEFe33tw1gD12kt1YM2kZiQahuz
         bH9IW8UsgdOR3nDyEOrUTw6pHBetJKgliKfuDtgtbZp8tYaefzJniFSkwJay4GbQoMYi
         f3guY3mNKfR7mBcXVNDqoK3oE9uz2POBhXN7jkoXhB1BE0gmhzupPCK7QE7nhD9t2ugg
         VzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680860069; x=1683452069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70JWiI3ir/yodHMirtpCr960hDJucp8ZmgOAZyHHfjo=;
        b=RUKN7R7EBD9glu1tpd6Hs0WX7ifDVILyLzBOzcN/+u/yRSkHHbhrDqOmKA1lTlyOs6
         7s4CbkM85E9YVCD/XcHMZyf+el7u7iEt6ma7lzV87mcgmJwfZ+Zg+EKhEvQlcbUZDVnw
         8K9cjBLxEZvvxRbyr2jEk7WKIZxeEnHDUlGCAQHyAvRHWIU/BEIg4gAuqh38W2GnWVRK
         iKE/QS8S//nwyexcIP1Zq1gzBqrxTDT2VQW+XQ5ONo0ZtZ4TJYRiLsOeNr7lHoC+MIXQ
         R4wsMcGMbXYEUTH4Y849ekz2zeWSAMsai17/tfv6sBMBGi5iBN8X+IE7g4htoEsBXCg9
         i54g==
X-Gm-Message-State: AAQBX9dIczMwYgj/Ftqv/hencb6DHbW57uxXJrPw5FeBte8L6TglLpJE
	8x5TOJEMy3nnkQwxPfgb5f0L2A==
X-Google-Smtp-Source: AKy350YypaAVLJKTn67bZFSJ5w+Bznsf6177h4pS/ayorAldv93lbe3E88jagS9SiBVOi3W60rfOng==
X-Received: by 2002:a5d:51d1:0:b0:2ce:a30d:f764 with SMTP id n17-20020a5d51d1000000b002cea30df764mr942043wrv.21.1680860069489;
        Fri, 07 Apr 2023 02:34:29 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d510d000000b002d64fcb362dsm4020432wrt.111.2023.04.07.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:34:29 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:34:14 +0200
Subject: [PATCH v3 3/7] arm64: dts: mediatek: add apu support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v3-3-97e19ad4e85d@baylibre.com>
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
In-Reply-To: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xWFAj8fuPjSh5BRKLkeGKOoKQ305/M/G1EGxpvjOkWE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL+Ohlg4spt+Ph+OrbPJZKpEpJNrFe4L6RjUFlhcD
 044pvFCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/joQAKCRArRkmdfjHURZK/D/
 wIztu59Z6cma4MWtA5B7NQozRNiJHyTE/Kl8Z5vijoZ0nE/K4GDnlyrtym6yebHm/EehfkJMuhrphg
 Zz/cf/vxh+FX92tn4pfkqQlub9u2mz2eULkvrtNnCzTUaI/XdQXpGKfzxUF0mCHf75z919RvnzWNab
 RyHSvxl806VvR1jKbt62bbdDzwuFOENhrp0O1kJ8dQdNOU9DnXtZFRopBkQxYSXC/gLoD22MprXA9O
 z+5NDatU/AD6FiV+w7K4Di3a+mj/uCc9EWM0f65ekcXGhbyVb5bDeAW2tXrVoqtdAvy4caoDEbW5wD
 ELHrZ3k08yu0/pb8b1FUT253Tl9/wioZ0vMy+CXcdBpsG4cBb/+Ko53Nbvd1Ba7tNn9Blkh3NA5E8b
 ViVV0vL4qIBvhddGJX2urR3FA25LZbpxGGC8/2msWAuzwm09IoyrA6rCUo9k28nL3Y0QZe4dOygoHh
 7gkUD/rtJ8/0C8XvT9aQbP4Ex5KqI3E9qvVlsDmUUnq163orhqdlXe2dwnhX3p2WrlFhMPBA2HhKVG
 xfhjzTKz44L+AyJ+KaJkEQLYKyLf9Tw14jO58hnx4Zi9VsUUxSgepunXgeocs5rHE47ygwGnj9lA7g
 xHgG6kPUFdRkYhaM6suBRYQTzpMmyU61mTNkUAxFMuNVY8PHgzFCmEwRS9Iw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_023431_087519_55641698 
X-CRM114-Status: UNSURE (   9.56  )
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

AI Processor Unit System (APUSYS) is a highly efficient computing unit
system which is most suitable for AI/CV algorithms. It includes one
programmable AI processor (Cadence VP6) for both AI and CV algorithms,
and an eDMA engine for data movement between external DRAM and VP6
internal memory.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 73cb10d296fa..386ab8902b55 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -604,6 +604,12 @@ camsys: syscon@15000000 {
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		apu: syscon@19020000 {
+			compatible = "mediatek,mt8365-apu", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


