Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4132C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=depBOPTI35g+YRPYwr/nPzsXd8X/T0z5pvtEG6j3p3s=; b=ZAh1ChoUdfS09K
	GBIN518Muq+TJG/A+VDUVK3uvPB9v3tQbFr1qthV2vKBT3/sZmKZhC3ApxpXEj8oZnvAn+7P8NFS6
	6iFPR77Q2U+kccqHADhkZl4SuOKS6gvZHmohC6ohlNfNzeAjCJ7BXucVYDmFqCnwk3hftRXv4feC6
	PVdtlShmDspOxKIGl5AMNYL2wXs221nkvP7LiHsetOz2dwi2pz9neBYhz5drr26TH0U+6M16bYv2J
	9WdO65uky6cUaJoUFamgSiNZ1FDAA8My4zfJSpja71GTGZIiC/81/J6BfomN+GYX4XyTxeXVlLopm
	HxFD764Nq7W1ULKgktww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFYx-000fyf-RI; Mon, 07 Mar 2022 15:46:19 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFYu-000fvv-Uk
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 15:46:18 +0000
Received: by mail-ed1-x52d.google.com with SMTP id f8so20502579edf.10
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 07:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O2robocWX/4eX3h0HkkMwskjpGu6tvHElNahbn7kKFw=;
 b=G9xK+pOQDnRlW9TPM9PfZSJ+HE03a8E0WnxkTNwtnH+cVBA4mObITDp5hePOIoBiHz
 HYtUXJ7pLhIiprdZUmnfyFeDFg9XE1B4vwemp1DbGxIsiBy1dCmVIJt29Cx3DY9+a8mJ
 /cJnrDju5fawzi4IbBHnHrL7LhiBTpm3TLeZ8cxuEsDy4SpKPrM6lC6mh2iKEaYuZLeB
 2kmyKFWpFtmrNBhF6IVYcmWMBZ4vHoJtkLu1OfpI9HVuaxkGBZxWIRAps2tQiL0GiFGf
 5xfhwIRGIPstbdmIMj8GVeaHkZSknqdypmELx3xdjPyZmE0TeEYanW4fWbFbpBuOjc/h
 Z8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O2robocWX/4eX3h0HkkMwskjpGu6tvHElNahbn7kKFw=;
 b=JD+/s6SPcCNZVfY9OyENxdkWwB45okeFEbsXCAtodMhTv0Ev06A03A/fjFkkjZwjzC
 HR2PZPl6I3iqy15Y5WwbH+ek4y6J/nxf0qeA2/V7vUX8uifau4t22zqhMVTyzQSgGORU
 aFAIjoWWK+PEUwky0EqAlZwciXdn7Md3+4gm2us8f5WsQtXKOASF2aI7zzGndfrIBjoZ
 J7xZV+jkyIuo7mhf/ayhVPV4Qv8SBAZsd8ll2J3JmrdJoPBsjK5jxai8fXpG/udE0jpW
 lg5LYrAvvl8rkTaLT/Sg8DABBqbvVPmIGiqQj8T7q9mLIDzCWRPFmDuCY7NVNkoR+M9D
 WeIw==
X-Gm-Message-State: AOAM533sQRt8hnUGZSmdf/uZCYRiRUQFajMcyx6zGo4iSzwLW/YlUJPq
 jfCXtpo58F1I2Io7fx0NgY6u7w==
X-Google-Smtp-Source: ABdhPJzIFSku8aVjJrO50LvyMLTMndzAvl2LadpIo5JOvunKayfQxPpk+9wCWH705xaBAJv5DVyZ6w==
X-Received: by 2002:aa7:c4cf:0:b0:416:e28:45b9 with SMTP id
 p15-20020aa7c4cf000000b004160e2845b9mr11805955edr.319.1646667974548; 
 Mon, 07 Mar 2022 07:46:14 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0041615cd434csm4210747edz.60.2022.03.07.07.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 07:46:13 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v1 0/2] Revert vendor property from anx7625 bindings
Date: Mon,  7 Mar 2022 16:45:56 +0100
Message-Id: <20220307154558.2505734-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_074616_999760_9F98B24F 
X-CRM114-Status: UNSURE (   7.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

An issue[1] related to how the V4L2_FWNODE_BUS_TYPE_PARALLEL flag is mis-used
was found in recent addition to the anx7625 driver.

In order to not introduce this issue into the ABI, let's revert the changes
to the anx7625 dt-binding related to this.

[1] https://lore.kernel.org/all/YiTruiCIkyxs3jTC@pendragon.ideasonboard.com/

Robert Foss (2):
  Revert "dt-bindings:drm/bridge:anx7625:add vendor define"
  Revert "arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI
    endpoint"

 .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  2 -
 2 files changed, 2 insertions(+), 65 deletions(-)

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
