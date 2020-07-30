Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62BCC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:51:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 813302084D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 20:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yBWDvkfc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ViS1JlQV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 813302084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZTkOpbctfv91xG35owlhW/waDOqgx/TNI0G3b5zO2SE=; b=yBWDvkfcjQRD6myM8KFSCKrMm
	Ow3Vb+cGdcW+pqs4NHtjGHbTfUmylb+5RTtUPoeUzQZFrFqlRJd9FFoaIEB0UgxTIA6lPn0CnwwbL
	z1BZiC07uBrSi6E5Tq2zTI3uaGDi4stJEU/uedx37EFvzb0uh4QGN8//ls8nePTaCfftNT5mqf9Rh
	BdCVcqlj0A85/5Mj+Jk1qbzX0bDrYjOsMsfBgsllftIoXYJMi/cyZYl10IC+vgwQyv+CkiR9juJTr
	7BFXs8mReqRc20tlcMerGGu22A5t6b30dozvfzC8OLhpuoOvIZGkfKgsOtPj9Afa7g2Ua1Hx4B/og
	QqcbNNlDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1FWd-0004iH-BS; Thu, 30 Jul 2020 20:51:39 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1FWU-0004dx-KM
 for linux-mediatek@lists.infradead.org; Thu, 30 Jul 2020 20:51:31 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id a127so35451857ybb.14
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2020 13:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=G95KKuekTz1iA7Zr8ZdyT9EdDFTvRs8dYtvTVOv4Dfc=;
 b=ViS1JlQVeIZx1+sasiczEhUQiJqT9BJ3+cGlNfVvdmsU9R2mLheJZdbOTUgKPav/+p
 5pdrAapxvRSoKlz+chL0Gy18OCbJssl+aqaycS4dtpZekMdniwmfHSE28+u/htN+H2l+
 lzAV54E++V9VAVcItllAAJIR59b/yWJz3F+UzYTyFBu/N5BqHonoSRohu96fk/lK3LEL
 0FlD+6rYx6p5mrUR2jhCMNL3Mk/QYxpV5o//SYtwl8PLWXae6OWyWZcWxICKQUEdXgj8
 g1z85D6nN1NBUXBVWo8pSEl6use+HV+VDaOcghe11TQpqrFnYk0mdJa+xoPyhRvpSBPa
 46FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=G95KKuekTz1iA7Zr8ZdyT9EdDFTvRs8dYtvTVOv4Dfc=;
 b=m9iM2jzW5xCryksMeZTPOGTBscDlTL25Tp16t1bMtHfmZm+o8/HEG3cIHVpl3gqKM0
 NsyL2yjGgbxZ5CfPOxOqNVQLgSuU4YYGIX5k3Hg9rDD5UTDkMD/pvPx+iuPmlTO2mfie
 Fj+mRJyfyOSU1gY0JHX9n5jWZteUlFodVFcvfQ4Gm5mVooAKTfjV6HySYqB2tJV3Sp60
 27NQg6iy7YxBvLD+Z85ujm70g8UD7lr5EXi09OpRHveqPkMN/YpNpVLxc56lk//UQImm
 edGcMtQR5Ud24/t9GX5QbjFJ6x1i5vf8pDa+eQqGvCP3Vz9OX9Jvc+uHXhKvxr6S4uyU
 ezKw==
X-Gm-Message-State: AOAM533wT1qh844WBbGeMInUcNKoKevndQEf47xY7M72Buo038juuRk+
 VJRzREeb/Hitnn0B+/qAGaMjs9OR+q8XSnYjFjo=
X-Google-Smtp-Source: ABdhPJx9IM+NZ+Dy+UO1H89OWuA1mQwu+ABN06cb8h6aN7Xpr4/KTHo0SHpRsO8t4uShHvxZa2ijHx26yaXliUNcOww=
X-Received: by 2002:a25:40cb:: with SMTP id n194mr1171359yba.380.1596142286622; 
 Thu, 30 Jul 2020 13:51:26 -0700 (PDT)
Date: Thu, 30 Jul 2020 13:51:09 -0700
In-Reply-To: <20200730205112.2099429-1-ndesaulniers@google.com>
Message-Id: <20200730205112.2099429-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 1/4] ARM: backtrace-clang: check for NULL lr
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Huckleberry <nhuck15@gmail.com>,
 Russell King <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_165130_697454_0436FD9E 
X-CRM114-Status: GOOD (  12.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 clang-built-linux@googlegroups.com, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lvqiang Huang <lvqiang.huang@unisoc.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If the link register was zeroed out, do not attempt to use it for
address calculations for which there are currently no fixup handlers,
which can lead to a panic during unwind. Since panicking triggers
another unwind, this can lead to an infinite loop.  If this occurs
during start_kernel(), this can prevent a kernel from booting.

commit 59b6359dd92d ("ARM: 8702/1: head-common.S: Clear lr before jumping to start_kernel()")
intentionally zeros out the link register in __mmap_switched which tail
calls into start kernel. Test for this condition so that we can stop
unwinding when initiated within start_kernel() correctly.

Cc: stable@vger.kernel.org
Fixes: commit 6dc5fd93b2f1 ("ARM: 8900/1: UNWINDER_FRAME_POINTER implementation for Clang")
Reported-by: Miles Chen <miles.chen@mediatek.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/lib/backtrace-clang.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clang.S
index 6174c45f53a5..5388ac664c12 100644
--- a/arch/arm/lib/backtrace-clang.S
+++ b/arch/arm/lib/backtrace-clang.S
@@ -144,6 +144,8 @@ for_each_frame:	tst	frame, mask		@ Check for address exceptions
  */
 1003:		ldr	sv_lr, [sv_fp, #4]	@ get saved lr from next frame
 
+		tst	sv_lr, #0		@ If there's no previous lr,
+		beq	finished_setup		@ we're done.
 		ldr	r0, [sv_lr, #-4]	@ get call instruction
 		ldr	r3, .Lopcode+4
 		and	r2, r3, r0		@ is this a bl call
-- 
2.28.0.163.g6104cc2f0b6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
