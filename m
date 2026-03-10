Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703C5EB104B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=; b=06VE0zDa9B4HB1
	GDR69U/ecf5jQ5ThmWI1KAgkkWR+W1+3u0EBHYEsktmgg8kxIf2h2odYv5shCegH3brY3DnlNWb94
	hF++NfDyDrbG3qiovWMEQ4+i4XzHnKBSrqw5jUdy12lWw7Ab6JTd/inb3B3+YiC47MtNwUC+PEyTu
	jMMbe1uQM8MJFQbQAZJWTEjHrMSNGTHeNI6gAgFRv9QuaffGDUIZILYeZi3mYY+RvTSLWzcMrwnwc
	Z6UGoY3mbI62m1KDUKnOis8wwPLl/H3Gq5CGgYcTcaxeQSU3SZ5xWTbfo+km0yFnCFUQOjkYxnE1U
	KyoZJQ9SBDoSLcAm2OXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAo-00000009HCc-1pf5;
	Tue, 10 Mar 2026 11:22:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAl-00000009HBS-2wKX
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 11:22:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h7pW2754160
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y/qwFBVrh28l0ZkfnwX7cS
	s5swrg6QXLtTG7HCt/bKI=; b=lvNdvUYVrWfemxq61pdGbHF7drp9x+Bp8VAQNn
	3uVWzG/PYaJoffXDdLU5DovvKKcOOhI5R1dlSrBXucLfOrCdIDkbvnquMMzBJoZM
	/ZX3biQPyhWUB/C67MeeQMytvSEHXTynFaIJGmSD/Ul3PiviEbs1rYyyinB9FsKL
	c8DHwmkiMXNy1Q+SOLb2oeRQiotDRy4mlRSyvoXARrrPH0T+wR/iV8XNzONGazbg
	zFxvJd6TeWEvj+eUombbAf1uDY1rqmkeEpjlR3RadusEQvN5KuRlawCAv9yB+21s
	9zhg9xi0xrteftGP72y7xrl7n5v6QT1NP1Mf4N/afUEKnJOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrmem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:22:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81ce6fdcso2375088185a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141766; x=1773746566; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=;
        b=jDyt/+yMh8RMRAYga/y3zA5I6nivqJY6H/4PE3eoHhVkHlDonG+UShiU41uGHm3i4b
         o9wwL5dJR3jgUeLH1uD5PHqWJleExDEN6oH3s2zZiWA9d5NJ7FCwIA8Y+QkjTD4njRfl
         Ji/TB9fEa4gWwVWsgEYZQtrkCHRaipZSyEsnaAQx5835haTpYqQ9xMc0QA8OL5tfCtqQ
         GwgMT2rEPPI4k/AAOcP2seAVhVvTcUHG57VdAB9802ojI9RzJaC1BkPKPWhAfDwSD9YM
         At1jvZPPeNvb+KAdpWRiJ/Li2QzPM9Xb9HugrlbHrN9zf3+RHHWb1PcjgjAEv9dwOmyU
         OZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141766; x=1773746566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/qwFBVrh28l0ZkfnwX7cSs5swrg6QXLtTG7HCt/bKI=;
        b=K7MPQvWxuQJVcWF1neBSEriPIeLeACNFcL85r6Wou4r2B2VabVol0B733fC6vD6TSh
         cTh5kk0I10SP7tkXsK6Y5C5kU08EV17E7BDk9Cxby4HL4zA1bxtjcT7tSsq/j7o+3zpC
         3a6OYMcv9tQLgVKh7omlCFWdaqN1JQBK9RKPw2nKthJN+RL5pPHZuWBk41IbtiR8HfbV
         EsuU4L9EXo5T7ZKIfbv6nyDT867wQ+7JQm2ufZI43MldvM5z+q7fGW299p2prZrLglOF
         KKTB4JkCqehZxy2TxLkL2TKuYE84q4gXV4S6awL/zMRzJsdrdofOgG/lg9xEaRcfXgMa
         kA7A==
X-Forwarded-Encrypted: i=1; AJvYcCVZrSvnSc0Qs+L4dwm/skrrn8wKcxAQB6x9ntt5OoemhkVrOyAacnb+Nr8cZW8cR1GxImVLAybaFK2W7h1EAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR19OtgeI5vp/f47Gx6r4tEj8nsolgfc/qRH2lGT3d2/3T/t5P
	5dBUCJaHAJM1tAX39ucSbJ3Vs6XPTCdNkuNecu8z8lG8RH6J1ShXKwN8QLYgtQs66cu3NDPci6U
	a8ZXWDteGLeWT2bl/TOFxKh3xAaaPjDRI49bd1OS+j8LqfxBb4PJqSFq960tJ0df4Y+Ogdohfzk
	Y=
X-Gm-Gg: ATEYQzwaEBc3nz3fhGqkHLcyvWLJD8c+9A5qYZ7UCpNFaHVm9waDT1H7Un8+NCDnqkW
	GV2D0s/jfnu+qMpKwB8lqjIYhB6sCRNIfq9GROfMDQOYpKxYl5vfpyq7mKbqrDoRiBDfHQfhHi6
	rQLwpRINWHZy9qIhqI5cxzO2EyFA3PB8YZG5v/BNepueaFWGOseJOUKR7ISbRQ+GQb046nIknjE
	DbGyDXGgOlPyiwPxbtUSVz8Wz2AncMhUiGmTcspgVcCcbN+GzBlGW9BcNVP53YXef2mzYBSiYH8
	NcSN7zQqgouuDcSwA93nNHyWMzBOil5PtxlUOmA5H1uiPsbnzOCv11EVJgS3CXj5ZYVrqyw+Xe0
	Be4VTO9+t9fOMXp9RSlgeFD5poHWuiqmNtJGdyJYZgerZ
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cd937f17f2mr356171985a.71.1773141766016;
        Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:1404 with SMTP id af79cd13be357-8cd937f17f2mr356168585a.71.1773141765602;
        Tue, 10 Mar 2026 04:22:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Date: Tue, 10 Mar 2026 12:22:34 +0100
Message-Id: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr+r2kC/32NTQ6CMBCFr0Jm7ZBO/Y0r72FYlHYKTaTFDhIN4
 e5WDuDmJd9L3vcWEM6BBa7VApnnICHFAnpXge1N7BiDKwxa6SPRXmEeB+lQODq0KcqEhjWdDPn
 WXTyU2ZjZh/emvDeF+yBTyp/tYaZf+0c2Eyq0LZE9szJKH25JpH6+zMOmYahLQLOu6xcm/Pn1t
 wAAAA==
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
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
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pYcuf75vG0mfIhpRZR934R9rutW2Spwx/s55qT/NGM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/79dtIL0hoBUkby2F0NZwr71kJVJLTW5zNxt
 HtKoGbbYoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/QAKCRDBN2bmhouD
 15aeD/0VT/T+e0k9st+gQW6YoLj391NXIaXPNdoizXWVYj9/m8VnvPzI4yWwLMZsyS4/u61yLYq
 17S5OEBQH+HVgrvKu9pBPYqFSQritNf9G/0hvOt04+KwKqlJzlBO9QR/2B2woU52sh4zcJ6hWYY
 cUpbshSq0bZsyO0OipVEbiYeWj6PIt0zKKi+mlf4TxbWMlX6pOUb2tKHUU/0c9v0BRNf/fZdKEj
 FQsxLzPgtHel9lhGJfsXDg2fyRpH/lrDNJ242Qu33xAQHP9Qa7/vx0/2GstXZ4f78qygz08Ound
 vR5ygwsDxAy8TveduE6uUXwbcytKBb1TXVbZBLYPaT95ssmFWQw11DvI+HpeNfnv/liVxY8NMzf
 GRab+WoELSC56zeid4QTsbVDSutmUwUdpsgtLXWgIEsW7DrDVrB1BRWq72Lgx6/nP66q43Z/mXE
 iTvTtgSmIF/OBXILTMAI99Q0tWvUNO/lMEDhaXEa9dqguwcz41UvtSRGFQgJ1O0AKp/m9t0i3Cl
 udGIQbKOUUncPTAupcq2h4sVQqMTaVlhQTNRmuW+FKT609sOptOyTiiOpMILV+DV752BUVBuFVh
 cnQ9Lj4MqQkPwFzyRWkaOE3b/j6SL5bY2SOdbomLdssxtTYpemKhI/FdhWV3oSlwm7uXtOndqj3
 s6tshYhHpVQAJZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69afff06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vNCZscE_9IHIdu0JSTEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: SWyoL-g2DbjW-pNaJ71DXMv59L3zoLZh
X-Proofpoint-GUID: SWyoL-g2DbjW-pNaJ71DXMv59L3zoLZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX0tfWsZJIcVEB
 ZYtgVMasbbMJSfIm9cGXrnU98kNNt8ktQQp4Ef0JngvRyZJNJewmUrVSDbFJnE6OUiVHSuV5QY2
 tId5E5CGovYqSR825TPo2SK0h/GSC2/kJD40Pd2FEKpsRQqFfbNq7/OwycOKAVdhLHoTi3HxsK7
 EhrIEMsCMyy608UdJA/ZzrbVJ8YhjXev+BAdAWKDTdaFXQ9TD855gs7/c/6eNIs8fWGM6QS7+Ub
 stDEizPMUVDjFQOXIjhPOuyC50J3jv9toh+cSwdZbme7JDFdG9ezHoBcHyDw3fb8PpkHoanu1+q
 ZJD1TIPFPatPxybYiVE2tEX784h+sY4ZHL/asSgxuqoD92N8afOJCSZ7VeAjHmwpgv5QE+oqT1c
 TiZjmDb6f12tJ7w1Qp5pFf/8wVgp/7yLMCvfk0dRSTCJ/ywwVBviyYmQK/ci1VLhmrKkC7AYdqu
 lYNoSvaCypEhSD+rkWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_042247_850714_6A850A39 
X-CRM114-Status: GOOD (  15.85  )
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

This got acks from Mathieu (remoteproc), but not from Bjorn about qcom
parts. I was hoping first patches could be picked 4 months ago removing
the dependencies and making things easier. This did not happen, so
Bjorn, please provide Ack so this can go via ASoC or please express your
preference of merging.

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Changes in v2:
- New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
- Rebase, add acks.
- Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface
      media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()

 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
 drivers/remoteproc/mtk_scp.c                       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
 drivers/rpmsg/qcom_smd.c                           | 10 +++++----
 drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
 drivers/soc/qcom/apr.c                             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h                 |  2 +-
 include/linux/rpmsg.h                              | 17 +++++++--------
 include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
 include/linux/soc/qcom/apr.h                       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
 18 files changed, 65 insertions(+), 56 deletions(-)
---
base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


