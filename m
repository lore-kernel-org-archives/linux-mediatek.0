Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641BFC41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 20:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VqWk9TlJRT8ykwWsdvSnZzCfxI5F9cpgpLcByRA+sY=; b=kFVBTRVAlRzU2Jsj8L+LSgsrvo
	ynHRoL/xDQ/7AVBNCFx8xIQSJKnQ8r6GukJ/1D8YPYAlZIv7JGO0gEDsFVAOJAY02TpNg5DaMLcWx
	KtMlge5t9gboznuxNJrchkKIkFVhBPLFqyxlEKB7TbhAIGE4aREJDq4x9L+Gv5IoWQc8PCvNy/qNf
	SW8YbXkbceAx4bYuZDfDRslsUthMmI728etzehpCesy16rw0csI83lw6qVf6pfTY1KbSPSfaP/QT5
	f8tp3aJVD+ti5bn33xXammeq4Hm/zuBhOYKQ/+vJ+g9crB8NaBMKu+QxNZPB2BXrWPChMqTKOrSKD
	HoUyL83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUCFL-008ebO-00;
	Thu, 10 Aug 2023 20:27:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUCFI-008eaH-0Z
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 20:27:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bc5acc627dso10196615ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691699219; x=1692304019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VqWk9TlJRT8ykwWsdvSnZzCfxI5F9cpgpLcByRA+sY=;
        b=K6Xr+JpfP3xNnjYDhY0dK5WU16CS3QdsDehTrDhfKyWhlQr9Ju/mj540r6Y+bgal7r
         Iu8tF0uh1VerGPWpO5/wmQxvZkh8iK1gyky0YbGqEnpkyPiNkPHdIw5lKML5Pok1+I7a
         XPeKJAL5CSpLJAKuJCFlHYDzyBBWqVnVMzUfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691699219; x=1692304019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VqWk9TlJRT8ykwWsdvSnZzCfxI5F9cpgpLcByRA+sY=;
        b=TmStEl3OryEbeM0+CwZFV1TuKg6T9mxgi70mOpTMWFudAZ2tykTD+wLDf0fn5nzUvx
         0MeP2oDOzWQ2hxRbdBGXxGTpgAxtP926OVNGP/lA5l13MdXOOS9BeFOrjf2OuNJc66lP
         +w8SRU/VCa9RWi7aI45IBfU7ZYEp9BuRNRUkaehJlqD/KzHkGJ3DmSufOyixifFbdXNi
         O8GqCnj6dU/7ZdlmKdQvBMIwM411EsPpnGCDvX+6pzaL3HmMCDTs5IaMTD/s4LKg4q/i
         hJdrlm4hc34qeCRknxyIKtCvA0xfzes/M9U7/YxnOC9xQL2CopjLZMASdhYvhNPOZT44
         81NA==
X-Gm-Message-State: AOJu0YwT9FtMSde1pPRxHVlPqjepqZ8vlqx5VVWDPbtRA6XRb8nc7vN8
	/KUQ4jQByRpK0dXYWHy/OJS72w==
X-Google-Smtp-Source: AGHT+IFgOcyEjd2Q4OTHrM/7gs8YLxs3o0idMAJRHLTXxcQ2zXZGYP1++8Hj+FJQ5dwHLcBJL9Zu0w==
X-Received: by 2002:a17:902:d3cd:b0:1bb:5b88:73da with SMTP id w13-20020a170902d3cd00b001bb5b8873damr2990326plb.61.1691699218904;
        Thu, 10 Aug 2023 13:26:58 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k3-20020a170902694300b001a98f844e60sm2183276plt.263.2023.08.10.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 13:26:58 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: Kees Cook <keescook@chromium.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] selftests/seccomp: Handle arm32 corner cases better
Date: Thu, 10 Aug 2023 13:26:56 -0700
Message-Id: <20230810202653.never.932-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=keescook@chromium.org;
 h=from:subject:message-id; bh=CLpz6EOfRrbHfxs+DW+QOBPRQnZKfWBS9qhYDrihYZA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk1UgQGhY779bsGNZZQsbavTn3fuJhNl9tmHaJi
 pe/oTK88q2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZNVIEAAKCRCJcvTf3G3A
 JuJ/EACTcQ+/SL8NKJMeMFthsYqig1wZP1bL6BwiogHpMrhrE4JVzTccWGM8XLHbP63E9NyJdTG
 CbifBfVw4Q2qw1VXKAvuSpkN6uSsMv4s3/BosmYE5yEu4i608R2SQMqm1ifN1U1ovAAYvXxVXY4
 mEy+5TG5jPr/3XZrHHgf7ygankQSzS38Na8mfcmebpJfZweX8kDy8Zew6h2tSG09wMBoAlirQEt
 K2TKbjN/dhB2e906M3h7tHIXjIH8gThBwY+4s6o+DI5vhpDjT/6ETxNgaAK9wmXNCyP2v+o3GBL
 hscos8jzbMZ4QJ/+1PCtSgY7j2PzQmbNzr/wDgkA/LSuAVhL58isbFkaIrHmgXPHd6IDjiaEXR5
 Vr7pR97vDB1V6HJ5lHg9kZShcr1TABvwit/h/O5anJXH2Aer12Ng1kHn9m+2buZI5tYjvB8gicC
 JJg/zttnHUhUwzKUKUk3wlToFm9Czbj+vraJF+kexBjCW+DPUS0l6Oa6JPjElLKe5BrrUhTlyBN
 3LLd16WA4HhAwVyVlq6vm2gbEUUeXthpn3hm6b/JxOULzY/vOxkMGjjbKalbsRof+RKDJPz6vM5
 cYVUoyL+rap+LF2B7gOhxuHz9zwF4EvwPoQ4wd4snZlGZ/T6NlRz3bHc8/4DkmejD6OCLSsBxS6
 UCCv7P2 xUDMYFGA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_132700_210646_209F89A9 
X-CRM114-Status: GOOD (  12.14  )
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

It turns out arm32 doesn't handle syscall -1 gracefully, so skip testing
for that. Additionally skip tests that depend on clone3 when it is not
available (for example when building the seccomp selftests on an old arm
image without clone3 headers). And improve error reporting for when
nanosleep fails, as seen on arm32 since v5.15.

Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index f6a04d88e02f..38f651469968 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -2184,6 +2184,9 @@ FIXTURE_TEARDOWN(TRACE_syscall)
 
 TEST(negative_ENOSYS)
 {
+#if defined(__arm__)
+	SKIP(return, "arm32 does not support calling syscall -1");
+#endif
 	/*
 	 * There should be no difference between an "internal" skip
 	 * and userspace asking for syscall "-1".
@@ -3072,7 +3075,8 @@ TEST(syscall_restart)
 		timeout.tv_sec = 1;
 		errno = 0;
 		EXPECT_EQ(0, nanosleep(&timeout, NULL)) {
-			TH_LOG("Call to nanosleep() failed (errno %d)", errno);
+			TH_LOG("Call to nanosleep() failed (errno %d: %s)",
+				errno, strerror(errno));
 		}
 
 		/* Read final sync from parent. */
@@ -3908,6 +3912,9 @@ TEST(user_notification_filter_empty)
 		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
 	}
 
+	if (__NR_clone3 < 0)
+		SKIP(return, "Test not built with clone3 support");
+
 	pid = sys_clone3(&args, sizeof(args));
 	ASSERT_GE(pid, 0);
 
@@ -3962,6 +3969,9 @@ TEST(user_notification_filter_empty_threaded)
 		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
 	}
 
+	if (__NR_clone3 < 0)
+		SKIP(return, "Test not built with clone3 support");
+
 	pid = sys_clone3(&args, sizeof(args));
 	ASSERT_GE(pid, 0);
 
-- 
2.34.1


