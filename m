Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA8B60850BC
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDdUYQsg;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=izuVT1y3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=; b=XDdUYQsg1TZ8i43FcgDkRms9dE
	MztryVXnXd7M7ij4Y8C5Lr39I5jREy4Br0ZpsIkEfWgyS/udkdoD+V243dG7fEwtSJBI8xyno381n
	NS30clUqto/n84vyueBJEaBKaZn+ONveSKwjuqsSOo4tOyHVgHFYj2oX+X2C6k3sgt+/DWr2Eom92
	GTYr22xTYwe/n/em7wgem0ITDf1AGRiIkGYRX8qVwDK8WjRNH6Vm10tce4pJm0O8ktBJU6PYjLBCV
	2PM/PiB701GJlvXuUSM4jijTZPFKX2gFo2wHlrJ6iUtBEebDsK51yLoiBvqiYhOWrUTXeRcPIx9v/
	Z/nKZ3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xj-00000001Z0M-42i2;
	Tue, 03 Nov 2026 08:33:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xg-00000001Yys-2jU4
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 08:33:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so278724a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 00:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694824; x=1794299624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=;
        b=izuVT1y3ykaCJjq9E8oPIjwVeHZ0nsNNlsJq7r5jhu1WKenxU9wDQ1K4DcknxAmFM5
         xppo8ihaI09k0pEuN6vaEfsF+K6zlwImbieQIjjk+Jg7XBSj7ItRj9yo6BdKKQpvGUax
         dk9HSTv9G/zUsqBz/zJqhnYOoXtrYFWDBhFk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694824; x=1794299624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=;
        b=C3m6bLBW1vDL5xKtBP5NCtT9E+hOuPO82ALhMSYAtAeEIYvGErT5srTP8nqjrgK4K3
         CPc45PVLUpG+RPImskZtrbL099tOway5imKc4SLEvL1omL6FJzC2oPft1lHFRICILlhb
         2rlBLtqQEOqRyvjv7QvaHyJcUA5QRiTZCkBTtycxztbia3eGv8xVu/YhHH16yAm8ami7
         Ts5Z+IFPRNOZ41sbSXiJW7aIIN8UbglayoJZzU3RKYgs/Q6Q24PLEfXvd5O0UdTQQrbP
         Srhh7LQfDFr3Hkky7C9Ub/kErDacygPu+lB6tGif6zhhc9e1lqGqP+LswAdc6AuBxs2m
         1WVg==
X-Forwarded-Encrypted: i=1; AKwUvByyj58oAVIPhgq4W8n0fgr+7Hh1Tu4zXAEZ2dudCh8/SvOHNYbR1ueaVaFN04HMmQkZsPt4AEXx7DJAnCvPOg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+PycfN61boG7KgkmCdjxMdFxaOKP1Zva7gCfNt+Bg+t3rtfU/+
	Z9IR+nmIcsk1YPfpGi/bA5dkPzE5QKc9x3cmPdF4xYKG/EznyIetqJLYtqS+pCctMA==
X-Gm-Gg: AYBFou1HndVQvCnggptZFviMoSy2iyWhqldbmPWoVpuXlbikZlt5X8EDTEP/JUGf7cm
	Hevy9cPXYZeZC4OPPKHMx5UJ00ouREFFm5aqZ7M6R9icbRPnB7KJPBKyYiuOlkJ5UEFrHXTnj6m
	KqI1LZqStoeDcdhjuoAN1FHjwhBdiwEv1ZFPEDqcKh+ZqNdmp1WOg0ZnwqnrDOF2r0lk0DeMQL+
	ojWH5QminLT+s7I1K61YfaCp7gJjDL4XzwHSMf7JaT3+q5OkO+jih5MFTszYMJszjRuPdXpeNIs
	fB44blbB+NZ7RXHdJa5DdwwFEPzBSOMoJ5Dp9buMTsdH88zh6TJXRckdZ9ic/4b00/dZyw/tFrL
	G/LqGVpt6vCxThK0awA/8fribddLIjHNaZ9Xu2kt/Ht4/fZIosoKfgnDecaZ9+Pj2WuvTH8iGyJ
	7q5yQkzQF1OlxzU+qR7vDASd4TmTf2Qb3GsNnEfKs+KF2n3s2lFTHMiPLq5H3NO2hQgfGOOT4D+
	+1qppyGZhVVIavEAZX5YCUlZaZ3h5lNYDlGWcnKQTLh0PfofKFkBeuR9igMvx/5LGKL3yJiTai4
	/cgQYL7GkMJbAV6uNK5OJU6yeFeF0gP5NTPSuX3DrF6YjQX593qDUJ+0OlK7abMchuxWRUs7cQ5
	YY3ul/GHcXKL+Ug==
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6781818a91.28.1793694823651;
        Tue, 03 Nov 2026 00:33:43 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:43 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: mediatek: mt8390-genio-common: USB fixes
Date: Tue,  3 Nov 2026 16:33:31 +0800
Message-ID: <20261103083335.2944847-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003344_720823_AFD8D38D 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

Here are a couple fixes that came out of the MTK XHCI binding fix [1].

Patch 1 corrects the USB type C operating mode (host mode only) and
graph connections.

Patch 2 moves the pin mux for the USB hub supply enable pin to the
regulator.

I don't have the actual board to test this on. The changes were only
compile tested.


ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-11-wenst@chromium.org/

Chen-Yu Tsai (2):
  arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and
    connection
  arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable
    pin mux

 .../dts/mediatek/mt8390-genio-common.dtsi     | 57 ++++++++++++-------
 1 file changed, 37 insertions(+), 20 deletions(-)

-- 
2.56.0.385.gac671c819a-goog


