Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F43C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzteyAfQmYgd04c3xIbcEszPYVc0e3vP5LLdlStO4ro=; b=CDwt3Zy9Dp8lh3xEe/tUx9Sp2U
	mF4Q6GCYnp4CugYNbdHxPZg0q0S0APECu+CdMwMLoaPSkk/zcqtDXuN2ifuAP+/P2YlwFpYcKIzoz
	sFxlvx+6DecvnDXZbrzcmz1lxW35iNu2MbBwXlzbon5WrH6OHi1+2E0rO4viwTJbTjyjcL8xp1uwo
	IhIlYgVHR3INckPCQWnZuRG86Zr1Maf6tcGqJ+rGEtQKn64UUHtoeObVncjrbjYDs5Uzz4pAD8uv1
	MYogmFGo9i6B23FdyRQI29aXQhxS31gQIc/9s1PJCNYNcA4cUpF+RwYsGaBnbM6hwGf8G7p0G2ivG
	ebsa6Nxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebbY-00000000zwQ-02dY;
	Mon, 26 Feb 2024 14:05:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebZ1-00000000yms-2UvE
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=SzteyAfQmYgd04c3xIbcEszPYVc0e3vP5LLdlStO4ro=; b=Q1tfd8Id1KsN6CkwjQFUcZo9Aa
	CgFwdPQi3uQloXBl85H4QDscuyJgOqiP4at6wEHFhsPVlHF2g7zfof5mOy3YGpRaSUu+Hcv1qdo7m
	y9XTHct8rKCw5bea3ATv6aB1pCWVEjcgGckYzXK4ZFJCN8hKZkTu+cQ6oc5KQ3GesAGv3m3wOOLJS
	8X1YQjGIbLh5UG020r6tMlI8RwPUbNzoMoYrbJUT3HjuxwU1oW/XIhyaa2TWiy1P0pfp+5T1qyP34
	TARWn9Bf6oNLT3YWJGo4lLOQ/K6wK/Brz49FiYZ1vDRqrn0qtbvB+4GpTkVTb4pT35LPFBc3mcc43
	eEurjZig==;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYp-0000000HKJ6-3bzs
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:38 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412a38e2adaso8268575e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956145; x=1709560945; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzteyAfQmYgd04c3xIbcEszPYVc0e3vP5LLdlStO4ro=;
        b=yHcwsb8ILYFMSlHnSZbbEf4wzVUs/A2nO3fOKObifVfnoXTbigDRXsb6hJ4DB6siIL
         3CLERU7IToJKxizfeFn4fC40htIqiuwbLHGVoAkrchO6rC3i9a0jNz4uXqrX/XH7/fz2
         +rer41HlpL8NQ8gpYVrPp4xDBzQTaw3xKQgM8KHgT92QuiFeFildaLcg1E58sR4+uqFT
         pQQpdj9ScAyKP4yy2lX8H877vS890LaZhMKgmrdW7oZidhREcvk1+L5/y1uFvXb7a2+v
         uls8vb5PgCVoujNLdo+q7JzlXGYnmLiwbpyT8SNeX0Mw+wDN7W/VwLpdUW+qf9w575sk
         vDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956145; x=1709560945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzteyAfQmYgd04c3xIbcEszPYVc0e3vP5LLdlStO4ro=;
        b=ERfo+psBOLZc/k05047fGKK6jYsmPK43sg0iXiIaNNio646KQsnESixYmyT2GI5VuK
         1xujskdFWPhqlNIc287cjjom7SNmb3V26Tw0+ywqsg3C7SR6Q5WyXBllZdBWdQo2FFrc
         dibTGMBwnC2ahVuMYRTtHnw8mwLQNclCxoyYe+HD0WgFpka7arpK96mU/zOXi9rDekzp
         TgKCG3TlgurSMvcrUTrnAby0N4rnajifcgI94FmgOHzcJoiKJhn6Uu2UHCDrTOtS0CBG
         BQnEhreOPjnx2HxVTnOEBUUd734gYu0DCu1R1gIv7w5KsFRqnq60b3XRYO0hi4/zYTeD
         kHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoLB2nG0WO84FUbG5nD4y7bzYpbqJig4aIaf4gOEC3r8lR497ZFuOvxhEJumetyApmy/j2PUAS0s6uNqEFfnOfLe5aJFph4ZNQYqCDzV9qLaZ/
X-Gm-Message-State: AOJu0YyGveaeyeVNYrjrp9q5qCAWPNZfGq2s8UfbxuzuN1yv15/scA9Z
	4q1kJM3/tv4DH2zWrFl7/mdOrCuRvVwp/AIddpGKrWTKyvfDL+rMvXlK0d/tjTk=
X-Google-Smtp-Source: AGHT+IFc3ZtCNmpbpEYAJHKn2ZQ9YqyPoGmBc4eBeC0117sAQ472ltXWjc/Xa516gqcnqMw1sOOt8w==
X-Received: by 2002:a05:600c:a001:b0:412:a47d:1fb2 with SMTP id jg1-20020a05600ca00100b00412a47d1fb2mr2070382wmb.19.1708956145474;
        Mon, 26 Feb 2024 06:02:25 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:25 -0800 (PST)
From: amergnat@baylibre.com
Date: Mon, 26 Feb 2024 15:01:51 +0100
Subject: [PATCH 13/18] mfd: mt6397-core: register mt6357 sound codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-13-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Z2yJ/oBlNczeCIJzQKH6oIlg8xoLP0FDW9ftHO97UdY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncCWphAeGutpqeyL4/OPzJoTjMSUOe7sBai3g6
 KqqPwIGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURT3eD/
 oDk2BfGI180002+laCNdSwG+8z26O11oUe+X/vcITvLRl8uMowpsX2Oia6rHtaeJPd49fFMgyUOtDs
 0uSjOeVUMe45iYIOiO+dGqIn59SpKw13K0I31SEsg8661CYSTrUJkpKX3DsLbcDAu6wkg/t7BY3TPT
 ELDPQZlEUPun5D8HIIiNND00hiLwznLngaPPr9ju83cpvSrmsKngPH5uUEDFQ8aRL8jB6E2ue+5ePA
 tN/9r+yw/ID3Z42bTGjN1DumsEKB7hEqM3+dn82SOwsYK9e3G16spC7a2f3xwUkbNEDVAtkOT+N+9j
 e3loRcMxyTqSh1PWd3ByYdW9aV98q0rIcvxlkJNINdHhglQgWgGRNQJTXHUfyj4eEAbYLSlX27tPnv
 X3LJQ7qBhetlZcd/OR4YUcgWxF2L7AXwytkKKpv74Cv1kfNvrUNZG3TVO7C/DJzItl9yJqbTRdNkSV
 Vnlb+Zjcl75QjgM5OsgAZ0rdR5fvOEEmXEEJrthVt7qTY/0ozZVmricnmd4Dktxjg41iHqFF/7E4WZ
 FscF9yqDi1c0990MlHE/WcHu0TBepjrpd6XHKE+1l8D3fetAhFuGgNrD7RKBWgUb/E55GPU1bVl4rZ
 Lijf6U8oITrWDehsCRAyvjTtqEximqHMFOv0UsiSeSUKtNkIyoy7FmYMhdZQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140227_916414_1A7E92C4 
X-CRM114-Status: GOOD (  11.06  )
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

From: Fabien Parent <fparent@baylibre.com>

Add MT6357 codec entry in the MFD driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 4449dde05021..4fd4a2da5ad7 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -141,6 +141,9 @@ static const struct mfd_cell mt6357_devs[] = {
 		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
 		.resources = mt6357_rtc_resources,
 		.of_compatible = "mediatek,mt6357-rtc",
+	}, {
+		.name = "mt6357-sound",
+		.of_compatible = "mediatek,mt6357-sound"
 	}, {
 		.name = "mtk-pmic-keys",
 		.num_resources = ARRAY_SIZE(mt6357_keys_resources),

-- 
2.25.1


