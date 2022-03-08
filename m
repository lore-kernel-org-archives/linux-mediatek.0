Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA56C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3IJ8mPayCxSdUCE1VMGMO8XNOe/xoFFlnYyRliz2f8=; b=NjUtgQadSQ05T8
	pcEuW9t+pMfmvK60IQg8puU/X92o/IGyaeGvoz2/I1WB9wXwy1LvTNz2Zy0B13IudeFJs7L3gJN8G
	mangk99w2NyOsCiHrUw5Gmc4NxkypNcQNZwgj6+IBriH0f70lBuuAKwrp2ys4RHXnARMvMaGCH/kx
	EwzgHGB5OJsn3x/iGMLiZ8MeZsOeiDeaBznm0+P7EMktNRxUuWSJTC6Go0qbulxUECt4Dbw2shX5n
	Qw1S94KA23qqILgxjbouG+IV0i3G/Apwl0AvpTe8qCGAGC03T6lF4eZg29NJUZligE+AKMydPtHe8
	DPehyT6YAl7FjzlJf2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWd4-003fyW-Gq; Tue, 08 Mar 2022 09:59:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWSy-003c9H-Ao
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 09:49:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id p9so27518598wra.12
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 01:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02UDf1pdb0U70hOLizwodglM9/0MIkQTrFbx130jmiE=;
 b=TjZphH9hgyELIqRwTi2WvGdoGj1J9+ko37q3Dy+QljjxZrcmoDk6pGD+9BkVeoWGl1
 c9cQYim68QjDDKBJC75LgOBARQdj4uHxDI5dHKKBf7O/my4JRPQbITljSvXVICz+kIzQ
 uzMuCIEvQpgxiO7KMGkHAA9CI20uLtfq+mC2kUGMuJymhFoQsgvBfeH8Dh37Ijctf9/1
 j9s1H20UTvvd4CNKc+lJbQwbO0zPanfu1nuz0cHXv/0abJA/1RsruwvnID4aMwSvIGmN
 GPY9CCl/Vys09GOCr4GHKBC8J9A02W7kZrjPxLAvuU0LUvaGFMMvdelTSF37S0lPxzqf
 ddAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02UDf1pdb0U70hOLizwodglM9/0MIkQTrFbx130jmiE=;
 b=D4UFt2yRpmJJA/PNCd+88UyFj7DQ7bCrWVKjgVHQnywczfK5n/U2JC9xeK6tuNG38k
 djJ/r6h0gj+9IGDUJkefK0faikYJ6QL4OOUpY/xykTnLeXRxHws1BuLB3HX5SXbjNT2f
 T7TUf2nrZSkwzy6JJTML227CJGZUe1XJX/tATBEOMS/+VW7QrPqNGwvepHIM3/MFj2n1
 Z5SxaiTfgDR1TyXhBq7dBJtq16o61NsS9eVm5pnM1SzeZjLOr8JOI7Mc5DYKFbeOxxp/
 4nDZr+Xr0Mm9rTNb9COeEL4x9g967hsOV9lyPOKhN/7m5JfubbpuiRIRCGnC9cyRwxNz
 qsig==
X-Gm-Message-State: AOAM531JfS4TClK1PUV2VwtTe7j67XuA1uKAvoWfW8yVPGbIJhsc+1kh
 9di8rufTdzTIz7Y+oAFquxb2/w==
X-Google-Smtp-Source: ABdhPJwJl4t5Tn7r80HbhzAHKE1pKs8GUwcFZWPV2LvK0bS7AXZojL7riB/OQzKcrK/Px9dayrwCYg==
X-Received: by 2002:adf:fa46:0:b0:1f1:d99a:4b1 with SMTP id
 y6-20020adffa46000000b001f1d99a04b1mr11663745wrr.516.1646732954621; 
 Tue, 08 Mar 2022 01:49:14 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm1684885wma.21.2022.03.08.01.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:49:14 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org,
 laurent.pinchart@ideasonboard.com, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, arnd@arndb.de
Subject: [PATCH v2 0/2] Revert vendor property from anx7625 bindings
Date: Tue,  8 Mar 2022 10:49:09 +0100
Message-Id: <20220308094911.2680291-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_014916_401300_76780947 
X-CRM114-Status: GOOD (  10.68  )
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

As used currently CPI (camera parallel interface) and DPI
(display parallel interface) would share the
V4L2_FWNODE_BUS_TYPE_PARALLEL enum. I think that would be perfectly
functional, but it is not what V4L2_FWNODE_BUS_TYPE_PARALLEL is
documented to represent. As far as I can see it's only intended to
represent CPI.

Instead of having V4L2_FWNODE_BUS_TYPE_PARALLEL represent two
standards, I think they should be split. And possibly
V4L2_FWNODE_BUS_TYPE_PARALLEL should be renamed for CPI, but that is a
separate story. This would provide for the neatest and most legible
solution. If this solution is implemented, this range would be
incorrect. Additionally the snippet reverted in 2/2 of this series
would no longer be valid.

As it stands V4L2_FWNODE_BUS_TYPE_PARALLEL was used to represent DPI
due to not being caught in the review process.

In order to not introduce this issue into the ABI, let's revert the changes
to the anx7625 dt-binding related to this.

[1] https://lore.kernel.org/all/YiTruiCIkyxs3jTC@pendragon.ideasonboard.com/

Robert Foss (2):
  dt-bindings: drm/bridge: anx7625: Revert DPI support
  Revert "arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI
    endpoint"

 .../display/bridge/analogix,anx7625.yaml      | 19 +------------------
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  2 --
 2 files changed, 1 insertion(+), 20 deletions(-)

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
