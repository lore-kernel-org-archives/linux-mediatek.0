Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2F9C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 15:38:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D2A060F01
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 15:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D2A060F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDe8beFlqmLmHnbCCSI6Ugg/I1RBfh9MI0zmP1kyYMM=; b=EagR/6CfPaIA9z
	iNnsh/tDrGu2Ht1yQGpA5uJtjECEuI6mmeIjCTjdw3JAu00+5tVOqK7yyBK9epcIZCa8EX21wFDlK
	qbgF6fGq7jC8sI8uLXe2qtgdX9zmKCN7O/ChmvWm3lWxxNklZFPU5BJamFRRXlkb0S2aiFfsA9peZ
	rBc0xHXR+UEC+pBvt658SKXe/lZb0BtCTHCfjDE98jTTmCv3cTrSUIHxCdaXsM8eKSfNie/tpXDky
	uNy65z2F69ArBRP/9u9UlQ6OShgTD9G+aVdX9Eq+Pdz5mH/kZ6iXaTM23mb1wyPA9aUeXzJWdT54x
	hL++szihKHU8hTmMz1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m987B-004lRj-Ci; Thu, 29 Jul 2021 15:38:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m97xB-004iRD-Lm; Thu, 29 Jul 2021 15:28:29 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gn26so11415562ejc.3;
 Thu, 29 Jul 2021 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KE22c1Ad5gonkCTcGvngPYElxeArkuqbrIzxFeSwHAY=;
 b=JetzgI9snLh9gHSQtjDoTivcJXzq1kKOvclnaK+MCZ6DvY89LFB0CWrkt7ZCuJ+Imw
 oB54aTWQ4dVe347xR6K8GxDEpafJTNsyhUyElIoXoAVIHZmy/MB3De8fBIPBFxRRQC6r
 NjuFkuN6LYbH50BwQAGT1LtYaZjgK39dqXb7tjlTIArnQTYmMbTUE8afU326KCPopZmr
 ZCtIAz/vmWa/RcKY1RwK6W2OYB99AVSvRkaHzawiCEB5tv9nnvW5gFArxAJbUSm8tA/O
 H/meAr4DXD2Zft0pG8yFMhj9m9qPf6zM4Z09PxCqpHo/eNy3acpI08loYwi30vcTNRKe
 qIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KE22c1Ad5gonkCTcGvngPYElxeArkuqbrIzxFeSwHAY=;
 b=EhvsipUhLdxgBuem5HFRwqxv0VOJ6F3SMXMzp1uHPMaMBGRV5RT3ehBLMsuEuRDjUS
 S4+tByjqgnam03POEdzQes1wF2CqBjIP1REbR1D7qtVUSkuYDdqDt9VumVWVV50Vm8Yk
 RP7wW6Wu4HlLDXWThjYEDs946cyTW6VCljUk98CG2QRQKRbijrT5IBW2OzXX925R8O+8
 GqUKISzzzE/dibH7IuYxYGwTNcA0XrlBWH66hE4rgh29Qw63cHr7Xo2jEoPi557ZGcc5
 ecOfA9jrMFvsXyxaBJM6AiVSBenVaTW4Q/qz7qso2NGWjWBnCXYZF4prst9r1LD7yG7l
 KbEA==
X-Gm-Message-State: AOAM531wimag6MFZNs9RkZt5AdCL8fm+n41ZEAi7/RXd0XP8PJZir50R
 en06TR5H1nLtWZf+ICVruEo=
X-Google-Smtp-Source: ABdhPJws25x+5xhXV2Dr2zU8FJu9Q1J/fMCHNUU0hFEyvnt6R1J0U3UzIcVhhlrThKtW/vR6GCg4Vg==
X-Received: by 2002:a17:907:629c:: with SMTP id
 nd28mr5019983ejc.403.1627572487725; 
 Thu, 29 Jul 2021 08:28:07 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id ck25sm1340106edb.96.2021.07.29.08.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 08:28:07 -0700 (PDT)
Date: Thu, 29 Jul 2021 18:28:05 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from
 standalone ports to the CPU
Message-ID: <20210729152805.o2pur7pp2kpxvvnq@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728175327.1150120-3-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_082809_823338_7D70A8E7 
X-CRM114-Status: GOOD (  13.83  )
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

On Thu, Jul 29, 2021 at 01:53:26AM +0800, DENG Qingfang wrote:
> MT7530's FDB has 8 filter IDs, but they are only available for shared
> VLAN learning, and all VLAN-unaware ports use 0 as the default filter
> ID.

Actually, on second thought...
If MT7530 supports 8 FIDs and it has 7 ports, then you can assign one
FID to each standalone port or VLAN-unaware bridge it is a member of.
The drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c driver has a
similar concept, only instead of FID, it manages FDB IDs - each port is
assigned to an FDB ID and it learns and looks up MAC addresses only
within that FDB ID. Every standalone port uses its own fdb_id, and every
port under the same bridge shares the same fdb_id (the fdb_id associated
with a bridge is equal with the fdb_id of the first standalone port that
joins that bridge; every other standalone port that joins a bridge will
change its fdb_id to that of the bridge). When a port leaves a bridge
and becomes standalone again, its fdb_id will again change to the first
unused value. My point is that if you search for "fdb_id" in that driver
you will maybe find some inspiration for how things like this can be
managed. I know it's not 100% the same as your situation (the FDBs in
the dpaa2-switch are selected by the VLAN table, and for that reason,
the dpaa2-switch can only operate as VLAN-aware, and with shared VLAN
learning per FDB), but the same concept can be reused, I think. With
each port and VLAN-unaware bridge having its own FID, I think you will
not have the shortcircuit issue any longer (and with VLAN-aware bridges
you shouldn't have it anyway).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
