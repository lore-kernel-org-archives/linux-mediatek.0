Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B44C4741F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 02:32:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9AEC205CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 02:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2dxgSHJX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mjmCF1T6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9AEC205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MS6vJbmzRUKXl5C2itbRHM8iMYlUppUAOmJnoqLVyvM=; b=2dxgSHJX51Pg9sgtmQU5C8of8H
	OSlveBQkRsxq4xPwIArgscv7vLCNlGJ+UIJ0BZuGgMf4r8Tmsgtuqp8nT4hu7vtW6LlHnZg8I/43U
	K7cDW6QxkG5VaV2ym0xTx0cGV0yUktL7Y3YtC5c2xytFyH7HAzmH3tEEtzaCkl62e5Ndd6D9GMAKp
	9opVhryMHB77Y42p16DiS/XRSGBrloCVBJTt5+JWoVV1z5B72pQrQOt8m7p25T7Mjt+r0xuqpKA+C
	b5nknErfmFZ5to4UfX7nNJSA3dYChSw/idGv8W0o9Q+xnGJfjAUnHJKS7NZEB25tS9GYiYXJGejVN
	VBM6Q83g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcJS6-0000Vs-2N; Tue, 10 Nov 2020 02:32:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcJS1-0000Td-6g
 for linux-mediatek@lists.infradead.org; Tue, 10 Nov 2020 02:32:08 +0000
X-UUID: 6a6ffdc37af24a718dd23455389d823c-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5d7V6hjUmWAmoDSANYgdvoSKhiQCO+gF4zjCHeH8cFo=; 
 b=mjmCF1T6vFkpTn2JNM1+ZyzN/579DZ6KagCLHNSWDRiZ2E09Q3d4EHkYAZwGbWFZTajCNMwnKMWgdjgLk23zjP/DetASwkwvmNVSRkA9U/QDBH4EQ0n5SozHGtH+Yg6kR/NIpxLZSQ/LJWO+G2Xjgdd7I7OF4T08J7GFojG2pVI=;
X-UUID: 6a6ffdc37af24a718dd23455389d823c-20201109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shane.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 258673229; Mon, 09 Nov 2020 18:31:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 18:31:39 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 10:31:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 10 Nov 2020 10:31:38 +0800
From: Shane Chien <shane.chien@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH v3 0/2] Fix vaud18 power leakage of mt6359
Date: Tue, 10 Nov 2020 10:31:30 +0800
Message-ID: <1604975492-6142-1-git-send-email-shane.chien@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_213205_443062_4E9EC103 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 chipeng.chang@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Shane.Chien" <shane.chien@mediatek.com>

This series of patches is to fix vaud18 power leakage problem.
vaud18 will be enable only when mt6359 audio path is turned on.

Change since v2:
 - fix dt-binnding syntex error

Change since v1:
 - use dapm regulator supply widget for vaud18 control.
 - add vaud18 regulator property in mt6359 dt-binding.

Shane.Chien (2):
  ASoC: Fix vaud18 power leakage of mt6359
  dt-bindings: mediatek: mt6359: Add new property for mt6359

 .../devicetree/bindings/sound/mt6359.yaml          |    9 +++++++
 sound/soc/codecs/mt6359.c                          |   25 +-------------------
 sound/soc/codecs/mt6359.h                          |    8 -------
 3 files changed, 10 insertions(+), 32 deletions(-)

-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
