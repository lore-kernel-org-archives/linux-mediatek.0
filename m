Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01081C624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 20:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=; b=kOsoKnBYqvmt5SvVx0DyK3bvu2
	deUCdKILBU7Cm8/qebY44ldYhX/fBkrHgJQEB4byoIliRy4RYXBK0VxTA45eMDpb9uNzmlJ/P2DBU
	ruo+tAwpEy4LLfua64u97NWSgywWlX482LAcfRdfsKwLs/CzBffwf/0w6WwPPuA9cM3cuLW2I2LcV
	r+czYVTH/yCFnd0hIzARxFWlYQMcAPavzM7pIDYkeYqfo3kEIy7KxuMuEsQ+3PQZOM445Rc0OAU5u
	u1HaBRhZe3Nq5Y/pBPRkECP/tYo6eqR6U/yPFM8dRq47Fe9P44Q6FCR6LGK4kcOJlf0I39i/CKH36
	aqKbxWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rG0-0000000FpTc-0KHi;
	Wed, 02 Sep 2026 20:08:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFx-0000000FpQy-4Aux
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 20:08:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr7wD3378615
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 20:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a6ghP9glQZI
	jLasHwBOsrO1uiVG300zETw/KSJymUtA=; b=oz/tv1sRl/3WsGWjrvJ22sIWBYb
	EK44Eaj/gx7eSgTeGrFcBt5xotgqCYwj204u2D0Ndd3sEk1CT566XOJaRzl5VqpC
	EbEiiC/Sm70Il6ZcpQ1Ov/NdzUMXu1/Qh5WISHG1p9iAn+cPO5nWSkGhU+MTBev2
	tRFRmXaaICjuberKDCp9omSoB4vhP9evTmwK66S0w45DyWz7Iw8r8xrQISBK1dmi
	fkEIEA2g/dFwWupDcNawXcQpj0E0Wo9XOuag+STbTcUpHqLyXrUTMbOIJszCF5rK
	DtB+rd2+Is6sHEHgkmy94RiOKEOgofNKpIiX38htK6gO7L7l+GjQ7AdMY9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnhg01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 20:08:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2377507a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379705; x=1788984505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=gmbs0YcBiWcbUOadaz63elWpodH8O54SaBOOWiPr90fR3mlGf/5dVtwL+6BFYBF648
         IsBYcGhwnKyWqBqZIMsjPKEJZ+lgjnoS2b/xa+5AW97CB6gDyh0zcoL7WhHyuPz8a6zH
         DakB7xvjqfZPcZ7CwjL7b7i8gPj4voCXcFLc2Fh1mKM3GNMdu/hg0udXtGxWyoQLRolD
         i39RfJ2yxTS2XzH7FAHggcJJw79eRbIcPsmg1LQud4QIFb8+viPyr760hFiwu8hj+X59
         G1NZHjM67fRhzdNzka/BbYciusy6MhJRqJQ7fwfkSIqzfMBuf8BbmhHm1lCoPM8dZx6h
         KjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379705; x=1788984505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=NTEPXkyK3i1iH7mti33EUXnpctLeRNdjyekpWkXSGWB0VWq4V1BhFKCux/KOfUj3S3
         zuNi++DcIuwlm3CPw9tY8RGV3KgjW8AHj+FjvW2FY7iVdtYbrNCIYkD5+VQ6DISXlHpl
         SeQ2AA7dhxWakMLQmt5LLr7ZKsbNjTAhcbsxbbyVXsedv93SvU66Y+jxIuZk6iDKwmgH
         MfGthy9io4oBqaeQtzExoW9B75d236ZduU3jQIJFlCw4lJ6Vr+I2w5MyEeoMS+f7y7qO
         HTdWFLuTk8xmcUgwa5hFXak7vp7Nk6ALeQOIuVox66Uf/RTmn2YqlV8VUmUWJtjCS/bp
         U8rw==
X-Forwarded-Encrypted: i=1; AKwUvBxiV4WKPBmbhq9qC1eDWrp7KbUuEVSh2hiHuIo8sgKgQ5Y7u4jSI3ckOIjhWvWN24wghJ4qYFYBYi0SJgPDew==@lists.infradead.org
X-Gm-Message-State: AFuF++limFdawy2/QyWx+Cje2cYWTQs1KT8BwQNP3bruWeG2nbTSWFTL
	B+9mbQtBjlf8Ls5x7k7YWt+9PfvKwHfpDs+gm6Omch4SVQ9K4OGIuXukOXQygvZMy1/VP1cTOe6
	t5hM+qcTXwnm8Ff29O27+h9kWL1Wesg7irIKllGLv0/Zlb76h/WR1kVEgYTlbjkImM7A2CLoirO
	Q=
X-Gm-Gg: AYBFou0IcTaT34GwbiTDyMtheuXqwrq8qyXN6Zyvg9feW9rtFpH+LSRf1d3/PxQAKE7
	PzdiSc2m82nfe+e/gvuV90VaK2cv+n33BPbvlIxeVbMd0UCPVK80qqjg+JBN1HuRGYXwS30B9e+
	06XE+KC34e0eBdIFIzi1aTUePRS3o/WAOGh9PzjhaeDedwrXT5+EpcwGX46vbhpJeT4LphTbbJp
	H/Ak1KAWHwwT5xuQh6+i8QLAklkE/gSS1pcBEmn2UGaw8ZzPd05ANcBFoMZAdewmPN/pKPr5PmF
	s/+Q+2MfSTuRYAYzcPS970IIUuBWmHCfDAbHWbh1OBi4P9grPUgcrT56ysThhQhLaHQ3vxTPbl0
	/bvObfqAnVvvKXP3oxYQjNsbZpU4=
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293348a91.7.1788379704622;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293267a91.7.1788379704103;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:23 -0700 (PDT)
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
Subject: [PATCH v2 6/6] staging: media: cedrus: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:03 +0530
Message-ID: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -tNwBjG-hXFYe7WzK3cls1EDfpCYAXU3
X-Proofpoint-ORIG-GUID: -tNwBjG-hXFYe7WzK3cls1EDfpCYAXU3
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a988239 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mTAD4mZO0xO8FHYJIeoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX9RxwyCqcjjC2
 PWCzxnWCjTPcvY9TcSHp4lLdKKKzdCgc0Xk19fCSD6KdAmmwnqM6KXe+FiexCd02AKpmykz6izr
 JIMMx84cKrI+OwL+YMUNJKz8K+eYasofL4x7wlslI2sxyHC4uFEl2p/QuTrdhbIoQZqDibhcRkY
 CYmoZT9h+NzmZzMkm7BF/pFyFJisNt4QCBO+7edq5XZqvgdvrDl0QPXtQan4sL7+eRx7Vko1ce6
 p2z8znBf1NhS85KPaO2H9l+EZxNCRkacSV5ph0Bf/8k47Qbn6wxfGAjwhBmK/UnGQxpI/nPgdt+
 kHoyPi3+7LrG6t3leUGUTyGGDg1WIv3PZ6pyIk3/jyfttApgYk2KB7NPaEa1fZOdc2in6mCNEJu
 0esuhnWaxLkdOSN+g/q7jLlLQV75452MLDFuYSHR6ErijmZbD/zvzKy9Q7ghBDzn8gSSAS1dLz8
 UMH5j5nG3Vg90ORP/GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5Aaw/YXLw7QJ
 ZOzKDf4252zgYT2etOQAGmq4ScTa7rzpuoHMrhrsXYz9WI2I9qX6dgjp++xDjtgA0uFuNiqs+Rq
 9JMKPhumPi/4bNlFzChYfOt8kQBaTUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130826_049253_BBF2E483 
X-CRM114-Status: GOOD (  14.22  )
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

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..4a15f45ad077 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	ret = of_reserved_mem_device_init(dev->dev);
+	ret = devm_of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
 
@@ -277,7 +277,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	if (ret) {
 		dev_err(dev->dev, "Failed to claim SRAM\n");
 
-		goto err_mem;
+		return ret;
 	}
 
 	dev->ahb_clk = devm_clk_get(dev->dev, "ahb");
@@ -340,9 +340,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	pm_runtime_disable(dev->dev);
 err_sram:
 	sunxi_sram_release(dev->dev);
-err_mem:
-	of_reserved_mem_device_release(dev->dev);
-
 	return ret;
 }
 
@@ -353,6 +350,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
 		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
-
-	of_reserved_mem_device_release(dev->dev);
 }
-- 
2.55.0


