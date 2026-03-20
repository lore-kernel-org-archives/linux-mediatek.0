Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4951093180
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/i+XiMvo4RBkCmrsB/NhsQRMMdemw4kFlJaRryPfTs=; b=iqhHg+3UnlP2VWV5+6rI4nUVBb
	n2QWnS583/ub/ayt/3lak/ihGhrdttHDTaFzBw3ODNIHq6B6vX5CM0tdD9F0/rFBALEyzKG7ytEJa
	XYz6pJA+mmQVST44bU94+9NVTXxLyNUVgKwfv26Uc7A//mAV5dIS0f5FaBdGPN5Sb2HJ2us7GRx67
	TsDd+5CmoHfRzmTuiVWgauQr1eCcTLMSjScLjtB3x8R9NtBqMsA43rfChIKrC/n7g2Ot8ualYGduD
	Il3uQMFBod4Slg0+J6MCaj/QItZvN3yUjzcmjYZxYBELhEPPmZvqAEzhrEYpZ4J26IrdrcNoRdrxT
	bKWW/Vew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCS-0000000CEyv-1v2z;
	Fri, 20 Mar 2026 07:23:16 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCP-0000000CEx9-16S2
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:23:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c742882d2a4so128257a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991392; x=1774596192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/i+XiMvo4RBkCmrsB/NhsQRMMdemw4kFlJaRryPfTs=;
        b=byqEfylhCZ9l767keTfgKGWCIx0pX/pkCfm/Iue7KyBFbx0BjiWDmw8FQo4TWvqjdw
         /sDpiHs85lUtmThelIrkyNO7DpqivKG0R36TnYJFwk1u47nHXKwdycfJjqTxO9GJv5Hl
         rQjIePEjZcAzwkQtjGhA0RLAWoxSPq/02zyz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991392; x=1774596192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/i+XiMvo4RBkCmrsB/NhsQRMMdemw4kFlJaRryPfTs=;
        b=LI+Ap5XZd6gTdthxK23OJCOEgmLYVS6LesjUx6o8rUbKI5d8n467CzRjDAUbZlCWw4
         bqa9tHbK0AOLWg3t3Gnt3mM1IMVt71q7t0tMqMpRlgoVRJ71pcFjV9e+1rI4tY03oOlA
         Iu6T/IzhBbF+Rjy0GBhx3GbIW5Nwd248EH6ettwqsOM86fvRce1u4XuQGLvJ5+ccfgC4
         jFAa4cqpY99gHxysIthInY18srun0fnO/Z8Vk2er5PuP9bzuTnOca0svKNamcMcqqP0P
         B2w6+gRbEBMvwoeLW+b6c/PfTEzUB4tlFDAOn4ocybIHbIPb3dHmYojfxOp+4DfsdZfZ
         gSzA==
X-Forwarded-Encrypted: i=1; AJvYcCUb3ZgEJiwc8qxmoi2HMfiDhkN9XrO5cqijVMBpZp+29isvVLkv38RshznmqnxKo8snwqT7OF0/gstKxJvRHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdhR61i4YO7AJ3HlfnqmRVF17/xVbMXk4z6qiFHRwJlg+VQW2W
	ftzZ7CnoPQmbTGhs+PdkkLd5njQ8suNfakwKxjxEdgeOTmdsH1Z95eWYpML1U1u7nw==
X-Gm-Gg: ATEYQzzdVGMVfLqVhmBUDOsSlMBEganuwOaH/1sfjXTqrPyVEjOMAQxaVLqNKH8gM5W
	ItMPR4KpnXZ9pqQY4SsI8zsqQcS90jrNMOn5gbukZTfYxSgeqczexRY9Ow2KvHYEErgI8vOaCdA
	QZXBaWE7SS69AB9VZsozcxg0RCLJ3yg3wG2LSLageRjzUPGdyPzGLTmscP/WsgvZDNNgjf9SGF4
	5VrPAUUXuFohpTy/lhhdiZqpnj0enTWg3kSKTcCHxtz3x8Vq+OeD8wU3/vJMMhG5WRVg4p3XlVe
	R+rgjR6dEbEIjMwAfdtqvM5auTvMhkykMoVFqlMUCyoKbNp0aD+NEbyTql82gWKEHJu0KLTUf1b
	mQvp7+AiRixoz3ad9um34dveMu1j0fIrrUURczo/NIjQlU73I/h3uMF8XB0jmvFX934/oztB9Wf
	az6J/jnDnSeYSBeY1L95ob9a9Nckblv3UFOgxcoo9prSrYZRpqfOXqevuxYaPKMN05RFKaywYgH
	Htp+KYuW2v7aYlwkXc=
X-Received: by 2002:a17:902:dac7:b0:2b0:7224:a4f3 with SMTP id d9443c01a7336-2b0827eefc7mr19316025ad.48.1773991392395;
        Fri, 20 Mar 2026 00:23:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm16728365ad.7.2026.03.20.00.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:23:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] regulator: mt6359: cleanup and add supplies
Date: Fri, 20 Mar 2026 15:22:59 +0800
Message-ID: <20260320072302.2402489-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002313_387397_B77348FC 
X-CRM114-Status: GOOD (  11.72  )
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

Hi,

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  regulator: dt-bindings: mt6315: Add regulator supplies
  regulator: mt6315: Add regulator supplies

 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 drivers/regulator/mt6315-regulator.c                | 11 ++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog


