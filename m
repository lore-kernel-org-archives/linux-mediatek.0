Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD44EE748FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 01:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qy1p7dz4KTgtjDJxH7zF/s/gw1hKlABNOIK2uPdIh+s=; b=lL+/kzKVPZ8l9d
	HmfokUvNyBrqBCzXga876u2USMJEmYtTeqaDpgcIwBd4sQFt0YtgVq8qCX84Mw1naA6dWNyBkPBOx
	DLF6rI70fobQA+5AayL3NCCglsWHmJ4wzp59DLhkTzb7XDFRkRf1eBbyKoox7ceEC88krJI1L6v6C
	as+vuFqHyW5vHh2DOxHneKodp1hYJ+5gAuHochNxMaRtQ2vHJZhlhJUA72A6wnCqNablaSGIpEfVO
	348fCW+Ds+njerXB1BHn3tcIFA/tK1bx3V1Qc54/1LrMRTIJPRab3DMFaLG9ZOs0QxqUj8kE5d5Gs
	LczhpQzaRZq6xW9CiElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDHn-0000000GEnS-3ATG;
	Wed, 24 Dec 2025 01:03:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDHk-0000000GEmM-37L0
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 01:03:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXmba1206755
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qy1p7dz4KTgtjDJxH7zF/s
	/gw1hKlABNOIK2uPdIh+s=; b=Qy1JAWIw5RxuLOv5JvoPQDQ3fp2u1Bt3JcmncW
	eKmUgS6Ym8+vieeKqVJzLTpZZSTHiDCrqEvyKQDTe1lZ6YKVl7Im6YwwtdaUHVuI
	vm5KPTtIZT9tBcv9JEaiAtWz37t7lchbtbti2t6D+xYTMPA6v/6W4QAKUHXQMuG8
	7NUFdw/gT45rzolt2V9zL7KnSFGWM7MwjyvYjLh/xseR1yTYTCCLhrPY2Re961RN
	+2DeqPhnzjcP6Mako0ao8Db3AJO5qxu9UsjuM1ICh7xNMIJHbRtAek5E43CbeYnY
	YpcwpAXRwKi5kKtEG2XRunwQSnQXi3OEnVOXNFWJnTmXyMPw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0gnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:03:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso144835686d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538206; x=1767143006; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qy1p7dz4KTgtjDJxH7zF/s/gw1hKlABNOIK2uPdIh+s=;
        b=OGoMFh47YMyXNuNZmWWS31ncSoScY8XS9Kqx6TqDxEa7Lb3txvrNRAaVToj/85ThB9
         P3ky2Ezj4pWRVpBE/G95WDxR+JzSn6vfrwx+Opavtw5vydrfmxB6aAIXq+mg6BlwEaJ5
         VjTqgjplZ44GyIKWG0CKsmeNtdkWbWdUDwrIyjvvoCv+BPct2yF/WjjjAqK4ciGWlP0c
         oZffLUP1RR2gurOC8+7DtfVtA+hJSZbeMmd2hTPTJCA0mr7VtNP4gdd9fszMuC1kzN+K
         /kJ/Y2PcVRlSIyLNHxe4Ymn5ezAI+x5paYRP/7DfGYsTk7vOAAqRua5Kbn536C4LBrKm
         BYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538206; x=1767143006;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy1p7dz4KTgtjDJxH7zF/s/gw1hKlABNOIK2uPdIh+s=;
        b=lUf4BZjZMht3wj1PjFRSmLntwdCQAz4cCLM8SYyZnZrShE+/0tM8UrB0HVgs3Fja6G
         Ml6IIKWgxtMzDSuFo4alIIJtI6oI8fRlwQqeoRY2yFxWV2VV0gVoWaIvRG1hHsHM4k4B
         98k18qFvKN21Y4QgQTjsEGzt0tHWpYNZ9J2j1N0g0OS2gnZjbwUDZReQM84bQrN8y2G8
         z5p1AX85j01EghULmHsJPwSHFiM5h1xBe1RVmVTYRK6AOsrSXM6HInInr2LvGFDQYvMk
         Ssqn/oaGwcm0a5dWWtCYUziPMst+OtE77OBWsTFvqK73aEOtq6tPgVJ4/3ea/xsl7++8
         gTZw==
X-Forwarded-Encrypted: i=1; AJvYcCWaBqAmzgaNpE6LQwoEmH4WLKxVj71XFi0re4GblCEQ833qAEIii1oH/DvCcAzWdeG75WUiRvcssnBp1lFQYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLqV4+h6GToSm1NLCNQ71YvRZW+xy2z8Y+Qf0c26cAMvH1UCyA
	+j04vxAjjhEPNATOVN0hRKJ8wuqYnGyiwVj1WQRLdVDAYwVLfCHgkgVIXdPCk6Lpji10cthobYh
	AoTZBXipIGdUUHZkwwujaR1IYDp/1tMDhrutv3Hfo5CfpZ8yGUXVBeRS+Z8ZUvANvO2oZMWkzKZ
	A=
X-Gm-Gg: AY/fxX4Uh8iHMMMR0Uu+4Aa3pELzAsNM5dHoDIp6C3Jm3Pq7zzrBRrPBrKplTX8fvF3
	oU4sg5N5peCBLbDQsPqCBmXufGu+nPGTQNNU0dT97U91D1w3VVSdR5TpcHFXJOhndYzTay3UsUD
	c9VgKGdSPZDeEGOk3BSRRFXY1Fuh9zkUYsiOsZwKS8+aAsaZQRnsxQWIDAGFVU2dJwChUwBKUyW
	t2mLuppSM6vvFV5YKlSPZLl24BO8VuBcAY07tJIATnZKRP3NUw5v7lHQFGciY61UGX9KjzeLC7O
	lYthvxAEBx/Uexk6lL8h54Td+GwtfGIud3qq9U4ZG60vUoZMJSuWKUjgNeUadLphD0DAx438ZlL
	QNL2fiWmP3IFaKrrKeTR2ecF2EtYhma4czscCrny9Fj4j+yvzV+5Y2QcF6vK1CZ/06W7x3cOlh2
	J4V3jgNMu8h6BmsQMN4KaCihs=
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id 6a1803df08f44-88d833b5f7bmr300845836d6.35.1766538206502;
        Tue, 23 Dec 2025 17:03:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpimNXfH3oYorddWUqgTrbXV1EPp13vtXQqLBq5K7iNXJf5pz619uZUKkotZ/5noUnChRCWA==
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id 6a1803df08f44-88d833b5f7bmr300844926d6.35.1766538205726;
        Tue, 23 Dec 2025 17:03:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/10] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Wed, 24 Dec 2025 03:02:49 +0200
Message-Id: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALk7S2kC/33NwQ6DIAyA4VcxnIcBFJWd9h7LDqhlNhHZwJEtx
 ncfetrB7NLkb9KvCwngEQI5ZwvxEDGgm1IUp4x0g57uQLFPTQQTkilR0xEtzhQn44zXFgIVtGp
 VAVIpqJUm6fDhweB7R6+31AOG2fnP/iPybfuXi5wyWqlact72TLL24kLIny89ds7aPA2yqVH8S
 s2hJDbJNEaanpWClwfSuq5fUggn7AUBAAA=
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3625;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Tzjobm822RrqnHK47PTxRb1kubRyL6ECDVZddDDmG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvXIbwsPmKZGaTML8UxKouye9UbF18LUF9dB
 OPRCcT9gdmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs71wAKCRCLPIo+Aiko
 1TjRB/46NUvByKDGyDwWo/bdFXCvMaCYCrhtMnS2CnzdVUkBWOQJlGAUXoB3wgO8QCfRpICSP2W
 INpd5UxrZkAO42oYeNdfDx9bRfJlcwUtxLc7db6mthobHJmKl+I5N0AfogED8Hvx74hjRSCWqMq
 0grAUH6HRdRV8dnY514V1FOVRkeFgLB3TZG9iUGZb1sBJL0psbTYtrX5Bm08kmyA233ESSy+Yx/
 5TfM2F5sL/SA+jPiyyJQvV2vEMXoBYQGoTe6Lf+FK4s6VRPPxlEqKzNwHl7dibcDXxpHkQxTISf
 uj/97ZaUsT+ooSkpOia7cPAXHcz4hjmR1XSw4mh/qatb3yss
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _w2ow6ymgbHuPX9GV6mclc-dpRvOdfbk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXyO6NOs5QNFQo
 icW7EEvDZ6o9rezjNCzyLJPEEMMyaJZRO4CPtNI0vWa7WiJN78skt9d5P1L5HOcdNv/iq11P5qk
 WdjnoRYm4mSfs2Q045v8l2FBcOVB+AYCBPDyS+U+QN+44yIXsY6T9OkH2uaZPWmAd/fZ/C4wHok
 FPUQiKYn80iYdp8S1Q6LmXm2IQj125+yl2JeKwEeDd3MzCs7WYhgusKXdr3ZGX0H4BX1BVOuccp
 Iv0CYkkabwvaqW7pVO2Q11VMFSV+x8uETDsOJAmsoXMHpAvdt27CER4Z1qPQxIaX8eL3G07paZ4
 JedWOPWSiXjrDDEBYf/Nu7miazEoAbeomuZXxTMwNj7x165yG9mllYMSzZTs0NFQHp8rWz/6qak
 YG2pOJFzVZnnR9GwwhyEplWj0MBRwH8LPOrdD+LJHUMGPmZc1CrqyxDGchsRwRSBnWFRFI92Ot2
 41GsHtn7HZ2NNy6sYtw==
X-Proofpoint-GUID: _w2ow6ymgbHuPX9GV6mclc-dpRvOdfbk
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3bdf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cAKecciHRQCNmb6kppMA:9 a=QEXdDO2ut3YA:10
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
X-CRM114-CacheID: sfid-20251223_170328_933476_2680C40F 
X-CRM114-Status: GOOD (  15.69  )
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

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- split function interfaces, having a pair of callbacks per each
  InfoFrame type.
- write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
  for unsupported InfoFrames.
- don't create and enable unsupported InfoFrames.
- limit debugfs to provide supported InfoFrames only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Added DRM KUnit tests verifying InfoFrames behaviour (Maxime)
- Reworked the patchset, having per-infoframe callbacks rather than
  extra flags (Maxime)
- Link to v2: https://lore.kernel.org/r/20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com

Changes in v2:
- Fixed build issue in common code
- Fixed comments regarding HDR / audio frames (Diedrik)
- In adv7511 actually check for the HDR frame (the comment was correct)
  rather than the audio infoframe (c&p error).
- Link to v1: https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com

---
Dmitry Baryshkov (10):
      drm/tests: hdmi: check the infoframes behaviour
      drm/vc4: hdmi: implement clear_infoframe
      drm/sun4i: hdmi_enc: implement clear_infoframe stub
      drm/connector: make clear_infoframe callback mandatory for HDMI connectors
      drm/bridge: refactor HDMI InfoFrame callbacks
      drm/display: hdmi_state_helper: split InfoFrame functions per type
      drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
      drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
      drm/display: bridge_connector: dynamically generate HDMI callbacks
      drm/debug: don't register files for unsupported HDMI InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 180 ++++---
 drivers/gpu/drm/bridge/ite-it6263.c                |  95 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 143 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 110 +++--
 drivers/gpu/drm/display/drm_bridge_connector.c     | 190 +++++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  94 ++--
 drivers/gpu/drm/drm_connector.c                    |   6 +
 drivers/gpu/drm/drm_debugfs.c                      |   7 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 110 +++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 195 ++++----
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  47 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  47 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  42 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_connector_test.c         |  19 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 525 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 105 ++++-
 include/drm/drm_bridge.h                           | 127 ++++-
 include/drm/drm_connector.h                        | 105 +++--
 21 files changed, 1762 insertions(+), 515 deletions(-)
---
base-commit: e05b08d7d0162cf77fff119367fb1a2d5ab3e669
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry


