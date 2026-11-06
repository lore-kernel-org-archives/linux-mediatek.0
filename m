Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB682606A328
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c/tHTFIC;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F9AEB5Le
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=; b=c/tHTFIC5tZWSNrN7J+GCeFid9
	I/GRPgKrlgXRRcPmF0J30tKeYWBCP2JXswAM5qakUoKjR92saftYHXWDXqbeTgyCVqhEqHKRBEvR6
	pnQoa1e3Wbrd2jvrR9dtChymIT9gtf9lJ+N8vmlwgRRmIhwv9x3K9ZMUnOb58s6APiJxRn0dSqYSe
	s54RA9f6IiE8G3P388QvrOJILzHj25i+QjM4j0Zl4v81h220LKJqnOP5SCHycCLbCzHeqfrx6uOPr
	QyF6GRU+gxVuHCbqaxCLxKh0vq+75OIEAo91ikU+/5Gq+No9y8VBiAovnv9mp0aA3ivp1rZbehrwi
	DvzJhzRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD5x-0000000BJYh-2h5h;
	Fri, 06 Nov 2026 06:06:37 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD5u-0000000BJX3-1K02
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 06:06:35 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so370986eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 22:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945193; x=1794549993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=;
        b=F9AEB5LeW+pAeK0HfpVtKB5Tjux2HAoaIzzHkkqtS3hoVoL5cQZwnj2tBTygKoAm9s
         52mkREbOxu9DQtZ+6NOcRo1er3sG/ZmjwNTnkcygHJN00IhWLmNG602kPf94ilXPIsea
         qRvluycgWGUY/0gKhyM0h7Hsxq91P73qCFe0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945193; x=1794549993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=;
        b=NU84HnIK2jOWwMQPtovLpASCJYJ2XPe97HlP0gQw/1UctgRAifcB/D5bFbfStkHmhy
         8azyz6KlNNTwDuwfjCxcC0YiMpI0yWnfHVvukhNe60mf8hH3shjUse5SMJ5LkVOcoXeA
         vKype9W84dQS46q5mTCea+EIdSV8O1cJgF+Ak3vxEqYkepGZE2d26hVfDeyyO/l7boU8
         +pTDbXSKcbNKw8D5wJ54WdYshXAJHNmCVqYQM6fmyylx45oFiw9VArcKFmlcIVD4QEI+
         cpJIBM6ZlNtfKez7Q3XuwQEw6x9CB20uIo1r9QtVZVvaYLgKQYZB7GB6V8dzpJeVE50y
         6anQ==
X-Forwarded-Encrypted: i=1; AL+hErH9r3R6AX6Y1C61ztdJIjO87oy9zw+9QpgSm6Igs9j84lx2zE47h4W/Mkn1Y99Un4GN9e2I6kti56GjjhWUcA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/+8sdqdFBmBmke8m97iyO1t6azzDc85qbsb42h5ylZX+aint9a
	IhcDapEe+UKFBqk8TTXpfucACTmAAUK9xG6pfdyBhzo0RKcnDj7bCZV9H/sHswBTxRVrBSluhsO
	AZOg=
X-Gm-Gg: AYBFou3mtyqHZf7JCZoZljTS597RMe6nnrr5XgXcNfM4o66KKo+N4avmGPKJV0STK3l
	Gl3JotRlj61GjahXU0QTMzIU2JM0oGWY6DVewAl468iHBD+6pn3v9T70ovHLGjwiRHifwHkXmlu
	eyJeoYct13ogPIqoDWMGwuDbTLnvpNbT1d5mpT0sn/k5kpV+IMHrnFwF++FV9ZvCczkaXPlHnY9
	/d4yJn5pD83rpVVD3YX8hVrcvC3c1nWn96RwwbXcC8lMtb8GMl+lL5V8u+g0QDBc9+DbV+WAsJM
	29by1EYgnNHGS8ZkwL6lARe5AlisnIVFEEooSTvHhsP+U+FrDl6Krrv25qrE5jPnqXldv7cmnka
	7Kpi4PTNlWt4VDfWEjyxZ/FjUNmQbuWPxAwqgvFWpO65F+4Z+aUz5EiJbsm00OnAsH+XXV1XVLQ
	uzzL/rZlRP6M5qB0VU6nu67eJcyrPt6Ufzf71OT+rp2azg5Ut+PIlwBHUUI+utH0B7LGGkhyMrl
	/ORJ9kSv0w8SAzvexYkgQ82NvfQUoBjBQ+29QreuZ3KiXtxxw7RCvMBg87ZzfdPMQNjZ+SHPtCo
	CwcDYY/bWwYJc3VO2BfhiSatrrW3jum69QtFs+PTa6jrWrzOZf6E6YDeLk0dTgylKelR8HdneUS
	ajqr34ghHn9vJ4Q==
X-Received: by 2002:a05:7300:f586:b0:36e:2b8b:a09e with SMTP id 5a478bee46e88-36f76c1875amr1931679eec.34.1793945192713;
        Thu, 05 Nov 2026 22:06:32 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:32 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: mediatek: mt8390-genio-common: USB fixes
Date: Fri,  6 Nov 2026 14:06:17 +0800
Message-ID: <20261106060621.2706658-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220634_348071_645EAD81 
X-CRM114-Status: GOOD (  12.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is v2 of the Genio 510 / 700 EVK USB fixes that came out of the
MTK XHCI binding fix [1].

Changes since v1:
- Patch 1 now also switches the type C port to a source-only port, and
  limits the source PDO to 5V 1A, matching the hardware (Sashiko)
- Patch 1 now connects the SuperSpeed and HighSpeed lines to the
  correct USB hubs
- New patch 3 fixing swapped USB hub labels
- Link to v1: https://lore.kernel.org/all/20261103083335.2944847-1-wenst@chromium.org/

Patch 1 corrects the USB type C port: the controller operates in host
mode only, the data lines go through the onboard USB hub, and the port
can only source power (5V 1A). The block diagrams for both the Genio
700 EVK and Genio 510 EVK were used as reference.

Patch 1 depends on "dt-bindings: usb: ti,usb8041: Fold in TI USB8020B" [2]
to allow graph ports under the TI USB8020B hub nodes. Without it,
dtbs_check will complain about the new "ports" nodes.

Patch 2 moves the pin mux for the USB hub supply enable pin to the
regulator.

Patch 3 fixes the swapped labels for the USB 2.0 and USB 3.0 hub nodes.

I don't have the actual board to test this on. The changes were only
compile tested.

This v2 patch series was partially put together using LLM. v1 was done
by hand. Sashiko review comments were fed to the LLM, as well as the
datasheet for TI USB8020B. I manually checked the PIDs in the datasheet
before giving the datasheet to the LLM. Same goes for the board block
diagrams. The changelogs in each patch and in the cover letter were
also put together using LLM.

Also, the LLM seems to do a decent job at mimicking my writing style,
even though it's a bit more verbose than what I'd go for.


ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-11-wenst@chromium.org/
[2] https://lore.kernel.org/all/20261103095425.3097720-1-wenst@chromium.org/

Chen-Yu Tsai (3):
  arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and
    connection
  arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable
    pin mux
  arm64: dts: mediatek: mt8390-genio-common: Fix swapped USB hub labels

 .../dts/mediatek/mt8390-genio-common.dtsi     | 76 +++++++++++--------
 1 file changed, 43 insertions(+), 33 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog


