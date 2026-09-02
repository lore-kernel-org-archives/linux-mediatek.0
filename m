Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D759C61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=; b=xO6FusjdIFZbCvNpTXG2pF1Qrk
	HaOjEXZEqjeQ675h11VDlYAmRbCph/qP4jZdhVzu6rVH/Cdvc998yRBG4zJkEVoeQkXXPR2RcSaAa
	ufP1b2GwS2XxlWVwORYUZ0TnzFqhWd3U3ZErzNhUX2+M8JI6JjS2iTAIJ25LUGS1edr84GBtxaMaf
	3jwNnxZGv3qZLhSZNVe4q6xw1XKjm1V8b69XYJZzO4DhjRqlhixNaOp9YswQ2/i319f1hZH9uvUKK
	m9wZpqHnPl5Z68qgAviaXC6BWqlDn+uU8djLRiEL1bHl/2z/d+06OFoRLh+xGmloiM6C0hTvuND4U
	/Q8Whjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvx-0000000Flon-0SSa;
	Wed, 02 Sep 2026 19:47:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qvu-0000000Flma-0nOz
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:47:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrE2V1714663
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i7IUo5ODu1Q
	vw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=; b=mUvxqWw4oJGdn61l8WtLkN5uIbC
	pOe3XUIGU7bNwqp8UilUWssgk7nvV7vFxGa8NGyg4XbgnGg3Cyr8ZxunqeYhQ8+f
	TCiZjQMM60U6inCxKvFki6V3rZcNiuqzMAmYJBCJ8GXJCs7/+yunwXADfqiZPLlC
	NQqHTfMpTn3DYqAPCrQq7UawxehowYfaIMMqCReJix0QfXobob3YqJOQhcuoxQSp
	S7RjP/hXbrwfZGQm65rspmTNcr6wbpkCMgFkDIA37V4GWfIjv4g5g3RwYdZxY9dF
	vyqcJC/0j0ItsF+Xf91mfl/pzHyIEh//JF9RYLhGRR0tsDBpwI2Wa5g/KEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9ttc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:47:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2863162a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378461; x=1788983261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=;
        b=KVev7KCtIFouoQp6doWix6ADDta2+kwbEnOt8rhv6SBxQN0+BpGFCI0pE48MbkTDbS
         S/7qJFXuJ2Vw/7OenmEkjN+N2f27FzohUze1Wr8LTRB19jemfGBjIEg524Oe0OiFdte3
         ybM81j245QM1ipE8DcteGOb8jjYGgAvEZFJIo6Rhe6UWoEVWhOYBj9cKtKybS6WffjZQ
         W+WevGyrfEmASkbHrqNkhvENxb6jIIRNVv6IU6JOmdkJg/hicf0AxnzsRnCaA3FRs8Bf
         qjFofmuCiZyvTeEqHJ5S5F76fDRt93PfLnyKWT+a0Vat0fKWLPWoPYnTNQihxlYuwy5w
         PORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378461; x=1788983261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=;
        b=V6UOimrtJ/aqA+TAXIfOZ38SJ7WmFkS/JVnF2Qm8/55XCRcoQGRc7mz8MGbs39pPcu
         jJatX+JyzdAyQkc1NN+8w6EwUaFd/gkXumo5qD48ZJkK2TQ5gqnd2veinqxOHAhRqHeu
         gsR3Bzf61vO3Wh0SfQ4ZYyvqca7NoWPin4T98mzR0AkhlUwAk71YT/JiHKaMzQNpjm+V
         gDrEW8YFzgCla3h6Hq2J4zzGjWymtT5xNbIVlElvz361kSIVFPsq+vilu0mNKfbB6uZ6
         v4hLOsb5soqc9lsamZy+Ucu9YBY19qZz3jHqDKj79RUlstjTyH1aD+nEvP8zyn8wirHu
         AYFw==
X-Forwarded-Encrypted: i=1; AKwUvByJ5jzq7gjWh33HlxEnQcUnchrJ6JfRFTOgCLAVuPYfRSz+22q7JxfJB1ibajhsWsEvGDt4EvwJyJ8qyU7aww==@lists.infradead.org
X-Gm-Message-State: AFuF++lw/2hQ1h9+U8urq41KsZ29Xexi8fZODUU8/pBUiROYVomoXPEG
	rI7KMx0fi75IFv9ePHKn7RY0X2LAPlgT2zdWEYpUwT+q9Xq6crK1LcLbb4vOxBDIVvi74hA2qvq
	iEKbTyfapmDKkVMf+ngGwrADbS9TDPDy1J4pgvqmwrOxKcLVIOiT/pR5swQwK4nfIkMmiZJ6E7w
	8=
X-Gm-Gg: AYBFou3Z2gjRxMHJd1fH1QnpgttfF7wIybEDjWShEDHkzKh9m/aQti6KVSztplKPwU4
	c9e2ek74Oo7n7jvBEmXPZPOBFBXSdQ/xT/5ctk+utXvEDG7DXU6Mkeb83OlyHVniy7KUZ0Kh8gZ
	c+lioY+/B2IHvhPDnRbEbGZGqnwH/y/Kvl39NeB9bEZx65/YHoj/faTUg3qztEKjxKRZYfsQSNA
	W9rJH8yPmZQFREOgeN6nV3gb7WJF8IeIziC+vfjO8FjZV+tlEik9nXhS0L1Ln9tKM5PVgpQweO8
	51Dv8jFeFh2DiB5geOjtrNpznhJ1Ekej+eVmua7v8PC8X1weLjC14vhdVUAYGNo3hXDJHGanALU
	A14R7coPjrRVvhLrdkL5o0L8AZ+Q=
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr11569155a91.22.1788378460857;
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr11569098a91.22.1788378460471;
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
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
Subject: [PATCH v2 2/12] ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:02 +0530
Message-ID: <20260902194712.2003414-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX9u01K7Q63OTG
 x4ZvSbGDoEW5h836hCqnbznW7rvl4wGfJ1VyVW3EGZNh1Ez0flC3IdNsA0bc1dIUy84pyqS49PT
 QsvnjjOPJIHpNVhUEjnNh1g9Hf4RogbGMLdg8w7ni3KX7utWVJ0s2+T2hRZLeJsrAuuG/k7+CE2
 xMBNgfNNrSNRctbW+mevwjgZTjLuGQ3lK2sZDiz/J0NFgg3ff3vrRd4LC7XeqhmRuuiWwSJ1pq4
 MEp3/fnQUjvZPcwKQ6xhJf7Sdf3lfx/J/QjgyQzGpc17hFhgiL/7VyiRQD9kvR+fXPY5wrhQdX4
 EsKg7F0Kv1ofOOUYP4rUlKsq6FOJ8F4ZWSJHz4BRawceSZqArf99cgo9yPVVlN2KIv4GKxjI4Gx
 1WO2Vo65vL81X/7chLYKz1eELTcr+vby6/y/SYhK4FI+TImX5LafgiXnJlDqzCzbBRQUo61snsd
 UUYH1zf38FgrQc/tEBQ==
X-Proofpoint-ORIG-GUID: Uoi91T-5RWO6gWtqt7cDXiY40uI0s1wT
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a987d5d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2Epw-RBMujpMcR55kOQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Uoi91T-5RWO6gWtqt7cDXiY40uI0s1wT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX8OTakmBIhXDO
 JBAMRuEGqIaX2/syTAiGPsbxb1weNVv0S9mh6Z1UD9GJ9dLddsbQyML6f9k2Y8YfLmhPVle42Aa
 +ghf8lP2v1+zjqAquLO5Cuvtujzjmdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124742_292023_7DEA6ADB 
X-CRM114-Status: GOOD (  16.04  )
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

Replace the hand-rolled devm wrapper (mt8196_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..dcee037991aa 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2309,11 +2309,6 @@ static const struct reg_sequence mt8196_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8196_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2327,14 +2322,9 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_err(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8196_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0


