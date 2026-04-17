Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814F0F4368A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EJE1EtDskVc3fllBZ5ebizZXuuApx+bNxnjPDCy6KQM=; b=TZ88Bia6XrUMMxJTxqoeCZmUF1
	er82Vc+NG9fsmMdHrjEA/rGlpdmLM5gymtyoSgDrDfrZ7Pm2ByqYjdNPLNaXkKH40FOBgPUI8BZ4/
	tUWEzWJwWSulBsrNzXvm+rnwUrbgIYa9PIKXJOzG5o8vgOjtdce2ybO5Q9Ro3auixABj6e4T5WylF
	bIzZHzYopoCRgSu32F7hozZLJAewpYZ1k+dhb/NyL1nU31AOIp0TcZT08dVLh0eUrFBHHpiqNUEQ8
	HyRKI5FaPYJZ4qICSuZPBRNtATINg7VPGi7+YGXteQC+oEAZ+x/Ld+Z+Zg5lZzlFXqzUMs4SYJOmf
	hhpr2YRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhRr-00000003z4h-2rTv;
	Fri, 17 Apr 2026 11:33:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhRp-00000003z3e-04T4
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Apr 2026 11:33:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f8cebc935so223977b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 04:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776425600; x=1777030400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJE1EtDskVc3fllBZ5ebizZXuuApx+bNxnjPDCy6KQM=;
        b=atbQZOa/nbAKE0gisMKhmGHU7NWdy+0NSaWUInMZahGSUxXae1TCASBddGg6Q90ffp
         iAjTTrZ0NgWXXDhD6b+yHtDf38i0sXabFqL7MmSMj82levOsUqPI+YIV7J2jOxifei4Q
         I8Ajrj+UuGclln+Xwxlpgv3GG9aY2Hrx0mdjwzzJdp7RTSsgdbvDA8/VTb+nBlB+CQV7
         13ZZHqWGtqGJ/KdxeDI3dhAOKFBy0r9vbBP7d5bxP1ONmBRVhynqCN7Ilw3mZCDmE2YM
         pBrtFrc8wU8TmnQIoIQf5xIgzmQ0gpcemYnkJvdoMi6q8rFfO+v3Z2H8yEin6eUSfGCy
         uo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776425600; x=1777030400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJE1EtDskVc3fllBZ5ebizZXuuApx+bNxnjPDCy6KQM=;
        b=cCIXMiHXOJcYEcJPy+5RNL5J3e6Q2ilKCuFZXwxE2/5Gp5oY3Xv33bDkn9f/0HVZ+x
         GggO2UbJMc3y4GCGo79NE7fUX3axbvgcmnaZzbSVPl7ldlVkq1s0WZNbAMksINiPiL31
         Exezx91tSskJEbfN15vtQe8GcwEd1tVAIiOoGOr+3QS+KRnxrBtGwL0A6cMoOOL1TLME
         0v8lUeu/A6m4SMz4httzR+9VLsqFkP45JwvS0U+t2bJyzHpJnVUblQokBBzHmAhmi9A6
         hqXzux6z2EvWJyCNB2T/gKggFGhIde1UQlgrAm876f/8M8SyewJLswVUbDWm0rvrkkWs
         /OWA==
X-Forwarded-Encrypted: i=1; AFNElJ8ebHLkvjWCv+qY4WrIQpSKyyZVHNSBxPgKx4QsIkkyKAlZHjeShzOSPsMefeVlQ82x4ByiWJOqRFpVZFHERw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ZCHe+5OsbaGJR4QmPCdLemK+7gFE/IHF8zzWlBzJ5FZuZlDW
	tZvFiOnSMbE19YuMGr1d9Ccd+iwipGJDJXUNETOIQCeh/1KgUZcH0Rf1
X-Gm-Gg: AeBDieuOG9Vu0wi3+v5nJg/yduK1+irrGdB8taPp+fcgFrEFml95hVT7ljEftM3gUtI
	1La+ELzm4A5AzID9BSqZ6cSQsssledcCR1auc1Go1IXsuG6EZ8W0wJ1fgHC4TrQiwILKwTc0zVG
	Rc+6WIQKsBNtDmJf8cpgpvSHF8O5RU0Qf5RKHvIZdfI7J/QThLZYcSbPO4J0S3N5JfCshJr6mjP
	YM8ejHoPEztk6o6JsinFat3nb+7gZSPkRuMtG2ZV/Z+Hz0D8425zjSgOWlQslLfEX3K8cnfMX1f
	FjOzYH4TKCRyKfBLAkyP75QwZHb42142zOdPKvNSDGnSBd1yB0Zxb9ELQdYkT4Y6FejTxmP2GlP
	GVxyFRsSO0upe4DFxqRnuaJmzZVrTuHRsQpTD0sAY8cBtduGg6dJLdWTrPJpL0xgv2pIL9B8b9F
	Uav2eUOHPeoX8vz0fBcWvVzKKTa4cfRnXceqmHFk5xf8gYfEWhZmov5Q==
X-Received: by 2002:a05:6a00:bc10:b0:82a:64c7:8c6d with SMTP id d2e1a72fcca58-82f8c8bc5famr2390055b3a.25.1776425599584;
        Fri, 17 Apr 2026 04:33:19 -0700 (PDT)
Received: from dbc5pt3-os.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38f2sm1610998b3a.30.2026.04.17.04.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:33:19 -0700 (PDT)
From: sai madhu <suryasaimadhu369@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sai madhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()
Date: Fri, 17 Apr 2026 11:33:10 +0000
Message-Id: <20260417113310.2903091-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_043321_046884_EFCAFCB2 
X-CRM114-Status: UNSURE (   5.71  )
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

The DRM_ERROR() macro is deprecated in favor of drm_err() which
provides device-specific logging.

Replace DRM_ERROR() with drm_err() in the Mediatek HDMI bridge
driver and pass the drm_device pointer via bridge->dev.

No functional change intended.

Signed-off-by: sai madhu <suryasaimadhu369@gmail.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 1ea259854780..f431fc9adca5 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -981,8 +981,9 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
-			  __func__);
+		drm_err(bridge->dev,
+			"%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
+			__func__);
 		return -EINVAL;
 	}
 
-- 
2.34.1


