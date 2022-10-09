Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F221DC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Oct 2022 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AQcp51uRXNcfooZTEfbZbxQLHbIh+KufIsSkzNM91/U=; b=gREzhMDw13mMG/
	ni1qagcOQCAWbr47PbNh1WK1VlhA65kz8dgcedOYQA4REAhOVgjBDpBTRZqYzWEkwFCicbbiky97P
	N6MLG9F0mxDkhkbbBBLBifjVmZD9XpAPDOS9WotrnWv/mJQ/ipCucGvMOGC70q+OV2+9syC4rtC1/
	xy47qhclxGNtJazkIbo8CSooXsOw6CeFCSfAoZnmd5rOOi1vA6jC3uN+P8SuiofrTlPXJamtIH5Qi
	7p4Z0mnYxaaTjIByNQJNei1B+4bm16p3VILgnA9QuiwHdGpEeS5ugGKNr02pkocWwbw/dN66r5nyV
	G3XYIS1ECLKxg7I4I+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohTMn-00FHWd-1x; Sun, 09 Oct 2022 10:17:05 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohTMU-00FHTM-5V; Sun, 09 Oct 2022 10:16:47 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id B83A75FCE7;
	Sun,  9 Oct 2022 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665310599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AQcp51uRXNcfooZTEfbZbxQLHbIh+KufIsSkzNM91/U=;
	b=vcRGXu57F0J/7EXjfbzQdp6vRzWkXWyxefuNjO8/eLdfMiDRylZOLUQcN+r7d6KyN1s120
	OZaFLTfm9f2SgTgghlZvsEY6gt1tYzxMm49tDEhdRNBGGr71+nsDfUfWsixnBC9nOxGIss
	PWp4/qdiVh19DT8PHdEfurYUtC7xI9w=
Received: from frank-G5.. (fttx-pool-217.61.145.235.bambit.de [217.61.145.235])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id E44EC1005FA;
	Sun,  9 Oct 2022 10:16:38 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] Add mt7986 i2c support
Date: Sun,  9 Oct 2022 12:16:29 +0200
Message-Id: <20221009101631.82380-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 6f6f32f3-2929-45fb-a491-600517718096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_031646_416093_27AF3421 
X-CRM114-Status: UNSURE (   7.09  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series changes binding and driver for supporting i2c on mt7986.

Frank Wunderlich (2):
  dt-bindings: i2c: update bindings for mt7986 soc
  i2c: mediatek: add mt7986 support

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.34.1


