Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E7DCDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 02:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GhD54Vd7XuHqS3xNEGfHS0Gv8FjFdg1pX/48Yp0FuCo=; b=lZIpsZv3hozbwJfqAvDfy6uEX8
	vH0M0e1oAa8Li9AnTap/F1I44a5VIknF0F9/WZCFlh5abTpLdfRgvk0JxLLy0Uw2imLmYUMXpJzWE
	u6n9OnjXtCkrMQ91TRl90wcEcxJgbpB0tH/V8srlO0bkF1p5r6z2d1fZyqToNhFJ4511zkUJq/FTK
	pCTcxvcRM00Ye9Xiq5K6XpBE0O2HsHCYC+SxIeidtmH6QAozz0mKlrbEuhUEaIkqvnTlGfpmsQxeT
	ueO4DyV7g3fEM3HUJJ/hraklkh2RyUxopS3argh8Cho3dx1QDpf3L2txq4WvJ8kyYmZ3aji0X2Zi6
	cakAqa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtIVn-00G6cY-1f;
	Thu, 19 Oct 2023 02:11:47 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtIVi-00G6bw-0R
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 02:11:45 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6c4b9e09521so4895501a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Oct 2023 19:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1697681500; x=1698286300; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhD54Vd7XuHqS3xNEGfHS0Gv8FjFdg1pX/48Yp0FuCo=;
        b=AAWd3Mn9qYrrAAS0UnGb9Nw7bWTqbszyR9UyO6xvJ0C0DfbTtKG6uQKWWDTJk1vU/F
         TzO/U6ouegCCVXEB6+my9KelO9653eyRJAE9FOuGigN1D/UDpuPTufdOoU2M0kK5s4lW
         GeQECGpZr1HSwMghU/sy9Uf0N21nMtBjTBhk+CvZVFSGBY/ewg1qhuMkzYEWfJtsEJwQ
         e48JlrlQ8cpd1/RsVoEYpd36UFl8UCOpf4HJRYdYdssJqG2MTwYCJMCVoSP+WJQrpVyp
         TpgRui3oPOb8djemoXoUcRkIaZPh4wouZ2gLtuz4HZEYSK7hl8tS2fmXf1k88oOIAbEH
         SPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697681500; x=1698286300;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhD54Vd7XuHqS3xNEGfHS0Gv8FjFdg1pX/48Yp0FuCo=;
        b=LgbNSVWfJ+jvkoPuegZ0QPbHyPyHoPkDJbm1dyrT8uNY18VugxxNVThKGWhESgrGDJ
         xQN3Lhk6B0VXzMh/KK79rr1hfCEGpqMCRBcZS0QFB8Y3BYpgSaXqc9xTTchTKY9oFOx9
         LKrL5qq1bT+BEz0CnhKQHWiAosLrIXFk9EVpg25zKd1cxXxWI9On+lF8QBL3KmeRJoMo
         0VaEKPOss94x9HowJ9sO6jf1z4AzsPXLAMGUPIHy5VDQENwI/V3PcLT9Zg9PlPaW74fg
         i0VdU/jZG4FNPPLVRhh4qOEgFmC9WIdcjgbn+U6ONsVni9zn0V/auZZPDCfTs5vy+RJ7
         fA+w==
X-Gm-Message-State: AOJu0YwvGU0cjbmdgIgxQM4gjsheR8dSPnJTjphAKx/OxvQQN5/LQJdj
	xP8AjIs6jFEP+PCQIi1NKhIzXA==
X-Google-Smtp-Source: AGHT+IEIarBiMYROPVstrKrgagZnrOD+TOR6snhDlbuRvSbmOoS4FE27KeDyxjkKOS9q//75x1lJig==
X-Received: by 2002:a05:6830:1e0d:b0:6b9:cba0:93a9 with SMTP id s13-20020a0568301e0d00b006b9cba093a9mr945172otr.31.1697681500175;
        Wed, 18 Oct 2023 19:11:40 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id d7-20020aa797a7000000b0068fadc9226dsm3974278pfq.33.2023.10.18.19.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:11:39 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 0/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support
Date: Thu, 19 Oct 2023 10:11:31 +0800
Message-Id: <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_191142_431853_A9FAC826 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
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

To use RT5650 as the codec and the amp, add a new
sound card named mt8186_rt5650.

xiazhengqiao (2):
  ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
  ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  1 +
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 45 ++++++++++++++++++-
 3 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.17.1


