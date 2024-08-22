Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF33C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 06:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8PKT7sjGktvi1hrrMiQcV4qsyDxjdMEYuTJhST1ej0Q=; b=icz0HoXuP1261D03ZvwOdyRqY+
	zjtSfuDZCNKyU4Yw6b5JQX/JSGjOYvNaQDYG17KWq+T6jmODIlzT5D/OgY00+VQ7CO151TpNt1sNT
	ATv4Ms1UOMBau8NcUmK6Y7cj7cuR9DtmbdErf6iehYCKaF7a1LgB167qXegNaEPBbrZOSegomxalt
	HwjvyFKJ9WjBcxbVbzy4tejt+lnBmfpMF+qTFzlaTDQtp3b+AnNqwUKPNuFho+x8d5wkl7gjVQIuN
	+7UhBYN9OMKter9PocvBcL4hYehmCw7RjetCrgN97jH9wGG3CbxKTE923tOK6FkRmUNqFghnShJDH
	OKOLZrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1b5-0000000Bg2k-0pYj;
	Thu, 22 Aug 2024 06:47:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh1b2-0000000Bg1v-191n
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 06:47:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20227ba378eso4109315ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 23:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724309219; x=1724914019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PKT7sjGktvi1hrrMiQcV4qsyDxjdMEYuTJhST1ej0Q=;
        b=leVEMUeZm2M+hs3UYz75URMRiH7MIfZ4huZbuKRxPeNtejUDmGTqkpwX2O7l9bhZFJ
         hxcf9UyjvG50RAE37TivNG+wtDsxLV7VIWaxUAhYYAQhnBf8V/upiGwmzicDD4mfiiGU
         wutIoGmLH+a+HUGGoA8lsM3wmnNWtQ3csVrj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724309219; x=1724914019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PKT7sjGktvi1hrrMiQcV4qsyDxjdMEYuTJhST1ej0Q=;
        b=mhK7MuSbf+bf0nRpAxq3Idv99FS+m9kPRe+76SXkZJXgTFhxAjg3oDnuZZ+7LHxHU9
         TnZ6toss3J+jbiXSbNVLBFE0jdh+1b/UEnh6MwwxC7As9LDQQ+ERRz/qqVvVRGuDZ+Z5
         G2u8j9aGAsTnZvBz8u9bJ+HBEfm5zRPcmjs/QhFh4SsOq/N0TUT7TvU0fvJ/wcZTRTEv
         iFC5LwSeQJVfHXSHGUGOqJ1ICdAZG6kFQYq+KJHqWLQfemENbSnE9wPN6Aab0o8zGnBz
         ulUN2ccQkDciNVt2K3r2ypnrFZBevBg4JddDrANgx55lUIlZx9XNHvNyB+SoE3QV2QHN
         XD6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmNnLE1VKiFvEwJv7mj++Mmr1ak7lgJ56aLV+UlxMcDZDuh3anNdyMk4PBzmFuckWcLhsWrgB1nQJkwwxIsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdrDkfT+k/WnPc9mFuSTXRnTG6j5NYHlwovqGkPstc9jVCHFt6
	HCd4LHRD3EMR3t3RF+L57B+YiUwcRpf0kR2ActLom2SA/Vxz9EhvgMaPsi811A==
X-Google-Smtp-Source: AGHT+IF05n9K3CL+M63P08MGc6+22/ERQOuhVD94PT0FR2/G0i0HFMNVwflN0PwwvODsfTnybf75Vw==
X-Received: by 2002:a17:902:c94e:b0:202:1547:66ad with SMTP id d9443c01a7336-20388e34ce7mr10308775ad.65.1724309219112;
        Wed, 21 Aug 2024 23:46:59 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2038558137csm6046845ad.99.2024.08.21.23.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 23:46:58 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v3 0/3] Devicetree updates for MT8186
Date: Thu, 22 Aug 2024 06:46:47 +0000
Message-ID: <20240822064650.1473930-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_234700_330782_756AF2F7 
X-CRM114-Status: UNSURE (   8.56  )
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

Hi,

Changes in v3:
 - Update some formatting errors in the bindings patch.

Changes in v2:
 - Update the binding to include power domain in only some
   specific variants.

This series updates the DPI node to add power domain and
adds the Mediatek SVS node as well to MT8186.

Thanks,
Rohit.

Rohit Agarwal (3):
  dt-bindings: display: mediatek: dpi: Add power domains
  arm64: dts: mediatek: mt8186: Add power domain for DPI
  arm64: dts: mediatek: mt8186: Add svs node

 .../display/mediatek/mediatek,dpi.yaml        | 17 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 21 +++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.46.0.295.g3b9ea8a38a-goog


