Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92336C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkyg3PseRq5i0Folj+GRO/aSoM3TKUeywxLrge822u4=; b=WML7zWRjSKf9O8fLvhDEYmsstZ
	dqnj3Xq1nTXmA7I+GO0fK5fPO9FS1wM22uLfF/jPGk9FcY3cTTehhS51DL423Cn7jL15EUUVcpSa5
	kfdmgZy1jhpWMxsItgrmjn2IIc66K1oydKF+odVrBQCMQcsM0SdU6miUI5iwngGPBTtKoSjthLpQh
	zzOcF4LWOtYaYL1Mb3q5Js0xUkzu8bIXig1npdLHyST+BbnD6eZGK8JBhLR9aTpsXmr3m+UcQsPxC
	X2YvDOTgLxQ6aZG7cV/BRmDLkh1bmB24Sq1K3wqfv//XhZ2lKIR8pepQiq57JC99xWxkW+N2Audll
	pxBkYtYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27NT-00G9fv-2L;
	Thu, 25 May 2023 09:35:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Q3-00G0Nc-0k
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:34:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3094910b150so1760685f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003635; x=1687595635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkyg3PseRq5i0Folj+GRO/aSoM3TKUeywxLrge822u4=;
        b=IHRtJBEg+ATJEGHAAj+runJWLUQaBJ+qv3YL2RJSDUOI+2c+8Gnsit7XL9NdV87Wcm
         bmnhiMFrTBtHQyAGPhMcRhgou7YYtfQHTqKtIQ/BIpJrUxMyuw0xaE5bD1L6Q0lz2T8C
         bf1uarJWsjgBESBDO7t2+62DaXUh4/oCMvT8wbdix/K8x0HwCYcllcDFzNYw76B4nHVo
         S0uQe/Cj9UH5oKGdGMgtbjP/5zTtlPV08KuM/so5OhSvZyiOTFGBxEAGejg2Z12LC4BL
         YfDWgK8t5EFmEdzSv3z9NND27+4+QrUa28HZ6mRfWSM+/RF1z8oraFccUw5ZbezrX4yk
         HXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003635; x=1687595635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkyg3PseRq5i0Folj+GRO/aSoM3TKUeywxLrge822u4=;
        b=W0WACTTEof+RbbhNVlXovUdoTa/xvZk3maG36LZdbWlGWphAjKIFaMUg+UQhLfK4fN
         8ZYpRBRTQa+dwodtFQ/wDpE4A58vLu0LufjhLSFi6iaCkW5i39cH30Nr47i914llAslK
         yVKWcyH1OrqFTv0eUpB9jCXLkAByKtsZk5lf79tdagHJ/Jb+y63mCjkyGKh7H+W+yTGp
         ERjQkp86m1nJYm9sG5orcoiTAS+TIWg1CbAeic19m/jxuBoTnxj2AAny0hWo4bzOzr8T
         56fJIvenpiyVi5+c/GZ88uyx7GtsYwkuQzqGTqC3oR+jsM+Nu2sDJmKIdqDHc90NgMDA
         V0cg==
X-Gm-Message-State: AC+VfDxviPA5Iqix5BRTVNPnutccvnu0AawcQMEVeOzNzZzbZI5R/hco
	uVp686mu9hIIqjX5jt+XV94NnA==
X-Google-Smtp-Source: ACHHUZ538gNxVUvNRj7yoUeDbBW/0pV1KsL7cuIz765EeYCOCdcyFMyhx/H0Ry+Eil4BKt82CMZznQ==
X-Received: by 2002:a5d:590d:0:b0:30a:bae6:fa9f with SMTP id v13-20020a5d590d000000b0030abae6fa9fmr896467wrd.34.1685003635596;
        Thu, 25 May 2023 01:33:55 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:33:55 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 25 May 2023 10:33:11 +0200
Subject: [PATCH v8 02/10] arm64: defconfig: enable Mediatek PMIC key
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-2-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=877; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=jPn3tggveilK0xTrgDaZ1+RBp85nyEx21PEy7yxORvw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1v4EJwb5ltY7o9akUPr2vQ/+igut2ra6dXr9OQ
 qqPxMBiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURZTzD/
 4pgUjLhvBw1cyMvt0mnTbbCfkUC3ELYRSKtaczQt1HA0mAJOG0m+S7ULvjZV5e0QfBjIo70eRMXa51
 Vt/jJ6cCJnVlgo9hJ3PZ+Xp1/w2qTwRAtBZMhyXUFD6bHGU/VO8T4kTeVfKpZVjqoPqBzGxGuuVdig
 JIknJzkrmHab7DvupQQ9e63PhuyXGsr3Ckn43clGgIyTEDUy5YlkbFNhhFaB7ssWMhUALSmqtB1j/N
 Gdf1efeuoJLd2HgnsuAy15QsOHsym/+ejnrpD37IOz58xNYqdno/Edi3c2EHrod4DULrLSYQt2uWxr
 5mJntZQbuTGWZuelBgsb7KvVP/XDSnC2tiWf0VvWIgFPSvGq12wWpk0P3ppI2j2S32NLoPjJ5FySIF
 Dz7fPT2gaIh4kJkWYbbqtzH2BYjmTvxakal3jMi+YQwjFtDCNIG5sUNVA4g3n/5GT9ECrHflNgiJxW
 r4Ht77qFPUVJChncFt7AScHk1iXlmE0M0mfD4FilWEd1HL5guIJCDnp1SaYA3ss0Bd8MceRzroBknY
 LphjyR8DzU5oL2cNvKy8SItqu2HZh91DTQVS/lbcME3Ve7L1sBr8+yyTFagS1oUDLiIGLbkcyTq+ub
 /8JYw1P7Y7WYl3AwlhAeX6yxerr3XUtvC5cen+HixlKOSZWcwre/1DScIu4Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013359_270741_C72A70D5 
X-CRM114-Status: UNSURE (   9.83  )
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

Some Mediatek PMIC devices can manage Power and Home keys (buttons).
This patch enable the driver which handle the 2 keys managed by the
Mediatek PMIC.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ed3fca298314..0db8293f477d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -413,6 +413,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m

-- 
2.25.1


