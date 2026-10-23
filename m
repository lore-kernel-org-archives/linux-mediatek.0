Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F6606A31D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 07:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OyCibKBv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=At5IDPwb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=; b=OyCibKBv6/RoJcLXIjTKY48R0i
	1bRzv6XN3FUTOkmPVwmH9qS4oE+ZcTrvWTsRpih5q4TpfXj36wOl5pv1Kxmb64Xu0Q56li9iedScF
	8uyP3fY1SK0JL+KvFYTFSg13dogdu7pc2iXm2mmrPpvuXTMDaowOp4wZfLtfcHWp8ntpldWvJ6/Ac
	Z1bj7fUiwA3uHaLdtMV/hcSco73ljJ0Ff5qeKkPExyk1tQRWZEIfXbVZ54vPc1qbNJnDEQDaXY5OG
	V2TG88mzIdw/SX972kBXKoXVCGOW9YC9cNH947x4Q2mHaQ3tx3KkGM7SPJ8ASs45EQv+FCLqBbe/X
	ARetZAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA94-0000000FpRt-163V;
	Fri, 23 Oct 2026 07:56:58 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA91-0000000FpPm-23e7
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 07:56:56 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so482501a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 00:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742214; x=1793347014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
        b=At5IDPwbr9HunpECIaioGQGJDyX+hN1vdj9EHG5jJ2uee7AR1+ne9zLQISwFKz3A4v
         2uLB++rC7GT/CAZL8cuiC6AFoELYWvy5LgbuVGcsaj9lwNfeIj2oZeQNSE96yIsIfd+c
         KCtH62/BYqudKA2XzSA9+0RG+GFVqKOEq3nzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742214; x=1793347014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
        b=bJCc4yvcFxj8Zri/40RohTK0J6vfC6/4cYaqmar/B8n7PL55xxCQpV1jsEbOpYUnlO
         8jhFwMm+sUgVYQvxvru58tk4WZ4yISlEu95DQljTfmY6lIzJkGIlP4q0OU7fpJ9rz5Y4
         8PWwquP7jUR2G8+que+mNB8XPifNhk84l9pQnptwOqXnGKhvj4kQP0xcIoA6RtjbtjmA
         AfexvbWio8w1Lx/7cXelgTT0GRaMmjeqrICyXuULgCV6Tb4CBLalqUIuKhLtMpw/j2a8
         81fLe6oAn07b2N0IXCo7p9fsECWxjOfnz8JDbvZKXV8FIyf79xoK5Ic4hMpTvqoSaB8/
         8Qxw==
X-Forwarded-Encrypted: i=1; AKwUvBzksmQWjS9LMY8K4NL7tO0Kiv2flH8v4CmihZcnw+yHgiRGOM4HowLw+41QTgEHgh9pqtra4pvWwOvgKPJx3w==@lists.infradead.org
X-Gm-Message-State: AFq9FYK6HRjEzjt+tE3AxjG8VqfHVV4fst1kefZkHnjVo77e8OVJt2u2
	1gUYM/lrDDC4OSXmaHCA1gasev15NRYTqVRwu8VCZAO67JVBpnS9B8hGi5ixGAvaRQ==
X-Gm-Gg: AYBFou1INe9Ah9qSFHZxWLWr2BQ0IOWfoE7RkywXEPNmvRTu15FQrzjgtZdy1LRFcaN
	GpUjDOsJArS1NYBQlMS28mayMIFUP2yaaW4pB3WDn1GgD79d4tU7czbGLU8HnkKbighAsXHH6Aw
	4CF9VNle/TJZ5nYt7JggQK7mRM+t5mK6uC1uSZpSACC1qJFoTYb0j71m4OoiLM1B3sh/x2e44ia
	bqO7wIHTAqFfOpRUReMD++JNLK3q0Oc2nE0gShst03m0/+ppk32atpagHqvm+CBFMEFS88TWjjx
	a1fX50XyWWkQNdxP3GUNksogO7xBELqS9x4+P81t/gQLVM6pWMMyJaTG+vs0VExXBJgoupvLSMn
	YfBmTOMVBWAnkwthWFVyeHpWxB9trTuDKVZjKkqi/SbeAbJ7xi6msfNAh1e+g966EBJ+shdHTFc
	lDRpjOVGmZhx3tIcqJbuWfmsBNUOMXLqKarQ1eTQWqp7dLzmeOC7VDlGBamcRt9HoMDeceM+Ab/
	y+ueoOozsckQWzC2H8No6S+eVuwz9jdYE8g2pI43nUcKXumre+afGN9WZuLoB4RK+4tfT0NhMB0
	0dUbB4vJAtrm+BIcaZqC9bWN+vWSdvzM836nwis=
X-Received: by 2002:a17:90b:5246:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3adce7dd700mr1102279a91.34.1792742214339;
        Fri, 23 Oct 2026 00:56:54 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:53 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH v2 0/2] media: mediatek: vcodec: Fix NULL source address handling in decoders
Date: Fri, 23 Oct 2026 15:55:18 +0800
Message-ID: <20261023075642.3671805-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005655_569626_812D4A26 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both the stateful and the stateless decoder workers peek the source
buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
returning the buffer. The buffer stays at the head of the ready list, so
the same job is scheduled again and fails the same way. In the stateless
decoder the media request is also never completed.

The two fixes are split because they fix different commits, and the
stateless fix also has to complete the media request.

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.

Fei Shao (2):
  media: mediatek: vcodec: Return source buffer on NULL va in stateful
    decoder
  media: mediatek: vcodec: Complete request on NULL va in stateless
    decoder

 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.56.0.257.gf7497c7d27-goog


