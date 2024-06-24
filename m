Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC742C2D0D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uPl1ZQhtp404/46Icx++0xUILGoKNCSD4Zi+KclrJiY=; b=VPw68D+RvsOl46
	tK7tEVdX0a43f546FMPccjL0z1MDx3gBAYmPTFOv13ASkVab3gBQY2Y+cUCoMMZleiCcfi3T3wHFC
	PyuoArAfbm753/cqKCfcpjLDxYyGA4ghXEI7LcadvIoIj5IBgH7vXXyRNq7iMd6OxDrtvN+0HcJfB
	VnVVszRFdM9w8XyvFqcyIyKRgByif3E3Q+jzWYR/GGfPpvnljXgKlTLnrzLlvst0GwfAMdGJb5gZX
	rFcr7YoFqfCTWb8g739Dmi/PU8n9kB7qjJEbAAOaOCIEt194xw1owNgAlpnvhemOPkzO/DYS0lIIQ
	AG9BiCSkElbG85vI/CJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmnX-0000000HZKj-1Nj2;
	Mon, 24 Jun 2024 16:44:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmnU-0000000HZIn-47RB;
	Mon, 24 Jun 2024 16:44:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4218180a122so34876475e9.1;
        Mon, 24 Jun 2024 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719247443; x=1719852243; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPl1ZQhtp404/46Icx++0xUILGoKNCSD4Zi+KclrJiY=;
        b=f0joiWrJcpCejeBIqocgXUkpWBqg5ZoSC5Y3y17w8vW39qSRQJzT9N17plQIqtDaXS
         MmeqCTq+YPsbNGjhUlR0+VYesE9QJKqbYHahpagbHHbKVhSo3z0lBG/pl3nKsLl+EwrK
         hguIXEXCsTQ4vsVdB5GbjFXZkam4rPEeKG3N10HCYo36EzZkijZ4gnffI8T/Z9oQuSjQ
         9+XO3V7yphim+WienP5RwmlxUlfF+rJ5/zmMiD0/y82B2DU4V0NgD1uKmklUN4sHif52
         lDqVdOPCsQPqXv71yYYr5R18PTc8M8/w8sUvMlTTdQSoAMS2pZLZOig7FDbsscJBeH1n
         CUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719247443; x=1719852243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPl1ZQhtp404/46Icx++0xUILGoKNCSD4Zi+KclrJiY=;
        b=lbdgJ7SR6rXRMeuNhbLGmgwLbds+j0wS5TkOR2u903D82hL3C0RFupPqY0qWdhiavZ
         HRfzgHeJLaco4mFwnMa1nIdrkKticGHFMnMIaUbfGWIXoydsm/WhLq71dFpVgVfeLX84
         G2oGDUxBRC0O3atSczQLPI+QEY7k4gAHcyEfiZky00lkqd8TBC/a2/HEeCvlvLBHsSg8
         24PCrNrZQv2bPgyQifm+yqaNBzWXZWzV8A2xVbu9I+fNeUmFUTMUnoPpydndDYUdCXsj
         3+mts79LFDzJ8+hfoc9r8nSy4Tavl2mu6IioFBEmJHbK2wiCRiErJp3bL2zzISYFPEo3
         KeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc/LmPGQWGu051cHz0tjKimeGYWJQOB0VWSUjBm6CFY4OuHwQmL5gw9XOlElCH1fvw8aWQ9Bb/HiKdP3FYvNKXTKggaVxBBXo09xy4WIup++2hp/CC1V5l44EBJhjyII6oafzfHhaOCC8wl9DAQylF6c2sSp6QtQ4=
X-Gm-Message-State: AOJu0YzuRJH7+QgWUgDKH1Upd8HTHjand3BLBhUJp56jnVzWAN4QXsgh
	aYQZrPq5DHDBGLqAgYQxXfVdgn1EKA0wgUzz/0VgYq/J1Wc6Uthaql473hhD
X-Google-Smtp-Source: AGHT+IHZL64bTgMiLUEUoyTtjAuoK7dRxFHbZnfAkyi5qDaE8VVg4wQ9jBw8En6Ky+VVdvaKH93RwQ==
X-Received: by 2002:a05:600c:4fd0:b0:424:74ed:dbfc with SMTP id 5b1f17b1804b1-4248cc66abbmr38179755e9.35.1719247443096;
        Mon, 24 Jun 2024 09:44:03 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42484fc0aecsm126090365e9.12.2024.06.24.09.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:44:02 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/3] drm/mediatek: fixes for ovl_adaptor
Date: Mon, 24 Jun 2024 18:43:45 +0200
Message-Id: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGieWYC/x3MSwqDMBAA0KvIrA3EMVjwKiIhTUY7+EnIiBSCd
 2/o8m1eAaHMJDA2BTLdLBzPiq5twH/cuZLiUA2o0egBjTquzQaWZOO9WxdcumK24mOioPRLoxv
 e2BvTQx1SpoW//32an+cHv+QRl20AAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719247441; l=1065;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ROPDCII861NLGqzE80k9+DtJm8iQ/4QlSPD6kcUJ+YY=;
 b=pk334UJ3+WtdigFDy/IyUejM7j4FgWaYmPUO9ZXnCA9jfFn1yVyJk19bsKp+cRJMFnnrkWzpz
 lSZ8e01j9sfDdOUxhI2QnN//s+lP7nzC5B3oCoMDOacSUVG55AN/ACX
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_094405_059054_B8168E0B 
X-CRM114-Status: UNSURE (   9.79  )
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

The main fix is a possible memory leak on an early exit in the
for_each_child_of_node() loop. That fix has been divided into a patch
that can be backported (a simple of_node_put()), and another one that
uses the scoped variant of the macro, removing the need for any
of_node_put(). That prevents mistakes if new break/return instructions
are added, but the macro might not be available in older kernels.

When at it, an unused header has been dropped.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (3):
      drm/mediatek: ovl_adaptor: drop unused mtk_crtc.h header
      drm/mediatek: ovl_adaptor: add missing of_node_put()
      drm/mediatek: ovl_adaptor: use scoped variant of for_each_child_of_node()

 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240624-mtk_disp_ovl_adaptor_scoped-0702a6b23443

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


