Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00214C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nghk3fxsfft5bLKjR6qNTwc/77bFbrdVB/T8jga+IXE=; b=ts+1hQd3QNaXsFaG6SvQQYDtbg
	OEDBT47GBrwMTG3iQBNHfR89ixlp+XtI3burhWsZEcK1q+FUfkPqxGzqbNQ2z8t9oNm1rh9PcVw0M
	Srd/XxGFrlvtPYOXJKuzhSZGkqENj/48wYGC1mMRID9ZXoix2c77QwmSBp2bSxCWC1pZ3bDtPlXtt
	WutIRCRWnYg7D1WXCTU4EMOiBXMdfTFC2JcLh5E58S5QZgV7cKwtTslUqLDOKph0nwljJZQKTXDkx
	sbdNZZIv7Kwm4riBjCiaLH+vymfEbODvsBFqJnLXiTI/JDGtNicM5FXv1qpa/zpNfEhXvwTjboy7g
	aGly5JyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQoD-00H1Cn-0b;
	Wed, 29 Mar 2023 08:05:29 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQo8-00H1AF-0b;
	Wed, 29 Mar 2023 08:05:26 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-54601d90118so123441087b3.12;
        Wed, 29 Mar 2023 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680077121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nghk3fxsfft5bLKjR6qNTwc/77bFbrdVB/T8jga+IXE=;
        b=m/wB8IYx1klF5QHZlk3xM0LIUXYrS0g0/6SG2q5BTrkPUi98dq+nBRoCIgz9BDZhWq
         xEkPB0O7kO8Ki1ybClCLtpMw1e6m22u4NxTarJJnOMjLCTV2TCtb+yTH3TNDNTRNQC3n
         xsiIQ2BjHgR9zNPmQP/ac2LjzUZrJfaHThdJpSFGY5Q7hlaebD53Dz3pU1vl34AmEUwM
         jUuSb3rdgUR5Qubu5oPTpPrZYfVMya4VyOSZAMwRoYAXP+1teQZwPE2qPo3QDvFWaBVa
         T9uYWun5rPauglIrrnu2f1VA1POO+P3jZkroqeHXI5ynRPv6dcq9NDphCm2W7UHkJP9t
         CPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680077121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nghk3fxsfft5bLKjR6qNTwc/77bFbrdVB/T8jga+IXE=;
        b=IxI37gcyYK9d2OXtMhkfUh8bd4FnXgIkG62/Nzz2GxNTZuUcIhL+VJ02Qau/wcADK0
         J/4HQ3DKxge/bHBN0mLGOaCDdEiEF7eLzsxdF6LKGKIHyufecYnpoeiU2g0oWYMncBGc
         z55RADPEW4lXHak9OSjWKrbPYH8C6gYT868CRfNOI8BH9ScNEQwyySpq709U/xzOIe42
         sSd+dvJQPK/3pWSQK13vcZL4k1eWlvpIAo1mGDG01LJRZOvmV2RvXK2+nW2A/H9PDH55
         kXlJezcFF9C8PMPNPER4VQH7J9ftOK/9mVD0WiUx+Jyco1NJOWQfECMhz3Fk5l0VmHyC
         hOmA==
X-Gm-Message-State: AAQBX9diO9NeDdiVMLbggImAre1vJUYR294+xUBYJGUPM8Zckdb0HRCl
	2sdVNYG/BPLyFiWVa+ZVBIQ=
X-Google-Smtp-Source: AKy350YEliHm+7GMl+5Gc1UlsBXS9j6nsNRg2RMOr6mxYA6BZNv4Om7iZdbKk23o6a4iQJk3E/3syg==
X-Received: by 2002:a0d:d402:0:b0:544:d3f3:30cf with SMTP id w2-20020a0dd402000000b00544d3f330cfmr20814654ywd.49.1680077121002;
        Wed, 29 Mar 2023 01:05:21 -0700 (PDT)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk. [143.89.191.119])
        by smtp.gmail.com with ESMTPSA id 199-20020a8119d0000000b005460251b0d9sm988965ywz.82.2023.03.29.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:05:20 -0700 (PDT)
From: Wei Chen <harperchen1110@gmail.com>
To: tiffany.lin@mediatek.com
Cc: andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wei Chen <harperchen1110@gmail.com>
Subject: [PATCH v2] media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup
Date: Wed, 29 Mar 2023 08:05:13 +0000
Message-Id: <20230329080513.1127982-1-harperchen1110@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_010524_251386_BB43304D 
X-CRM114-Status: GOOD (  11.94  )
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

variable *nplanes is provided by user via system call argument. The
possible value of q_data->fmt->num_planes is 1-3, while the value
of *nplanes can be 1-8. The array access by index i can cause array
out-of-bounds.

Fix this bug by checking *nplanes against the array size.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
---
Changes in v2:
 - Add explicit braces to avoid ambiguous else

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 641f533c417f..173407664cf4 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -753,6 +753,13 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	}
 
 	if (*nplanes) {
+		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+			if (*nplanes != q_data->fmt->num_planes)
+				return -EINVAL;
+		} else {
+			if (*nplanes != 1)
+				return -EINVAL;
+		}
 		for (i = 0; i < *nplanes; i++) {
 			if (sizes[i] < q_data->sizeimage[i])
 				return -EINVAL;
-- 
2.25.1


