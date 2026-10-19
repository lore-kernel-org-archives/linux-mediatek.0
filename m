Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3937CCF2DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 06:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=; b=b+kuPvgyKFJwNn
	ArfFY6G4J27eDoxqU1G1jLUEml5yzXDtbhk2OwgRi1OPWYdPwMrLgE4FZSKmu9YblaEPUkc7Q51Uz
	OKkGsjVRGX2TXYRySY07puB58IQRJO/lnMf+0kH6bCuqhP+SbrZ4/X2Q0cNZHLjBarckwVlMGR6rb
	tJrsOo5rZ0RkTrg/4Yn/Jvxyfe6eoFKYGawAjJ0HrOYqv9cnBca+Ac55zDl8huLck+D6qoWdhtJ0U
	9P2rQSdJbxVrO2N9msINZgbYtf0rAEkA4R3s/0KiD/HeP8qJ+wK6qPL7twdxbQDoGc1l4aoxO85UK
	bwLvKJ31YP9jQYJw0elQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYI-00000006frS-1j0z;
	Mon, 19 Oct 2026 06:08:54 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYF-00000006fpz-213i
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Oct 2026 06:08:53 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-14394530ec6so490337c88.1
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2026 23:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390130; x=1792994930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=;
        b=DmwTyHIpVsaBobyk76puoGf/UEaKGTzEAmovEfl+omjypOEsb5RME+QFEytRzA3kR6
         u9yogh3/R7chWhBdG2z0n6aOQ2KgUQEG3llqTMgEZUZkKvbmy52nJt43G159i0kuCZnU
         6E0TN0F7pRNbrnwTrh6uMMSt0bA+FuKhoYyMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390130; x=1792994930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=;
        b=FI+bjZm5ZF1NNtD3LWmHGaeOYZj0aX3VL19By64h2giADn+nS0DIpiaGPReRoqByxL
         qo8EvUnLRDPaZ2Q65DAJDlG6mqfb271Y9ZShZUzk9m23JxEzrv+UmaEImAPRhhuDejJw
         mJ4IWNxVY2ikOOzPyKZUm/PLd6D9qrOn31lPoa/gjz+x/omUwYT6/5VmUS+or3lxBsGF
         GjcxXfId93kJ9C/CZKDk6g5mCw9ukmXLSqlboxe4yopz5hYxwbUqmDLACSe6gQzfixQT
         VzkaNg4oxkHnnPiHa3e+zF7TTkwdRbVt9CkCcaRAvgF6sOWKfQxB4hM+b9XgkI0MbR0n
         +FIA==
X-Forwarded-Encrypted: i=1; AKwUvBzslTObEe+r9UnbU+WWVDQmVQ2SNjMSYegfwz6KBLE0dn4OWoNX/LZmrVp9SemyC5Ww0ivjpYndPP7cp9snbw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJzaGO5aaaiq8mLX9aVR1lgGBd2bi9IA/jKwX1GH8UcUrN+8JMm
	JvvFaQkd/1QWh/rYbRKdBiPrkqD7a5EhPGstdcrkUMFXNokl7BmHyMuKuo9J1tifGg==
X-Gm-Gg: AYBFou201ax6kU7C4LYHRSczLcWjEfjK81B1AoB/Wb9XctK1u9TKkKJtlXhMxakTFbH
	e4Wph9TNiTrKf7lSqJwXWYKdGfqtSNW12ddzTO6Zcu8aVCjNm6dt1enfAgoB42P/APdEPCg3Wp0
	rUR8APpVeiOzQhp0DoSANcFRdXWPgCRqinneI2kRGFSUwuXlr1zdiLR7aqfcJmKhncBvLuYXGRp
	3CmmnqLrM/ifOAUnmLWNcq2nSvW3y7jwBVVHpWGxG9DSPpXtpA+0Aq4AEhp802ll9Az2AIuaiIb
	cn+yx7fva/LoMZBz/z+oZYbWhrbbFGu9EGYcHvGJU9PBjEbRBA8iydq0UwQFPRkEbYTBIf1EYBC
	SVxxfrMyf2OkW/ReFweJURnnWVS5ke9Zr3sDhYqo2+02MjPwgVK9/CpRLVle0nQX6WaReO8SqZX
	2jIOMH/9vw53XSSzVq+WbeksPNAv8vnA5eAOo13vKCW7n1PzuhOWfRfP/RUu6fVXvJaRS/ZHl9f
	N597TojnqCyRgD7Qo6TgJgZ97xgsWUzW3M7rodKB+ogm4sjPHCjJwOksQ==
X-Received: by 2002:a05:7022:170d:b0:154:d06c:e70a with SMTP id a92af1059eb24-1851285ca17mr9287698c88.23.1792390129597;
        Sun, 18 Oct 2026 23:08:49 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:49 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/2] media: mediatek: vcodec: Fix NULL source address handling in decoders
Date: Mon, 19 Oct 2026 14:06:18 +0800
Message-ID: <20261019060825.4163770-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_230851_554512_C15ADF18 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Both the stateful and the stateless decoder workers peek the source
buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
returning the buffer. The buffer stays at the head of the ready list, so
the same job is scheduled again and fails the same way. In the stateless
decoder the media request is also never completed.

The two fixes are split because they fix different commits, and the
stateless fix also has to complete the media request.


Fei Shao (2):
  media: mediatek: vcodec: Return source buffer on NULL va in stateful
    decoder
  media: mediatek: vcodec: Complete request on NULL va in stateless
    decoder

 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.56.0.176.g3575e65682-goog


