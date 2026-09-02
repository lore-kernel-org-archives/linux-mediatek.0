Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D4BC624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=; b=OGmrh2IoWEU3pnJYTgrTq9//Lc
	935Bo0Oufv2IdRqlleBu8mSlogZUpdPUSQ8WLp+V6a4JSOR7wPa8mwxo0DjGIFIkRt0atsqVT4EFP
	8mi4BL1vRTmaMah1MuiJEo54IWVl4tT3DaOfU3E2rOMGcS4njgvs/xS3pcJVwDi49AAULwcR9AQWo
	DE/flrvlcyuyIIhLwC3DvGNL6nI64d5dpcfb/BWpAvFhQwNEEiw1rdSoP6aQrQBRwhSKLluBfnZql
	k2dBWVGzqL2BEK/CjtNstrKDsdGTz02s8a5HE+Sdxak8knAP76zUBYw2cXISsNY4zAPsJe63u7hnD
	ZdK9HMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qx3-0000000FmrQ-0edW;
	Wed, 02 Sep 2026 19:48:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qx0-0000000FmoX-3AMU
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr3Yh1714422
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mSQ2wHhx839
	udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=; b=SrARi4tMGYt78Vw9iIalKH5PhfQ
	d47PzXnzCU/UuRGqYazjgueka+kdIHjj5YiZY16yem0fyH8wDOW4zgf+qATvlGlF
	RGdR4INSXrg+wZfUZZ9rO+Jloh5nDrYKke0VDt0LJxvCJc3OMvblSMJTlBH8qydz
	YVK+BAgvV3H68+2grhR8nGavPAg0q9RP231KFd4f6VovWkiVozDPLzSrJU1oa6xo
	vs+nx4v/Q0ckJgy469rSdDt6apzzy82ruQIx494vaolH3MBN0fxpjpEN5c/1d0k8
	pQAS+ofoSxareDrvTrXljVbHlUwkiVUSZ0b38y64aW6ZRRAnpZ0B9r7sZIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9tx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:48:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacd6d37edso19349675ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378528; x=1788983328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=;
        b=F+9ddm1pz+Q1lwWa7i6KhPjoh02AOQ5hdZfbZoHk7shrrANyBjINn/QiGIhgw0y66E
         Y4p2C82YAPh28FSiNyQqRnTSc4BTaJxRkAmqF401az14JGwI28gCA50pPg41Gq75GM3w
         YSVs2Npq9saleLlK1KEevSIGkybxO7qFfsmvCh9Q8+gDG7Om/V8S53YeEn5ImRWZORsF
         emTkS8KOijvf1V0Ua/v2/0wq70FgoVUX/VN3XgXE+mPTFx4Zy+Bso/zcmWUn/gda++dh
         0h/fxTC5bgB+JASyX/TgEmgf18XmAfouG/WebDk9IOromWRx5T5MRGWfxKaaU2PQEgZf
         AkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378528; x=1788983328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=;
        b=jsLoRPbNevDFUGgTe4tGiAd5oU1SFwZLojMHKC0JxgFHa9x+ReDrQ208xTzc5p1TSb
         nivn0zilamVuptjz84jEey0QlgJ5SQ/PukpM3cYy5fjmV7A4BQ9tlyFh+bsg2NUHw3tw
         98UNM0GmJDZGqZ6KhkPzBI0TbyGKueoqSKeCIT5vbaDRqqqqxEnlNcxHZzROyNpE0g5m
         rqIVE40tz8tPG9otj2sbcc9Hm+FYXKN/emHmxL1EZnkW7cbq1ZZ9plE7rxe00FStEDpR
         0HRd/QPN2p/Q0lvdgjHOFcLG0OlvOGWjeFM6E9MZ++OuIjXqwrzfIpjZhxAiGD3dpY/d
         lR8A==
X-Forwarded-Encrypted: i=1; AKwUvBzPieAl2i5h5kM2U/dOy+17pa78GD7TJ7P1CqoU3aflSIBYUeNSrXsodhFyDbsnDBP6F4il87MzPQCSNeGJWQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n7OQT4cblJjpSd4DwOdBwTv035OuQgWsG1IQpWfAgA9ENCpl1h
	QLa+uI/ubPkMy+JhgYj6nnVmI38ae8t2DkhQBPeLo2X76wlJ9U1lUHJFNcN3MMadIoBMuocO1kr
	ag/ZtPVVd0qyliBZKwOOjRhEylv5ZMJywzN5vaG+swk/sN3GFHSoiULIB+9Z54lYN3RYHz+m+qT
	0=
X-Gm-Gg: AYBFou1K4PaPFPzmzuDXdM+86h4X4hZqUleRvfBT8OrALzRiVlNR3PS40AEzU/m34Jx
	3PH8//brt6/7QnWwXc5YQZmwjlm0mH+mofs6SMdSE0iC9AFGmdEA99UanpPKqmVu8rTHM/dOTCs
	+zJKkwHWraF330cg1sloDlSG8hNQpMrM55brti/gNYwqtASFAYtTV8Mcuu8301A/anmhL0C8l/0
	0VRKjqNEsWxNPRp8lUne/OJYSMlCxkhF8ZjzajbgpJ2IGL0Xt+OLrorG6DWVAJcsNGeA+GvLRXx
	gHoUNfEC0OChg1qawITRcdgAyJoasIg4WzlRZh55B0spiI8ws0Cl8PC3BkVS+NdsAxQi02uOTgf
	l0XXNm+Ogeo07VRnHC0APe7FrIWU=
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id d9443c01a7336-2dafa6ab21cmr26711955ad.2.1788378527653;
        Wed, 02 Sep 2026 12:48:47 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id d9443c01a7336-2dafa6ab21cmr26711685ad.2.1788378527226;
        Wed, 02 Sep 2026 12:48:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 11/12] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:11 +0530
Message-ID: <20260902194712.2003414-12-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX4k3khBlz/kTg
 QjgyY5gfcCCU8xGD6w+GRv0ue+2OAN4lZXWENVw/eQdw8T0ydopteUV3wtFEUWuLLC33dZ92as9
 upZDL9gfQZ2Cci7AYJQIjcw9yA+ooZh9/kVgkMgCABOmSKewOBvDGCvalcdaFT4EArfKzg2BGnU
 vdj+LB3cRWtwox44RKd19JVNdW0NT9rJgnWiNtw/J3bWfJ50kuIEzjfzpz1KDo5Dq3yB1ENqdQg
 SwwbFkSOBrPkUnq3I7HHBmrEcOO1qsRotnVIPCM0sWx4sCbyFiWfD2P7jqDv+f8L1WMSsXUXPG5
 cEWcyauV0RA8rFlW0GpM1sWFrPsCQlCcvHl1uIZWoOAh2lKC6aW+Zo31mzAhaKxCmMti0j0D+1X
 xITKPLcG/k0xZew8a1Ne2SiBwVWX2i5QSF1WQs9LKGW4h6yvZzGBmgUsyxRd66F1Z9m9eDkxCEY
 0YRYmSPLbS4w7igXcZg==
X-Proofpoint-ORIG-GUID: Tr8PNkWwNQb8b0ul0nsflolgOHzXKrHO
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a987da2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Tr8PNkWwNQb8b0ul0nsflolgOHzXKrHO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX/l5ooEPcHfDr
 led4kagUOmDruzKuOcJymJJr+HbzW7GTurznl7d0ulRyybre5nroXeXQB6X4Zp+UwKu+PpI2ze9
 M4G27semWju+Jj1yTa55VzpJiA81+Iw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124850_805372_D706E8FD 
X-CRM114-Status: GOOD (  16.37  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.55.0


