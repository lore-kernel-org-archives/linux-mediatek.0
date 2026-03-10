Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E53EB1050
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=; b=dxOtFBSGk98soowVVqgj+ud/UP
	CQGdPGBsNZulxKY9obLV59pSdzG2MSg5dS07eVhWF0nfvlpcNGsVNy2532UlKYsHhav++xzz9RcUF
	T1dlUfCoEZDl1EN/Lmnf0Qas3X+yDXVNegbkeQroYPi1ZRROxjjGA/Pl6kSNcooevJU16tAISlKhl
	yxq+2So63YzN+lTNYWLHl961yX3pBadJnTLXYef1JN1E+qOm+YNi6KVPsapOImK2AIRqZDqzWGIB3
	S56Tu/1T+rKieY5n6dygjN1MvSojoCn8/NUpF5GnTWNX8c449unXcwEUBira6ZPZ571ICm/ByD/+j
	zp2cv2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAz-00000009HNd-407T;
	Tue, 10 Mar 2026 11:23:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAx-00000009HJx-0YiR
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 11:23:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VZfN2021721
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=; b=gvghw8DNIsAi2ZOW
	rSW3aAU2unXfvpyObviRS6XiDeTA4dtbT3T8AsX+/MCVGS7NNm8/S6Kt7+zM4UHH
	KbGKQm6ax7UUTaOwTgseEP7SYCNxz3rqgTBj8u648oCj1w8Ktm06wF6HHSAAqtdV
	QQ19c+3P5HAUkoycF4YYSERRzcwPvkRAxySGr9+gl/qm1+Z8+Kk1LThEikRfiJ7B
	r/PV77TMO9kVLDtNGcg2MZvaPtq/LTufVj24bCq4kGIU65RR/UxuNofAEfxxay/m
	wDD8wQYZ+n4RYD9iqm7d4XZrQ9X3QKFsLNQWXCTT1tthpouMwJKp9qiUEvhM2csr
	fT3TkA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w933n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:22:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50921f7da6dso12986311cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141778; x=1773746578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=;
        b=MFtfHlWm/XdO+Vs9Ry/lP9/VQyXzKVHsQmFlpC/wMDDrHdUghEAyIlH4+P3+dZYWt9
         V3SiIGIBNR947JmTN1JHr3NNW3CMofrGq8FtxU5O1boHBrmDFMX5kU794WqxucDUUcbV
         5tGVfnppuy/7GNeD5UGbgpT2jnPcuGRx49lbn9mxJM0YISzmJhMXndIM0MYR1JeOY6+/
         Sd1XfaFS5ECbEXEi0racNS2fUNA5B7arTPbGxmi+SJ1Uc8kZilUBkIDJ6cJogECIFENr
         ULSWAY7yfiE4MonQuWjGn6TMNcVIzD1cYIC08bkFvfyWwMlw1nKcRLMl0tTlvTKzjEC2
         7NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141778; x=1773746578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=;
        b=mqvrSLPkNy9AyQgwfv35hVbPcTQgnJIar6W/AnvdrqCuN52VaZxehu4BrtbYJfm+lK
         O1XUYPt+CNKRXRbi95/ewdjdyGEpylf5AWXNk+BxgOE3NDSP1vOKTcryuRc566+Rrf1f
         UnB3jOcCGv8kwQFgw3FkMiaq+TKjvI+sBsofajj/YESidG2L0Ln2jKAgRQKMztObz4D1
         WQZmY56c9iUw6AFoS7f4d3IuxCa1drtTbkeU1HMzklugcrEMyXsy1QfepEyXZsy8cG9y
         7vxhw8UtHdtJH3sJXZhxzX+tgTa9qFl4IVYycD9X8ayz45mpdeqUO5XchNgbUWXBqoUI
         65pg==
X-Forwarded-Encrypted: i=1; AJvYcCVscqOz9u65+BJUvKsDSGPKtKNkXj4zVdu+M9SKYK33L/2088isVqgWGk+aqj1651n3Y/Iaov3TB+dtUvXJxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfOsTw2fGHvGM5Aiq2wH1SFCZCdVGneJ4apMIPKTRC33VjuYQ0
	oaOl8JqbEDI8n8vqYcTorFryyQvrY9GDifYOgVsgc93a5dJyMMFtXZtr+Dtd8rYf0a2fxfohye9
	++L6Yb3JCnBGfHc7l7v0wy8Jny1HxTKn4dKW3SqZNFWHCLSnH4DDxBl3vCtiMqhLqxp+wUKQ25p
	8=
X-Gm-Gg: ATEYQzzuyIy2DTzd4JavsdmlOt9HQrM3AwBJYvLO1Q9keuj92yX+BQB0IpCyKWVbhqI
	u95eoHIR317zVIdD+OhrT1+H1K4FNmI/sHx2G1LxRcN2mXdRnNCnkv0HEvrjI8jKR72leWKRSTu
	2n0CD4MSm4NC4UzyvZcPx8K8pQCAwujEPw1IFiYjy6gCw0pq+GOyWKaa8ALkk2BG4aIn0I1KbWa
	j3o3ZbfkgIYb1QjMRVF4akPszHS4LtzXQ/FadvxFFzspDHqW3KBWSncRJqKkKakajQN4L229adL
	e60fWWVPdJ3n+y4SThchWdFnDYZFzKEnx2Eu8Tz6QRpbdwksDm3IqRsLQOZSJ8HvEyekAhqjzGt
	ddWTkPJr6VYW2nbmhO1AuIh7nNd+3HMMIcc9dkhUJEF16
X-Received: by 2002:a05:622a:1456:b0:509:219f:8e35 with SMTP id d75a77b69052e-509219f951amr49609841cf.42.1773141777595;
        Tue, 10 Mar 2026 04:22:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:509:219f:8e35 with SMTP id d75a77b69052e-509219f951amr49609561cf.42.1773141777135;
        Tue, 10 Mar 2026 04:22:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:39 +0100
Subject: [PATCH v2 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-5-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PYQfNbJhq08lhf8pSFWFUAIROg8/q1W+1h6VJZjWmOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8Ctq9UEeQlkwgbYOvBN1J0NS/LKB7qV4njw
 JU8skMasvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AgAKCRDBN2bmhouD
 1774D/9uW5xrt8/+RUVSYosRDY2s6mNxQs5JaiEfldKJ+p1+reJ9wftn3leur1dOdwHj/pB3F9A
 jOJIbwcWDRi4xx/mNWXP5Hv2xSEBxQOcf0sfrwWcK8LroDj6wlzCOxbOvuhxrfvltkttgQ14t03
 U3zs9fbzvPxeEASE1aWA0d3S5va6WP9xo42jJeOovTbPAY79OwFBoFeRrALnvVy6NxOerxKOeGQ
 5lBuAzESo+KyhCSJUv858+bItSk7gcTzAJspq73LPE6peIEYsHDuicNoHnJYH10E4HBS7nktFx9
 IyONmGVnKGA+eWGC4bh74oYTC1f1gj1COyvrzK2sHh6TvLIksPRy3KZBFHUFTYKc2V9n74ypweX
 mkivKhKMRyMxmsR/xoxKrOmTs6pbC5qM3bonRCgksg+e6Xa1GittEa5ta6/CJ1lF+e1TBq3jJhb
 bti70QpBkAPodaPfwDZhfmeCIdC4U4RdXkQb20tRu4H+bSE4k7c+kytacurPBtGm8w2CXCvRJyR
 KOm0hEFxtR3+n1gzbECyPMgHwj1KRsz297+3oq/56L7lZVaIq2TDOD+/T7H+LXQAa5Vds6WuxCh
 eiCnDXDKS+yIdOH5I9wBB6q/thrp3foV5UQ0aBDk/YGwhhfGRM9mErhiUyj9MpWlNRKuwsH/+C4
 d2Tmexu7aWpZaUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX7/wX3lUi0U0S
 AfO9AUZoWMcby0/GdwjNnMAL0pkpE26x2JqR5UTpHRpIpVqWBeXKM9lM9ag4POUuJdHVzKazoqG
 0aL6MHpjTmwrESII5ys40/kKXxfIlezyDS4r/oOnIGcOtzp5C6h+SioBo+WVRx/+Gecw2qnTWlG
 fQlkPBcsZZU3eqHXhRVttbLYZiIc2cFchayV1eLo6maCr/IcZrDMGlvmyIO6ZPn3VSycQ+eS/64
 BHe7UqAAFodq+AEMI1yrlQX6wBYY3I9teOjwDlBUan2OL6H+r1OU3cGMuY2dAldRnNmT0qEYxef
 sGROZ69uZvjPIFpixfTvIQMlyMgD8td+lgQacPImRzcs9oNBSkqHilz/P4JjZTxsvLTfjHa6k+y
 LWnqwfyReqIDEwuCzh5/Ab9xCKguTBl1NSz0tNn42dfA1oCGW7XZFcj8FfWdur6Za/4AMj6LGcM
 w34jEWqm+OIdBw1Mtlw==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afff12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=07eiXoGdt8lw6NVwCNwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 64lvjoDjihnd2x4foRQoed8Wd09fNa_s
X-Proofpoint-GUID: 64lvjoDjihnd2x4foRQoed8Wd09fNa_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_042259_181122_937FB74B 
X-CRM114-Status: GOOD (  15.66  )
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

mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
pointer to const, so adjust this interface as well for increased code
safety and code readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index fae3e1ad2df7..67f3001153ae 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -163,7 +163,7 @@ void mdp_vpu_unregister(struct mdp_dev *mdp)
 }
 
 static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
-			   void *buf, unsigned int len)
+			   const void *buf, unsigned int len)
 {
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;

-- 
2.51.0


