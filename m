Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0B7D0BB5E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 06:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULy+zyN1BivKyLwzuPRCl/8UJCnpTGDPYrNtb9eDcL4=; b=KgkRftQ56TwsDccHW7874CuXFK
	kuJJcSCk0fw1EQ9NZIiIiah7XSDLPGqMl1VvpPXLMTA+idaubylXuIHiUnf9wP9CMZkkfTnFdQe9c
	CuJ4aRTfg1hvSiZH+lzrjaiBrvrcX+foFAxj4OeMqzxB0o94Mv3LnDk3AFqwRiEc1WN/Hev4ooksU
	NMDXOJC6sP+YtgiJBPjjTKcjnDEiSXAf/+kOQ+tkqmIxfBWL5oKsEO2ZdQSK5Z+CXd+R87UOnCJKD
	5onNIunBccoz4vC0vafh6VdaUEw4S4D1yvqoH36ypdobwpvVXVboiEqSClMhBNYfN0f/dtIg5bawi
	tq3AIzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r9f-0000000Gt9p-3g2A;
	Thu, 24 Oct 2024 06:17:07 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r6c-0000000GsRa-0BZX
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 06:14:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e32b43e053so8801467b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 23:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750436; x=1730355236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULy+zyN1BivKyLwzuPRCl/8UJCnpTGDPYrNtb9eDcL4=;
        b=S5iA2AnUVrc0O90c8bMEmAoqaAOjPdur9H2qrQVSoQPNOjbEexy5sCUCwqc4eTOhpe
         ZPFy+svQphhU7lltTDVlvc4HvNm0eidlgMKQ4ZAct7ZctrPEuWQmZZBYRf4yYtXwlcVD
         LdQMCkMY7lJdn0Rbc2AS+hD9mA8TEodr0VZJgqru62zChy1s2Fez42w1A8Tt8mEZElmr
         00Exta0e/vWfsdejyxKdiKHi56O4056WRN6E35SveeXlOpt0j14n2bdYpyaGnw8abDJm
         ykppa4LlGcGdd3J2Wt8do63Q9hwHTv2hnNrjcbU5hHshsGaJzQMWfKz2kIDfcQ3+gu5y
         HeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750436; x=1730355236;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ULy+zyN1BivKyLwzuPRCl/8UJCnpTGDPYrNtb9eDcL4=;
        b=g7+8KTXpF+b/oh7iCWa1fhRP50v9oAozfWNASm6s2JFKw/6f1pS0QE43PJ3ir0bW6k
         aP8JETGX3mvT3C+OF7uqlg8LfXBPtstCqrv4caiAwNdocLVvTfD3STfbq1nNgZMLbvmC
         y8YwqomGs86vhRgFjDEZtEoQiujIlsgck2SudU2WQnHiisSDq6fbBqLYuYnjrD6ZipsH
         GLnsvbJ+wUuHHpAXZoR9lqRMxPFJHElacZJYqXzcACkSJTR96PT0eKiUlEKbDAuJ5Y38
         O9Qm8bQrO2tBg/XKVJB9pkeruLkeD+hEuqS/bbTI5GKQFswsROl4ldzBOfqPhA6+8PaG
         WWvg==
X-Forwarded-Encrypted: i=1; AJvYcCVdY8fDV92RDnxvKgsL+xXxscbTGYyrJziNRBblGH5ETvfxY+zSWzQAG5n6DOvu0q3Ho9QAa0J/p9uLih53Tw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9y4lYNzYJOVuuG4hUnckyyXVsBcgpXRa6ggzTp1kEFmL5cEqk
	QOpVcFdMz0nrY+ZztGPRvwAUoys5d3TRK9LAy7PGmXcSitNO8ct21tFbAG+mB5ddJVlnRKUsxBy
	z9Qt9CcyepJMh0g==
X-Google-Smtp-Source: AGHT+IHCEMkQ2RfyYdNtjaLmn7Q1IV6vv3d2IoDuURVXiH0KtdFNDJTv0BNk9TxANKxuJUTxCoodn7NIA1qQz7g=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:6811:b0:6e3:19d7:382a with SMTP
 id 00721157ae682-6e85813d7f5mr589267b3.1.1729750435897; Wed, 23 Oct 2024
 23:13:55 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:42 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-2-saravanak@google.com>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_231358_104250_AD935E35 
X-CRM114-Status: GOOD (  11.38  )
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

Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@no=
tapiano/
Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
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


