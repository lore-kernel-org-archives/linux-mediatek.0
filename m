Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA8EC33CAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 04:36:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B0B22073A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 04:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xj3fYlU8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="WStbr0MJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B0B22073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EZIFSI1hR7qklr6srl5bk4AUzapO5jYe0/rowckNVg=; b=Xj3fYlU8Rr8Qcl
	zePxWCtDajgwetHaz6j1viCuu8hCvL88+/9TaGQQRAgInJBg0qAXDfPNr2/wdZLkQskj0i9TKjmM8
	6NSp4mANpj9d7kk0aWylFZx7P+L9iYXs0Rk+YfxydR/xY9ITbWYl6MjGgPp2ynEYUjEJbM42XF+Hs
	HLSSwCXrtTyKKSdI7PBOeoJp9pnwD3iOA9YbrKqimuw3ywqcOQvH9RjCPKgAMtleb01VpnvjyXiIv
	Q2S6yL7Svq4epGJAHhcCEhG1IhDCDVK8gJM5PlBsZJaH+CU7VHGLim1raaq+YblX4oF3EdhpcW9Xa
	70M9DQNtdUDg/eeTk+Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irwtT-0000SU-93; Thu, 16 Jan 2020 04:36:31 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irwtI-0000Gg-Qp
 for linux-mediatek@lists.infradead.org; Thu, 16 Jan 2020 04:36:22 +0000
Received: by mail-pf1-x44a.google.com with SMTP id v14so12269991pfm.21
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2020 20:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=lOS4ewWznrG+/0jceSUIoLxZFs2qMA4l+9gH32rT8ZU=;
 b=WStbr0MJSOPJGqzN2iGhIkdauZViO9hiPHW8Uj0CQFi0U3cTaC+CtBLstGwqiu/okm
 HwJonDO4S20K4z1FseDh/ERI2uZPRo9aoKkZjNyJR4eLMsIuCWvGzCPrdTwlUbyFeq18
 4aadRAQl8JLnnKuLbKXV8Kf5PuQGXgWmjRQGIXV6jLyRE55XPV46346RsbUI5pwP646F
 W7Zi4/hotQx4xNZHbfw2SyYexpMQ3MwhPt1at98Ah5V6RNdVvM3CwauYeM00GAr+WM2Y
 A8r1y2CyypILKIp6eJzku7HKEflikMjfc9K1prTtvGNz2mox+pXGPh+YGIgEKaDqqfYW
 KcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lOS4ewWznrG+/0jceSUIoLxZFs2qMA4l+9gH32rT8ZU=;
 b=BfI/Pz5+syjUxoMaf2Lsw3tamDCMpHT7ojkGSjcLOC32fYlPsqp+QL/XY6vHWDwQMl
 aCHsTNo1D/ppvTN6kPhqzHCDF08E1e51te082dc7Om1BbNr78IptbcUTFYRdRQ5P31rP
 jFg84o0KyQkcXsdFyeCglbN5sghVQ4bRmnmzCusTnVpYlq/7r6Kw+lSWUd4fspuDHP9N
 U8nSWSb44qp27t9jHe9+3LSB0WkCZFbWtvq0z4QBBBU+Lq9NBtx91exehkuWn/ThouU3
 awRHJppyvGoWzFnahOVQF/59fGUwkXoyBgQAWUigl0mzInClDfZoBh6krszLlcIttyQh
 l/IQ==
X-Gm-Message-State: APjAAAX+L+frswvTI6Hfrsce0ylsPiUP2LlkCiPO7AgFkY82TeZK5JIb
 gyAxgrhZc+A9gWYvWj7kFMlrQfgPFlI=
X-Google-Smtp-Source: APXvYqzbKGjnpLecCWg4B+/ttVo20VzbmxlVS+5fmmSGkVQcYwu4EGAJJ4ZismsmxqM/zsKwRtOeqsmsDUk=
X-Received: by 2002:a63:1f21:: with SMTP id f33mr37413032pgf.91.1579149378890; 
 Wed, 15 Jan 2020 20:36:18 -0800 (PST)
Date: Wed, 15 Jan 2020 20:36:12 -0800
In-Reply-To: <20200116043612.52782-1-surenb@google.com>
Message-Id: <20200116043612.52782-2-surenb@google.com>
Mime-Version: 1.0
References: <20200116043612.52782-1-surenb@google.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
Subject: [PATCH 2/2] kselftest/cgroup: add cgroup destruction test
From: Suren Baghdasaryan <surenb@google.com>
To: surenb@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_203620_871446_C9A9EC35 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: mkoutny@suse.com, linger.lee@mediatek.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, tomcherry@google.com, matthias.bgg@gmail.com,
 lizefan@huawei.com, linux-mediatek@lists.infradead.org,
 linux-kselftest@vger.kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 cgroups@vger.kernel.org, alex.shi@linux.alibaba.com, shuah@kernel.org,
 guro@fb.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add new test to verify that a cgroup with dead processes can be destroyed.
The test spawns a child process which allocates and touches 100MB of RAM
to ensure prolonged exit. Subsequently it kills the child, waits until
the cgroup containing the child is empty and destroys the cgroup.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 tools/testing/selftests/cgroup/test_core.c | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_core.c b/tools/testing/selftests/cgroup/test_core.c
index c5ca669feb2b..2a5242ec1a49 100644
--- a/tools/testing/selftests/cgroup/test_core.c
+++ b/tools/testing/selftests/cgroup/test_core.c
@@ -2,7 +2,10 @@
 
 #include <linux/limits.h>
 #include <sys/types.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
 #include <unistd.h>
+#include <fcntl.h>
 #include <stdio.h>
 #include <errno.h>
 #include <signal.h>
@@ -12,6 +15,115 @@
 #include "../kselftest.h"
 #include "cgroup_util.h"
 
+static int touch_anon(char *buf, size_t size)
+{
+	int fd;
+	char *pos = buf;
+
+	fd = open("/dev/urandom", O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	while (size > 0) {
+		ssize_t ret = read(fd, pos, size);
+
+		if (ret < 0) {
+			if (errno != EINTR) {
+				close(fd);
+				return -1;
+			}
+		} else {
+			pos += ret;
+			size -= ret;
+		}
+	}
+	close(fd);
+
+	return 0;
+}
+
+static int alloc_and_touch_anon_noexit(const char *cgroup, void *arg)
+{
+	int ppid = getppid();
+	size_t size = (size_t)arg;
+	void *buf;
+
+	buf = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON,
+		   0, 0);
+	if (buf == MAP_FAILED)
+		return -1;
+
+	if (touch_anon((char *)buf, size)) {
+		munmap(buf, size);
+		return -1;
+	}
+
+	while (getppid() == ppid)
+		sleep(1);
+
+	munmap(buf, size);
+	return 0;
+}
+
+/*
+ * Create a child process that allocates and touches 100MB, then waits to be
+ * killed. Wait until the child is attached to the cgroup, kill all processes
+ * in that cgroup and wait until "cgroup.events" is empty. At this point try to
+ * destroy the empty cgroup. The test helps detect race conditions between
+ * dying processes leaving the cgroup and cgroup destruction path.
+ */
+static int test_cgcore_destroy(const char *root)
+{
+	int ret = KSFT_FAIL;
+	char *cg_test = NULL;
+	int child_pid;
+	char buf[PAGE_SIZE];
+
+	cg_test = cg_name(root, "cg_test");
+
+	if (!cg_test)
+		goto cleanup;
+
+	for (int i = 0; i < 10; i++) {
+		if (cg_create(cg_test))
+			goto cleanup;
+
+		child_pid = cg_run_nowait(cg_test, alloc_and_touch_anon_noexit,
+					  (void *) MB(100));
+
+		if (child_pid < 0)
+			goto cleanup;
+
+		/* wait for the child to enter cgroup */
+		if (cg_wait_for_proc_count(cg_test, 1))
+			goto cleanup;
+
+		if (cg_killall(cg_test))
+			goto cleanup;
+
+		/* wait for cgroup to be empty */
+		while (1) {
+			if (cg_read(cg_test, "cgroup.procs", buf, sizeof(buf)))
+				goto cleanup;
+			if (buf[0] == '\0')
+				break;
+			usleep(1000);
+		}
+
+		if (rmdir(cg_test))
+			goto cleanup;
+
+		if (waitpid(child_pid, NULL, 0) < 0)
+			goto cleanup;
+	}
+	ret = KSFT_PASS;
+cleanup:
+	if (cg_test)
+		cg_destroy(cg_test);
+	free(cg_test);
+	return ret;
+}
+
 /*
  * A(0) - B(0) - C(1)
  *        \ D(0)
@@ -512,6 +624,7 @@ struct corecg_test {
 	T(test_cgcore_populated),
 	T(test_cgcore_proc_migration),
 	T(test_cgcore_thread_migration),
+	T(test_cgcore_destroy),
 };
 #undef T
 
-- 
2.25.0.rc1.283.g88dfdc4193-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
