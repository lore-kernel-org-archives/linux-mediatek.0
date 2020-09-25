Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C577BC4727D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 15:37:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA0C20809
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 15:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EU2wc7OJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAcWeLzu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA0C20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=juz86B9/1wFW6KSQGaVp//YO2+l0MqxHSRlhs0T5Y1I=; b=EU2wc7OJeyIHmD6IH0yH3rDz+d
	lOPTtxWe89VodJdyTz9UOAfo67Od5SZz9jTaxAFDKVvSSzztIYPgse2hV2f0I7QQwLOSpCjtNGU8a
	RapAnqExA6E0KmKdSYzna9P/pYsFj2JOSNoqBvRryNB3X+Isy7Y0u/WIfIAZiWEsVu+34g+F0tNa9
	bfQNorC0nfqF4wb3PsePQMXiXdyWuhU6hWxzqv7F5OS4FaaULsOxh2ad1dKXipFA/7IkamCd70S6M
	fnP+ZdyusnbIE/9ruqN+vNyqAtlaGVcFb9woSeEKETDUhcsVpMhgiAnrPhnIQ6Dfjo4Uh1Cxo2BbG
	tXlDvk3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLpms-0000Zb-VF; Fri, 25 Sep 2020 15:37:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpmq-0000Yq-TI; Fri, 25 Sep 2020 15:37:29 +0000
Received: by mail-wr1-x442.google.com with SMTP id t10so4112022wrv.1;
 Fri, 25 Sep 2020 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Sk80hMWOWitD5chg4s3k0usNJ5TIluhuy8Zau0uX8+Y=;
 b=RAcWeLzuTFAnoEcfLDkpwAUjKY0xN5Fk4HCsY97o4eRbMQ2VpxsGL+N+q9uFkl+4F4
 Ps5ZOfwE7f64AHTKHIeVhyon8R1MF/Q+K7JQCOlnAhfwNEnYEsdv9lVpFuYLxmGRYs+I
 zGdMd/5CHG4EQ9AZ3zoMiHFv9XN9n3b7jF3iSu8NTYu5jer+TSGa64SrjCOHLZMkL4cG
 7pFmDZijsMUjLOsniv+OuOef+RVdUXKtNIbmbMEGNqmsCfCRqPuIU9qvLvNa9ViNutIy
 jUuZDSJw4cceBCYPMuisyl0QCAmlRGtpYkNNzLAFzUEICR6jariZSRLXcaOiVSfD2+LG
 Mqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Sk80hMWOWitD5chg4s3k0usNJ5TIluhuy8Zau0uX8+Y=;
 b=BMjA9ZWF6lAsHBOSrZckXPOTLKwjzp/eZGsJ/fwCMxurREU2jKpkBCF3C8Ia+TQWX4
 ZFd0H651ndhNQHyzklYaCYzSVYW7U8AsQu6tfHftzWGIGveD85uTeXm94itlGFX33lcw
 lIT2uuHjoKie7VoVuisGTUE2s8CcDE50fkj2OjtU60E9TTwIZLmP8mq0RqDz8L3VFKTA
 ASby58MRmKvaKaorruS32jQrb+CGO54nR8nEquKgnxniN8a++Ar8VmovlBlJqEmJPnE9
 GnIWPiM4y+5HeYzyHSThesE7F/cmlGpS+1WgwJnPRPfhUYKRXdhn2pSjKCIOgzYOf5Rf
 sUqA==
X-Gm-Message-State: AOAM531DH08RgSU+XNZUXvoJFML1bqgn/KO4F1MmIskhAg5p8R6ur7be
 jSJxLX7qT69g8ShBVusDq2U=
X-Google-Smtp-Source: ABdhPJz59P/daVaj08q7Dy535LW3mj12Kplf4SPkE2EeuwgLg1pxEV+UwlAtEetlIlYlm5vMH/rQXw==
X-Received: by 2002:a05:6000:124d:: with SMTP id
 j13mr5434946wrx.182.1601048247685; 
 Fri, 25 Sep 2020 08:37:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id t4sm3451929wrr.26.2020.09.25.08.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 08:37:26 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: mediatek: dts32 updates for v5.10
Message-ID: <641d4d47-b7ad-42dd-f7a8-e028a1f64d70@gmail.com>
Date: Fri, 25 Sep 2020 17:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_113728_951310_7C58820E 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Alex Ryabchenko <d3adme4t@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof,
Hi Arnd,

Please have a look at belows DTS updates for 32-bit Arm board from Mediatek.

Regards,
Matthias

---

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.9-next-dts32

for you to fetch changes up to 36f0a5fc5284838c544218666c63ee8cfa46a9c3:

   arm: dts: mt7623: add missing pause for switchport (2020-09-21 12:03:52 +0200)

----------------------------------------------------------------
mt2701:
- add jpeg enconder node
mt7623:
- refactor dts and add hdmi support

----------------------------------------------------------------
Alex Ryabchenko (1):
       arm: dts: mt7623: add lima related regulator

Frank Wunderlich (2):
       arm: dts: mt7623: move display nodes to separate mt7623n.dtsi
       arm: dts: mt7623: add missing pause for switchport

Ryder Lee (1):
       arm: dts: mt7623: add display subsystem related device nodes

Xia Jiang (1):
       arm: dts: mt2701: Add jpeg enc device tree node

  arch/arm/boot/dts/mt2701.dtsi                 |  13 ++
  arch/arm/boot/dts/mt7623.dtsi                 | 123 -----------
  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  88 +++++++-
  arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  74 ++++++-
  arch/arm/boot/dts/mt7623n.dtsi                | 306 ++++++++++++++++++++++++++
  5 files changed, 478 insertions(+), 126 deletions(-)
  create mode 100644 arch/arm/boot/dts/mt7623n.dtsi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
