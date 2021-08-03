Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3F7C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 12:59:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A6260F8F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 12:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7A6260F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KeJ0uNSi1B0kg82HHUNX1+Fx2q7c56WHQc7hdg8zlzA=; b=Z36kdlWpT7YYdp
	q4VdMPq7Fzf3sA8OHSzwdwKOsvWnMLxBH7XWl0GARdFtMxmTooofYb2xjlFDwzourjD5wb4X/u+uV
	tc3vmoEgqoBIflLYZQueSGtRf+aYms/MNpo5uYuSfmDmYcsotVrgVvUHE475qEM+WWE13+aDnNy5j
	XzypyftDOTgRzUtIIGk30VCOxqfmt2P+vWd0JlxufJxADofKJl7LxpA87N85oZVTY0zukmdszX7hL
	fxhXYoRgVHKLsroCw3lA6BpvSiFOw8OKZBxskh4f744uYivROfXxyA3GM1PG96sYTUq7Rd9bDqR0R
	hh+tV+EeeBwfI3/EfFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAu0V-002nvT-Po; Tue, 03 Aug 2021 12:58:55 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtij-002hMM-G2; Tue, 03 Aug 2021 12:40:34 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so3643064pjr.1; 
 Tue, 03 Aug 2021 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQ9TyR/ElfRpbm66B73yjjkp4wHEV5Mt6Yp5m7wMnpM=;
 b=Pj6L45Z5d1eZKMGaDjGEn+k38rvy794EmzxLdJb/SBe9YcVz+Am/OQ2Jc9YAn3dH56
 NkN+NKB8dBgiUuBspVurnd1M2ZGcauGNp0w98ejIF6BPhziigns9l/nvFpsjEp+QxTeP
 1qg+5au+gYhCsgMNP1q3myQQaOnlQrLgxsZbKt1IsCncbJLzZlzP5qialHQ6k8kBN4Wc
 lufhtmrVT2A6OdlrcdtwYhDCOekmQbh1DbxY66wIDO54BMgIDx0ynuGEaXAQ3/ebHLZz
 HzEosZ1FUd9VCBYFLs10i8GCICS6vzUHmNSfPAShvkfnBqm+FmN2ViyS78b7OXjKF/wj
 Qduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQ9TyR/ElfRpbm66B73yjjkp4wHEV5Mt6Yp5m7wMnpM=;
 b=MoXo7n/k82HKyY1i0Tlf0DTlTnONyovzJnFyX8NUAVf6cC3lxY5SIwS/arkCTLw99r
 Q+ZcR0pG0HDAy1BsCl76nz5OATCL0hSyYHMgba+p/x/kQWFCgJpnrXixElz8ewtFXyOu
 2/KD2qiETycVktOjqSO2ERIKoA71cnOQpthf+dOlT0E49g4KzX/smFDw3WHytwbL/pEQ
 fasly36ynovw6pwQPbHfhK5n73dMEwSh+3kcEQrTrmX3Ui3WiHhxIr4fD6pfzKv4ODNc
 giqo9Olk47C0MCFv4K6b0D0e12c3DB5NCSAQBLRDqHyFHTm56mmRpjOKdM3JD4Na4D+x
 9xnQ==
X-Gm-Message-State: AOAM532qXDsmPYhs1q37YSDqwnHPxrvckLGdks5FhO8ptIH9ausfr7c6
 saIwop/if7fKtlL+C7Oz1kE=
X-Google-Smtp-Source: ABdhPJwZx7+VO53Jv6LZiPKW412Lt5aGVRYJ7kbue0DP70WdatNFYtNsAGuAlhq7/AwKuQp8i2TUUA==
X-Received: by 2002:a65:6813:: with SMTP id l19mr51800pgt.118.1627994431593;
 Tue, 03 Aug 2021 05:40:31 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g25sm15747499pfk.138.2021.08.03.05.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:40:30 -0700 (PDT)
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
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 0/4] mt7530 software fallback bridging fix
Date: Tue,  3 Aug 2021 20:40:18 +0800
Message-Id: <20210803124022.2912298-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_054033_631943_ED26BD08 
X-CRM114-Status: UNSURE (   8.21  )
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
  net: dsa: mt7530: set STP state on filter ID 1
  net: dsa: mt7530: always install FDB entries with IVL and FID 1

 drivers/net/dsa/mt7530.c | 87 +++++++++++++++++++++++++++-------------
 drivers/net/dsa/mt7530.h |  9 +++--
 2 files changed, 66 insertions(+), 30 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
