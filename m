Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63366C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39401613C9
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39401613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dm5Bw82xNG76Vit0kGyUvAufZL23NjqMqKwYWffGy6M=; b=ryNH9u7efs6mk9
	/JqbJqb5bdoUcBVgRcjqBMb4fv6dVMS6Ah9+NqgfTu6TH6xkRNNkJN92eY98cHtFMr20cvL58XJ9+
	plKzY1irG8J15FevSW7TU/IYGTr+YIWeJf2s5FeQ8H54J2kNLjDKkTlXl90J0tRPUoOTU5u6+Ws6X
	ZHj5TeKPCtzIMM4K46ZxSal/VvPMuLkaODJORQ7ytOp0cQmTpeWgc+xxjo2XX0w4AvPcIGX5qGXGQ
	WZMbvZHH3itTsK4jR2XP3ikYSrCjXT6bnBtjy8xmVGAUQ6WWgLfCoSRTzhrOsgUYZRKCOc1AfOFIp
	AAbYc6G0buBQ7rZ9yCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HF4-007qnh-0j; Mon, 05 Jul 2021 05:34:02 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HF1-007qjS-0l
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:34:00 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t9so17243486pgn.4
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uXyqnOeoyJ4NZkEKPJHOl4w1hXSWWEzhqLTMS9dPfWg=;
 b=Jh1hPoDFYkVXHrWRwuJ4Scju5gaiBoK7/WyLA8g3EzRjNl9LEdaK04bb2ug55bnKea
 Pi9pbq/1u5IRfMKIl5xqpWvytO1MPAGHaA2H3pzWiwJXXj19Me1P0oTsVn2TUakHXHjo
 1NxcGOQrBYmY01tKHLlVEnWcBvvxqXJrzTSz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXyqnOeoyJ4NZkEKPJHOl4w1hXSWWEzhqLTMS9dPfWg=;
 b=B787XQyvB2EPQtGrQiSp/rdFMgE2Lb+dVKLqpIXd3h+yqkm3MjFUozr26zDCoSQ/AS
 0pFYVB+N7TlJuHBPKGIVW2rveO1MSpjm6JcbRVDBTPrtRL4dCeFSen91UGtx82eGlVTL
 qoF15ftKmNCylfOHWia20fqvLPzcf56U0EprnvyEm0cwsAL5THnmsataqgUeJhV+++aL
 9yjUMB6pVYkQxy0Wt/BmqwJINkScfnZKcUk08FdaqBtCX7PpZTr2xrUEBRVdpQGi/0Hs
 I1jnnYP8Md5qKT26Kq518/We7/J2MH7Sbi5v/a5NtnoRPPEpLhuDJ06E+pBjNJ5QgKZ1
 GtJw==
X-Gm-Message-State: AOAM533MuDyDPCM8e2WdpWOe0/2t30QSlaPusrD9LLYxKANMhOMPkZLJ
 si/DLiif1cPvgYFhOC6Y/qc4tQ==
X-Google-Smtp-Source: ABdhPJzcOf6htkQbr6g+Z9QUaRVopdGl4FPYu/027dmu4bdfATz1XeYdyiDTTv2CEipoO7bU+Z03MA==
X-Received: by 2002:a63:445b:: with SMTP id t27mr13940726pgk.413.1625463238016; 
 Sun, 04 Jul 2021 22:33:58 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:33:57 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 13/14] dt-bindings: media: document mediatek,
 mt8183-vcodec-dec
Date: Mon,  5 Jul 2021 14:32:57 +0900
Message-Id: <20210705053258.1614177-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223359_086348_7A1DD6CF 
X-CRM114-Status: UNSURE (   9.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index ad1321e5a22d..c44a6e6943af 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -10,6 +10,7 @@ Required properties:
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
   "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
