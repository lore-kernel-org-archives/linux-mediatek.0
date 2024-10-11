Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1923D0EE27
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EYgQWgt/qKmfdHG9VXiGCkrR3Ne5T90ztqEtcBQu9CI=; b=0QTPiiFckl0sT8
	wedRqwtElUv3lQzIzk/UNLDCq/FFERZ8zukttbTSr2hsgXpHi2oyVrRHCrxE3NXjPFr3uoA9HmpBu
	oMfPOV9/2YSCrqSwNI+yixp4EIPOL3mT18aYGE0j06CGgXzWtGybOenSgaOxo9LNYuKWiApinf2sq
	M87i1ARLiOmpsM2E18z5lIjVr5ItPyxLhYcw0b2r9hyhjPrxypXgvBoKK5dbg1ZPlLymi6bXQ+mDv
	oUHeRVJXRYrd174zmDNOwXfJrM+B4zYoUWgDWj1DiZpRkTQOHETkXAJfia0/CrcMgMcuG5fNoIhJf
	S2iMCAUDvFRTvI028fTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szLDW-0000000HOyo-2xyZ;
	Fri, 11 Oct 2024 19:22:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szLDU-0000000HOxt-2lwW;
	Fri, 11 Oct 2024 19:22:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4311ae6426aso12986235e9.2;
        Fri, 11 Oct 2024 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728674543; x=1729279343; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYgQWgt/qKmfdHG9VXiGCkrR3Ne5T90ztqEtcBQu9CI=;
        b=nHRmAW1lI6bCqu39YyT7EulTJ6lmMsxOECBmbxULnkQtxFAjSVE2IhhpNMp4xL3ugV
         HLqJ43JLKUCGwx7/gfp06CNmYTjCS2/cq9RodCXrM1vy36Rbc7KaUQ3LCogRcNzO5mZP
         FQ5rgIulOxYZrscuheSymfXOaEdsz3hnnnzKer3kWSS3TaH9NT5Pb/omL6Y/JmIXq4Ne
         5Vs+Vk3FWMhO8oECI+RSJp6YhSKmtNNhQdqWKz0Pkg+Uzw9tao1hkTDPph7BlXCjWH6X
         EHBpji7uzwwCgbIZmZrbOo6gJmX7s8hHg3xaC0ELkORXarAxr/MsGK2ksXa25/Kdix/1
         h9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728674543; x=1729279343;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYgQWgt/qKmfdHG9VXiGCkrR3Ne5T90ztqEtcBQu9CI=;
        b=hfdQl3eDA3ve4gUsHHbFQ4zRqfdY6l48jGFSS2qFb4u5OCdRxYCv75StUGD/vAAQFd
         ZsfyFpMBg1YmP5cAXqvkXOo/TBvj5ievtKTSkzDyzqlrbiVrsz3075b7gUP/RmsFIxDK
         oI4tbNAP44nLYsOjyHgZHptpfc7WRmzQvrLqlaJ3F7M7JjbBJljVSYKmmy23TplpWRTB
         Y8/4+gX+8WSM/nZWuqHCcC1Bqtbus+Wc6FxYa804YUdx4T7Qsb7ouRsGPNNX9bTTiLsx
         eYRU3ku3tG6UlnNClxN21Sdqq9GTz0i8ZnqBve9DapPJw9Jtgseg9uNhplIUJlYTi7Jb
         G0Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVPkKERO9LYDzMn3TFwjNwVY0KkjEDgmZMsaR8mhFHWkxT4O3+nNCEPzwCVjbZfxzoG7r7vx7UqgUF7IRVrLhyf@lists.infradead.org, AJvYcCX51mQSx6R8wCbZdy6iIMECbcuhHS71UmSeAnpQzxCfpKwRwElQ/wR0nMxcDRxs2tZ2wwYNVEfHcN4UKWpO99I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyptdYs3S/ZFro97rjy9E5XYLhMyQMMQVEvmmVFoBfQhaxWr52n
	5sXrWYDUlp4jd9s9BfDabV9RrtZhix0imc19jfAF/nd+0cvD2UVf
X-Google-Smtp-Source: AGHT+IHDrJkqntC5hbJBHUdbeUAjDp6V1K7XShBIFjrWbQhxHt6e86dahsDJxOy2EMtrhVQ1CrDX1w==
X-Received: by 2002:a05:600c:1d26:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-4311deba2a8mr23732905e9.4.1728674542675;
        Fri, 11 Oct 2024 12:22:22 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-55c0-165d-e76c-a019.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:55c0:165d:e76c:a019])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ee49bsm4581663f8f.100.2024.10.11.12.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:22:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] drm/mediatek: Fix child node refcount handling and use
 scoped macro
Date: Fri, 11 Oct 2024 21:21:50 +0200
Message-Id: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM56CWcC/x2M0QpAMBhGX0X/tZVfVvIqktg+/DG0SWp5d8vFu
 TgX50QK8IJATRbJ45Ygx56E84zMMuwzlNjkVBZlxQWzctfaW+8Sd+/gNgyr0qjHGpWGZUOpPD0
 mef5r273vB8+vyTdlAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728674541; l=800;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=CUgnykuigeyvSk+12QRyPfcuP3wIVJxY7aInDCemjsU=;
 b=VS2IFCGJyJpyQN++hbNfW+QHI8VE09TUL+q0ILjUhG8LFSsaeXapxeE08GCY6WIEkfxFiYrvq
 3o6Dsm8HPgzAHTM2Gzm1+GZnOiqBBIM/R5LsZ4CcxFrH8NtRwbJSivg
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_122224_734770_6A04E6E2 
X-CRM114-Status: UNSURE (   8.46  )
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

This series fixes a wrong handling of the child node within the
for_each_child_of_node() by adding the missing call to of_node_put() to
make it compatible with stable kernels that don't provide the scoped
variant of the macro, which is more secure and was introduced early this
year.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      drm/mediatek: Fix child node refcount handling in early exit
      drm/mediatek: Switch to for_each_child_of_node_scoped()

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241011-mtk_drm_drv_memleak-5e8b8e45ed1c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


