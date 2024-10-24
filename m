Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087E7D0BB5E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 06:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=; b=uEgxewThmmDLVovVH/ToJSMMa6
	zsmvCxbD0NrJxdZES0NGUNoQ+b9Ft+QmyzWve94tF7PAL25NlEOkJbTDUwDw5Ub5BrYP6YZs6fVfN
	nbp7FTlktUmkoYH+fQ4A4q6q7DWYeQ8VlyBR1NTMViJ9KsFd6rDna0UEmQV55QE/gguFZJs7fGzxL
	YoHLV8YXqc9wHREqUtds3qKz78R4KxxCBfVJPAEQsphYluvhjindFfb5OXmoFKWNI+2xVEpBp9Z1D
	cJLIPE2xKM7piCsubPGhM6agjt4PLfmukHEzUZq+OoTsXhMPSitIHATjTAhKsxV4VMu92NZ4GQjxS
	PRVrlq4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rCj-0000000Gtm9-35q6;
	Thu, 24 Oct 2024 06:20:17 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r6l-0000000GsY1-3EoX
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 06:14:09 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e0082c1dd0so11563977b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 23:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750446; x=1730355246; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=;
        b=xLakp9LDgPw6u/JgaXLpCgqQgG97e1imMYD3tlOJh3yzwVzXsDBUFJazeDdsnYaa18
         I3TEhbYtt8mibexjODfu5FZYPGwjG/a/g/y46yKd6XuDJQ0SCblBTrH+paKoTVMrbkcd
         optt0D0JEVQbHUNo5LneZE+7ABdZ/BwbCnd7ZlQR+RaiFuvyTo8FycOdmV29InVyGEQB
         5/Da8JnZFPm1OJunqZqHesEt9cP6uRodTFVFNOlR2RLY1OsZhD2D99tO2hXIYQR9lWOo
         9FdCDuzp4xzqABDPeoOfO075gM76IicVhnBAJnSRQsSJAwSioytaw1GSoUffJJXFvLDP
         swGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750446; x=1730355246;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=;
        b=Zj4/DK+6w9BXWTSFeFBKeWRiUshZHYU7K8ogSY27Rk+KYyVOlV5BEej9Ys3FZq82nL
         BtUTli1kyQr/RGsssjte7FeBGdkfaux2xiavkrDemD53wXrYCBSDLYNccug7qwK3kfqE
         C5/CiXZyy7/EhFRKGk4+lRcpJlnRr+sEoeFuvpcR7dcvzZrU3HV/BRn98UcuLL9akRJG
         mc1KPuhs7tz+SDhCRL84FCh5IbdPk5oKN/EcLYZiO7KInkuukUJi9E1u8MDAk66A4GNI
         Hlnf/N+ENI3gUah8tGkob9LPaEUSRyiZrNZI2wVMIrgJ3S3E3KBonvXEL7Fb7CW+/wk/
         rbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbccVR6XhSsD91FVDv94DPfO88q28SKqhFO0gEsPCeMnKExW46eDQqcVZVe3zt+KwZQv4CBjzXu28i8HQvdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI1//JvAkHEP5yPpwYhPCSxyJ65v0gpry3OsTfPLNh84Y+eIVU
	D6nfKwG2E2+muurkJRR4rmOh8xUCOmqXnEJShrdeZz29INGHDsNy4pU7VbyjkbCLYJAe5BSmL3N
	GISsPOOjEjRZzfQ==
X-Google-Smtp-Source: AGHT+IEJXaAAeZpuDAkTsefFXLL2kex4B2AlfwjdclQcvPn636A6m5nX8BurNhgR4ykV7U+QaaWd5sb2nHuey3k=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:3749:b0:6e2:4b3:ee22 with SMTP
 id 00721157ae682-6e866359b6fmr171667b3.6.1729750445961; Wed, 23 Oct 2024
 23:14:05 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:44 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-4-saravanak@google.com>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a bit
 more useful
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_231407_850995_C8979CE8 
X-CRM114-Status: GOOD (  12.49  )
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

It would make it easier to debugs issues similar to the ones
reported[1][2] recently where some devices didn't have the fwnode set.

[1] - https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
[2] - https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia.com/

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index a4c853411a6b..3b13fed1c3e3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2181,8 +2181,8 @@ static int fw_devlink_create_devlink(struct device *con,
 		}
 
 		if (con != sup_dev && !device_link_add(con, sup_dev, flags)) {
-			dev_err(con, "Failed to create device link (0x%x) with %s\n",
-				flags, dev_name(sup_dev));
+			dev_err(con, "Failed to create device link (0x%x) with supplier %s for %pfwf\n",
+				flags, dev_name(sup_dev), link->consumer);
 			ret = -EINVAL;
 		}
 
-- 
2.47.0.105.g07ac214952-goog


