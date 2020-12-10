Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C16C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 02:18:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FB1E23A7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 02:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FB1E23A7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Ku/NWLKxbiiIkXnVAAWNEfzg7h17fAHlgqDB+eF3kQ=; b=pqA1adCQ2WVz5IDarXUkFoy5x
	SluRVIC79QQcKPqjord8b+kUmlC1Tp0JZE0NQU34k6VAHpF9I3yjKGexAUgTQLnSVehjHEC3/104J
	Ddyn9TrOxeCtusgDvpv7R39F2PUWUK0vQ0sIzFfzOvEDbvbNnMB4rvEzitNuIMOxbbP7UDW1dmwHo
	Uvpp0APEIvRcQW6SlRMqxr+ab10Wyi3igIdTdOs5KNgo43vFhpQHtiVnIhsrDn1UsmJZmYm+TD+H+
	RaR4+kDakPAAHGlU6Gn3x5dC9AvjlkIsIJ81QOmCBxj81zML5YbinmvQ7tCVeH/OZdZ+O59VYhPYv
	LKoCxkliw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knBWr-0006Fu-8T; Thu, 10 Dec 2020 02:18:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knBWj-0006Dk-Mr; Thu, 10 Dec 2020 02:17:54 +0000
X-UUID: 877071b8873d4eecaf44972916735f6e-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VLlW/IrE1A/pJMKdniMUW/PFDHTKyvEKmb2W8/ufCmk=; 
 b=uPZBc+DieB4tup7G8l2N7hxHeUCyakUo5mX8aCGBmg0Yka39mK0NmyQDuoCNMZ8T3hu4eN7Nhqf3Zve03JkGgG9fYL3AIRhC5ylmoHtVbc7xn5/wP/HdIntG6s9YCpWjnBkrOfH+3hLmB3G79GlSefzTDlwlM0IT3WpCNvCiwq0=;
X-UUID: 877071b8873d4eecaf44972916735f6e-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1564170707; Wed, 09 Dec 2020 18:17:46 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 18:07:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 10:07:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 10:07:45 +0800
From: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: [PATCH] mediatek: update MT8173 VPU firmware to v1.1.6
Date: Thu, 10 Dec 2020 10:07:40 +0800
Message-ID: <20201210020740.21467-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201210020740.21467-1-irui.wang@mediatek.com>
References: <20201210020740.21467-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_211753_921965_E2E04E21 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew-CT.Chen@mediatek.com, Maoguang.Meng@mediatek.com,
 srv_heupstream@mediatek.com, irui.wang@mediatek.com, Yunfei.Dong@mediatek.com,
 erin.lo@mediatek.com, Longfei.Wang@mediatek.com,
 linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com,
 tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[encoder h264]
set buffer pitch to encoder hardware

Release Version: 1.1.6

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/mediatek/mt8173/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
index 00d9c47d19a1dfa10244a5b030d171982333bbb8..45e214dd4aac4c54b8dc2778c7de3de69c6f41a6 100644
GIT binary patch
delta 198
zcmWN=w++HT002OloO8}OnwI`+T09X2YcK*0Vi=a;PP*6c6TN)jLv(#4;hBWUlxZ_&
z&6&4g(UN5=R;^jLVbhjvJ9h2aci_;GV<%3XId|dGm1{R{-MRPR(UWK6ZxSxI_z!i>
BJ;MM1

delta 198
zcmWN=w++HT002OloO8}Onvwy&ro|Icum&U0AckQX?xcJDKGDnfJw(?>5}rwjOqn)g
z)|`0@7A;w}V%3^;8#Zm(wqw_xeFqL5Id<aInR6E|UAcDS)}4C~9zA(B{wCpai~n^K
BJ;DG0

diff --git a/mediatek/mt8173/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
index c3a6678ec4eabbdacd9504988f01fb3dbaf6c1de..96f1c632972cb068d0c1aacbc78b5cc0da07bf4a 100644
GIT binary patch
delta 20
ccmaFU!11PmV}tZm#x2b<Q@6`ZWems$0AGv<RsaA1

delta 20
ccmaFU!11PmV}tZm#ud#nQ@6`ZWems$0ACacN&o-=

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
