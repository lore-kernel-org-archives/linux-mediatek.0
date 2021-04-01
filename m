Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB97C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 14:02:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF98C61277
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 14:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF98C61277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KoiuMeCpPT+wv7MSBY0cyzJJ7rmfExE3WG4MkPqk4SA=; b=MabT/sUQaXzIz0IMXTykYnlEky
	s0YfwPBEMs4sOJJ39yShRQDa8J3Ruiw8ws5yXA8mbeAM5JV5zglRTS0ZLqhbVqJq7+ycqDIv/cdQq
	yGrld2+E5E3lEe5jDA/II3bEiyZoq+mhQKc9JnX2RHQb7Jg0O4Mg7ZL3M4K6sh58R3GqDsBhyE4IJ
	ykRC+I8CcDKnUkZ73UC74gLBCeKiX8dbFGHa5VeZa8muqVhGOFP8WgTbaubaOO6UMauPVZZIYLJIi
	pueyPY9/YNQYEzlCKkt5IWsjIUCQL0cEx79wgY3V9n2GUR+pcsPTu1+5c01pY4yJMFeqkrBNi2qu8
	d4+/VZvw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRxtU-009mQM-SV; Thu, 01 Apr 2021 14:01:56 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRxtD-009mM7-Rd; Thu, 01 Apr 2021 14:01:42 +0000
Received: by mail-ed1-x532.google.com with SMTP id b16so2084223eds.7;
 Thu, 01 Apr 2021 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Kpqxj1R5RpTVz1wBSRjGUo0ShbRDPWFOGRiU4h0lHJs=;
 b=KF+livsuleM1CtrGNFRxImYJSlRq24NlTbJfISnKTFNHN0k227mnczQBcjgurTdtYQ
 k4ieptHLFhVoH3h9LbDyNEoU/P/1mEoUGVNSTig3i3xgjB5VZ2FxtQ0Mu9ioE5yO8gAj
 AokZVHGiwwIFVMogDK2/vSlAK/iXp9f6gRsUWm84idp/WE7bvolY+0/mUs43db+R9k8l
 aDY4bGk3rvqgZoVQRd0Ndh00uyIwnhIwGAmJ3Zgv2PWTGWmfoxMDEWXOUAtd8+d9GyhX
 wWi1v3HuqppBj4psniCgJ1KVhwAWCyhZ1IUkYVWt8vSXV1eCos2QS+jbcmzmTV/ZtsA4
 Orgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Kpqxj1R5RpTVz1wBSRjGUo0ShbRDPWFOGRiU4h0lHJs=;
 b=k76HgUHNjTBD+RAkI/JMyQajm+J/+lItcRnMGbWmiYG/30809bbm4JsgSGmtKE1ehC
 WohyvDvUBhcSFrkhwbstFRffWiVh4cnu11loY9vF9gEOcufoLzkuVVbnczmu9OWEANZ/
 GVTMmRNECwIL2kGmqCaWzlTdBq0ER4KTeJaXvJPZ3H4f+4c7xu0BO21HqxN8gCrK2oxl
 jnsoFBwwS7WnzKdO9iIdBUNTfFtKN8YRtWrIqDeEVoNjPycj51eeun+OCSslTobA3K5k
 mqdvAgJAJV+npAabtk7XZLlMMGqn/w+NE+4W7btTJzfTT3VSL4rRXPmHdf2gSkcJwouA
 7HFA==
X-Gm-Message-State: AOAM533PyfVbQ1KTf4XfSYxBjfY2mPf7HSzZjyfV6J/+fOeBrBWKNA4f
 Kvw1SjzzjdbqVEy8kyZ/WZY=
X-Google-Smtp-Source: ABdhPJy+F6nVJbW11NEWKQKmNn/+8SdFFd8vKpxN0TylkP1ecGu2agI49lAIvGeMA80rjZLRsH5Ohw==
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr9948692edu.52.1617285699193; 
 Thu, 01 Apr 2021 07:01:39 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id v15sm3566132edw.28.2021.04.01.07.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 07:01:38 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Boris Lysov <arzamas-16@mail.ee>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts: mediatek: updates for v5.13
Message-ID: <be262120-6cd9-87a7-ccc3-f5c403cff66b@gmail.com>
Date: Thu, 1 Apr 2021 16:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_150140_113513_0974D880 
X-CRM114-Status: GOOD (  12.21  )
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

Hi Olof and Arnd,

Please take the below patches into account. These are mostly cleanups to make
the DTB checker happy. Apart from that we now have SMP support for MT6589, it's
nice to see that someone keeps working on this old platform with which I started
upstreaming :)

Regards,
Matthias

---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-dts32

for you to fetch changes up to 562f818deaf0601f224999cc39b6c97fbb2adc57:

  arm: mediatek: dts: activate SMP for mt6589 (2021-03-30 12:12:25 +0200)

----------------------------------------------------------------
- fix dtbs_check warnings
- enable SMP for mt6589

----------------------------------------------------------------
Boris Lysov (1):
      arm: mediatek: dts: activate SMP for mt6589

Chunfeng Yun (3):
      arm: dts: mt7629: harmonize node names and compatibles
      arm: dts: mt7623: harmonize node names and compatibles
      arm: dts: mt2701: harmonize node names and compatibles

 arch/arm/boot/dts/mt2701.dtsi  | 19 +++++++++++--------
 arch/arm/boot/dts/mt6589.dtsi  |  1 +
 arch/arm/boot/dts/mt7623.dtsi  | 26 ++++++++++++++------------
 arch/arm/boot/dts/mt7623n.dtsi |  4 ++--
 arch/arm/boot/dts/mt7629.dtsi  | 12 +++++++-----
 5 files changed, 35 insertions(+), 27 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
