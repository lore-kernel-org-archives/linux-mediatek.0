Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D0AC44502
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=fIBhHRZ7s6hnDSJCPakrtpHI0M
	KgbHwqSiAyZgKb6Y2DMs8Xr/qzuSMy3JFqTUlNrQzHoXXGJ1BuohjPLJoU/aONgSdmzZ6R483PMN4
	LatpAg/FgI3vvBFE1fzsYRAnEacbew+ccB8dIbYH51nffY00cahN5wTcooOrecAvShrzYuDOuy7wU
	goxTwpjtsonw5MiKuMkk65A761bAGNUkj0A78AwDTKBoGlzx4p4ojDUmauPIMGXUE0s7tslpKueJN
	tZcSai164ZV+jY/5LRbEv1PrdJ/Byg0GgkHXu0f9n4GklQxzNYuZwNukw15SRHhxr0/+8ff9y7L7c
	ef/DD5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSi7-00000009diM-33sj;
	Sun, 05 Jul 2026 19:41:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSi5-00000009dfv-06Yu
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi0l22327150
	for <linux-mediatek@lists.infradead.org>; Sun, 5 Jul 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3J7+oNMk7WM
	Q4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=hPcw2XE00hJiXGUlPJdzgAHVQzT
	3IKBxTpsdM3YltXY0Gb00tp8cyyqr2jLji+CKNDBWau5JTu+BreuyR01af4GFyfv
	ngpGWe//C62ZWMgkGJk4zSl0S0wOJ9lpQw3JAKnLg2fIs5pZCB7N4aamjssEjqJr
	56eMgt2RR1Wu9uGyx458onBujfZX4GqD+UxQKYZvfMFk6K6CooiLxTXLejKO9W0R
	0jkXD7cR55aEXj06BsfreVAtJNhMuxZgvDsgw5Rbn8a2yz3zzklaCOw3S6PIDyNi
	LSZAc2ZKjYucaa8JgIZQNxudHkYVpBDXyT4e5CmqkA1zH01od7f0TWn9fNw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh3ctm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 19:40:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so1029535ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280459; x=1783885259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=E4JtAtysZa6MTmnVKoJzLoiDBh/iYJlplAc93Y2dBvdbPAGSnS4rc2pVAa6qUPkfKJ
         of1A+KiL7NHlttm5CxrKG2WAmDDOdFcB7aCMbGwvaAHogPvMJ+l5Q4Mwe8TLuUP1yrom
         syEjLz8uyil/HjFIYoe4f8ON/oXBgwrrg/Hl1PJ9O8RgynhQD2xl+WMuw1Qp/K9IVB03
         qnMiQGsAGkzqve2O8lxo48Ew8T9WFiyTw/XSJR+dueXJt9UzxqqFWyAoJ9Q1h4GUXuoc
         MiPFmQxIT8QDlcw4M5KWKvjOnj0qmx3QqERaIxUX5q9BpOnK1B0ztemarrWqokkRMXst
         CEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280459; x=1783885259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=JKsplqWKB4aMdexXOT1ICjSAfAn8vAssbLzh6TQWQMtM+jjt969srGPUT8XDdlxLP7
         xZSkfnEZRRTgGFt8CtNFEggDyu4HSn5oZltZll12HAEXA6D5vJO43cnArpuMHVtjlRIw
         LrCZj0SJz7QmoncbMJU7XhMWwZ4qja16c/MGnHV1hzs9HPgldhz8/tlyU45askivIM0D
         U+veOA2kc9LBkr7IYfQe0m6RIdXbYO44jTbK/L+HQZCQL4MFbe+dqeUKgBs4+k1kDLmL
         RX4LeSZfkjFO9yOdMjDQD35mf0mD22lTb24m1aASaySGaTsEu1PvLH053WHqy3KOn/3T
         cEpw==
X-Forwarded-Encrypted: i=1; AHgh+RpdSpZZuEa7Kfm86VewgCbGOKXl6int0QDCHCOzO6x9tJNSZ0aTmAfea47z626YGMY68lRsQPh8grdOnZ2y/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeDQkGu7dJc5SLNVYVO63mq2FIFmE+DBC4PgmNQHy6JqzdyOff
	IeGxCdTJEquRm5ZNuq5MeI+mjM1Q671scQOI+84UeL2iSoSbFZY89ta5gK6Oe4bsboTN0PV/4yw
	pNsJBxHF0wmXpptsYTYi6trM8Yit/C9HZEQfka8RkQsJwZtjMLmPg2hray9P034vA5+cXnHtIyk
	Y=
X-Gm-Gg: AfdE7cn55pYuYztWjKYgZQgIGA3GWVFoPFCirt4W4B9zH7hATc3vROARrY54YJG1aBf
	ntqHSJlMKxYjy0do/NpcbrxCS/T/GH3gsUCwkhvkn/4kia/GFEfBUyAQQmva7wZmpbynzieWJ7o
	evPys0uWp10isiddYsRB6GSF6cyLE1pNoMsijNVwx8scEKpEIDsf+4nqfybaV8TtPoAUbTltyLz
	faB1NDt0/rkiXCBgFQPvgq4Eyh/KJA4i+Hbw/0gUuzL6k9ZiwPORg/5nKggqyWPA6vU/nxnjm66
	jHPozDxYYR/STFUMx4HaYbrAfA4aVicC7kTuHztK5O76tBTGKuuuwsNAYGS6Rys/bridqWxwZrW
	YCCuR8f36l4N/Z5bspvbLmQ0rT9LiEYYuIJtKNw==
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369365ad.37.1783280458791;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369145ad.37.1783280458256;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 37/42] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:13 +0530
Message-ID: <20260705194019.2565498-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4ab34b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+3saHGBk9Sit
 11jxt8hagkkiaCNS4F5mYJOMzwE2sC/DY3rKiNsAbOjmGolcRq0hh94OS6YK/LolalLCpwHPuno
 PwONwnKCSX3TirRWNd/b1APLp4E/s1OvxVlRwo6x74hqT4wxoIyZdM/amRWXXRRZvaIMAkC/sab
 nsDTnAtuKKqjXhoyCeDbzuhgMd/8DLndB5HWt0W670CJ7xo8cApLTkn+k6ZCbSZHvJMQY8zTEU3
 jyH2S5JqlRKDfmtztdgYMSunzlym/audppafWSv5U5yq2g0rYfDWIJT55JDoXssjTQNNQ3xubJ1
 Fgr8NV6ou+CIELDCIFZU4Kl+k3ywtIG7S3BZMR5duMu29txcQ7CyMqlPax2zdCcyZQml+9tv1sB
 itDxMfcxuYx5LOtAV4NUwFki8UlWraTMHUZQvj6sGt1lKnLPkVi7uLeh1n6WvpUZPOfABnvnZt4
 AMXLloLevc5jqF1HIhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX2yiSmkOxfKP8
 wSmUjnMCifVV22v4SY8w4n08FwRR8y7U+kmlxw/jREgfQkM/r0mlfe1UyI/1zHQz33ombcKY5yz
 jnLSobyVKHBVN74oZiPF6X5NbBosBQ0=
X-Proofpoint-ORIG-GUID: Z4dG_F_i_Vbt1-49857aO-yppfRNagaW
X-Proofpoint-GUID: Z4dG_F_i_Vbt1-49857aO-yppfRNagaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124101_171713_BF74E8F8 
X-CRM114-Status: GOOD (  13.82  )
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
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.53.0


