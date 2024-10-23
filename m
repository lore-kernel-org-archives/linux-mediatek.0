Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A680CFA463
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 20:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9XbsmUl/ykzeRnfUHw2btfSodiXu3QqAkcfgdiNebV8=; b=m9xB6/U1wKFi39XXBC6JujgF72
	K7QEWtrw4Dlw8OmDdmNVUoPy/ksDfdst60RrUB+Qsju9GZCwO1N2CSWkb2dHS41WFLxgvpN1KZSmS
	tPRGLbxxK4G9+7mgqJHqwrwFrrzkflyqJFwGrQcJqOucdEIeaUmdZ4qq3TMavcuWS60wpzqhxxjNv
	sBX0dejW73nRnXO6ntfOROc/RpT1P1t7q/nSOfMTYFgY340q3hCcWJctdA7/zHXw8aHbCyiY76nNc
	UaNVrNTvgYNfnembuQ5XT7+nzRUnH8aelrt5T3tqq4dhHYeryibruMQrQK1ZiFo6iXgkBiGzB+aPT
	xS5LsaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hfp-0000000FluT-1rbb;
	Wed, 23 Oct 2024 20:09:41 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gni-0000000FcrN-01lY
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Oct 2024 19:13:47 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so287863276.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729710824; x=1730315624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XbsmUl/ykzeRnfUHw2btfSodiXu3QqAkcfgdiNebV8=;
        b=tXz7G/1fXriAf+Sfci2FhYJnWMyiVrILtS4nN1vRS5J2Up8TiFemPhaVl98gaKYtfA
         xMIg02LZyVmysMOGJNNoZpZppfoXPVk192dzWKlQKTTDn6BOamHOeH0Om+0LR5wbSZDH
         cudugThcy+6A1mTwz6tdCmCIJekGbFbjJMkc16t01slOkb3x8kIyJfrI1s+j3Xq8ITBu
         qjZPtnTm4dIk5of3hSNdKUs50M8Yqske9AE/hwSyQ6NNdMTVP4D4yc2ECayQLYyfIZrk
         DMeJ10sylwDnSQHtvzc+d6+tJc8ozSGrilJozb4eO9cFhEDXODKLRkswSqCSgMz876y7
         9WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729710824; x=1730315624;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XbsmUl/ykzeRnfUHw2btfSodiXu3QqAkcfgdiNebV8=;
        b=eLYLJxybgtCvyOWghRtbuuh9pO4DPZs8l+YAYHSVdbIP/Hlk9GdZ5ruEsZveman3et
         zicAGv3Lv1Ch8uSdq+R8IW+RPZ3Dr9BlLiGM4V4Ngp9Giqu3zrXMl+7LD4NT4QXUDqtW
         nZMtYiyULc76wvBhX9WoapETUwuWtNpRL6qvn0HrpXkN3fKH9AoO4lnMvKRBIEV27a/O
         6HIZiF7gBneHmG/rEb2IBd5tbLetcmRX3H8hY1QONATxvfQ7ORqfDBbexDuUk6r9aFur
         KHi7lig6w2bPju497PPYEWQExpSI5MiGC7VCjIFtwH4ErE4ktbbZhsalHvnALy/D7LhT
         o8OA==
X-Forwarded-Encrypted: i=1; AJvYcCUbhPMuF02shPtKMPYe7lFUsAUqGGV5TkTLjxPFn8esiCBpbg60xE/wDe4vpN1tZQ46/3EJW8sgg8XbUc5fjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysIOUR4yMkumBCytJKW0ZpLK7pTOfzJAW/Ed8odVqHSqgWo6sl
	FZkmi2Plgk3aYV+8jUtguse+nzgqhnw2zeogvLcSFqS0hHZLUQkxXk6KorJmeAZhOYUWmGW3MfP
	2gj2wuRc6/WrhsQ==
X-Google-Smtp-Source: AGHT+IGtw++CFsHM6UsXTaa07P8s7oTXdItvei/TRQB3GwOD9DmownHZlFBOwrDDCuKJGIw70cl6vC5daxpXLbk=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a5b:602:0:b0:e28:f2a5:f1d with SMTP id
 3f1490d57ef6-e2e3a632bffmr3981276.4.1729710824576; Wed, 23 Oct 2024 12:13:44
 -0700 (PDT)
Date: Wed, 23 Oct 2024 12:13:36 -0700
Message-Id: <20241023191339.1491282-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH] drm: display: Set fwnode for aux bus devices
From: Saravana Kannan <saravanak@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, Jon Hunter <jonathanh@nvidia.com>, kernel-team@android.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_121346_101225_A239EF0B 
X-CRM114-Status: GOOD (  11.26  )
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

fwnode needs to be set for a device for fw_devlink to be able to
track/enforce its dependencies correctly. Without this, you'll see error
messages like this when the supplier has probed and tries to make sure
all its fwnode consumers are linked to it using device links:

mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with =
backlight-lcd0
tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with=
 1-0008

Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@no=
tapiano/
Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
---

Don't pull this into stable branches unless its causing a regression in
older LTS branches. fw_devlink code is complicated and it might end up
with missing dependencies picking up changes piecemeal.

-Saravana


 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/dis=
play/drm_dp_aux_bus.c
index d810529ebfb6..ec7eac6b595f 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
 	aux_ep->dev.parent =3D aux->dev;
 	aux_ep->dev.bus =3D &dp_aux_bus_type;
 	aux_ep->dev.type =3D &dp_aux_device_type_type;
-	aux_ep->dev.of_node =3D of_node_get(np);
+	device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
 	dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
=20
 	ret =3D device_register(&aux_ep->dev);
--=20
2.47.0.105.g07ac214952-goog


