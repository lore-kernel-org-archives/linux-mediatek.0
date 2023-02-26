Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AA0C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 12:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GH+ymoXuWfREPdyg4pHW7JMCRBD+g/vx0Z3V4ujtx/Q=; b=KfX3dKksMHupKQ
	pbA17bO1buYFWGq+ifO5ELXXnVq7TGdkyU+SCOLV98naU0AD7zYOnZJrmdFE19FWEog+pLoD3DGvg
	Hl3tCRxz0ucnm+6r6VIrUg5J0O09r3xLqRs2QlEEeCnHM2MjlXgXNT0yrXtqtoPFb2WlBk/ssoZVz
	Psw+bzy/UUdsMLyViZOK39zaa6Jp7nh7R2FhO0mNm45BmFUUWZVfrj6HK72LWSrqKQ+xA9BsUwj6k
	hD96QbGz97e2B4cs7/EBdhIkUI64OgHY7XA/kZzNPfsI717IXfh+HpLgHThLFhCAXZv5xgQG7FsfU
	F9M7X+VKkvzoGsjgUL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGRt-007Cf3-NV; Sun, 26 Feb 2023 12:48:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGRj-007CdP-Js; Sun, 26 Feb 2023 12:48:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9CC260B5B;
	Sun, 26 Feb 2023 12:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFFAC4339B;
	Sun, 26 Feb 2023 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415685;
	bh=e4JVxUex+BYhnFw9i2xpgRnZTwUc4EajwCGd4m9HsGY=;
	h=From:Subject:Date:To:Cc:From;
	b=LaWZEM8e9/ksPi7ppvgH/R/Iix6RrF8XvcYkh5lH4Sbp2qa2zd2LP+LcK1P+W7M35
	 X7zw1mYcNCsg/eL0dk/+Nel7PGKcRYduAyzWlfuTK5jgHJIq2pcTWJSC21JNlYL/rS
	 ssz+r128j3JWPcKsSX+hP+DS9X6TdKZqoCmw/uzC5P+W0ntq+KGwmIE//9/+52gFK/
	 6VRC9PTjV4GWWZbUoqgvGePekHdAWmsw+5ibRTT1m/AEt/OX3GdEMNURyUh4ybDFII
	 cUnLrzm5ErTD1NiaqLiLaIFXqYERI0iIi2kBVgpk4s+RUXOlmf7sGnnidXhQ1ZuQl1
	 jCLc0+Jn10Abw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ASoC: mt6358: Fixes from an initial glance at a
 kselftest run
Date: Sun, 26 Feb 2023 12:47:55 +0000
Message-Id: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtU+2MC/x2LSQ7CMAwAv1L5jKUmKaXiK4iDE1xqVSRgs0lV/
 07KcUYzCxirsMGxWUD5LSYlV3C7BtJE+cool8rgWx9a7zskKwlvzz7sB3y8JM04ypcNDy52TH0
 cRheg3pGMMSrlNG3/p+i86bvyv6/udF7XH0P7ud2AAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=broonie@kernel.org;
 h=from:subject:message-id; bh=e4JVxUex+BYhnFw9i2xpgRnZTwUc4EajwCGd4m9HsGY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1T/vh1v1wrN30hUR9D98736dtLyOfaSdjyfmcxD
 771Ye16JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tU/wAKCRAk1otyXVSH0Oq6B/
 9ec5dg8QVTGYm56PJnS+ukYisqxSgCBT2kX0o5ALt44S9aJtB4Ca5R7wM4XucJ+Ln5qXJfwiFdY0RD
 xjgO+tdPqYTEBeebk6MZAfbgvh0RffynXiqpCptpENVQyR+nRr5W5bMXjGl3xjw2efzafBuwRDU3Ub
 yYY1nJWJu47RYcB6H5xcd6kOcWQX+jp3lT1OwNkSpIBeLwkxpViOP4NtG+kMITBpIePhGnjsHAHqID
 seNHSPISt3WlfAsml/jC1Zjxi1JEyRkATwA2Nl3s6373Xv4js12EmGW7lrDtE9N38Mz5abuZooISc8
 jYMZBHsagJxFJCsEqOQJSgIwWDuTIy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_044807_719778_D528B706 
X-CRM114-Status: UNSURE (   8.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a collection of fixes I came up after glancing through an
initial test run with the snappily named Kukui Jacuzzi SKU16 Chromebook
on KernelCI.  There are more issues flagged, this is just what I fixed
thus far.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (3):
      ASoC: mt6358: Fix event generation for wake on voice stage 2 switch
      ASoC: mt6358: Validate Wake on Voice 2 writes
      ASoC: mt6358: Remove undefined HPx Mux enumeration values

 sound/soc/codecs/mt6358.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
---
base-commit: d2980d8d826554fa6981d621e569a453787472f8
change-id: 20230224-asoc-mt6358-quick-fixes-71b4ea6b8f13

Best regards,
-- 
Mark Brown <broonie@kernel.org>


