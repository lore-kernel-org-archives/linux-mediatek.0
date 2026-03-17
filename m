Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747BFD875F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=; b=16BoU3eoEiKqBxrRZsTz0jYNwE
	Kq4SCkWyUf65eBdE/1MOPG+pIwMiiOAK0uQuYq9O2p5nECajyWw1uQe6ZrNQmveGiPHy5PtEHchCa
	loMhcQjP1BG34it/kRZqnCiTuaoHHQ/46wcWMbJQwUpsW436cU+QVPAFM7BNdGAVzEnXMJXufPZhA
	n2uqwXlkLco27t7nSW3vCyvnosyrmq9AffiMuUVRg43xRC0rABbkNYVCaUS0cTLl02RtCg3w+H4Wv
	FUXh7BAx4BZoDfJVwLega2W3FJMmujHwOq6VtHM1uTQy8k6ec4vAZIzb+C5ufR8hlVEakxa1HhTK2
	hX5zWuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfm-00000006JLH-0WTY;
	Tue, 17 Mar 2026 12:37:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfj-00000006JGb-1Hz0
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Mar 2026 12:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=; b=HDA5jVxqbtfRu4bjgWteQAWhue
	pvzFotc9pGKWQ5kfSscRfUNso4rPp1f9+0PTIiuqZlI7L78q4gMXj/s1sU/zBKYhFPFFGd3ZmhVQL
	D8kzNQE/4lG83vt/iVDo4ut2Umc3jLnPGgx0Yxw0p7Kze5H4Sw2qMhgmzC2GFvjU1DOz9VRZq4sqS
	APB/WJ8svQAnxYKgP3+2r2JtNK2Lw8/sU72nFI1DsVOdKBj8hjee/A6bb4DDBtxBADFN3fiP/DZbs
	qoe4/IAOZfKRZU1X9Zl0X8r9b0PD4acciybo2g0SaM/7CjWlMJxyDkY82iJrbO4taAVBWfV+6g7/H
	ghBv1opQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tff-00000008z2f-472c
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 12:37:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H83KvP3295281
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 12:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=; b=FbKAAK1L3AL/kMQL
	f+JgJitK6FzWufXruPRpNmpR/N97YYfGYs+qhXsYzFWU/djN2twZJQc7qjiTnnBu
	qTt5/eNxB3b/2vLfotFc4Y7XuqM4fHblNM4eierINCK1B4jabTQSbKLsrurGjciZ
	7aGfFsUvNSX4w3U09s76lf6h6x0DvWhcuaPILTyPGruHE/f0kP2huBNEhON9uZjj
	gsdq3+4KSJiBHmo+66/zT8vLQqawfThkN3wqsjpcczFuFPKRoNwmgma/E8T0/rAE
	6VSigu2z1dUjkcakUvTmm5MFDPQuW9wFV/GvxZg0QGiyrhCJEYOSIH83YJBphHZm
	ukS20g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy40ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 12:37:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so550000785a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751034; x=1774355834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=jNhSu6mzvbOXL2SRusbEJsHyoGCL+LeMavQr2NMTLkwDkWcHkEGttVw/WfZVBRgljH
         Caq5ARYb5UWs3e6Odv1Kw3IyIOfkFy05iUh5yk5JdVH+DAeTtxS3SALpMU49lB48WnLA
         yAiiympf4NLJ0MhNyleWZQtsSaQcdAyWYCJTt3IpediXUD5SMbp6U3W6pryAdP2rC+Do
         5FV9jk2iQia3Cq8Lj/wFuNPwfYu3F1x8g3QslcOQJ2QEgyJcyXWQkIE4F2pknv4wprec
         OT4uOlGeVRZeDvFvDSF46bsDDIrrD1r6rayzKjmcY1HgoxMI5QMossYMHpAt341z2jWX
         gYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751034; x=1774355834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=byxoC2B+TgYDo/MAM/Lem3c7C4KLx3Sj8BKoMIUyVYMek6qYNLyWDISSt5ScAfjOvB
         d8d/Ol2X/T/w13syAJmnddP+oZhgHQepzvgi+4j7x2n7OZxNhCOv2vPZgB/cnu2l7LNY
         yofUlH3UKXeEM7Rp/llk3MLuSIURErKLMhGLKcSlTlwmUv3fzC7whhsfPhsZy6f2iUoI
         N06P90BDymJZ1mlcib14OqIrPSeFIGZeH5SEOyHvOPseTwgu8tnhUabn4psckyJh7GEm
         mBmUMz1BDb9aZc3aKRNHw5eJ6agnIA6PCGePr714poXpKECdbpjcTK//gFUbjaYKkBCG
         Or1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpJ5T9LZfzDH7hbNArL125aOyncx08McSpoBpirnzQ2yGJUG+FgWLEg0fBzobJDj3wRG6HlCKS1hboyHbbtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI0YlzWeowFXQTcB+Azw90mG7RQFZeWSfdeAuAyw4xnXch3jtW
	xlqtAHBCMQAaBL9Y1O1qFWt1m5Vdo11A7kJQa55v/FtmIU1RiuHiJdqQs0GL+GE0S3ZU941nX21
	UwZe9NaN8jMYtYdKT/dX7nc6B7DonWeJ+OyInNzdiDKcQSMoc3a4LVfXsxz1wjrFVPT0Sr21bDw
	Or86SrO8A=
X-Gm-Gg: ATEYQzxAcBnGS/DnFDgK4p5VlCAVsxwF/gQ8A/UOj2FBdQy5buIoxBrIxadMMcZacVC
	sf3YCMNNCJGgf8bpgoWJiR6nSV5kRqaS8buTIP60LR/TA6NuG6TKuoxXfrFp9e+8VLq9qkkzTEJ
	8URpj7jQ+G4fvuYYbaxEJysEiZKm3UBpLVB8I+74s8NvpQ1JpZ+WxKg6RBleVoXvB3TTsHLH7og
	KSGX++iFx/WOMEy0shUo8SbTkdvL11aNiX4cH+A7uy5p2/xbeNnZQcxy8s3x7BPPUoj4yfJ9zyk
	NmnYsm9xsCxMoSJb3x7rAJ3qa+4m7REh2H9rttOTo7U9puN4D2IlQq8Wwqb6KN6l5liz9S+ND/U
	vxWu+Icb58lDp4lyXUGWWKnwsvQiietDND9Jm/oxP3AZQ
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379627285a.6.1773751033824;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379621885a.6.1773751033207;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:54 +0100
Subject: [PATCH v3 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-5-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/LQ5g80XzsL/5CYAV3ISomhAgBWuAHns7jP627oUkDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrqgmtdERuN3F27OHUmSHYeKw5e7+/d1vJYu
 lQtMLR4gguJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6gAKCRDBN2bmhouD
 15jcD/4/Gi4pOzQo6bWmArEEKAEmKpSLeGaLTVR6yuNG8KwvwphE6E4w2Yi5wy5L4TV30U31R2I
 Cku6v9OjiaWcvGVp2wSSpAkv1HMyqXkUqKM3VHfhP6RHCCNEC8TLnAiGUnDmcYZ5niVVFzVmw8m
 v/1WQa9G1p2v/jzVM3WzKfga6U5SoFezZzU4cWQbM8mJUZUZVMjwaeLqLMyciB80jz8RDRSN24Y
 COQyhl/3m/c1wL8pNJDR8QkNDDJ1GdRmE/ege3JxLwdsVSez4uED0bXNsD53wFk9/9mC5uNOzZy
 3oFPRNIINZbspDiBrcbP8d9229ebKfUr9bndPzjyJbjoLLmHbcmghV90ZlFbO6Gs7b0YxYQW3lK
 VWc1iQJ4PKJ0ocO7WDxrztmD7MIHbH6IepDsz4MPOhFdalKDCrDXa0CfC2bSI1VFGFy2VFAxOBp
 8BGEJmqzGF4zhrXoSPG/6sIoRxAqlGYbCccADWHJClI5JBUqno7bmssBht1lTz7W3+Rs/5ILg1L
 zeQ9pis01EF8YVgyfAXkwrlU+HDue1nOXa21u1ELAm8sWnPWYD9AdR4W4TlYC2aktq5E9xaRTk1
 ZQ0zROlLiome5squwaqzQd3/PTC5FhHbuVFHq1nOwR7UoCDxw1FTX6zYgvjV4ALFXnkbevg3mZC
 Dr9djLjyQVcSO2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b94afa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=lY2TEL3CVMzQJMwj26oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX9h4vDOO0RRXq
 B/j9nKl280wt+mO8nNbRCHeYpUwD7o3+6/vzIh+wdpXOVZjnNgob6psUbh5sRiL3BUuoOjIRtqw
 q1JSp9Ir9bh+8frYHuW+LoSFTcMelJlMHNMc0x15jOoVmFs0pZiROznV4AAHcm3z+Zo+vymrHrP
 Zwhin06cZhde/pwQk6jIpS6LOmYlpupG5wpBwfqkum8ihN0J8sJVzywbqLtgyqd5yG8xbF4qgn/
 q6H8u6676L/tgfuBHCJ9SKh1nqLINC1lEjFLfpEFDyqu8bsohnru7JFIY/mee+tqw23pqPX5Imy
 ZXK2Egl4qkBlY4DK9nqm5eE5P6BGAFiV4HY2INkZPWb7hZOmLwxOdTLMnqomtg2ZoiorIj8VHg+
 KZGcgZYpgdlYFXo6IpUNzZ+PTWFVSeqrOtgB8C62c5s6aApr0aNgUmIc5qyv1bYeKYyaxYEDFrw
 ER2ky9SLCZ4Yooo1htw==
X-Proofpoint-ORIG-GUID: UHwrWPAl9EuT56zl2ZpjU0vlC3QCRX9J
X-Proofpoint-GUID: UHwrWPAl9EuT56zl2ZpjU0vlC3QCRX9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_123716_454632_29180124 
X-CRM114-Status: GOOD (  15.46  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


