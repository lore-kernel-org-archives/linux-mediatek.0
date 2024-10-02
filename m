Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358C8CF31B7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAY/dXsUs9CkME3PSfZ8rKUo2mav2/+CmW1Y+16arGU=; b=FTXCoFAqeiJd4F
	+rXmFNk7pl0M+FWKty9C0fHfDzqkdZiDEcjf5RcTH18Pmd9WU0j8MRpzhXC3Y7bbCKi5YEQUb0gzC
	Epn+lJixww5LwbEkMFPG9AYmAHU2/cFvBwT1E3iXdA+7oD+n0T1z7YeWQwI3qD21pksClVW8EJs8X
	cNhcQtOeR07AVdVk9LSLwxUFV61V9/ESWOzULjhQi9Shaaw/UoEkKAdUI+USFI+H42q1GQuXBCRLg
	K6ocWZg62xJxEOVJYCEQOK1GZjfEOPG6oh6VcKRVc4n22sC3fqlI+mg1atvlcLPHB4+T4Ou++7hM0
	b4lhF5SiM6Mv95lNC3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxrA-00000005ifo-3UTs;
	Wed, 02 Oct 2024 11:49:24 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxoi-00000005hry-2Kr4
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:46:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71970655611so6073655b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869611; x=1728474411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAY/dXsUs9CkME3PSfZ8rKUo2mav2/+CmW1Y+16arGU=;
        b=gI0Ce8m4/GpZxVGpV4P/C2qK2IXVPjB3hjVJ9S28z5O/DcC3ihyyeDGh69s2sWnG0H
         o2AXPAexFVKHTGAZzDuWXWjm/DqScRVCoAkDeluh2LJNZESkocqtE3KzxPcmQswZp9OY
         FFY6kLVfnJFOrCzJI+LPWIBb+uG3P6MBziuI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869611; x=1728474411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAY/dXsUs9CkME3PSfZ8rKUo2mav2/+CmW1Y+16arGU=;
        b=IABXsVtx3OSyHBOF/Rzx2gbAAnQJ3nELW96cIKObvau3Ly2Xbtj1YSvK/LfOnozrSk
         NnYtCVgLtpU1am3KFOzgKVGO6HiyiR+6jxUyqA8Qp/vGjrZnZpUeUOIMGZZYrRfF2+1A
         WlFOC+4WcegVBMohwA0HZsicg+rC4bMjmaEqVriVo67bztsFFj7O0Ra6ipEZv/j2qrTz
         OEa5fcz9L/KozDthIs6vQ7t6sNSt6WfkoDyEZr5+D0ZPuiu2IBUehsOGWTd1UmVy+tfR
         9ImFG019Htj7qsL6GzKD4qIKgg71mK94KcMUa/xmTIGMyGVC9+9lvN05DqpixLjCorvT
         6qkA==
X-Forwarded-Encrypted: i=1; AJvYcCVoNmupRSIAvsTkJ1DyVn9EIdHs6ykstx3UQAZyvEPiVC93a4m1mak9bj5YqUWKeJymarlwY+nkjut+vC9PGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQZToIvH/Sxw6K7WRFojx09W1KLo1TVyvKqzhhH3RCcCmux6Rg
	ZdgqorCxA0CAgaYjRDk/KyIP3pyncOXoMtGxODKeLX8Povvwgx0FWbI7JOaXJA==
X-Google-Smtp-Source: AGHT+IHSlrdMuVKexAIEnpb0LlSgDCgS0LJ5jiyqKYhPJ24XMB513q/IRWvodzvlblB9Cry7cgSZxQ==
X-Received: by 2002:a05:6a00:198b:b0:717:950e:b589 with SMTP id d2e1a72fcca58-71dc5d429f1mr4913086b3a.19.1727869611476;
        Wed, 02 Oct 2024 04:46:51 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:46:50 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/9] arm64: dts: mediatek: mt8188: Assign GCE aliases
Date: Wed,  2 Oct 2024 19:41:41 +0800
Message-ID: <20241002114614.847553-2-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002114614.847553-1-fshao@chromium.org>
References: <20241002114614.847553-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_044652_619917_1DE08507 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Create and assign aliases for the MediaTek GCE mailboxes.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index bf15ac9901da..10195a4e4e9d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -23,6 +23,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gce0 = &gce0;
+		gce1 = &gce1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.46.1.824.gd892dcdcdd-goog


