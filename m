Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3D9FD376A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ddQboShUAU4xr9xh3nmF5l6YT/z5QDVdd1na5dDuboI=; b=mME4Z4ls9SqyxCpa/hMgXXl1NF
	xBlw4woKZriY06hhipIP7GD45y3BC/L5eTqJ0hU+bSVt/P5fL16xovXVTgfJC2qT1kfw7/zttosnC
	Fu+I+IMg3hnFpcbD6R5NWiq0k5DbmRFuRjPujdj0qHk5RpcMjfRpZk6HZelvpFeNRhyx0Hvk9FgGf
	Kc+TQKC1JgMVoFVcHhrKbi7qvkyaqaJP8C2yGm8cKojPcT/hn9mzGa1LOZCPBNaEoPbm93VRZTCy/
	TwHESzabFrFZPa50h1SuUsrHPcxlHPEsThm7WkP7RTLM5j+9lpbH9oSd+AJEFHELnw19BLHpXZaVd
	gEL4TC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHpN-00000004Wul-1v3l;
	Wed, 25 Feb 2026 16:33:33 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHpL-00000004Wu1-0D7H
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 16:33:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-358ed90bcefso1138096a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 08:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772037210; x=1772642010; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddQboShUAU4xr9xh3nmF5l6YT/z5QDVdd1na5dDuboI=;
        b=m7abO92IbhnFxgFzeaOdozz8Bv4OLQbHFJ/Z9Ke0GuSHCId3o1/NRn8gnEJJZC8OkK
         +JCRRfs4bp+raxpN8YY8FjhwTyvLjAnMoqxLCa8LqZKwAK3oeMFzlVFDbec+A7//OruB
         R0TRLnzsH/V1dCI/rEnhevREeYbWdeTjUMNxpOOjx0rGnp9skFtsRQ51vltLwU4fF4up
         0vj1iYFV+VbEmEHVsuwRDi0LaemXkn25LvzS0rLSTplMPVdmdGAj4OLljS64VH2iA+9B
         jE/KIaEX/MWZpml4a1VWcLtOYW4g3XdFZQA0JDH5rgcm6DDJghiRIx8u86BaAbpJCU6Q
         +TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037210; x=1772642010;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddQboShUAU4xr9xh3nmF5l6YT/z5QDVdd1na5dDuboI=;
        b=ZWBLDQdOJJMqzuYn4a0JtRAAzCc7X44U2MDe4463sOd8b/TmRh43WsIftBaN+XNOHd
         KUuks9iqNrwk8VQAteqwgh+7IalSafu5/+QA0DLTvBqZNU2Ix869U8zTc/ActOEw42Zf
         +synx+m7apmzixrhRkUHClaXLD96OtugaNBgBJJagZiPi3RfUULiUVP+I5OJzwzl4Jeh
         J093ut230Ih/8E3l04Xbgv/4/7iRLhB8Q5SgZWh6rxE1gJVpNBaiFqKaJ8TKMdjqqBk1
         jNSrB8ijrfG+PkhDdbJbglb7MMXulsQxKXcugdhB4UlfWWCe9rtPhQuiPyVQu38iGJAP
         D80w==
X-Forwarded-Encrypted: i=1; AJvYcCXaMBL6dNoEpobY42O+uciz+uOffqokqJ5ClavDvLOHB9/SEDkvTW1j3njeGNTiMQB++wl7PfkLOh360p9xkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKtmWVofrkxrUoHeMphGALXNb8br1WCePG3VQozgTmCGAYP43q
	Zy4tQUQ7oCJItsJG8fohw24qSIrg3Kvn28XCKdNxVg4vFdURsuXDDLc7BJXarqTl
X-Gm-Gg: ATEYQzx48n9lZClZXmFI2ygY2AyEhnc5Ls7FtCWKtmjspCsC56nkOaqzbfesN1rX8It
	vP1AMNtHH/VPZEo8t6znVBwVcNauz2QZHXXe36NBn7IwWNaCpDu2UsUqmZ6/D6Qx6fBAoM9Mp+X
	cA6de/4FJgYQsatOBNRhJQrXvISPTtH9osfXDEDOAC6ocGZ6+Z6IozlEC0Zzb+3APwAy4B6Sh0q
	+Nkr4IQI+Mw+IFaHJhaaX10U4OmHbBfrlRqwiTC8e2/OEauKmsTNiZZOf6/gCt7yrEe05dqjOe/
	m7gdzaTQyTX7uZHoJnwCYMGlqHjaOtkXl3O0rY4XkJdv/8m6AiuUuSptZdkzYuVpD+j60P51nWb
	8Tug3Y6xgK0udcnciRYUziJV8tb3NWt9ND8d5TwM5bc6auz75z3FfGEwUVnZdYebFrKuQL/0xAA
	d6CmeM4iKIHEx8KbfEztA5AmBv4gc7GyfaoPKA
X-Received: by 2002:a17:90b:4987:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-358ae7e86a8mr15320596a91.6.1772037209583;
        Wed, 25 Feb 2026 08:33:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:55d9:d867:54ea:d951])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037af167sm3335665a91.15.2026.02.25.08.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:33:29 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 26 Feb 2026 00:33:24 +0800
Subject: [PATCH] mailbox: mtk-vcp-mailbox: Fix the return value in
 mtk_vcp_mbox_xlate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-vcp-v1-1-766c5877017d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFMkn2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNT3bLkAl3jRAtTYxMTc6BgqhJQZUFRalpmBdiU6NjaWgDxwXc+VQA
 AAA==
X-Change-ID: 20260225-vcp-3a853447202e
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jjian Zhou <jjian.zhou@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772037206; l=961;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=W+jP3zwPXvbN6VQlSiaHn6aD2hpSIbT32Oq/GSFkHGI=;
 b=A/kPlRCS6V2E+kcdMjDircq5UF5u5qvwoxlGCWmLXVI6bOhw4nyn1gIgaR/jjArtEVtu/mn28
 cAgO0P9PlqYDVFsfrrdx5LSusYs0BjvWhrCnLB3brTGMgo5KtRrD2WK
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_083331_083700_FC33CAE6 
X-CRM114-Status: GOOD (  10.92  )
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

The return value of mtk_vcp_mbox_xlate() is checked by IS_ERR(), so
return NULL is incorrect and could lead to a NULL pointer dereference.

Fixes: b562abd95672 ("mailbox: mediatek: Add mtk-vcp-mailbox driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/mailbox/mtk-vcp-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-mailbox.c
index cedad575528f..1b291b8ea15a 100644
--- a/drivers/mailbox/mtk-vcp-mailbox.c
+++ b/drivers/mailbox/mtk-vcp-mailbox.c
@@ -50,7 +50,7 @@ static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mbox,
 					    const struct of_phandle_args *sp)
 {
 	if (sp->args_count)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	return &mbox->chans[0];
 }

---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260225-vcp-3a853447202e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


