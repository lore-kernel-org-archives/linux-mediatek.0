Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4B9D116F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=; b=a03+bopn2w/3iy
	9r+kZ0MXPCDy0RCoTOeCJ1jNi+/MWA9MNYOfDaxMDdwACF9crmXMZFXlNVlQiGSDC3WzoWTIhOldp
	JjcCGvF5+SSbLQyymUoTE9UX3P+AT2KRnARyUhYttC0/sgVjWWEYxgdTjW/WUYDya2OZGHLiN+GY4
	Z5fl5hpAkRD7svVRzLrg93MYYdLTB+PoHdRwhF6TbKtrW0yLtY9CzHtQT+QpTyNbkjigl6wiwLqbH
	mUgoJImonFJZN7fLLBrtow2d/HR9ygEP+maOiBXyLzj7IQYIRSKli66vaJLbIQ2VpZ7C2pdAOpuIC
	nba+0h63CjhO7Q8wY04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfA-00000002Hxq-3D9V;
	Sun, 30 Nov 2025 12:36:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgf6-00000002Hv7-3oJ3
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU7pa1j949586
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=khDYn2iDAtsrUOzEA+11Sj
	iFVdLA2q+h0420fjCDJjM=; b=RMw0BOPGhi5SF8Hgv5nYITpLNbk8W9uMtjCXhU
	eOaPuU7Uvp8FvkUrEDiAdVuD8KS/xh+XUMjJZ534i/4I/BTMoQD08QxmbDZn+6KH
	1hDdfm6vWMooTzha4Zn80izXs6+5+57I4WfLkHR5MgBqZu0CqihECgS4CX4bQ+Cw
	aa1IJXl8+H8h3TRtqycKTk14TG1ZRYiviYdyvlH+83ZwyVcAYh4hFNZhiQal+kpc
	hbOV+aKN5uCRnea7BZT3B5930I7gu8A04QyURPiqmrfnyVNZtqCILL+ivjgh1qlY
	IBzBWiS3a1p/f1lSUbQdGbYtF+OosVq4+hEZB0GP6n7TnISw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqskf2412-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 12:36:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b26bc4984bso73431685a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Nov 2025 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506177; x=1765110977; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=;
        b=V7PdOz7inINsI4bUmx1hDB1Y1YBOmSPEFt/RLdzh6rdTGyB7juVGf2qDMHSTxBCCB2
         Mxk6MLIbY4ht8CseHpbk4kXcX2hBwj1vtULSMmpiYoQhe+LtqRZspTUK8soacU++JPEK
         bwQOeOZ0l2bOoQXMS0Xb6iu6CnJmOz0bXayqzUU/Xho0WO/vMkHVZxUj3osSI4nCX1w6
         f+rI0U/W51c/iCIrK+yqeqHm5iduId0H/PQpDwdIsd+XhiLMQiSSzv9LQ2GwFaExswgY
         cZZSTt48rqunZgoU4NF8spqr+lsZjlU335C0o3G2G0pQgdSuSMCLGYzJFN2LSsVeRt9i
         s2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506177; x=1765110977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=;
        b=ry4xNTYkXw8Fg5RR6WgSarMdRK2I5yHCt59e2RrUZYV+KaJ19dlja0J9Z/PJjdwQf0
         0Bu62ririr5KThP7L5U9152FEo7bUC5WbZ+5AC6IW/X1lo96A43teJ3y43aonL6w1iEw
         HFmG5Rl+txc/VzbTTdpgARQX4bE50LRCfYLRwrHu5HI7DTYYh0oFrIqV3+rERquRmhxe
         zsWEnDkfq3L9QHjOSk2/dCJd8grA3TzAczBeiporY9ZBFpwlfF7/9x05t/8axc+KbXkV
         gpNczQPh3HmT8Rty9ckbXLlA702Bn43oFptZ92hrVQdGaVqDLIM0fS3dIQg9IX8Xk7JJ
         Md2g==
X-Forwarded-Encrypted: i=1; AJvYcCU4dLwHx0kCKQ+9JTAMOieLoplADO2R+uyiueB9tlHBVBtmzfYXd0ry8kg1UBH8BqdMj8KhRJkgjLQUM6rHVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDFGozInWPJyZ4/zzLHmUQcvyBlbxCuDwgNnh5Dt8NmplAfsnq
	wWcsZeMbFl3IU0lNRQRWLDX1Vi9nVQ2wEg/MQPGC7gbt9c25IDtccP3LXRfSk8U/M4X1TOT+zBG
	isGYTsls4M9Frq3QBmQ0unnXuPK8PN+uyfeL7VVKtOFhAAD3VMSSN5DdhgqSxgNIGg3N9oabrhm
	0=
X-Gm-Gg: ASbGncsJ09UEs26k1f7J/nNUX9nviBqgtULuhQyJ8EgffhcSdWMTy8tNq2e8tQL5RTw
	K0Iw4+oi6i+PMT5AVmiP2Btsb1EVBoJ13eFagqP6JqcrLPmT09IeS9ea8LnJjxj+eqBmfITiOR3
	D+yJlapEZyWcfVsFSuSYnvwMTchaj5Knmw/lKZF1BqhJpMrleJlADtej4lBydV0slAVoxCclnJU
	AQxXH01MobnbdzDs9MOSnyahyeavcGZcWUYUhCF70nBIQSwZjedRKoXztC1H2gnupjV+wFpA+cF
	93HLHeqHWA7CvaCB3AGNIfGj8tWUO2V85+HMBzNebx5gWpvYPWFT1TH48yciuvYz2+lQQMLxrND
	pcNKmDTmFZUibbAJQOhqOv4DKZDjqyjFYKg==
X-Received: by 2002:a05:620a:4411:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8b33d4a74f3mr4231819185a.58.1764506176696;
        Sun, 30 Nov 2025 04:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeWK0WiHjAtwF/qYOyew/roqAG0tsI6NrdqTKzALGVqVXop4gZMar8qFcPH6xWCPkSaoNwMg==
X-Received: by 2002:a05:620a:4411:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8b33d4a74f3mr4231814785a.58.1764506176170;
        Sun, 30 Nov 2025 04:36:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC / rpmsg / remoteproc / soc: qcom: Constify buffer
 passed to send functions
Date: Sun, 30 Nov 2025 13:36:07 +0100
Message-Id: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADc6LGkC/x3MMQqAMAxA0atIZgNNRRGvIg7VpprBKo2IIL27x
 fEN/7+gnIQVhuqFxLeoHLGA6gqWzcWVUXwxWGNbosZgOnddUTl6XI6oFzq21DkKs+8DlOxMHOT
 5l+OU8wcxCDy5YgAAAA==
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=O8qqd34rZzKAlT8emxlMGg0aXIBHepVV/wOrOHz5bV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo6DD/JawmdtkgkOBaTkDXZexZA72yvwkmRX
 2xb902gWAqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OgAKCRDBN2bmhouD
 16BfD/oDmj4P63MBv+3h6ohF7ryGULYXhCUqF9p+69+7wePAdkGFR0SJ+SLk6Vy15z2rlQeSYXS
 Fq0PWTPhtAA3F1Ltma1AbOQtUE9D9Ovkh1yhinbcXfEmEo5kRDloS0j9684M6ig49Sd8AcrU/8B
 082KRFV04slBSkbB0LADnS0NIVUtOTXI1enIqRB/fb1b/XClxr9xdMFY89a9vLJbp01nB9eZuaO
 eIRfeXxCK6HAHForIN0cpb8NvBA+D7ygWojSeB3S0I+FLMujOQ71pZjD9p9cIxZVsTBsGq4SB5o
 28sOHp4Z9VhM9ocdhOfEfje2u4h8Y3xRN7AQEBMTzdbXwCtthtVc0YE35DHNNPP1gWWl6Rkp8MJ
 8SlHUxvsxP5Img8IkUhJMbbkjtJye/7IHhPhsMRaZ5ANNJvp6jtcCelghY/Lyaip5VzXutDKsoD
 srWqfPLvBae3f1g0ArGiIsAx87MkgflTDPvSQ0HxR5Pt+HNtrV0dBpEX+5Yn/tafiqWMANaoeB0
 I5pPYvOdRsjAm/a0B2w0erknqUgmJHl6V3PETd8TiLyHb8LORu5YNLjcfF0q7cm1RcnzmOIVllq
 cEMypHzNVe5FEFQqxGUVv/RJ4FuNFpaYmBCwwH+1SehdWQZZwn4woBF+Yz7b2SjkCHpUmJ7BGaS
 pz9b+fLWw9Cti1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=X7Nf6WTe c=1 sm=1 tr=0 ts=692c3a41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=a5V6tGfecjnVh1JciPEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: f4dNEDYgYZxgDq_wTj7j9_MGDd-zXRyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfX2Q8DfHtN1G3J
 0gKD7m4pyLahtZa8zWZorwOLWrz5EABBRaTwlxMpjAJlY1XRPS8F4gMRsKE0ahM1zYHd/xDpe2x
 TWIuWFzwt7Oz5qUh0FqFROnNp0RvwZheFF3One1RircGPD731Oyuj7zkrX2XE9srW/3QdwfnH1P
 g7Iwr8XoTHob1fx/QVg1HlGVsVSKCOzH+BIKXm6rRnnQrWMtH955HJBjYRtrGBs5Ie07Q/lv+5m
 sbM0EjPYUcSKhjFjqz/nxeTe/Fn7ExPncVs4tbv5Q+5WCBxGbnfExFO5Tff80s0BZECoEAYMu9B
 CmNqc4+eswXH+pLn0izDzyZmTJ0RPHmkJAFgYvgV5MUq9W7cAq/unMACIxvZWHY18Qt3PzGn5Bc
 cY2nEq12xB4YXMf4TC+96WUhKHRHAw==
X-Proofpoint-ORIG-GUID: f4dNEDYgYZxgDq_wTj7j9_MGDd-zXRyw
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
X-CRM114-CacheID: sfid-20251130_043620_972127_74060F8C 
X-CRM114-Status: GOOD (  14.23  )
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

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Also, first patch or two patches could be taken now for this merge
window...

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface

 drivers/remoteproc/mtk_scp.c       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c  | 13 ++++++++-----
 drivers/rpmsg/qcom_smd.c           | 10 ++++++----
 drivers/rpmsg/rpmsg_core.c         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c   | 24 +++++++++++++-----------
 drivers/soc/qcom/apr.c             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h |  2 +-
 include/linux/rpmsg.h              | 17 +++++++++--------
 include/linux/rpmsg/mtk_rpmsg.h    |  2 +-
 include/linux/soc/qcom/apr.h       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h       |  2 +-
 17 files changed, 64 insertions(+), 55 deletions(-)
---
base-commit: 7a9e871ce4c7c8a7d75eaef8407083a0525de2dd
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


