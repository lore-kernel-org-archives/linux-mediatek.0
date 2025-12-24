Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF711E6FE51
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 01:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=ImusCTebDduCbrAQ7wi36NwaPW
	5jtCzyvbvWuFtma7b0Jjv90JHfFulP8DHYuhK3Lgkiko7oA1HEKQhfH0aIR8rLmtOTk5IE2NEgwUp
	2vJPz8vIfTGSWo3I5wdwkajItS8eRtOsB+s/NhuIVNtCBY0Kb5gFZFQANwFxoEanlebxg4VeqbE65
	KtmSzdLOGd94JI6AXWtuvkPNYw4MpAPTIhj9tAzJaa9MJBHwjvKoQgz53hvEF80pCGqt+9QKDqX4Z
	irv448jAmUD7BN+CaczReWQtlq/sHF7iMIOLyqvHIqVArLktk+EdZQBymbv5+UeUjLQTAKv8fuY2S
	L5cebSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIN-0000000GFSX-3DJR;
	Wed, 24 Dec 2025 01:04:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIL-0000000GFO9-1Tj3
	for linux-mediatek@bombadil.infradead.org;
	Wed, 24 Dec 2025 01:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=c38WYY76FsyggE9ASnaCh6FhXL
	LxdwkgYWHBPzzE0AGH2YUJSUH9ZZlPJN8L9VX+zACCdU8KlBwzcnp23mEhgJW0xpBcE7/mYZLucyI
	ITaXYy0ywgTK+snL/jHKvReGFjHjl1JazSWo6EWmb2lEkyx49O6+uQyt0ZX4i30K9H6lqsQPQ8PpK
	nfSrXSuxVitqKuzttACPbdWMbNaqAOk1l7TT6ffY8X3xGFfuCbJwfpTdbRiMIJ75ugfh3le4gLvIT
	oyeykahScLG0ANkY/ZfOI1yszWRUE2RZDBrC9Y+vZRE2MIaxUOBHV/s2GUZVfq88TU7t7KrW++Dl0
	ily19CuA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYCQr-000000002D5-1fTT
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 00:08:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXnqd1206932
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=XfH2Ljc+dZzYTrzi
	pD5ysYGQfEwkhPa6D1pi8C2qbcfBhGuJdEE5Tm7axPuo9cDSGursj22LOxEqHeP5
	R9uBpaJ+4/sOsdjt2aULzxdHjQc0CHLodncP7N+ebgW+QzIgym8Fu/RIkEVIq0Jj
	jRDxvdSZXrLN5ge3caHHbALSV00mhM5U92CRhkAtigwUmz2f0w29lkiq9FqPE05j
	iEFxVpGxxc9A96yD8kdKzBFG2/urw5k637d0CrkxbijK0WRFw1tIvf767zHurFAJ
	1U1WFXX9uBnoE3GI5zyeTch4vmOF0P//3srIopPnVaZrtxW8W5okZ4R2ipkZ+bcV
	//Fs7g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0grh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:03:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a34f64f5eso171461826d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538236; x=1767143036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=co1RvDi23lrzQNH79a/w1YmmBQ8MeIUVX/eVMHGZzmAjwoPNIueWj6eSo/eUh381e/
         ewJSGPwteaPUtSwYXiC18ONktkMvD2drVAWbIs7wH9CPKEl69dSe4Akcgkxu3PUxhi3w
         wo4pIRZUaXPgInuUNrun+6QoQoBTP4Tc2pJj3VBSrsN5z7f3kFKIvTWRkHWK8conPR94
         AZPBl5cYrHrQxfjn4ZF01+XIj0yfREv2E4tie+p8dem10t0h6isDwH0XtCJJZhNMtm4Y
         mGyes+JRfwVf+HLg+w1BuqwmlNwwoik8UWRUxJxGfMrPTHYuxEhbvw0qxuoj6kJg3rp1
         DNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538236; x=1767143036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=allNkryt1rsgdVtwifhIckswLUOyGF4LJbL6XEww8Lj4wanbaRQ2USCyr0Zz4OJ3ue
         g9Ey8GA6zfbZWTyNtq+h6hh585IuHmOB6X1ckQArn5GbwtXYxUvr+sIc6xeZPAwYO+Cq
         loTCHhte5SxrlcbpnpTBY7XfkXTLttrMfI/OJ3K3wkuGUDd226y2uLgYD68bw3iUNE/B
         moP/f012jCvr3Qf/TQFrb9Gn7M6paUNi+GiTj9M/YHy8vqfuGSn4f4LmDsGNJ9pzCxef
         3hBXpkPcyWTXfVqNaC4HW9G/ZiK6UDjZble7aG3ilCb6xoJ1QouLHZ4i1c0kNPvdxdHn
         8jAw==
X-Forwarded-Encrypted: i=1; AJvYcCXnY/xF0n8pEY5KQOtmRenXzxQsuM6HpdULMfZCa+cPVv698FagXoNBdSmxozsPA441YOJ6raCYK+/A9uaoYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuT6cb+BgXxxlL5/cKuTrXeyi2d9trlKq5lbnou1jY61RWhmyv
	5QyfQTJM6cl+/dP0zp5M4/fs/ZuyygSNAKuP+nX54X2Q72yb0yGv7VA7WIdlmGk5AvGyszK9qEA
	N60oFKDIq2urX1CIPwhm85nyT8WmxqvPcrzNbfo1PpG7EGIBnsaS14c+fu4c2WCZQtKoIGxWH2u
	U=
X-Gm-Gg: AY/fxX7O+quKkBt9v+fmz1dSAuOGiK0Vpjee4aSCXD9LLpxu6TrznTfXSydu+L2Rvah
	AiB7D4/rn8w58VTVrbIsyT/vdevI/MFQ6r8pATsteFpGXt1G8A6Hj7GN+cnnKetPXJlHbpn/s5q
	EHj7m5laihlvu/FgqTjT+FNXeTvI516XDzaSBKDJewcr5fUf3RHHzWmlg+3qjMSN4NtHTqdp04e
	B3+sRNTbK0/UaHJLLeeI6SPwyiTB9ZOGhnDmc+zsM8hJS5AQEdMeBgLCxzQonJtPbD4nBCwSkVX
	YwyhLX2B2H5P89Y2tMKfW7WT4b1ZsNSliBl/OB3XIVsuC2cluXxd0Xyz2Na5zt3wZNhX9wUUQKy
	Hzox2KIdZB+Q8hQ1wlXt+f54omj2APjBqjkPCjVNXxBZvq/drAWgST8s719WFyz2UiFR+LzD/hx
	g0idv8LTT5IqvGb80XplYBBrg=
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id 6a1803df08f44-88d83c64e72mr214392566d6.25.1766538235596;
        Tue, 23 Dec 2025 17:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaK542l9xmzYYsxqdNmih3a3J+cADi7DGuEWQ94lgYPMK9IxHSj3e3msfodcDCfxK5YjzPVA==
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id 6a1803df08f44-88d83c64e72mr214392216d6.25.1766538235179;
        Tue, 23 Dec 2025 17:03:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:56 +0200
Subject: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZGVPsohAMKCXOdz12kIPkrJMlkOnHo6hb3
 HWobYyhg7WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1QKNCACqcQqgJBRBcg7CRb0dfX/GGsMyAFAip0dgaqJtDLf7ApFonc0Vo0fA+NhcV5j0Nx8Ti9U
 I3ZV4TYzf23eOcnZCdm7rXhqmyxWKpftkt+8hIkJizIcSP+w7WDLeC2a6QEPQiGVuMei4kWHGnm
 o85bmygfh11FQZkX2pCCQNJlyfTByGtP4Y8JpLUrRBIvBMTYNUGhePLY9wL2DAFLPPW6ccgE1wi
 X82GoCEVaLpslRdu4Y6qY0DXtzUr9H7AOhKf8Hucv3GM83Xm/DL5TfDXh/a3uK8yiLTMpc8RB1r
 OJlOJIJ4Pu0i+HpaBnRzjUWikC+VvVcYf/m/QP/ndRhcoX39
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Av1kvdo4fU4DRzwV8HmXASu7adQ4Jk3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX2hs9oOBGtHFs
 HacPX9M3FG+Y42TM9Hon7pI7I9xwGmFw7DBmpfBdWxSuwicBbMzQiqMfAxoXGnPs9v6Shdl0sRE
 QjLNraCwBrUxQmzXn9rfTVYh13qzJTYzTDWq4iHN/WiclG1V4hZlVAw6YElVGvuO/4XcQRZZYc/
 VXFsEVl1U0sJF21ez5PbamNPmtSxXL3+gCXs4BePpGW5WWjcpzhYokFbIfHZsujlk57HlDjw+SO
 VeThkp2Bia1ngToHPnJ39Vq0vy64CbTq4w+PRD24INnN3yHr9dhRTSaU/XDYcqDjcvx7tRDuMfx
 F1zf7UuKEuKQHtq7bbf0hkK1besk6oiUVG7T2QzzD9OeGHAnOwHZNUcHy5wybrT5SEv6PgkYn7g
 CJrI3h+c6PlvI3XQTuEoSRy4R+FI4xmm3+1nJKvrwecxaBMbbUHYIr/QIowGaJ3ooaPQ7Qoj51F
 fpQw3rSXxrkB47XUf1Q==
X-Proofpoint-GUID: Av1kvdo4fU4DRzwV8HmXASu7adQ4Jk3Z
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3bfc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_000849_754695_9BC689AD 
X-CRM114-Status: GOOD (  15.17  )
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

Updating the InfoFrame if it can not be sent over the wire makes no
sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
an error if Audio InfoFrame callbacks are not implemented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 5a3817271d91..e8556bf9e1da 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1061,7 +1061,7 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}
@@ -1102,7 +1102,7 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}

-- 
2.47.3


