Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF8E606A322
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sJMoD3TG;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vk0w86fF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=; b=sJMoD3TGoOMeijUBONbJbfeQ2A
	5x2u+SNCFjPa2iJET0LtV7o+5QnK0ibnYyMjZ8ChCJP3RVHYBSqwNgN6fRfLzN+O6cBPHm6voIpZY
	WU9YhrLmtIOi1jrK247lEqN1XqyeJ+XKDPsDvoGCFTiqYhn1dJHqdkbTR6jyAVN24pcc8/WhsdrAK
	Ua3Zire2j15smz2Ke9xO2wYgh5CDfAH+0Oqz1ulCVXwPD/c5Y7pgOWX/+gQpOSSr9VlGDfdTg3S/M
	w4f/mUuUj7CNnSv99lSM0FQbQiUFELl/sTdU7hD7Kuz7d0G9IdFew5oHc7t4oeS+8AcqqDxOQwNqP
	Ffr7mXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ74-00000000uq4-0OW9;
	Mon, 09 Nov 2026 14:12:46 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ71-00000000uov-0jX1
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 14:12:44 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1572548eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233562; x=1794838362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=;
        b=Vk0w86fFNp2MgHUNB/WN4wvtBP5ZJo21nGqRaTRP9bKs9+Hd6RhaK8z82fbELBuBxe
         kzOWeXsBeJ8Fn/vLrFQf0BLR9Bok7DI+XSWPkeFMwrainNq0rlE/7I08KIZZTHChID3q
         VHUNEOoiZnWi6uBRxBdPYtGsvpVV/k9n/K5kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233562; x=1794838362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=;
        b=rT6V81f772dOZiywcLDBxwNkUOWs8IWVEfMUXcYDrpoZv1TuQnIobr16GkVRLx21VR
         mquP8EgRtW+KHK+Q9Bms2G2fw5d/wNBHZCEEYIGCpHwsYzbYawk0ZZzhpTZHsh+AsEUJ
         qhkgBshSmnpPaeGTBNdb5NnYR+pgbshDPCNbos7Ug2YEObXnIf4xs8oaYNKCzVMiEjG6
         WZmdKz5vxsxSPSbA5VBPVdkC3/mOeySCABWdXaoGx7oCh+nQB5kd1DeLZj5tX83JtcQ7
         gFEMBOqOog3zBizAeirqOzbOvIVmnqFxjriRk+bTuSHO9XF4CZPnt1J2TeP75rqhmDSI
         Qpag==
X-Forwarded-Encrypted: i=1; AL+hErEPyBk53mHU2LnPAtKbZV9uZKIOsl8xbSSRYfzeMp/qkXfx+64lUlyF3ZGRyB3xbQOJfsAit6OHsJgy9zLfeQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z85DragMiiYa+iNXXcMldY7Xh8wb7J3JyTtyVpt+dMEEJ4dkLDU
	NWDPuoulnBEbWi2h30VJyEc1osXwfJnRUwKZhCX6bj1b41WLxv1+HXAo0SlJpYqpeQ==
X-Gm-Gg: AYBFou13uT7DJ9XLg/GHZdmT/z00CuJ0H9Qx0pTBVQKyxywjVpglYikV74N8JQRdngY
	21BrRrR5DE14Jauj2ItJnPp6XmMu1Umd5KDaGGy8gtnZ64aSjf6vciltrAktuL7HnQvXrn1x9Mb
	7ZQ8NTdT2UXbohaYXVWoqBElrglv2/3D6VtbKdJUn5PqCU8ZdB/bldwn1lq67RAbSfUgzsE0Fvo
	naB/2NlodJxAT8DGwSlR137FER1TdTUIzCtqrU8KToRjvDK7+1WdVeg4RO7o3/UGArNEhN4r3RT
	5m8ufF/SOIxlQ6phT/xqfaalH6KwLNXuiNsattP3gUMZba+FqLXw267QzkSOB53HnCZsowePzjH
	DiCTKZK9wGmGNvOEadtpRoW1IImNxawzoysIHyNuOpK7W40Ghe1jU2kbg0KVWGQtCOg4cJ2ovGa
	97W5dVC2bA8T2ZxaZFLoQLjGrGIwWA6rAvSXvSfWUvgBIKm4Uw4e/0f0Tl4RGXrBM7cwbb9ZwjK
	q61ZtvDWgbH/4mnDPhaLR174zmhvY9AmcTSG5X2/xo+UWkdNQBF2Mis7Ar72uj+xM8/yVh1Q4Mo
	lkWM8hy/oiyVDpTajUWU4/Vdqztxsb0lPx9v7ddjEg3V0tAZ1VNko1qRBqQTx0jWdGSu3VatzCK
	iL0QLUA==
X-Received: by 2002:a05:701b:2505:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b39febb929mr6132872c88.33.1794233561859;
        Mon, 09 Nov 2026 06:12:41 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3771ea85bsm14374676c88.18.2026.11.09.06.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:40 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: mediatek: mt8173-elm: regulator cleanup
Date: Mon,  9 Nov 2026 22:12:27 +0800
Message-ID: <20261109141233.983830-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061243_259785_A0F397DF 
X-CRM114-Status: GOOD (  10.79  )
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

This series aligns the regulators in the MT8173 Elm / Hana device trees
with the schematics and datasheets.

The comparison and digging through datasheets was mostly done by an
agent. This was an experiment on my end to see if it could understand
schematics and datasheets and help with the tedious process of comparing
all the documents and device tree files. I think the overall results
were pretty good.

With that aside, this is just cleanup. It doesn't affect normal
operation.

Patch 1 removes properties and labels from unused regulators. The nodes
are kept around to fit Linux's behavior: if a node is found, Linux will
consider it well defined (constrained) and turn off unused ones, which
is what we want.

Patch 2 fixes the part name of the secondary regulator IC.

Patch 3 fixes the regulator output names of the secondary regulator IC.

Patch 4 fixes the voltage ranges of the connected outputs on the primary
PMIC.

Patch 5 fixes the voltage ranges of the outputs on the secondary
regulator IC.


Please have a look and merge.


Thanks
ChenYu


Chen-Yu Tsai (5):
  arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
  arm64: dts: mediatek: mt8173-elm: Fix DA9212 compatible, node names
    and labels
  arm64: dts: mediatek: mt8173-elm: Fix DA9212 regulator names
  arm64: dts: mediatek: mt8173-elm: Tighten MT6397 regulator voltage
    ranges
  arm64: dts: mediatek: mt8173-elm: Tighten DA9212 regulator voltage
    ranges

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 78 +++++++++-----------
 1 file changed, 34 insertions(+), 44 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog


