Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20729CFD376
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=; b=FVJwUeHJXhB1k41ljqvaXTKOkk
	LVHUsPc+FZb2+pKBPjoM0Heghmpd6ZYeiw+Tq3FXAlFcOipwppdWyPBc+GB9ZsHLPRhxP6tgZF8yZ
	/0jrS4LtqeyFNzDlvRPm5eEjjnxWo/uS78kKbYBhNvyuRhQ8qy1X4aJpiCwQWC7s9x8Csy4hPnIQT
	vWnEoJa1EHYwTee3QUo7p2s0tkMb3PbNbj8fZOg0GzJP+fR9jzc3zyNakAyTckhSLnCH6aDUuefww
	1Rc96bxMXog070Tafzc/DPLeheSaFjCNKk6PmCD2W6XOoy1IRMElAuWHeSwVgJQirQSPgzBxs6JG8
	4zU4Wpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfH-00000002I1a-0Jr7;
	Sun, 30 Nov 2025 12:36:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgf7-00000002Hw6-37NY
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUCAPVi1455326
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=; b=jrxaUYnkZ48+4tXG
	L5zTrwdQe57RIVJMUrVyOYz71g5LUm7bC38EOjg74csAk54YkXiPYWudHh7u1QEb
	MyLSXisaFMA8mtlrqggiTnFVQ7aBe+oXlZZaqBoGPb7kXZ1G1tPwUM0U2ZFx6efh
	a1Rb4XD58ifNmfA4N2JxTNEUNfhFrp2VFB//w2L2Y98YD5/KfKqBjf/xBJKdv9Zk
	eRR8uczq6iy6SYB4oAyrBdgJ/Cl2T18E71sB8XKmqnQBRAiKLfMi2cpzvNHXVw8e
	aRCDF3nRhkj0R4MUs3EQ9Dw7enofSYa6S1uatcX6Uv1kfBWVdM6yJRrD2URpl/Au
	V12LwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqskf2419-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2dbd36752so640480785a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 04:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506180; x=1765110980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=;
        b=i0yZX7q2Ei/RSSsMWYX0vKnkgkCXWPZuptTKi58s07pG+4bAjTQV3aK7cxHXyl3Q+3
         PCXx628zgIVJHsgvHKvgHfiO3h8ahpglVp0OK/SROQ8oFPzk5t8OvXG06WlprY2RqGCC
         9ACGUHkVBDdJleEsvs8vI8AQZ1KeklfstjdEQjURtSZEm12i12Ec82BnkvXzFJG+yab6
         E5Mxr0qYr3E1UYzFN+Y71lJJLJ/tdihT7Z6iC+410gcbbGoU1+X4yepFnzfT8G2iiJP3
         D61aLz49xXczWfPboER8w8oSQHPGHzhdirY0cleNcOlQS3BjhzQIyFVUIi39ZUPzJcHL
         p6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506180; x=1765110980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=;
        b=uVw5YgddgEuHHwXbt68U3s1CFky3Pv82tugj5IQ6sz7wgH7E6qLMBR4ESZX2Ndddf8
         LRGIZd7PTd3W4w7BQAWczJdDV0B9UJx4upNrmeN5mg1sjrCGFUK6O7gf1SLei9t2ZFZW
         UHUcRlPdahDQYUM6vy8uBtyvciEpqBkq92uq4mFxtdEGZKz8MkXoUbXieqM+TSkBeh2C
         myyfmp/FC4VbhAvYJ4bx/Wu5MVChhBwSxsd76pspz5JOOejViyUolSGjyZbFUuxhH2hy
         9AjrU4oA+EJzjXO/83XzyQ6QLaSFnSs2Z967rPdJMs+gXkxIOr+ho7S/rd2OJ1HYcwjj
         gqaA==
X-Forwarded-Encrypted: i=1; AJvYcCV0b+Nv2AGoanLpN5kyIMBrnvNHg3Njgl0CWqHVEtrawyCHdFcrp7La6nVCVpKgKifC9rgdTXz20gr3syhDcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjRdghJOqN01EDNV0z74E7OwebdMduJ/miQphRTViHaULhMHW1
	jpytfAIW0F0ksXW2Syplcrc4VFlDamsy6zbJQ80t2PkDLNBdnZw+q6Sjs9V+IhUw23qoSyCrLvx
	w7ve3mgbR4Gtc8JWjeDdZCpvcGSY09YJmHXYORkN0LysYZ92DBCJ3K7Wh1q3iDGNR0/xRcGCnZU
	4=
X-Gm-Gg: ASbGncspYR6k4+j7d/RGvGX2ed+3rZdDWjbj7NM6Q+0Y4SLt3PRqD/7P06z147TQyuX
	HhqMmgEavjHxI231QFIjg34jrMjHBanHLdDD8tCFuEimkUwzi6jHDhLKXlJ2GHXrvJNrLHrZoi7
	uwXVLpMrWhqdFgMt3946tMttHj7f31ineGiPhnGI7+PCQpaNFzwMtLP5HI49W0CXfQ5Bj/nUDq6
	DuhC5c34le69Wp4rm1xPeQ9+l8g8y0x35N2uUMfakpCThra7aPn/y3Ebg/BnEZP+KIPJL2SlPzw
	hw9h61D6pf3DuqtNVxswpA2++/4XhkTEF+WsDpggC4SMGIFt8l3PvPnIgrgmqxrLrhekhnszYNW
	eO8IaVM7SSl+mnAO5h3/hogcY0xGz007ewA==
X-Received: by 2002:a05:620a:4689:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8b33d2681e5mr4596738685a.33.1764506180096;
        Sun, 30 Nov 2025 04:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVjFnLmAKnKsu+rROI20IfRIbSvxnxGH2GJOLhlIiUqNW2ucVuPMKhRlB1OZpEhn+d7v9Qkw==
X-Received: by 2002:a05:620a:4689:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8b33d2681e5mr4596735785a.33.1764506179712;
        Sun, 30 Nov 2025 04:36:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:09 +0100
Subject: [PATCH 2/4] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-2-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Eijw7sfo1fHO3BdYpz8WwxXJjQps55VoXt7UFlcVMeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo72TYdt6rx2Lc07XKkIkEPHnRGPcGuTpQIs
 bi/v4A8NCKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OwAKCRDBN2bmhouD
 1xtnD/oDgg43hK+yfYRQa5/OJIA2iP269kMbsXJJ+k0xaiWZ0X23n9yIREysBpFzzROhC6nrq+7
 RmwffS8bgzNPqAaonjTDi8g5SWVIgDLUG+jD8pKsr38ZenL58//aJwWUGK/4EvcvM3D997bpsIC
 t8qDt+saG84vnNGAu5A6r48Zj8DWVtjW3bHAwRMgn0ZX0dBc2tdTu3wYo7NbHZPXlJds+Evp1IB
 HWBvCGjOs63MVgvWUt+wsfNiKaT+7D8t9V0sJfTi37XMwMa+Rkp28buGEXUOnLSPHncl48ka8w7
 724pSPBcQvLcSicxYkCRFySGZ1xCnedG4gCn5go8HDonBdCwYrenEtYzvggjokzmR9tKVTMQBB7
 IhC6YwQKEal/n5gPTf/igMp640L9n4brJkDQtYRPlnEGifdQ67kAU2CY5IXiAdEKiGOrfW9mfHf
 b7dJ2gmAy19lOwvLiAUNHt5ii9QUUDwmTUPJulDGqx0IFtX8pJDh3CL7GS+NpDkCgbvUZJJLmqC
 1byTAKXNzxJiNrc0MlQmkLBnlINN0NGw1nC9P16GsRvoGgBvUcEjTBHMYzPcSE06HIaWHay2MU+
 cyu6McPojeS8IGB5HvrGSpoxLGWvgAzy8AFlR647pvtUVfdKsnv5dCC8X+7GhJ7PCFRUMmkZbtb
 fVgL16w38wuiO1A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=X7Nf6WTe c=1 sm=1 tr=0 ts=692c3a45 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWW22GgIgZmb96Hp9REA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: tIo8R9my8HtWR21-nEcYtTO1iCs1YhwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfXyjIYtdi9Dsdw
 A4Abo1Cc1U0/IjKZugjqn/X+nvK4ejkeJ4+K3kK6QLo8q8fybY/tdpybveOLcMlxJG6ie81WaR9
 foCn5KrjEJ83CWou7jChyIT27TbzfuD8Zj+TojsywoUYBTOmpF2nqobcDZUH61iYwmvia+I3P57
 oHVXoHR+M0qKeDn0w9DLjU6XYH2XI9iXhj49nwd+k2vLcIS5609nAAOedp8n9n6/+QT6rsxdDul
 quRgFbyT0p/VYoGx1PD1pN7Y9MZN3KwBiAHODpX2cJd9U+NVP93adpIqw31+m/MuJG4QJKtL4cT
 1lrPCox/1wHFWTFPnXGwnPybKtPE3zRKA/U/9G8SeIwpZJMF6GbkBqGFDsW/sH4bsIhabxiIzhP
 947oUOf0p86JijasIVH+tYLndNOu3w==
X-Proofpoint-ORIG-GUID: tIo8R9my8HtWR21-nEcYtTO1iCs1YhwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_043621_855764_CA1385EF 
X-CRM114-Status: GOOD (  15.72  )
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

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index db8fd045468d..95d5e0138a15 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1061,7 +1061,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.48.1


