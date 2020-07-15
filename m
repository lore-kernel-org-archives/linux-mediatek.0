Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2ECC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 22:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1983120656
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 22:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QC1Ysucf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tzHnUtRC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1983120656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HoiE0JVoxaPwjgIY/eUMB3B1hg6rfFG78xpMU7lkl+0=; b=QC1Ysucf+3nwcF51wHUuzWmW6G
	z7nBk5J4BtPBlOQUUw+IvCdXd+VkUhN4mCXZMyf+A2XBeOQ2AXvMFtVjVGDFerp9UsRgljKZxny1C
	rS71Jc/Cz2J4AToi590PgTQd9OUmJl2Pa7OoP/Grj70IIMYp3LxsSXAJmUdGDc8HuDX2Ftxqq2Gx4
	r6g9qgXIkA+BQQybuZiS4ioU80LxORslwZomBG2EqyiQSUohD0PnKG5W7Y+FdlVRs2AePhui0dbDF
	++JAupwwtLN+m/oYPUYYRsx43lKOzCSJ3QeLgX7pfSJ5IkPAteEbWqBcld95oIPWDtqeWelwDrAu/
	Y4+RoGwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvqJR-000554-HF; Wed, 15 Jul 2020 22:55:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvqJP-00054P-4S; Wed, 15 Jul 2020 22:55:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id s10so4663538wrw.12;
 Wed, 15 Jul 2020 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=4dmmaw9M9fUvgStacvMkg8XKd7wfG6N9YCPY0YGiqEs=;
 b=tzHnUtRCNTJkNnDuJL4Vrqy7yO6ubEuZTxs9XIweJ464ch58eYN0YAAchrpSRll4Jv
 smqNC5fkHULZiQGkzFINAUkKoYTzVCJldLqsmla/cUlFKzbAe9hxOV/UjQA0tjt0C9YP
 Az3MpDKeitsxdH3xSXry3aGxdqHRwLIHymBV/mVCbPJ2pZ3k+bPN+aZ7mIyhpaih1+B1
 cSuXkZKy0PNoRIqjJjTAuA4RKyi6xg4V/E7u0/zEGpcKJ6Wk6OmPzeaXI2uUvloyXAdC
 2VT9YHFiKTx0BFxb7xqBD/o259z03I4xRbs/KXpiE0DgrTdr7JnkZa3EO31xDNHxHGEc
 AVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=4dmmaw9M9fUvgStacvMkg8XKd7wfG6N9YCPY0YGiqEs=;
 b=LAR4a6/8WpH8+Sk0OtdHQGeI5cB7K/xjnEsLHNrp1SSiduLkoZ0fIfTxLQoTRZfstz
 btZDxr4DDS2LLHBOHVrHiXR05TpFutntkNPx3+JqCd0NO3uXXXD1azygo0M45T+HWB6Y
 WajJOio4ArTYvxBoQqh1guueNS9gQCekf7lV1nPzCNxPs0af0a0b/RNghZyWhkhSk9ca
 HKRpaWSMeIWVITOTJxdRzzPbu+KVSGRQJwVLRwKa5714OkFUZx5ISwCoAqS74Eyepeww
 PtcyvhSyW097hRW9A0jkV9KOnWkIL31zSw+C2UniMmtuDn9bMNrxa5zYxGJ1DkA1xRVy
 hbaQ==
X-Gm-Message-State: AOAM5330dUBTLkXt3dml92a/RVRJQQ2uJhiTA5y5Uxu/2vUHAAXgMXO4
 cvLAw9qo/gnMG8RHrcxmd0Q=
X-Google-Smtp-Source: ABdhPJxKCEj8IdtoTtdlZhx3pWvH0o/tXEeBeYLQ69CBYu1WU+0nUK0lyPUa3KzyuUwnvOrjCxfTjg==
X-Received: by 2002:a5d:54c9:: with SMTP id x9mr1949111wrv.247.1594853737908; 
 Wed, 15 Jul 2020 15:55:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.120.199])
 by smtp.gmail.com with ESMTPSA id s15sm5289679wmj.41.2020.07.15.15.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2020 15:55:37 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: MediaTek updates for v5.9
Message-ID: <01399fb4-b2d0-e41b-dfd9-f2deba0ef651@gmail.com>
Date: Thu, 16 Jul 2020 00:55:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_185539_214149_3C97D000 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Here come the patches for the MediaTek soc drivers.
This time we only have a few new additions to the cmdq-helper which enhances the 
interface the cmdq clients can consume.

Please check and pull :)

Regards,
Matthias

---

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.8-next-soc

for you to fetch changes up to 7de796cac48c0f55974cfe9cff683dfb3b7c71b6:

   soc: mediatek: cmdq: add set event function (2020-06-22 13:21:00 +0200)

----------------------------------------------------------------
add new functions to cmdq helper functions
- assign value to register
- export finalize function and don't call explicitely from flush async
- set specific event

----------------------------------------------------------------
Dennis YC Hsieh (3):
       soc: mediatek: cmdq: add assign function
       soc: mediatek: cmdq: export finalize function
       soc: mediatek: cmdq: add set event function

  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  1 +
  drivers/soc/mediatek/mtk-cmdq-helper.c   | 46 +++++++++++++++++++++++++++-----
  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 ++
  include/linux/soc/mediatek/mtk-cmdq.h    | 31 +++++++++++++++++++++
  4 files changed, 74 insertions(+), 6 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
