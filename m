Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DD9C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804296044F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 804296044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y8ON/FTQpZ8dbnWoaYSaK3SNxWXZrz3SqzRI3PTkOA4=; b=ccJkL1Gb8oUBr4
	dbmcVohlQicTjWnX6ip+JEEZoUskq2DUJan1rX8tarwcLIT3Q136Jv71PQ5TVU1Y008gzoanqmqSI
	s6266eZX0tFK27Ix9pJWw4+r29XdleIMO5zqA4UINuQgLwhdRf8tMRBqbn5sCgAhFhJMb+ykUgPgo
	2ml9RiXsQXEqvx+Up72b8EeVZLO9dX2rPBtGmfCKOtwNMP9ZJS2zYoTD1eQgiGV0kdp/o9UYdwsZT
	5DQn5uWXjVj9aO4jZfCUyydKGEak0nYnJwVU97xxFWwcDlX6w/N2x1uzFMOsXUjebwN2uBUrk6hsp
	Ak3V7HiT+MPPwAOk2b0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9uNl-00C8kO-Vm; Sat, 31 Jul 2021 19:10:50 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9uNY-00C8jB-PE; Sat, 31 Jul 2021 19:10:38 +0000
Received: by mail-il1-x12b.google.com with SMTP id d10so12801398ils.7;
 Sat, 31 Jul 2021 12:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7/TaYm/UF25Rhll7uHhh9B/mqiJ7+iZYI4BORoPII4=;
 b=nWpLOBq79CReWCkzfPSmWtyO1gGGTgw2IFheOv4pryVY/ew1eNQFhc6mhNh1x+Vunk
 /kLpUNDR/RsvGBtpULidFsf1YGwWl/5LntEvp9k6Ls/AyA4qGeD07pVh7gqTfsER7fp6
 M4Hkl9WJnHFWjWouhNC/Q85XCjuAF5WNy8MhUHPxfEZRNtgd4j+OHOytHP1kdfEm4OMA
 OwGBwLCuPSn+XdN4ckEv7+bvls+VSdnEcuNgOlM1yCAN0ysH09JxALVqhAwJPUoPw/cM
 m9WDiF5Xw769oPkXgpRkaC2BPHnGiXZFRE3fwQpV3JptRtyMXIKy/PFKEYK330Jylym8
 t2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7/TaYm/UF25Rhll7uHhh9B/mqiJ7+iZYI4BORoPII4=;
 b=W9q1c+ob2+RYDu8VOq9lAfaz+e6bQ2VgZBpUjSeHiL+r0bPBHpjTKxn/tjauGk+UD3
 A++tlMhJC1L0+uPVes44+ZEdqE50ATlHZYThEo4h3stqtn0AQthqH3BsWPQhZ7d4wPhu
 xEvwhYwFJccXFJ0i/Khpy4LdSNfTnYwy+XwGFQW/zgusdAgNZfW3WE1Pj9QUCCuSfZ+V
 5kF/qtnRaPlgvfgxcYx/oszXbQSHdUg2cQoBL/c2kUz0EECWnpCvpOfkU5HjonaMHQH2
 JJRPYeS2HUhmRWN30V2vXjkBDfpucuBkQA4f46h/cp8aqUMFVJPbNfmxd5rRSiJwHJoe
 L09Q==
X-Gm-Message-State: AOAM5311S6nq/+JMMw3N5sdDjf7G6G0lRevGR6DD1UNHq/89TGfU11PL
 U8l/s3GMs5RqpX/ouUZzE1Q=
X-Google-Smtp-Source: ABdhPJwKeP8kac45tmmqAQD/bbEi8A11l0vaH2d34nx7mjExz7NP+udqtBb2bTC9n/AQmV6ruzrYXQ==
X-Received: by 2002:a92:d44b:: with SMTP id r11mr2337590ilm.217.1627758633355; 
 Sat, 31 Jul 2021 12:10:33 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g1sm2837991ilq.13.2021.07.31.12.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 12:10:32 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: [RFC net-next v2 0/4] mt7530 software fallback bridging fix
Date: Sun,  1 Aug 2021 03:10:18 +0800
Message-Id: <20210731191023.1329446-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_121036_877454_EC91264C 
X-CRM114-Status: UNSURE (   7.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DSA core has gained software fallback support since commit 2f5dc00f7a3e,
but it does not work properly on mt7530. This patch series fixes the
issues.

DENG Qingfang (4):
  net: dsa: mt7530: enable assisted learning on CPU port
  net: dsa: mt7530: use independent VLAN learning on VLAN-unaware
    bridges
  net: dsa: mt7530: set STP state also on filter ID 1
  Revert "mt7530 mt7530_fdb_write only set ivl bit vid larger than 1"

 drivers/net/dsa/mt7530.c | 86 +++++++++++++++++++++++++++-------------
 drivers/net/dsa/mt7530.h |  6 ++-
 2 files changed, 63 insertions(+), 29 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
