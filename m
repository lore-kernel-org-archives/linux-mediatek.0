Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCA7C88E5A
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2026 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyF7bDkehBPxmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=; b=Haly1WzjhQRWK/4lqXjSCBoML7
	Y1n6VZGmb0EVEuRHO42h2WgL6h1kYiiQUTjsWYOPDYjqTcf8jPFkXWwC/tLMRENQfyb39fdRKgHpB
	eVGgoWOUO/nhbLPlougmkaVHh11bMvuh+QFkmIbRlGmTxO5pB2E6My5VHebiQdWMpSWW/px00vfZM
	MBad4pmw8Ye4uXO8giFjCbrrGso+Gx63pHR51L8KSr7pWJeVgd4B237hZ3bmShw/cUSrULsfAa0+n
	lcRBY6et6KFde1DY6aMSZ+0XLutf4i/MyNH8SC59ShecjsDt7Sq29y0dw9xlYCBzS/l7bZFf0DJc2
	A+x2No+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jP4-00000001eX8-0iNM;
	Sun, 13 Sep 2026 12:33:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jP0-00000001eUy-3jnz
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Sep 2026 12:33:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU2YG1468255
	for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 12:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cyF7bDkehBP
	xmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=; b=Vbtc5akrWG0zesD6IH5CV8IsjEy
	SB1MMzY1X3ZE8yz6bmi3++eMe8tCD7cR0XdsSCyfls0kEKP2Ssd3Rl2AzOhBuvQb
	36B/y3jB2hnYRvS7Yj1wacJrBbSCrvPsWG7U7Dq/ErXNK87Z8p7cpb34SJ9S9C6I
	FthnBYyA9heWHk4q3vR65jAENHTK1jyghNKCHZvd4YUVaqXJotT9rUE9FhKqzCu5
	EackylVKLzM+Ns2J8hzPC5UQq7p3lTeMoIydJb4yMHhIkinFe8hQU1icZAScMXxa
	CKpXnJk75cT2NPWtBFvKa0ukD5+e/3VgWW9xFwW+eAMdOlC6RJ5bug+HRvw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c3770-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 12:33:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so51184906d6.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302825; x=1789907625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyF7bDkehBPxmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=;
        b=LPfA7MnneFsUQ1p9dm2vGIfaLY0PclY+TZlzlsneYJk6e4z9yFZpYlK9D9Nr1Q2nLN
         tQSDwQj1SJW5tIYTrwfKIdnYEj3fxms0jkkaF0LXps+UKYfbEBmKoKNO3NJEXPA/Yqs8
         JxuFi8hn4FWUfzXJ/nQzSKeYvUrml6sZJqQWMkyQAEn31aHM9H7TCXEKaqAQ5QEDkOHy
         QGbJgLR7iSTJBwQyOCTmK+Z+dbFYJ7AcHGnx4KpR4lKqxTBcYWzVGYvoteNzMrVY/nML
         R/JbyYeL9pFcfXyMMESPs/OJVGHGNRKdk7m7uUHdnHYfvkpP24xOuHT3VuFEAODKN4yW
         w+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302825; x=1789907625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyF7bDkehBPxmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=;
        b=CLFe5etGwRxq7JCjfT3MDUr5GU0IWYExt0x8pj/mKg5WSuHorjHKgantzD1Fnw8lwp
         qkOC1CuRR3RmCv+YmIgX1XhWx/LuRhHhtG6Zz653ok9ib0DpWp+GqHTWujHefFE15beL
         zTbg43MM3dEwf9HQxA4fmCAJGsjF42HMsZBbSFjYs1ABKjdBx9sbDc4EZq6/L4qZnIsS
         psy3dSnS70kTPV+obwuciQ1NHEtbMMANvMMHbhvcvDkfKfeoTFhtzp04bdgXql8QK9fq
         moG7bo6kj9KkNt111TZrKbPvLsNVP07vTvbEmGhRpp8V5GvF8wmgsB6wDRedBOibcTfz
         BTaQ==
X-Forwarded-Encrypted: i=1; AKwUvByyhSboh/x0IaxKsU0YPuQ9rNoe6QeAWgDEPxcxEZW+XE4OnV/HyfRbH58fFM9bwXzLTcydKUsKPM+Mp7gebw==@lists.infradead.org
X-Gm-Message-State: AFuF++nAe3REodk/256KBZu3PFrnkIGiJPthyv1Oorilr/Fh+9GQLcwa
	Btc21U6M0esfacPS/g/7Ntw+sS7KTbkLjRJcAmBuy2uopm9uIFJ21iRFIrHEcsFjLS3Q1imX+rv
	7pgCmpruQqySZz0IsfyWzRW9h999G/FtAQzsnlZp1e1MmzH37EEip1Fiy7GFomB4/ndgDCpgw71
	g=
X-Gm-Gg: AYBFou1NGSOYU33bBp8K5UqUqjjjeemSgG5crhzrsmzPdPyV4EeOeG6zCycBO4VwMjA
	xuoHBrCtlijvfkyuTRQkF5X4hWcMh8p7zB6935j8XN/PMaG6AHEcmiae2PgiF1UyGseNiSRzmoG
	NCJ4/MDkuPYxq5i2jB4lxUcMJJuFCO9ONfoVX172CVqFJuzSaVjmCnibVHnRwuWRiblLOPONMBd
	rbxudWC7x+4aExJmradgHVp5euUZQwrCwpXf/UIOY9nC+y7yb3GYRRN018h7vp2LApC6c+W+zZ7
	xCJ6l+s4QoXWAkO1N3PVRD/82OPpNK4g+D3K+ULdkBR8IkHZa4a/NhD/2JDkEWy/7WKR7TBm91N
	GMObJ7nnsRyqxORk=
X-Received: by 2002:a05:620a:28c4:b0:939:518d:7f6e with SMTP id af79cd13be357-939ea137501mr1929952085a.22.1789302825014;
        Sun, 13 Sep 2026 05:33:45 -0700 (PDT)
X-Received: by 2002:a05:620a:28c4:b0:939:518d:7f6e with SMTP id af79cd13be357-939ea137501mr1929947785a.22.1789302824548;
        Sun, 13 Sep 2026 05:33:44 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f02c92sm131403175e9.2.2026.09.13.05.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:33:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: display/msm: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:33:33 +0200
Message-ID: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7238; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=/BtZgDfys4CXTrsxFKjPXH5EalqVZkUvEMDQgav+eWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppgcDRWoexqVysJxJwz/JPJdHx9ku3F8DoK6B
 yuVBP6zpQWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaYHAAKCRDBN2bmhouD
 1y6aD/9f+MGyU72k6ORvj3aQN0S1PsG+bjGsEspokFkPaCBbS7zAdkPouE7QFYItzCwMvv/m0gK
 APZCXfYZlCP6eUi9UTspRlXiXU7NISQbua9ZXN+IXb2FDaWgd5zM3peWDhJhLu5bS2WcxQVr/8N
 I5RNPu5hf5M8d+T4dXFhU96eALQUqoa/wttTAc5WT54YQpIQ+aKgyXNOOD8mPvA4HF4htEU/7Ps
 Nrk6wjVJ/ANv+ndNEOC1D3doEBW/Jz0/FwUqWKF+TogLWFiOEcrhkzGknmjD7O2SL0OG1KlHh3g
 ex/1yYjQzZLn8NZ7xIUX6ylwGd7/+qlEapIsuyGpV1WX7WxoeW6VijBpZipCZZA7PYQ7O9s5Nla
 OmiDMjSxY6/bUkUFv46YkBBbuVJpUFrr5iDiKs6/eN1mgKcWf68ONIgxM8fm3GiilYyXAM1x3wU
 zkrhT2nOisbLArRqZBV/sSuUjwpaoFvg4xibMe6vw6Gbveh+2miJkAYP0bB54UjrJVW7Qdj8Y5j
 O93zxfjAFIAMdWW0pzpb0V6x5YsTtWwxKBZ+8MDixIqAiFQXp93HqTD868dPpffRwRiGPVipvNI
 E8lqXrt3TtAfO5Raa9OjgbQ1kaYXPxhIhpW76faosmFJa/588EqAE0KYH3pqqhgkCfBy0pvuGr/ 8Ur3MhMzzkfl7lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Mz7h3N62ymvEWYdZxLLb6nDCEkg4HelU
X-Proofpoint-GUID: Mz7h3N62ymvEWYdZxLLb6nDCEkg4HelU
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa69829 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KDEBpenjW5rMv1hHu3kA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX/qB3EoNMM/i8
 UfCxvVfvlyKQ0T91nRjAiF71WjN4MHgksKvAMAEQrnspOHDPWFPPPLiBlbb3YlZvmcREMJnivwM
 I181me1cCNbI44MaYoB3o2r39Qlveyjx3tno7jzGfVBjFuDZSRYDu9dSOXu2Taed0zcm+Me/Iky
 kNSQMd8YgzlYPQylb9jGVTBcP6pDfNPT0iTLPw4lSOBAR7tkZNHP/G2jPU9vqHgou2aKH9rW4RM
 MuovlJjfprmwaPEsBVrp3SaageT4f5y3e5P+n+a+dHpPgp6Bl6HcFEOhB61DhfTSf1hFKeuweIo
 mZGpvUeE6++xng+5uYd3N5XbGekfPIZVV4kEBIW3dWSUmGrvYRNZKCfQclCNTLc8+h3NtqDW+Jq
 yrlo7gxJL/BYm1waqCkbKXTLpEiUFgZN4rvpRKQiZ1jVT9GWSzI9ryw792kVzSg5Rmbw4KKzK1A
 SQZHKcIy3kPNTXYeoGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX6hK+1EAYVXT4
 PROTwHhyVGCWd5G+3UEgyC+Vv9V85jL+pCLw8RiNVbNndi6sn7zB8MfGV0Ou+skAm67HViMUSLV
 rufxSbhSe6XI9Qcdt4YmE15/L8xH2/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_053347_063013_6B8106A7 
X-CRM114-Status: GOOD (  14.86  )
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

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../display/msm/qcom,qcs8300-mdss.yaml        |  6 +-
 .../display/msm/qcom,sar2130p-mdss.yaml       |  4 +-
 .../bindings/display/msm/qcom,sm6150-dpu.yaml | 14 ++---
 .../display/msm/qcom,sm8350-mdss.yaml         |  2 +-
 .../display/msm/qcom,x1e80100-mdss.yaml       | 60 +++++++++----------
 5 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index c41a86203e78..287cce4dbddc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -150,7 +150,7 @@ examples:
                     reg = <0>;
 
                     dpu_intf0_out: endpoint {
-                         remote-endpoint = <&mdss_dp0_in>;
+                        remote-endpoint = <&mdss_dp0_in>;
                     };
                 };
 
@@ -352,9 +352,9 @@ examples:
                 };
 
                 port@1 {
-                   reg = <1>;
+                    reg = <1>;
 
-                   mdss_dp_out: endpoint { };
+                    mdss_dp_out: endpoint { };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 44c1bb9e4109..fb3d24bbac7d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -248,9 +248,9 @@ examples:
                         remote-endpoint = <&usb_dp_qmpphy_dp_in>;
                     };
                 };
-        };
+            };
 
-        dp_opp_table: opp-table {
+            dp_opp_table: opp-table {
                 compatible = "operating-points-v2";
 
                 opp-162000000 {
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
index b4f437172218..8cbf99f9fcba 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
@@ -81,7 +81,7 @@ examples:
             port@1 {
                 reg = <1>;
                 dpu_intf1_out: endpoint {
-                  remote-endpoint = <&mdss_dsi0_in>;
+                    remote-endpoint = <&mdss_dsi0_in>;
                 };
             };
         };
@@ -90,18 +90,18 @@ examples:
             compatible = "operating-points-v2";
 
             opp-19200000 {
-              opp-hz = /bits/ 64 <19200000>;
-              required-opps = <&rpmhpd_opp_low_svs>;
+                opp-hz = /bits/ 64 <19200000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
             };
 
             opp-25600000 {
-              opp-hz = /bits/ 64 <25600000>;
-              required-opps = <&rpmhpd_opp_svs>;
+                opp-hz = /bits/ 64 <25600000>;
+                required-opps = <&rpmhpd_opp_svs>;
             };
 
             opp-307200000 {
-              opp-hz = /bits/ 64 <307200000>;
-              required-opps = <&rpmhpd_opp_nom>;
+                opp-hz = /bits/ 64 <307200000>;
+                required-opps = <&rpmhpd_opp_nom>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 68176de854b3..f5acf528d0e4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -223,7 +223,7 @@ examples:
             phys = <&mdss_dsi0_phy>;
 
             ports {
-             #address-cells = <1>;
+                #address-cells = <1>;
                 #size-cells = <0>;
 
                 port@0 {
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 8d698a2e055a..8c65a80b46e4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -208,47 +208,47 @@ examples:
             #sound-dai-cells = <0>;
 
             ports {
-              #address-cells = <1>;
-              #size-cells = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
 
-              port@0 {
-                  reg = <0>;
+                port@0 {
+                    reg = <0>;
 
-                  mdss_dp0_in: endpoint {
-                    remote-endpoint = <&mdss_intf0_out>;
-                  };
-              };
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&mdss_intf0_out>;
+                    };
+                };
 
-              port@1 {
-                  reg = <1>;
+                port@1 {
+                    reg = <1>;
 
-                  mdss_dp0_out: endpoint {
-                  };
-              };
+                    mdss_dp0_out: endpoint {
+                    };
+                };
             };
 
             mdss_dp0_opp_table: opp-table {
-              compatible = "operating-points-v2";
+                compatible = "operating-points-v2";
 
-              opp-160000000 {
-                 opp-hz = /bits/ 64 <160000000>;
-                 required-opps = <&rpmhpd_opp_low_svs>;
-              };
+                opp-160000000 {
+                    opp-hz = /bits/ 64 <160000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
 
-              opp-270000000 {
-                 opp-hz = /bits/ 64 <270000000>;
-                 required-opps = <&rpmhpd_opp_svs>;
-              };
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
 
-              opp-540000000 {
-                 opp-hz = /bits/ 64 <540000000>;
-                 required-opps = <&rpmhpd_opp_svs_l1>;
-              };
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
 
-              opp-810000000 {
-                 opp-hz = /bits/ 64 <810000000>;
-                 required-opps = <&rpmhpd_opp_nom>;
-              };
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
             };
         };
     };
-- 
2.53.0


