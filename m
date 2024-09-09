Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DF8ECE585
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 18:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afDJVLo/53ENJoGYPSFX6PhC5dwH69DoY8b425E79ig=; b=hcP+lUPoif2fuNEnRImHfPC91f
	NwIndsFhuCHzrkGefRQ3GNVUsFz2BMBJxYAsgOgxigE8mQK4sfGWV/pqFNbNUKLYE9sa9M7qzf9t8
	E9lS8xxCRRvJM23Gl6uwN8uxxu6C+DTPpLhqqTU6VJzXXtN4L6Tqq+4O1q0jAhzuyb1YIjDnKFr88
	/taCYHlHsArKw3Ec7hlSpZg5qtIB/XW53Mc8LaPE0IfarXk738cq3eyKKkCDUpETw2tAtHozJ3aCc
	KZPf8tw01/2/r+WdbaA5C37TfYLUASaGqQttaQU5wsecmU33TIiP0vQZP62Gi/eh8DgC2MIxJKahN
	7hnvUXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjKG-00000002zz3-1lZ4;
	Mon, 09 Sep 2024 18:41:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjHI-00000002zMQ-1Bd6;
	Mon, 09 Sep 2024 18:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725907097;
	bh=NADRXRk73DSEcKHQQvni0lrWb3AK/hH7vJ+xsFaEuFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MOyVqPcqOprLfzy/XadLU8XC5fbGGQO9ILN+44UJ7vdDvadezUBuxbfg6endteo2I
	 4ngJRt9Pe/psTrCGqbHs5Jj2yuzFUo6Z5VLW+i944LZy/tEylnfVCDx51TqCxoMHoX
	 pZeE0h8ej9VzktzoGE66zSZKXLEOyrw9oyQNp7kDbRiq83xI3vHjXYpMqDZUnv7EUB
	 MthblXGFoaEM8MTt7WanuicQ/DPHKMqNl3C1e7j+WFBtxMz6iuFyIUY/quSwqc9MEk
	 /eDtiM8FfrvIAboZc8bdR5NjWZzSyrCTuUptoWQY6/8JtmwnBDhUHGdQzD5R9l6u57
	 Q2ALrQ9fqVriw==
Received: from [192.168.1.95] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82F8917E35FF;
	Mon,  9 Sep 2024 20:38:15 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 09 Sep 2024 14:37:33 -0400
Subject: [PATCH RFC 2/3] selftest: gpio: Add wait flag to gpio-mockup-cdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240909-kselftest-gpio-set-get-config-v1-2-16a065afc3c1@collabora.com>
References: <20240909-kselftest-gpio-set-get-config-v1-0-16a065afc3c1@collabora.com>
In-Reply-To: <20240909-kselftest-gpio-set-get-config-v1-0-16a065afc3c1@collabora.com>
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 kernelci@lists.linux.dev, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_113820_491494_7CFFBA47 
X-CRM114-Status: GOOD (  15.64  )
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

Add a -w flag to the gpio-mockup-cdev utility that causes the program to
wait until a signal is received before exiting, even when its behavior
is to retrieve the GPIO value of the line. This allows using this
utility to keep a GPIO line configured even when in input mode, which
will be relied on in other tests.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tools/testing/selftests/gpio/gpio-mockup-cdev.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-cdev.c b/tools/testing/selftests/gpio/gpio-mockup-cdev.c
index d1640f44f8ac..f674dcafa60a 100644
--- a/tools/testing/selftests/gpio/gpio-mockup-cdev.c
+++ b/tools/testing/selftests/gpio/gpio-mockup-cdev.c
@@ -15,6 +15,7 @@
 #include <unistd.h>
 #include <sys/ioctl.h>
 #include <linux/gpio.h>
+#include <stdbool.h>
 
 #define CONSUMER	"gpio-mockup-cdev"
 
@@ -95,6 +96,7 @@ static void usage(char *prog)
 	printf("               (default is to leave bias unchanged):\n");
 	printf("        -l: set line active low (default is active high)\n");
 	printf("        -s: set line value (default is to get line value)\n");
+	printf("        -w: wait even in get mode\n");
 	printf("        -u: uAPI version to use (default is 2)\n");
 	exit(-1);
 }
@@ -120,13 +122,14 @@ int main(int argc, char *argv[])
 	unsigned int offset, val = 0, abiv;
 	uint32_t flags_v1;
 	uint64_t flags_v2;
+	bool wait = false;
 
 	abiv = 2;
 	ret = 0;
 	flags_v1 = GPIOHANDLE_REQUEST_INPUT;
 	flags_v2 = GPIO_V2_LINE_FLAG_INPUT;
 
-	while ((opt = getopt(argc, argv, "lb:s:u:")) != -1) {
+	while ((opt = getopt(argc, argv, "lb:s:u:w")) != -1) {
 		switch (opt) {
 		case 'l':
 			flags_v1 |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
@@ -150,10 +153,14 @@ int main(int argc, char *argv[])
 			flags_v1 |= GPIOHANDLE_REQUEST_OUTPUT;
 			flags_v2 &= ~GPIO_V2_LINE_FLAG_INPUT;
 			flags_v2 |= GPIO_V2_LINE_FLAG_OUTPUT;
+			wait = true;
 			break;
 		case 'u':
 			abiv = atoi(optarg);
 			break;
+		case 'w':
+			wait = true;
+			break;
 		default:
 			usage(argv[0]);
 		}
@@ -183,9 +190,10 @@ int main(int argc, char *argv[])
 		return lfd;
 	}
 
-	if (flags_v2 & GPIO_V2_LINE_FLAG_OUTPUT) {
+	if (wait)
 		wait_signal();
-	} else {
+
+	if (flags_v2 & GPIO_V2_LINE_FLAG_INPUT) {
 		if (abiv == 1)
 			ret = get_value_v1(lfd);
 		else

-- 
2.46.0


