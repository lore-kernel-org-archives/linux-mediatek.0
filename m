Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A4FC624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 20:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6axdt58sY1DqnmVQsW0ISUurcHhysngabrgAEPT5NAQ=; b=NnxgtmldwblK02v+ulT3wVD4vJ
	p/hmNkmvgkQ+EAtxRTHayivKgj2DvYW7FIOhqdy4vWyWxK69bpvYOlr4PE6jETG7uE+6/Fc0zHY1Y
	A+NBwKHUEjZ9vfpM32r1i60eIEjKeg2hDZOKhxi/6olSsWCAhvxWqdyDA/Lci8SLFVhY5FqyT0oeF
	+d0FrN2hq0fHT9z4ANQQn2mOtFB7xGVKZDSN+/ZTTbX2jQZ8QtXBzHvF2jEykCfPL5BpOWWGzh1dm
	ixnPfLg3EMYwhkt3FqbEoAV+naRqDyyVtBer4vCEAp3w95H3ooZwmKG2Lar0zPuel72HaB4YUxkls
	EQXAdn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFC-0000000FoxZ-2LNj;
	Wed, 02 Sep 2026 20:07:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rF9-0000000FowB-1fYe
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 20:07:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hrcjq2483955
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 20:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6axdt58sY1D
	qnmVQsW0ISUurcHhysngabrgAEPT5NAQ=; b=ROdgvEYDb2UZdpNEhI8RxvnS9DG
	2OQurEeIzPojM+T0MtsUy8ud0+ePaKsegGa2jZIAz+1/ZoRDfQgUPhsWM5VI8Q8V
	8njeua6nNI9k3tuL04Wmg+SptShh5D1ZtQpf+Zrhq47/HGQS6EE4cqFFn7skgYwG
	Z8Pah6EzNrX9zEbaBzGCISZoP7dl2XJBkXOqozZ8Zn62ajG2B3LSVEfCueR2Cs2f
	upqOVyaMpNKvUQ2R4tfkN7yAo4cStnJcs3FMv3FGzcqkoiO7mcmY639u/FVsvIeW
	raqcwHlpDp5YDpK9k9328GUmh7ldi700HT5V6eYIPzoxV9f3VRQ2Xz+Btpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9p74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 20:07:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so2515692a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379653; x=1788984453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6axdt58sY1DqnmVQsW0ISUurcHhysngabrgAEPT5NAQ=;
        b=Jk54wznO37I2Bo0E0yI9WbXa+D68F5FBJTTcDHEDsCH5jsYo7BxmE0p72UVH6VUSbb
         0ex9QR4Z64R9jNQglR35YM0AXf3YIuhfKqk8pjBApao7z3CmLaNoWZLX83F6FY1YDUkY
         ZHemJ47pjMFCaF4h7NVUFTr9FdjhDMaCN+n7BsLDTu7mZUVMutZUSKDRvCOqd/GHSonb
         0TykC4zD517tuYVh9uAUyvYHVSa5NN7VuqQv4JaqgHslg6AGy/pBokaQfJH+X1fiKgxt
         G4R8550+El9o85nY0qmuijbLl550ySmdgIHD4YndwCSJae3GQCLmthKKLnX5ystbSYQS
         cMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379653; x=1788984453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6axdt58sY1DqnmVQsW0ISUurcHhysngabrgAEPT5NAQ=;
        b=LqUseQrFamqnZ5OsfwZnOmQBf01BbQ2yBSlyFzN6hstWcPFFDoFKMN6JuTSQFMsSel
         Xn8p9lG7xIjoO3CFQttE5jgwE66pk8aIHKIISpK0QVmw5oNn/NRVib5B04fmnrT3EZP7
         7Lv+ikiXyYTTytaLfEimXbCNJdSXkAQ4RX5Bs+vfqb+6Kst8H5hS1PUT43Br8TuFd9DL
         cmaZaq7JAUJt5/s4bg+dYnVwR3LsnopU256aS9yH9Eex3IuhsVsv04yLQrpfBktao3z1
         8N4mBhlDHg4c4gMZQ366+NHZp3CVmUWbFxbtTRvrAMVs4Azyl2STt/FS06HuiIz7XyaY
         VT5A==
X-Forwarded-Encrypted: i=1; AKwUvBwf08v9akgxPJEmzVDoMJedcu/euHjlvNYJ+ezF1E35F7QN0gr/B6Z+OhajYA2VvjeSqup93KeXMfwc8KfYHw==@lists.infradead.org
X-Gm-Message-State: AFuF++mDDyCvXI9SBiVRpm+bElVr9s0DBKf5qkEniFsp6Uv6qYFrIa3z
	mOKWrRSaDQ8+/2smvkN922U06DBaKe7TT/QyuCtVAl6V6HbOKDL0daj5OIfmxqokjSBMbCU6KNb
	4FjJWmyL1KAEqUEqh+kj5K0HXZZh6HO7MGi2CO5UafZB2JvXkypuLSlqFFeqTVh7hDjYiMr7wYh
	Y=
X-Gm-Gg: AYBFou3VL7BFmAUxy2VMXzGpzbKaDGmcwXFVObOtm5HNdo2+qAnTFWO59UShnttPnE2
	9IbFOD0/zyA8RfHd/JsAibwhAptp7lnPI8P8+oGXAAkk6gbKIVkcPWW2osGsNMeoKxQ4V6zBhhs
	UVkvQ+VSYnw8YRcuMkz9ZAMRN0pAxpyfDD7mgdpxz7fRk7m+nMIsbaKqbRAShpORshnU7eRKgiI
	3fKGPEi4vXoHuatAoA73ipu1keRUhWqpQ8a8NWgFBCVDUf6vzJrZnhBPXbZjqfXBdjsUBOBWSON
	h0nOxRJWpssTx9VncCXfmgKDyQzx2V+e9b93gzfGKMbH7dSxT4k2SNnF7OESYqB2FyYO+U+vP9/
	v8g3Z9VW9PbwFI1wFotEALxqkQwo=
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr11942910a91.19.1788379653321;
        Wed, 02 Sep 2026 13:07:33 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr11942802a91.19.1788379652830;
        Wed, 02 Sep 2026 13:07:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:32 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/6] media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:58 +0530
Message-ID: <20260902200703.2016410-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0waS9We5Qr-FJV8KUOgMNO6jVEmLl3Wv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX7tyztndOoq1k
 5+l6GCMQAnBY8TbZL0Yg2i7CC3CDEQhQalNGkIKNhumQKcoxzrw1vHTTbgQ9M2yvBhJl2v6CM30
 OjV737kxb0diuhy8HBIRPAmKywOSYj9PHuACeHnvAgts9c4NKfO0xbyD/Q3iBeMsZC7WtrapocH
 iyASboeA0Cx6CE28p9nJTSHdl6467yivvrS2oZ2GcuknRuHGwjQ6g9aGDc+R/uRt8JLL3goPfss
 IeV3AN3Uw4DxZXIcmZFDvZjTqAznmXXL2jDXNVZFRyucRFiDlUJVA9HN83AlYvNBRJxaBf9KoHi
 AgMXrxAgXo00y134o4JIK8gxO4p9S7DQDgEyq+OW6evzhz7haUp/yIMkWndBG/dRmFJuLt2Up+b
 9yhiDM9xg+wpPV1ZtpHgdR/MsJICXiN/Yl1XFy93EioGdoeNcBmO49ZAASFhJfD9gJIndHwnARH
 7ezuqgZ3qbvn469w/RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX3wecG4pTpBKm
 Q8eXq5Ch1eBw860N/zf8e2NbraqzyloobhU8bZNwyY1JTPZim18diRvzZZ2AcsdthEyZeuK4ELp
 mjwMWPLkGpmXU3fxK6Lge5MXTZTlQdc=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a988206 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=wxxTr_YEz1i4iFEBgi8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 0waS9We5Qr-FJV8KUOgMNO6jVEmLl3Wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130735_557994_BA2067F7 
X-CRM114-Status: GOOD (  16.00  )
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

Replace the hand-rolled devm_hdmirx_of_reserved_mem_device_release()
devres action with devm_of_reserved_mem_device_init(), which handles the
cleanup automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..7c6acc6d7e88 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2265,11 +2265,6 @@ static const struct hdmirx_cec_ops hdmirx_cec_ops = {
 	.read = hdmirx_readl,
 };
 
-static void devm_hdmirx_of_reserved_mem_device_release(void *dev)
-{
-	of_reserved_mem_device_release(dev);
-}
-
 static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 {
 	struct device *dev = hdmirx_dev->dev;
@@ -2316,16 +2311,9 @@ static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 	if (!device_property_read_bool(dev, "hpd-is-active-low"))
 		hdmirx_dev->hpd_trigger_level_high = true;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "no reserved memory for HDMIRX, use default CMA\n");
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       devm_hdmirx_of_reserved_mem_device_release,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	return 0;
 }
-- 
2.55.0


