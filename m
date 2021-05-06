Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09789C43460
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 16:03:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928BB610FC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 16:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928BB610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oeu+cPUU5JThYLhD8XLDpREqLiXyqlDfFhlkq+Us7H0=; b=axuNwO5L+iQLk77KMs8YXyybxg
	3rJpoBEWh0d0MxLWd5xsz60LP9oRg2rpIZ/qadM6gfrbZnVl4NnxQA0+e064CqJX94wDZuos1LgOD
	zmEvlJkikt1R+r7PP4UXG0lgIxujB5EQNi3rBI0c3dfA2eqdbbRKYEMcuMXRJmpGacu1g/dkOWNih
	4JKnWF/w13GD5+8xH/0sb5jkYOt0laHV3Gx1+jlLGT0bquBsFGQE2QFFvLEqBKciV1D/HI+CfU6PZ
	aec86jF8GGIuMcOVL25cV5c4DkQctEy7XHqkGQT7cUxlFD4e522buJ9llVitYrcpkFSSZVouxVeDQ
	LAV216iA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1legNS-004i7S-IS; Thu, 06 May 2021 15:57:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leg4B-004be3-Ka
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 15:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=dSJyU8aFK9mEONqG/nUNis6Uka+vOYd9hMvtVOFuDIc=; b=xbRNHk2dqsqkJipOwU7gYLMKR9
 JdpEPe22O6mm5UkEMG0r4e5dc9UWlHoF9bJnYrxwXMfKiQY7IcqdWP+SRSLP5zWyKUlISdzJ82egB
 tQSyrQOGkkmF5Ysjq2IsKQv7AwA0fpGYc0OxbDJFuQIgoVvwZONkm/Jvm+Su+1S+FiqXDBktJmkT3
 8cGtPuC2wny40rXFdrh1X8+HVuaCnvprVzd1e8dzYTMcl0+zogpDnbllccfrG3Xq6ftQ7maBiwkuc
 1s0ZmomGroDeG7j9X07XRk15qAWCQI+d5xtbMvX+ZOddoPYkEhr609r8G6XC9uDp8SAgUNA2Bcl1u
 m1kHam2w==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leg48-006AKb-C1
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 15:37:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id n2so6144622wrm.0
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSJyU8aFK9mEONqG/nUNis6Uka+vOYd9hMvtVOFuDIc=;
 b=z57l6UWUoyml5qPK/3dbAyigL3/mFw4SWpA4jlORRMa04ADgJXr2kse+DOKvcgBMj6
 q6Rod2Pu8U/Z7HFXhUbZwV+N9F7S2ghT8tkGE15T28OFlM6bLNs+xhSzPExWm5bmmqqn
 i5GwKj+sqRYa9MOwMihoVFYbFl+18PK0T7HMhQrgzvSMT9U3v2rqocrefBcP37C110ty
 HVYJ/zH7DB1ez+PWo+LQflFW1BTren1pfZeIvSaSQgbVhH6BxvtLCpmk1g98ZAHbwv7A
 wpN5pK8V0WAbbcRUC/Hc4lddTVKyG54TJl5j7+cXQRJo5lUBA6JA5T2wq8832ohc0kQJ
 cVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSJyU8aFK9mEONqG/nUNis6Uka+vOYd9hMvtVOFuDIc=;
 b=KvuFsEni+dYsCZYCLgkj5OwONOfPTEXFJ8j0E5HdgSArpqzFCcw/RhoxKiihHNFikn
 LrSVzdmEaUwVM2XodmT4jqNt3O0FLVBTZsy9/BLQq1koJhITFT+ux0ven+6WGHet4ZPm
 h6tmKgPHH/k8r6TjtrSlkkclJtR5dlMQBgnLLpm1Y1+juWOJkkF3NsnV5LI6/f17dpij
 wznDc79wqBCFte0RLCj31kQdB5WQiaEKz/W0Epdl6Uun2kTP8hoNkSd6OSvmMbwXNiYG
 DyEwg/GQC6YKJV6tVRKdb3uYPDsSq89gpT/4+c/ZvpFlWeQN3LnZw/rpB0AYtBlMzcUo
 MWGw==
X-Gm-Message-State: AOAM533SpH1SEEpzukHfullQ0Aqb/Onss7H3UAaiA0EhoW1i7lLfTXMl
 3yHqshb5DBh9mEawSQnZsGyBdw==
X-Google-Smtp-Source: ABdhPJyaW15qMZEmXE3SxBInodABKnX5TaulmK6kQs2Ns1gEa0yWwUQeyDIYIIeCr4O4aaMcdPmAOw==
X-Received: by 2002:a05:6000:50:: with SMTP id
 k16mr5991194wrx.418.1620315446400; 
 Thu, 06 May 2021 08:37:26 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5fe0:3a70:ad4a:a29b])
 by smtp.gmail.com with ESMTPSA id o13sm3788673wmh.34.2021.05.06.08.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 08:37:26 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] MT6358 PMIC button support
Date: Thu,  6 May 2021 17:37:15 +0200
Message-Id: <20210506153718.256903-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_083728_500144_28A75B1F 
X-CRM114-Status: GOOD (  10.88  )
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

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
* for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

Initially, this series contained both mfd and input patches.
To simplify maintainance and review the original series [1] has
been splitted

This series depends on [2]

[1] https://lore.kernel.org/linux-mediatek/87tunpw339.fsf@baylibre.com/
[2] https://lore.kernel.org/linux-mediatek/20210506094116.638527-1-mkorpershoek@baylibre.com/T/#m5c76f061c2158587b7190a13abbf2094b0c050bf

Mattijs Korpershoek (3):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 drivers/input/keyboard/mtk-pmic-keys.c        | 56 +++++++++++++++++--
 2 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
