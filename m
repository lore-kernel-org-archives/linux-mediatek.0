Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959DFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awKH4hKDZt4EomKgD1b2VXD4GNOZ5QOJBq8sNyu7Q9c=; b=szKFCCrRUlXu0b
	u8wVvWZw+u2oKTaMjVjQEqtSLWv4PzHUpC5PEfRZ9qS+HP8vH7FfpD7Qo7cOR5wPKuGUuxPjoMTYL
	5oZNDnB57Dam/PBvBL5FIMM78mwMKxOVyK8KheV9JypH+NoyHAHVegUSN8VIv/2iWZGpbWsZVEjfa
	qGnlSiXGotMqobMxRveHtF4/8QQ3rYFnYQ2xTnh6u5+7Ko059irjUj27iWf0iKKy9uN3saKA3KXS4
	p5p4WYhhklx9sK/c08bdhWPKVrsus/OWa5UIa9ew26Xpxg1q5hdf452FBKvCi4WTPxCjlomr6cM8W
	XNoJHsy6KQiFOr+VzxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQoqI-00EWZV-FW; Sun, 06 Mar 2022 11:14:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQont-00EUwp-Kw
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:11:59 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D337C3F625
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565109;
 bh=vMFnkOH1WJAajK2DqdRDAa0cLEGNFmbkS8Gtp9GKvtI=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=O7d8uV8Okv/XTDEpawGXsUnPR8krCNI95rrLTe3BVb0+arTPy1hE14MXy5kPymz7T
 G7mKBZ1uIURbgSZTI1WF7k4LoW10chNyM8fc32dVxxg2Oq8VnbzdBZISAA2WH+4tCU
 MoZnlrNbZ5+01swEphN9IipYOpud4r1UxuRAm+1cOnmhCquuxTxprPNQ/x6MH+sZz6
 oHo2SJ6JuRZnEtL6OEcNMv8/EBsMfXyINSxArHyN5Lrdg+m/K66Sz1+pf16i21aPg5
 tBMczHYqg1cTjHxa7+l6SvDKQkpBytrkoL6/URbWNz3UXLgCjELeCbvyl2JwT2i3Py
 EvE0JmJvIik6A==
Received: by mail-ed1-f69.google.com with SMTP id
 u28-20020a50d51c000000b004159ffb8f24so6769945edi.4
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vMFnkOH1WJAajK2DqdRDAa0cLEGNFmbkS8Gtp9GKvtI=;
 b=wG2R4SIMM9Mm4KC7ZjPRhwfN+IWfFatwYi/Zo5iA/W3HezqReQBP4+8ZGO8rQHzpaS
 2omkzUx8g6vt1u2Yqqr+n6CeyU2c/+R0ajMlqSMRhD473/1/fuEBKoKisVLCJySt0Gsf
 LmXDTtQfhme0Fi4teh/EisX+tsTdluns44Pox1Gh6lYAjrEZ8edDYa6oAw9nvt/xehTO
 MG6l2B6fIhFMYK+3LaTJqUAtS+gT+JNXS3VKGpfix7m6OApg80Xe8JZQ7A52mc1kGX7g
 M9sJrLhiS+cA8t0+sjmctFgIfgBXzqr13UjhzgZsVq2cOK2IkqorteHQMIcDXEUq/6aa
 kvXA==
X-Gm-Message-State: AOAM532lQqypX/6yfeEeASL+3QGKrONPtyuTeRad+B2FPYkSEXdk+onW
 rx/es6qdoAQvS7NRNPSTvJefceTJk1oQlpq1uwUCAUuvwsZN2LJWPZ6RIskW/BR+CFoidyX6xDJ
 LNyqy7ik0gMpl19/RNoYcMVQXT7haDmkUGojLBrrI0jm8hd8RLA==
X-Received: by 2002:a05:6402:2d8:b0:416:34b0:5d5c with SMTP id
 b24-20020a05640202d800b0041634b05d5cmr2294053edx.6.1646565107742; 
 Sun, 06 Mar 2022 03:11:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTQ1jrVfZZl3Nu0dKHXWLrV//RroIxSgPbz2wvMOZz/2cmoQu/ylE+3YUml5SvnaWO1iXePw==
X-Received: by 2002:a05:6402:2d8:b0:416:34b0:5d5c with SMTP id
 b24-20020a05640202d800b0041634b05d5cmr2294031edx.6.1646565107595; 
 Sun, 06 Mar 2022 03:11:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 11/12] arm64: dts: qcom: msm8996: correct UFS compatible
Date: Sun,  6 Mar 2022 12:11:24 +0100
Message-Id: <20220306111125.116455-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031157_888332_EBB9AA09 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Qualcomm UFS bindings require to use specific (qcom,msm8996-ufshc)
and generic (jedec,ufs-2.0) compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..fa491f2271ff 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1730,7 +1730,8 @@ pcie2: pcie@610000 {
 		};
 
 		ufshc: ufshc@624000 {
-			compatible = "qcom,ufshc";
+			compatible = "qcom,msm8996-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
