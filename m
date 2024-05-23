Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3274BC25B79
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hq7fu9lKeXTgrshzdpFsaVgKo6fIiiCmJ+5OHF+gZs=; b=uqGEi3t3uu9Yt30fgCkJCcKgDo
	kQk6ON4hDzTyePExpZYSBANrqvzEEyY/YbYhpUxbhxPezQ0wLWe67RGE/jNrTRs4qTSd+4zKlRGak
	+T9NI9SfVR+XQUQly/9Gz6uTTNswrmMJPTV+pypCBx9XT5fullEdTZbtnHYJXaK2TO46c4f3+jyq7
	oUTHhyu4Hb66C2LHR75q0EhSV4oOdzzNSii7EsxlJFpu7CtfWCagEh4VO9WPjp4lOfDu2hNOtYrp1
	063b7WieO6Lt0Ud0XEiaDLX8+SwoysCovH9I+vQgK+PBRSvi8qsIGasBNuX5bhCLIQEQqzW5RKtVe
	TOFL440w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7uA-00000006FrQ-1Pxk;
	Thu, 23 May 2024 12:50:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7t7-00000006F20-055Q
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-354de97586cso2215637f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468580; x=1717073380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hq7fu9lKeXTgrshzdpFsaVgKo6fIiiCmJ+5OHF+gZs=;
        b=DxaYcRyFjp85mwenTr8Zj0TwZbe+1ua+VJbMvsTK7uADoG7xjBavKgwO5qRWPd2iVr
         2jIsvljNJ6m60MK3EH3mJGM2nmgCqUyD4+sxc2wfWPzoIQNtJ4bevXH9Nmrmy3qkFHjw
         ucIvO7y8Bx/22iZYfniM1PlBE3aXz6/C5axf6ZP68nQz31OnNTQhPiis2Elh7sFPg5D2
         E8DSahZei6p7Cg/68Mcf1zwcaz+LFFYehVKF6dZAgFsJS2xfGQbWXZACr1nvGicBbSOv
         9DuEPKxgSr3Tz3YSg27iWvEDPDvTJEe+LjkdpeuH/7R50tc5hFFTtI9RqUAM0S/SSAMe
         tefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468580; x=1717073380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hq7fu9lKeXTgrshzdpFsaVgKo6fIiiCmJ+5OHF+gZs=;
        b=YFpEoC2Wh8ygBF1XtiPmkUkVt5xZCAa50HhnSgaR5AHakgRGq+aYJgi2DySv8Zuj4y
         is0LpnEhThgIECQzC/IPpSk3JZ7pzZQdadR67eq77PgAYE/y5K6gFStIz6hy2HRJvmaE
         ao6PaE9iv6ZslOTZwGTV1b9PmJdopUQYsclqGX0Qkit1ZcRoDVhcjEsJAK8Zl+pqY963
         11/MthrB7+pR34m9PEucNGjLX2xXmJ3+r7Pt9OWKgcVrwiT82YR0CtRZjKKqxK3wQyBn
         OAdbQrnH9eK5e7Dm8k87zPD2T4prgiGiSow2BbffSyorTf29BeYOBrkyi8oIGxuQs2lw
         rViQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDQqdSgYtYeQP4oiFs3kVF+xybayw0/kek5CM7b9SF1TOkS+A4Ugw0wkGuVmv381rrwo5ElyBr8dhISb6f+HDuMaaB8W5yo+45El69Sp821UaI
X-Gm-Message-State: AOJu0YzUnjgweq9NBXCEAMxXTym0mFYzPxwZDMJgAebCirWEnm9G29Lu
	VQIEZ7hFxrJdD+IA1cL+OAasxt1nYTlYwki0aW0ofaovbx0+8zfv910hsd6ZQ6k=
X-Google-Smtp-Source: AGHT+IHtfgcFAHCNKc1JJLUdRiLvcwprOJFdCfAdBFglIGxFEJ4vrqXkikSCSJEtDhSqbfnzmVOiFw==
X-Received: by 2002:adf:ab18:0:b0:354:de96:d26a with SMTP id ffacd0b85a97d-354de96d776mr2915534f8f.17.1716468579794;
        Thu, 23 May 2024 05:49:39 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:23 +0200
Subject: [PATCH v4 10/15] dt-bindings: display: mediatek: rdma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-10-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9RgySSODKXDFtNBIppDoD83d/BgQN7IfDe8Mj9kVPEc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTqPg+oDl98yeTzoXSSrSOvhaYdFezpli0P5FR
 JKM6KpCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURcEQD/
 9EtbGsiu3ulrzzGjMJ5wGDXHsuyanF+WSqI4Z5YunbLAde+LdkO85gVphFDcYO0YIWuC9O42glwNHG
 y/TXwlPvfq9vD06dRmVngxd2P9BxMQQe4Ewsu0Tx/pXqaQZlJuO6xFXSLi73EjcfrACF+LXwFFSo3s
 /yvIZbuFDuqPO4l+fISmSq26J1z3rqPPVvdD1ZgKyjvEWg7MGsQ+RaHPhhuet4vU+S+SNjojFMQpJA
 YjCctmauXTlMyYkt16f41ffwOadhdgF0dPMJYGr2jLMN77d74XDGQ2ZrGqqeTgJ5ReMSls215GFtgR
 nWcLvLbv7dvRQ7DAM0Ie0XpXxkQqowIe3sz8SwpGkutorS28xGe2lYy3s3+FuKi03neXlPmnKO40UE
 vYCZtzy0NEziDBPwTDwiI4z7Pe/Xivpm6eonaEcI5x3bFIndvdP44rjNl97teO6vcfjCP5QRDiNGGU
 WHJwbRtl8ZZyfXp1FZFnNWzUfcsM/DyHtnBqpCorGoz3sgoS/InosNtERdgZKdBwaSFBrzcOrKyg9b
 9FpcYphA399Icm1nHIDqKnFvWrCps0aBliBj82wUnp1mbiHSQIAISFpd1/L9DYlqI+x9vbxhHjNTqU
 u9LXP46Bh5oZGiXUKLnnpKoflsjNGN0pMoml7UHpEXqjGyHR7v8lphTIRbOA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054941_158806_E384E583 
X-CRM114-Status: UNSURE (   9.26  )
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

Document the display Data Path Read DMA on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index edb8d3b67025..878f676b581f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -45,6 +45,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:

-- 
2.25.1


